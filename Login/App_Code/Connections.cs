using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Connection
/// </summary>
public class Connections
{
    static String connectionstring = @"Data Source=YASH-PC\YASH;Initial Catalog=imagine;User Id=yash;Password=yash123;";
	public Connections()
	{
		
	}
    public static string GetConnectionString()
    {
        return connectionstring;
    }
}