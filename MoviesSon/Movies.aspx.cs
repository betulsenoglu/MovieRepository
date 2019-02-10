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
            DataTable dt = new DataTable();
            DataTable dt2 = new DataTable();

           
            try
            {

                if (!IsPostBack)
                {
                    int movieId = Convert.ToInt32(Session["movieId"]);
                    dt = bl.SelectMovieName(movieId);
                    dt2 = bl.SelectDirectorsName();
                    SqlCommand cmd = dal.Query("sp_ListTypes");
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    chktype.DataSource = ds.Tables[0];
                    chktype.DataValueField = "typeId";
                    chktype.DataTextField = "type";
                    chktype.DataBind();
                   // DataBind();

                   // SqlCommand cmd2 = dal.Query("sp_ListActors");
                   // cmd2.CommandType = CommandType.StoredProcedure;
                   // SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
                   // DataSet ds2 = new DataSet();
                   // da2.Fill(ds2);
                   // chkboxActors.DataSource = ds2.Tables[0];
                   // chkboxActors.DataValueField = "actorId";
                   // chkboxActors.DataTextField = "actorName";
                   // chkboxActors.DataBind();
                   //// DataBind();

                    ddlMovie.DataSource = dt;
                    ddlMovie.DataValueField = "movieId";
                    ddlMovie.DataTextField = "movieName";
                    ddlMovie.DataBind();
                    ddlMovie.Items.Insert(0, "Seçiniz");
                    dt.Clear();


                    ddlDirectors.DataSource = dt2;
                    ddlDirectors.DataValueField = "directorId";
                    ddlDirectors.DataTextField = "nameLastname";
                    ddlDirectors.DataBind();
                    ddlDirectors.Items.Insert(0, "---");
                    dt2.Clear();

                    Session["selectedmovieid"] = 0;
                }
            }
            catch(Exception ex)
            {

                Response.Redirect("HATA");

            }

        }
        public void ddlMovie_SelectedIndexChanged(object sender, EventArgs e)
        {


            Fields field = new Fields();
            Fields field2 = new Fields();

            if (ddlMovie.SelectedValue != "Seçiniz")
            {
                chktype.ClearSelection();
                chkboxActors.ClearSelection();
                int movieId = Convert.ToInt32(ddlMovie.SelectedValue);
                //if (Session["selectedmovieid"].ToString() == ddlMovie.SelectedValue)
                //{
                //    return;
                //}
                
                DataAccess dal1 = new DataAccess();
                SqlCommand cmd1 = dal.Query("sp_SelectMovieType");
                cmd1.CommandType = CommandType.StoredProcedure;
                cmd1.Parameters.Add("@movieId", SqlDbType.Int).Value = movieId;
                SqlDataAdapter da1 = new SqlDataAdapter(cmd1);

                DataSet ds1 = new DataSet();
                da1.Fill(ds1, "typeId");
                foreach (DataTable table in ds1.Tables)
                {

                    foreach (DataRow dr in table.Rows)
                    {
                        String S = Convert.ToString(dr["typeId"].ToString());
                        foreach (ListItem item in chktype.Items)
                        {
                            if (S == item.Value)
                            {
                                item.Selected = true;
                            }
                        }
                    }
                }

                DataAccess dal2 = new DataAccess();
                SqlCommand cmd2 = dal.Query("sp_SelectMovieActors");
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.Add("@movieId", SqlDbType.Int).Value = movieId;
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);

                DataSet ds2 = new DataSet();
                da2.Fill(ds2, "actorId");
                foreach (DataTable table in ds2.Tables)
                {

                    foreach (DataRow dr in table.Rows)
                    {
                        String a = Convert.ToString(dr["actorId"].ToString());
                        foreach (ListItem item2 in chkboxActors.Items)
                        {
                            if (a == item2.Value)
                            {
                                item2.Selected = true;
                            }
                        }
                    }
                }


                ViewState["movieId"] = movieId;
                Label1.Text = ddlMovie.SelectedItem.Text;
                field = bl.SelectMovies(movieId);
                field.movieId = movieId;
                datepicker.Text = field.movieYear.ToString();
                field = bl.SelectDirectorName(field);
                // ddlDirectors.Items.Add(field2.director.ToString());
                //ddlDirectors.SelectedItem.Text = field2.director.ToString();
                for (int i = 0; i < ddlDirectors.Items.Count; i++)
                {

                    if (ddlDirectors.Items[i].Text == field.director.ToString())
                    {
                        ddlDirectors.ClearSelection();
                        ddlDirectors.Items[i].Selected = true;
                        break;

                    }

                }
                //ViewState["directorId"] = field.directorId;
                // txtDirector.Text = fieldD.director.ToString();
                //listType.Items.Clear();
                
                lblmessage.Text = "";
                lblmessageActor.Text = "";
                //DataAccess dal1 = new DataAccess();
                //SqlCommand cmd1 = dal.Query("sp_SelectMovieActors");
                //cmd1.CommandType = CommandType.StoredProcedure;
                //cmd1.Parameters.Add("@movieId", SqlDbType.Int).Value = movieId;
                //SqlDataAdapter da1 = new SqlDataAdapter(cmd1);

                //DataSet ds1 = new DataSet();
                //da1.Fill(ds1, "actorId");
                //listActors.DataSource = ds1.Tables[0];
                //listActors.DataTextField = ds1.Tables[0].Columns[1].ToString();
                //listActors.DataValueField = ds1.Tables[0].Columns[0].ToString();
                //DataBind();

                //DataAccess dal2 = new DataAccess();
                //SqlCommand cmd2 = dal.Query("sp_SelectMovieActorsX");
                //cmd2.CommandType = CommandType.StoredProcedure;
                //cmd2.Parameters.Add("@movieId", SqlDbType.Int).Value = movieId;
                //SqlDataAdapter da2 = new SqlDataAdapter(cmd2);

                //DataSet ds2 = new DataSet();
                //da2.Fill(ds2, "actorId");
                //listActorsAdd.DataSource = ds2.Tables[0];
                //listActorsAdd.DataTextField = ds2.Tables[0].Columns[1].ToString();
                //listActorsAdd.DataValueField = ds2.Tables[0].Columns[0].ToString();
                //DataBind();

                Session["selectedmovieid"] = ddlMovie.SelectedValue;
                bl.retrieveImage(field);
                string image = field.imageData;
                Image1.ImageUrl = image;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            // int movieId = Convert.ToInt32(Session["movieId"]);
            int movieId = Convert.ToInt32(Session[ddlMovie.SelectedValue]);
            try
            {
                
                if (ddlMovie.SelectedValue != "Seçiniz")
                {
                    field.movieId = Convert.ToInt32(ddlMovie.SelectedValue);

                }
                field.movieYear = Convert.ToDateTime(datepicker.Text);
                //field.director = txtDirector.Text;
                field.movieId = Convert.ToInt32(ddlMovie.SelectedValue);
                field.directorId = Convert.ToInt32(ddlDirectors.SelectedValue);

                bl.UpdateMovie(field);
                bl.UpdateDirector(field);
                Session["selectedmovieid"] = 0;
                if (FileUpload1.HasFile)
                {
                    field.imageData = "~/Uploads/" + FileUpload1.FileName.ToString();
                    bl.updateImage(field);
                    //ddlMovie.ClearSelection();
                    //listType.Items.Clear();
                    //datepicker.Text = "";
                    //ddlDirectors.ClearSelection();
                    //listActors.Items.Clear();
                    Response.Redirect("Movies.aspx");
                }
                for(int i=0; i < chktype.Items.Count; i++)
                {
                    if (chktype.Items[i].Selected)
                    {
                        bl.InsertType(field, Convert.ToInt32(chktype.Items[i].Value));
                    }
                }
                for (int i = 0; i < chkboxActors.Items.Count; i++)
                {
                    if (chkboxActors.Items[i].Selected)
                    {
                        bl.InsertActors(field, Convert.ToInt32(chkboxActors.Items[i].Value));
                    }
                }

                // Response.Write("<script>alert('"+ddlMovie.SelectedItem.Text+" was Updated Successfullyxcd!')</script>");
                Response.Redirect("Movies.aspx");
            }
            catch (Exception ex)
            {
                lblmessage.Text = ex.ToString();
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            BusinessLayer bl = new BusinessLayer();
            field.movieId = Convert.ToInt32(ddlMovie.SelectedValue);

            // field.movieId = Convert.ToInt32(ViewState["movieId"]);
            //lblmessage.Text = ViewState["movieId"].ToString();
            try
            {
                bl.DeleteMovie(field.movieId);
                // field.movieId = Convert.ToInt32(ddlMovie.SelectedValue);
                // Response.Write("<script>alert('" + ddlMovie.SelectedItem.Text + " was Deleted Successfullyxcd!')</script>");
                lblmessage.Text = "The Movie was DELETED!";

            }
            catch (Exception ex)
            {
                lblmessage.Text = "ERROR! "+ex.Message;
                
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("InsertMovies.aspx");
        }
        protected void ButtonTypeAdd_Click(object sender, EventArgs e)
        {
               
               lblmessage.Text = "ADDED!";
            
        }

        //protected void ButtonTypeDelete_Click(object sender, EventArgs e)
        //{
        //    int movieId = Convert.ToInt32(ddlMovie.SelectedValue);
        //    bl.DeleteType(movieId, Convert.ToInt32(listType.SelectedItem.Value));
        //    //DataAccess dal = new DataAccess();
        //    //SqlCommand cmd = dal.Query("sp_SelectMovieType");
        //    //cmd.CommandType = CommandType.StoredProcedure;
        //    //cmd.Parameters.Add("@movieId", SqlDbType.Int).Value = movieId;
        //    //SqlDataAdapter da = new SqlDataAdapter(cmd);

        //    //DataSet ds = new DataSet();
        //    //da.Fill(ds, "typeId");
        //    //listType.DataSource = ds.Tables[0];
        //    //listType.DataTextField = ds.Tables[0].Columns[1].ToString();
        //    //listType.DataValueField = ds.Tables[0].Columns[0].ToString();
        //    //DataBind();
        //    listType.SelectedItem.Text = "";
        //    lblmessage.Text = "DELETED!";


        //}

        //protected void ButtonActorAdd_Click(object sender, EventArgs e)
        //{


        //}

        //protected void ButtonActorDelete_Click(object sender, EventArgs e)
        //{

        //}

        //protected void ButtonType_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("login.aspx");
        //}

        //protected void ButtonActor_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("login.aspx");
        //}

        //protected void listTypeAdd_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int movieId = Convert.ToInt32(ddlMovie.SelectedValue);
        //    listType.Items.Add(listTypeAdd.SelectedItem.Text.ToString());
        //    bl.InsertType(movieId, Convert.ToInt32(listTypeAdd.SelectedItem.Value));
        //    lblmessage.Text = "ADDED!";
        //}

        //protected void listActorsAdd_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int movieId = Convert.ToInt32(ddlMovie.SelectedValue);

        //    listActors.Items.Add(listActorsAdd.SelectedItem.Text.ToString());
        //    bl.InsertActors(movieId, Convert.ToInt32(listActorsAdd.SelectedItem.Value));
        //    lblmessageActor.Text="Added!";
        //}

        //protected void ButtonTypeDelete0_Click(object sender, EventArgs e)
        //{
        //    int movieId = Convert.ToInt32(ddlMovie.SelectedValue);
        //    bl.DeleteActors(movieId, Convert.ToInt32(listActors.SelectedItem.Value));
        //    listActors.SelectedItem.Text = "";
        //    lblmessageActor.Text = "DELETED!";

        //}

        protected void ButtonActor_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }

        protected void ButtonType_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}
    

