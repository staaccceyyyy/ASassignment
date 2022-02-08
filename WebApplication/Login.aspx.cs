using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Login : System.Web.UI.Page
    {

        string MYDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginclick(object sender, EventArgs e)
        {
           
            string email1 = emailLOGTB.Text.ToString().Trim();
            string password = passwordLOGTB.Text.ToString().Trim();

            
            string errordisplay = errorLOB.Text.ToString().Trim();

            SHA512Managed hashing = new SHA512Managed();
            string dbHash = getDBHash(email1);
            string dbSalt = getDBSalt(email1);
            
            try
            {
                System.Diagnostics.Debug.WriteLine("helll2");
                if (dbSalt != null && dbSalt.Length > 0 && dbHash != null && dbHash.Length > 0)
                {
                    System.Diagnostics.Debug.WriteLine("sfds");
                    string pwdWithSalt = password    + dbSalt;
                    byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));
                    string userHash = Convert.ToBase64String(hashWithSalt);
                    if (userHash.Equals(dbHash))
                    {
                        System.Diagnostics.Debug.WriteLine("pppppp");
                        Session["loggedin"] = email1;

                        string guid = Guid.NewGuid().ToString();
                        Session["AuthToken"] = guid;
                        Response.Cookies.Add(new HttpCookie("AuthToken", guid));

                        Response.Redirect("ProfileHome.aspx", false);
                        
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("jkabdsadbh");
                        errordisplay = "Userid or password is not valid. Please try again.";
                        Response.Redirect("Login.aspx");
                    }
                }
            }
            catch (Exception ex)
            {
               
                throw new Exception(ex.ToString());
            }
            finally { }

        }

        private string getDBSalt(string email1)
        {
            //throw new NotImplementedException();
            string s = null;
            SqlConnection connection = new SqlConnection(MYDBConnectionString);
            string sql = "select PASSWORDSALT FROM Accounts WHERE Email=@email";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@email", email1);
            try
            {
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader["PASSWORDSALT"] != null)
                        {
                            if (reader["PASSWORDSALT"] != DBNull.Value)
                            {
                                s = reader["PASSWORDSALT"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { connection.Close(); }
            return s;
        }

        private string getDBHash(string email1)
        {
            //throw new NotImplementedException();

            string h = null;
            SqlConnection connection = new SqlConnection(MYDBConnectionString);
            string sql = "select PasswordHash FROM Accounts WHERE Email=@email";
            SqlCommand command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@email", email1);
            try
            {
                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {

                    while (reader.Read())
                    {
                        if (reader["PasswordHash"] != null)
                        {
                            if (reader["PasswordHash"] != DBNull.Value)
                            {
                                h = reader["PasswordHash"].ToString();
                            }
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { connection.Close(); }
            return h;
        }
    }

   

        //protected string getDBSalt(string userid)
        //{
            
        //}

        //protected byte[] encryptData(string data)
        //{
        //    byte[] cipherText = null;
        //    try
        //    {
        //        RijndaelManaged cipher = new RijndaelManaged();
        //        cipher.IV = IV;
        //        cipher.Key = Key;
        //        ICryptoTransform encryptTransform = cipher.CreateEncryptor();
        //        //ICryptoTransform decryptTransform = cipher.CreateDecryptor();
        //        byte[] plainText = Encoding.UTF8.GetBytes(data);
        //        cipherText = encryptTransform.TransformFinalBlock(plainText, 0,
        //       plainText.Length);
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.ToString());
        //    }
        //    finally { }
        //    return cipherText;
        //}

    //}
}