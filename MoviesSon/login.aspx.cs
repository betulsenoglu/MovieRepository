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
         DataAccess dal = new DataAccess();
       
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }


        protected void btnlogin_Click(object sender, EventArgs e)
        {
            field.username = txtusername.Text;
            field.password = txtpassword.Text;
            bl.ValidateUser(field);
            if (field.labeltext == "SUCCESS!")
                Response.Redirect("AddNewType.aspx");
            else
            Response.Write("<script>alert('"+field.labeltext +"')</script>");
            
            
          
        }

        protected void btnsignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Movies.aspx");
        }
    }
}
    

