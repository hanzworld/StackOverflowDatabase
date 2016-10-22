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
			Console.ReadKey();
		}
	}
}
