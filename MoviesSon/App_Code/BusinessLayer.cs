using System;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;
using System.Web.Security;
using System.Web.UI.WebControls;


namespace moviesSon
{ 
public class BusinessLayer
    {
        DataAccess dal = new DataAccess();
        Fields field = new Fields();

        #region Select

        public Fields retrieveImage(Fields field)
        {

            SqlCommand cmd = dal.Query("sp_retrieveImage");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.ExecuteNonQuery();
            using (var reader = cmd.ExecuteReader())
            {
                if (reader.Read())
                {
                    var filepath = reader.GetString(0);
                    field.imageData = filepath;
            
                }
            }

            dal.Connect().Close();
            return field;
            
        }
      
        public DataTable SelectMovieName(int movieId)
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = dal.Query("sp_SelectMovieName");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = movieId;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
            return dt;
        }

        public DataTable SelectDirectorsName()
        {
            Fields field = new Fields();
            DataTable dt = new DataTable();
            SqlCommand cmd = dal.Query("sp_SelectDirectors");
            cmd.CommandType = CommandType.StoredProcedure;
          //  cmd.Parameters.Add("@directorId", SqlDbType.Int).Value = directorId;
          //  field.directorId = directorId;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
            return dt;
        }
 

        public Fields SelectMovies(int movieId)
        {
            Fields field = new Fields();
            SqlCommand cmd = dal.Query("sp_SelectMovies");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId ", SqlDbType.Int).Value = movieId;
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                field.movieName = rd["movieName"].ToString();
                field.movieYear =Convert.ToDateTime( rd["movieYear"]).Date;
            }
            dal.Connect().Close();
            return field;
        }


        public Fields SelectMovieType(Fields field)
        {
            //Fields field = new Fields();
            SqlCommand cmd = dal.Query("sp_SelectMovieType");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {

                field.movieType = (rd["Type"].ToString());//filmin birden fazla typei oldugu icin out of range goruldu
                                                          // field.movieType = Convert.ToInt32(rd["t"]);
            }
            dal.Connect().Close();
            return field;
        }
        public Fields SelectMovieActors(Fields field)
        {
            //Fields field = new Fields();
            SqlCommand cmd = dal.Query("sp_SelectMovieActors");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {

                field.actorName = (rd["NameSurname"].ToString());
            }
            dal.Connect().Close();
            return field;
        }
        public Fields SelectDirectorName(Fields field)
        {
            SqlCommand cmd = dal.Query("sp_SelectDirectorName");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
              field.director = rd["directorName"].ToString();
              field.directorId = Convert.ToInt32(rd["directorId"]);

            }
            dal.Connect().Close();
            return field;
        }

        #endregion
        #region Insert
        public DataTable ListTypes()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = dal.Query("sp_ListTypes");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
            return dt;
        }
        public DataTable ListActors()
        {
            DataTable dt = new DataTable();
            SqlCommand cmd = dal.Query("sp_ListActors");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            da.Fill(dt);
            return dt;
        }

        public void InsertMovie(Fields field)
        {
            SqlCommand cmd = dal.Query("sp_insertTypesMovies");
            cmd.CommandType = CommandType.StoredProcedure;
          //  cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@movieName", SqlDbType.NVarChar, 50).Value = field.movieName;
            cmd.Parameters.Add("@movieYear", SqlDbType.DateTime).Value = field.movieYear;
            cmd.Parameters.Add("@typeId", SqlDbType.Int).Value = field.typeId;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }

        public int InsertMovieRT(Fields field)
        {
            SqlCommand cmd = dal.Query("sp_insertTypesMovies");
            cmd.CommandType = CommandType.StoredProcedure;
            //  cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@movieName", SqlDbType.NVarChar, 50).Value = field.movieName;
            cmd.Parameters.Add("@movieYear", SqlDbType.DateTime).Value = field.movieYear;
            cmd.Parameters.Add("@typeId", SqlDbType.Int).Value = field.typeId;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Direction = ParameterDirection.Output;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();

            return (int)cmd.Parameters["@movieId"].Value;
        }
        
        public void InsertType(Fields field, int typeID)
        {
            SqlCommand cmd = dal.Query("sp_insertTypes");
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@movieID", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@typeID", SqlDbType.Int).Value = typeID;
            
            // cmd.Parameters.Add("@movieYear", SqlDbType.Int).Value = field.movieYear;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }
        public void InsertType(Fields field)
        {
            SqlCommand cmd = dal.Query("sp_insertTypes2");
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@typee", SqlDbType.NVarChar).Value = field.text;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }
        public void InsertDirectors2(Fields field)
        {
            SqlCommand cmd = dal.Query("sp_insertDirectors2");
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@director", SqlDbType.NVarChar).Value = field.text;
            cmd.Parameters.Add("@directorL", SqlDbType.NVarChar).Value = field.text2;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }
        public void InsertActors2(Fields field)
        {
            SqlCommand cmd = dal.Query("sp_insertActors2");
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@actor", SqlDbType.NVarChar).Value = field.text;
            cmd.Parameters.Add("@actorL", SqlDbType.NVarChar).Value = field.text2;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }
        public void InsertDirectors(int movieID, int directorID)
        {
            SqlCommand cmd = dal.Query("sp_insertDirectors");
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@movieID", SqlDbType.Int).Value = movieID;
            cmd.Parameters.Add("@directorID", SqlDbType.Int).Value = directorID;
            // cmd.Parameters.Add("@movieYear", SqlDbType.Int).Value = field.movieYear;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }
        public void InsertActors(Fields field, int actorID)
        {
            SqlCommand cmd = dal.Query("sp_insertActors");
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@movieID", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@actorID", SqlDbType.Int).Value = actorID;
            // cmd.Parameters.Add("@movieYear", SqlDbType.Int).Value = field.movieYear;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }

        public void InsertImageData(Fields field )
        {

            //insert the file into database
            SqlCommand cmd = dal.Query("sp_InsertImageData");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@imagedata", SqlDbType.NVarChar,-1).Value = field.imageData;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
          //  cmd.Parameters.Add("@imagedata", SqlDbType.Binary).Value = field.bytes;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }

        #endregion
        #region Update 

        public void UpdateMovie(Fields field)
        {

            SqlCommand cmd = dal.Query("sp_UpdateMovie");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@movieYear", SqlDbType.DateTime).Value = field.movieYear;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }
        public void updateImage(Fields field)
        {

            SqlCommand cmd = dal.Query("sp_UpdateImage");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@imagedata", SqlDbType.NVarChar, -1).Value = field.imageData;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            //  cmd.Parameters.Add("@imagedata", SqlDbType.Binary).Value = field.bytes;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }
        public void UpdateType(Fields field, int typeID)
        {

            SqlCommand cmd = dal.Query("sp_UpdateType");
            cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@movieID", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@typeID", SqlDbType.Int).Value = typeID;
            // cmd.Parameters.Add("@movieYear", SqlDbType.Int).Value = field.movieYear;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }

        public void UpdateDirector(Fields field)
        {

            SqlCommand cmd = dal.Query("sp_UpdateDirector");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = field.movieId;
            cmd.Parameters.Add("@directorId", SqlDbType.Int).Value = field.directorId;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();

        }
        #endregion
        #region Delete
        public void DeleteMovie(int movieId)
        {
          //  Fields field = new Fields();
            SqlCommand cmd = dal.Query("sp_DeleteMovie");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value=movieId;
            cmd.ExecuteNonQuery();
            dal.Connect().Close();
           // return field;
        }
        public void DeleteType(int movieId, int typeId)
        {
            //  Fields field = new Fields();
            SqlCommand cmd = dal.Query("sp_DeleteType");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = movieId;
            cmd.Parameters.Add("@typeId", SqlDbType.Int).Value = typeId;

            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }
        public void DeleteActors(int movieId, int actorId)
        {
            //  Fields field = new Fields();
            SqlCommand cmd = dal.Query("sp_DeleteActors");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = movieId;
            cmd.Parameters.Add("@actorId", SqlDbType.Int).Value = actorId;

            cmd.ExecuteNonQuery();
            dal.Connect().Close();
        }

        #endregion
        #region Login
        public void ValidateUser(Fields field)
        {
          
            int userId = 0;
            using (SqlCommand cmd = dal.Query("Validate_User"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                { 
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@username", SqlDbType.VarChar).Value = field.username;
                    cmd.Parameters.Add("@upassword", SqlDbType.VarChar).Value = field.password;
                     userId = Convert.ToInt32(cmd.ExecuteScalar());
                  
                }
            }
                switch (userId)
                {
                    case 0:
                        field.labeltext = "User not activated. Wait for the permission!";
                        break;
                    case 1:
                        field.labeltext = "User Invalid.";
                        break;
                   case 2:
                       field.labeltext = "SUCCESS!";
                       break;
                   default:
                    break;
                }
                dal.Connect().Close();
            

        }

        #endregion
    }

}