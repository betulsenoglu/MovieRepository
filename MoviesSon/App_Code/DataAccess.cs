using System.Data.SqlClient;
using System.Configuration;

namespace moviesSon
{
    public class DataAccess
    {
        public SqlConnection Connect()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            conn.Open();
            return conn;
        }

        public SqlCommand Query(string text)
        {
            SqlCommand cmd = new SqlCommand(text, Connect());
            return cmd;
        }

        public SqlCommand Query2(string text)
        {
            SqlCommand cmd = new SqlCommand(text, Connect());
            return cmd;
        }
    }
}