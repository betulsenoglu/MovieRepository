using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moviesSon
{
    public partial class InsertMovies : System.Web.UI.Page
    {
        BusinessLayer bl = new BusinessLayer();
        Fields field = new Fields();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                DataAccess dal = new DataAccess();
                #region Types
                SqlCommand cmd = dal.Query("sp_ListTypes");
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataSet ds = new DataSet();
                da.Fill(ds);

                chkbox.DataSource = ds.Tables[0];
                chkbox.DataValueField = "typeId";
                chkbox.DataTextField = "type";
                chkbox.DataBind();

                DataBind();
                #endregion
                #region Directors
                SqlCommand cmd2 = dal.Query("sp_ListDirectors");
                cmd2.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da2 = new SqlDataAdapter(cmd2);

                DataSet ds2 = new DataSet();
                da2.Fill(ds2, "directorId");


                #endregion
                #region Actors
                //SqlCommand cmd3 = dal.Query("sp_ListActors");
                //cmd3.CommandType = CommandType.StoredProcedure;
                //SqlDataAdapter da3 = new SqlDataAdapter(cmd3);

                //DataSet ds3 = new DataSet();
                //da3.Fill(ds3, "directorId");
                //chkactors.DataSource = ds3.Tables[0];
                ////listType.DataTextField = ds.Tables[0].Columns[1].ToString();
                //chkactors.DataValueField = ds3.Tables[0].Columns[0].ToString();
                //DataBind();
                #endregion
            }
        }



        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                field.movieName = txtName.Text;
                field.movieYear = Convert.ToDateTime(datepicker.Text);
                field.movieId = bl.InsertMovieRT(field);

                for (int i = 0; i < chkbox.Items.Count; i++)
                {

                    if (chkbox.Items[i].Selected)
                    {
                        bl.InsertType(field, Convert.ToInt32(chkbox.Items[i].Value));
                    }

                }
                for (int i = 0; i < rbDirectors.Items.Count; i++)
                {

                    if (rbDirectors.Items[i].Selected)
                    {
                        bl.InsertDirectors(field.movieId, Convert.ToInt32(rbDirectors.Items[i].Value));
                    }

                }
                for (int i = 0; i < chkactors.Items.Count; i++)
                {

                    if (chkactors.Items[i].Selected)
                    {
                        bl.InsertActors(field, Convert.ToInt32(chkactors.Items[i].Value));
                    }

                }
                if (FileUpload1.HasFile)
                    try
                    {
                        FileUpload1.SaveAs(Server.MapPath("~/Uploads/" +
                             FileUpload1.FileName));
                       // field.imageData = "C:\\Users\\Betul\\Desktop\\moviesSon\\Uploads\\" +
                            // FileUpload1.FileName.ToString();
                       // lblmessage.Text = "File name: " + FileUpload1.PostedFile.FileName + "<br>" + FileUpload1.PostedFile.ContentLength + " kb<br>" +
                          //   "Content type: " +  FileUpload1.PostedFile.ContentType;
                          lblmessage.Text= "~/Uploads/" + FileUpload1.FileName.ToString();
                  
                        string image = field.imageData= lblmessage.Text;
                        //Image1.ImageUrl = image;
                       bl.InsertImageData(field);

                    }
                    catch (Exception ex)
                    {
                        lblmessage.Text = "ERROR: " + ex.Message.ToString();
                    }
                else
                {
                    lblmessage.Text = "You have not specified a file.";
                }

                chkbox.ClearSelection();
                rbDirectors.ClearSelection();
                chkactors.ClearSelection();
                txtName.Text = "";
                datepicker.Text = "";

                  
                  Response.Redirect("Movies.aspx");
            }

            catch (Exception ex)
            {
                lblmessage.Text = "ERROR: " + ex.Message.ToString();
            }
        }
            
        protected void btnMovies_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movies.aspx");
        }

    }
}







