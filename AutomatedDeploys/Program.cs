using Microsoft.SqlServer.Dac;
using Microsoft.SqlServer.Dac.Model;
using System;
using System.Data.SqlClient;
using System.Linq;

namespace AutomatedDeploys
{
	class Program
	{
		static void Main(string[] args)
		{
			//set up our sql connection string
			// (ultimately you'd probably want to pass this in instead)
			SqlConnectionStringBuilder connStringBuilder = new SqlConnectionStringBuilder();
			connStringBuilder.DataSource = ".";
			connStringBuilder.InitialCatalog = "DeployViaDacFxAPI";
			connStringBuilder.IntegratedSecurity = true;

			//load up the dacpac we want to do something with
			using (var mydacpac = DacPackage.Load(@"C:\Dev\StackExchangeDacFx\stackoverflow.stackexchange.com\bin\Debug\stackoverflow.stackexchange.com.dacpac"))
			{
				//set the deployment options of interest
				var deployOptions = new DacDeployOptions();
				deployOptions.IgnoreWhitespace = true;
				deployOptions.IncludeTransactionalScripts = true;
				deployOptions.IgnoreSemicolonBetweenStatements = true;
			
				//set up sqlcmd variables
				deployOptions.SqlCommandVariableValues.Add("Environment", "test");

				var service = new DacServices(connStringBuilder.ConnectionString);

				service.Deploy(mydacpac, connStringBuilder.InitialCatalog, true, deployOptions);

			}
			PublishDocumentation(@"C:\Dev\StackExchangeDacFx\stackoverflow.stackexchange.com\bin\Debug\stackoverflow.stackexchange.com.dacpac");

			Console.ReadKey();
		}

		static void PublishDocumentation(string dacpacPath)
		{
			var model = TSqlModel.LoadFromDacpac(dacpacPath, new ModelLoadOptions() { LoadAsScriptBackedModel = false, ModelStorageType = DacSchemaModelStorageType.Memory});

			var table = model.GetObject(Table.TypeClass, new ObjectIdentifier(new[] { "dbo", "User" }), DacQueryScopes.UserDefined);

			//foreach (var table in model.GetObjects(DacQueryScopes.UserDefined, Table.TypeClass))
			//{
				Console.WriteLine("Table {0}", table.Name);


				foreach (var property in table.ObjectType.Properties)
				{

					Console.WriteLine(": {0} : {1}", property.Name, table.GetProperty(property));
				}

				Console.Clear();

				foreach (var metadata in table.ObjectType.Metadata)
				{

					Console.WriteLine(">>> {0} : {1}", metadata.Name, table.GetMetadata(metadata));
				}

				Console.Clear();

				foreach (var child in table.GetChildren())
				{
					Console.WriteLine("> {0} : {1}", child.Name, child.ObjectType.Name);

					foreach (var property in child.ObjectType.Properties)
					{

						Console.WriteLine(">> {0} : {1}", property.Name, child.GetProperty(property));
					}

					foreach (var metadata in child.ObjectType.Metadata)
					{

						Console.WriteLine(">>> {0} : {1}", metadata.Name, child.GetMetadata<ColumnType>(metadata));
					}
				}
			//}
		}
	}
}
