using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moviesSon
{



    public partial class Movies : System.Web.UI.Page
    {
        BusinessLayer bl = new BusinessLayer();
        Fields field = new Fields();
        Fields fieldD = new Fields();
        DataAccess dal = new DataAccess();

        protected void Page_Load(object sender, EventArgs e)
        {
            DataAccess dal = new DataAccess();
            SqlCommand cmd = dal.Query("sp_ListTypes");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);

            listType.DataSource = ds.Tables[0];
            listType.DataValueField = "typeId";
            listType.DataTextField = "type";
            listType.DataBind();

            DataBind();


            DataAccess dal1 = new DataAccess();
            SqlCommand cmd1 = dal1.Query("sp_ListActors");
            cmd1.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);

            DataSet ds1 = new DataSet();
            da1.Fill(ds1);

            listActors.DataSource = ds1.Tables[0];
            listActors.DataValueField = "actorId";
            listActors.DataTextField = "namesurname";
            listActors.DataBind();

            DataBind();

            DataAccess dal2 = new DataAccess();
            SqlCommand cmd2 = dal2.Query("sp_SelectDirectors");
            cmd2.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da2 = new SqlDataAdapter(cmd2);

            DataSet ds2 = new DataSet();
            da2.Fill(ds2);

            listDirectors.DataSource = ds2.Tables[0];
            listDirectors.DataValueField = "directorId";
            listDirectors.DataTextField = "nameLastname";
            listDirectors.DataBind();

            DataBind();
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            field.text = txttype.Text;
            bl.InsertType(field);
            DataAccess dal = new DataAccess();
            SqlCommand cmd = dal.Query("sp_ListTypes");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);

            listType.DataSource = ds.Tables[0];
            listType.DataValueField = "typeId";
            listType.DataTextField = "type";
            listType.DataBind();

            DataBind();
           
            txttype.Text = "";
            field.text = "";

        }

        protected void Buttonmain_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movies.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            field.text = txtactors.Text;
            field.text2 = txtactorsL.Text;
            bl.InsertActors2(field);
            DataAccess dal = new DataAccess();
            SqlCommand cmd = dal.Query("sp_ListActors");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);

            DataSet ds = new DataSet();
            da.Fill(ds);

            listActors.DataSource = ds.Tables[0];
            listActors.DataValueField = "actorId";
            listActors.DataTextField = "namesurname";
            listActors.DataBind();

            DataBind();

            txtactors.Text = "";
            field.text = "";
            txtactorsL.Text = "";
            field.text2 = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            field.text = txtdirector.Text;
            field.text2 = txtdirectorL.Text;
            bl.InsertDirectors2(field);
            DataAccess dal = new DataAccess();
            SqlCommand cmd = dal.Query("sp_ListDirectors");
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            listDirectors.DataSource = ds.Tables[0];
            listDirectors.DataValueField = "directorId";
            listDirectors.DataTextField = "namesurname";
            listDirectors.DataBind();
            DataBind();
            txtdirector.Text = "";
            field.text = "";
            txtdirectorL.Text = "";
            field.text2 = "";
        }
    }
}
    

