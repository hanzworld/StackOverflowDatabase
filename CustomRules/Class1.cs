using System;
using System.Linq;
using System.Linq.Expressions;
using Microsoft.SqlServer.Dac.CodeAnalysis;
using Microsoft.SqlServer.Dac.Model;
using System.Collections.Generic;

namespace CustomRules
{
    [ExportCodeAnalysisRule(DateTimeColumnsWithExcessiveScaleRule.RuleId,
       DateTimeColumnsWithExcessiveScaleRule.RuleDisplayName,
       Description = "Datetime columns should not be specified with a scale greater than 2",
       Category = "Other",
       RuleScope = SqlRuleScope.Element)]
    public sealed class DateTimeColumnsWithExcessiveScaleRule : SqlCodeAnalysisRule
    {
        public const string RuleId = "Rules.DateTimeColumnsWithExcessiveScaleRule";
        public const string RuleDisplayName = "Date time columns should play nicely!";
        public const string DateTime2ColumnWithExcessiveScaleMsgFormat = "Column name {0} has a datetime2 scale greater than 2. This level of scale is unnecessary for our work and wastes storage space.";

        /// <summary>
        /// This is a Element-scoped rule, which means we should define SupportedElementTypes.
        /// Only objects of that types will be analysed, avoiding unnecessary computations
        /// </summary>
        public DateTimeColumnsWithExcessiveScaleRule()
        {
            SupportedElementTypes = new[]
            {
               Table.TypeClass
            };
        }

        /// <summary>
        /// Check if the table has any datetime2 column, and then check if they have a scale of 7 or more.
        /// </summary>
        /// <param name="ruleExecutionContext"></param>
        /// <returns></returns>
        public override IList<SqlRuleProblem> Analyze(SqlRuleExecutionContext ruleExecutionContext)
        {
            List<SqlRuleProblem> problems = new List<SqlRuleProblem>();
            TSqlObject table = ruleExecutionContext.ModelElement;
            if (table != null)
            {
                foreach (var column in table.GetReferenced(Table.Columns))
                {
                    if (IsDateTime2WithExcessiveScale(column))
                    {
                        //DisplayServices is a useful helper service for formatting names
                        DisplayServices displayServices = ruleExecutionContext.SchemaModel.DisplayServices;
                        string formattedName = displayServices.GetElementName(column, ElementNameStyle.FullyQualifiedName);

                        string problemDescription = string.Format(DateTime2ColumnWithExcessiveScaleMsgFormat,
                            formattedName);
                        SqlRuleProblem problem = new SqlRuleProblem(problemDescription, table);
                        problems.Add(problem);
                    }
                }
            }
            return problems;
        }

        private bool IsDateTime2WithExcessiveScale(TSqlObject column)
        {
            var dataType = GetDataType(column);

            var scale = column.GetProperty<int>(Column.Scale);


            return (dataType == SqlDataType.DateTime2 && scale > 2);
        }

        #region Helpers

        private SqlDataType GetDataType(TSqlObject something)
        {
            TSqlObject dataType = something.GetReferenced(Column.DataType).SingleOrDefault();

            if (dataType == null)
            {
                return SqlDataType.Unknown;
            }

            // Some types don't cleanly come back to a base SqlDataType, but for our demo we don't care
            switch (dataType.Name.Parts.Last())
            {
                case "hierarchyid":
                case "geometry":
                case "geography":
                    return SqlDataType.Variant;
            }

            // Let's ensure we handle User Defined Data Types. We want to look at the built in type
            // behind the user defined data type

            TSqlObject builtInType = dataType.GetReferenced(DataType.Type).SingleOrDefault();
            if (builtInType != null)
            {
                dataType = builtInType;
            }

            return dataType.GetProperty<SqlDataType>(DataType.SqlDataType);

        }

        #endregion

    }
}
