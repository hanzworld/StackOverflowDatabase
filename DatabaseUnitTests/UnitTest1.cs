using System;
using System.IO;
using CustomRules;
using Microsoft.SqlServer.Dac;
using Microsoft.SqlServer.Dac.CodeAnalysis;
using Microsoft.SqlServer.Dac.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DatabaseUnitTests
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void NoDatetime7Columns()
        {
            TSqlModel model = TSqlModel.LoadFromDacpac(DacPacFinder("stackoverflow.stackexchange.com"),
                new ModelLoadOptions(DacSchemaModelStorageType.Memory, true));

            var ruleSettings = new CodeAnalysisRuleSettings()
                    {
                        new RuleConfiguration(DateTimeColumnsWithExcessiveScaleRule.RuleId)
                    };
            ruleSettings.DisableRulesNotInSettings = true;

            CodeAnalysisService service = new CodeAnalysisServiceFactory().CreateAnalysisService(model.Version, new CodeAnalysisServiceSettings()
            {
                RuleSettings = ruleSettings
            });

            CodeAnalysisResult analysisResult = service.Analyze(model);

            Assert.AreEqual(0, analysisResult.Problems.Count, "Expect 0 problems to be found");
        }

        #region HelperMethods
        private string DacPacFinder(string dacpacName)
        {
            var pathToSearch = String.Format("{0}.dacpac", dacpacName);

            //check relative paths first
            if (new FileInfo(pathToSearch).Exists) return pathToSearch;

            //then just look in a sister build folder
            pathToSearch = String.Format(@"..\..\..\{0}\bin\Debug\{0}.dacpac", dacpacName);
            if (new FileInfo(pathToSearch).Exists) return pathToSearch;

            //or the OTHER sister build folder, cos someone decided to be smart
            pathToSearch = String.Format(@"..\..\..\{0}\bin\Release\{0}.dacpac", dacpacName);
            if (new FileInfo(pathToSearch).Exists) return pathToSearch;

            return null;

        }

        #endregion

    }
}
