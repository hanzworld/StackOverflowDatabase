using Microsoft.SqlServer.Dac.Deployment;
using Microsoft.SqlServer.Dac.Extensibility;
using Microsoft.SqlServer.Dac.Model;
using Novacode;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace BuildContributor_Documentation
{
	[ExportBuildContributor("StackOverflow.Documentation", "1.0.0.0")]
	public class DocumentThisDatabaseContributor : BuildContributor
    {
		protected override void OnExecute(BuildContributorContext context, IList<ExtensibilityError> errors)
		{
			var model = context.Model;

			var tables = model.GetObjects(DacQueryScopes.Default, Microsoft.SqlServer.Dac.Model.Table.TypeClass);

			var path = Path.Combine(".", "documentation.docx");
			var documentation = DocX.Create(path);
			var level1Heading = new Novacode.Formatting() { Bold = true, Size = 20 };

			foreach (var table in tables)
			{
				//print the table name as a heading
				documentation.InsertParagraph(table.Name.ToString(), false, level1Heading);

				//find all the columns
				var columns = table.GetReferenced(Microsoft.SqlServer.Dac.Model.Table.Columns);

				//create a table with a row for each column
				var columnDocument = documentation.AddTable(1, 2);


				columnDocument.Rows[0].Cells[0].Paragraphs.First().Append("Column").Bold();
				columnDocument.Rows[0].Cells[1].Paragraphs.First().Append("Description").Bold();

				foreach (var column in columns)
				{
					var row = columnDocument.InsertRow();
					row.Cells[0].Paragraphs.First().Append(column.Name.Parts.Last());

					var descriptionProperty = column.GetReferencing(ExtendedProperty.Host).First(x => x.Name.Parts.Last() == "MS_Description");

					row.Cells[1].Paragraphs.First().Append((string)descriptionProperty.GetProperty(ExtendedProperty.Value));

				}

				columnDocument.AutoFit = AutoFit.Window;
				documentation.InsertTable(columnDocument);


			}

			documentation.Save();

			ExtensibilityError resultArg = new ExtensibilityError("Result was saved to " + path, Severity.Message);
			errors.Add(resultArg);

		}

	}
}
