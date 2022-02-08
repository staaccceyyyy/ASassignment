using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace WebApplication
{
    public partial class Registration : System.Web.UI.Page
    {
        string MYDBConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MYDBConnectionString"].ConnectionString;

        static string finalHash;
        static string salt;
        byte[] Key;
        byte[] IV;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {

        }

        //hashing for pw and cc
        protected void submitbtnClick(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("this");

            if (fnameTB.Text.Length < 1 || lnameLB.Text.Length < 1 || emailLB.Text.Length < 1 || pwLB.Text.Length < 1 || ccnoLB.Text.Length < 1)
            {
                allinputVD.Text = "*Plese fill in all fields";
                allinputVD.Visible = true;
                //validate? 
                //System.Diagnostics.Debug.WriteLine("error");
            }

            fnameTB.Text = HttpUtility.HtmlEncode(fnameTB.Text);
            lnameTB.Text = HttpUtility.HtmlEncode(lnameTB.Text);
            emailTB.Text = HttpUtility.HtmlEncode(emailTB.Text);
            ccnoTB.Text = HttpUtility.HtmlEncode(ccnoTB.Text);
            pwTB.Text = HttpUtility.HtmlEncode(pwTB.Text);

            //validateregister();

            if (pwTB.Text.Length >= 12 )
            {
                string pwd = pwTB.Text.ToString().Trim();
                System.Diagnostics.Debug.WriteLine("help" + pwTB.Text + "fhbsdbfsbh");
                RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
                byte[] saltByte = new byte[8];

                rng.GetBytes(saltByte);

                salt = Convert.ToBase64String(saltByte);
                SHA512Managed hashing = new SHA512Managed();
                string pwdWithSalt = pwd + salt;

                byte[] plainHash = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwd));
                byte[] hashWithSalt = hashing.ComputeHash(Encoding.UTF8.GetBytes(pwdWithSalt));

                finalHash = Convert.ToBase64String(hashWithSalt);
                RijndaelManaged cipher = new RijndaelManaged();

                cipher.GenerateKey();

                Key = cipher.Key;
                IV = cipher.IV;

                createAccount();
                Response.Redirect("Login.aspx");
            }
            else
            {
                //validateregister();
            }
        }

        //encrpyt credit card no
        protected byte[] encryptcreditcard(string data)
        {
            byte[] cipherText = null;
            try
            {
                RijndaelManaged cipher = new RijndaelManaged();
                cipher.IV = IV;
                cipher.Key = Key;
                ICryptoTransform encryptTransform = cipher.CreateEncryptor();
                byte[] plainText = Encoding.UTF8.GetBytes(data);
                cipherText = encryptTransform.TransformFinalBlock(plainText, 0, plainText.Length);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
            finally { }
            return cipherText;
        }


        protected void validateregister()
        {
           
            int noerrors = 0;
            if (fnameTB.Text.Length < 1 || lnameLB.Text.Length < 1 || emailLB.Text.Length < 1 || pwLB.Text.Length < 1 || ccnoLB.Text.Length < 1)
            {
                allinputVD.Text = "*Plese fill in all fields";
                allinputVD.Visible = true;
                //System.Diagnostics.Debug.WriteLine("error");
            }
            else
            {
                noerrors += 1;
                    if (Regex.IsMatch(fnameTB.Text, "^[a - zA - Z]$"))
                    {
                        fnameVD.Visible = false;
                        noerrors += 1;
                    }
                    else
                    {
                        fnameVD.Text = "*Only alphabets allowed";
                        fnameVD.Visible = true;
                    }
                    if (Regex.IsMatch(lnameTB.Text, "^[a - zA - Z]$"))
                    {
                        lnameVD.Visible = false;
                        noerrors += 1;
                    }
                    else
                    {
                        lnameVD.Text = "*Only alphabets allowed";
                        lnameVD.Visible = true;
                    }
                    string emailregex = @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z";
                    if (Regex.IsMatch(emailTB.Text, emailregex)) //email???
                    {
                        emailVD.Visible = false;
                        noerrors += 1;
                    }
                    else
                    {
                        emailVD.Text = "*Invalid email";
                        emailVD.Visible = true;
                    }
                    if (Regex.IsMatch(pwTB.Text, "^(?=[^A-Z\n]*[A-Z])(?=[^a-z\n]*[a-z])(?=[^0-9\n]*[0-9])(?=[^#?!@$%^&*\n-]*[#?!@$%^&*-]).{12,}$"))
                    {
                        pwVD.Visible = false;
                        noerrors += 1;
                    }
                    else
                    {
                        pwVD.Text = "*Password is not strong enough";
                        pwVD.Visible = true;
                    }
                    if (Regex.IsMatch(ccnoTB.Text, @"\d{16}"))
                    {
                        ccnoVD.Visible = false;
                        noerrors += 1;
                    }
                    else
                    {
                        ccnoVD.Text = "*Invalid credit card number";
                        ccnoVD.Visible = true;
                    }
                    
                System.Diagnostics.Debug.WriteLine("error here" + noerrors);
            }
            System.Diagnostics.Debug.WriteLine("error eefs2" + noerrors);
            System.Diagnostics.Debug.WriteLine("inhere" );
            if (noerrors == 5)
            {
                return;
            }

            //call the btnsubmit thing once everything is ok


        }



        //adding to db 
        protected void createAccount()
        {
            pwstrengthbtn();
            
            try
            {
                using (SqlConnection con = new SqlConnection(MYDBConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("INSERT INTO Accounts VALUES(@fname, @lname, @creditcardno, @email, @DOB, @PasswordHash, @PasswordSalt, @profileimg, @IV, @Key )"))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {

                            cmd.CommandType = CommandType.Text;
                            cmd.Parameters.AddWithValue("@fname", fnameTB.Text.Trim());
                            cmd.Parameters.AddWithValue("@lname", lnameTB.Text.Trim());

                            cmd.Parameters.AddWithValue("@creditcardno", Convert.ToBase64String(encryptcreditcard(ccnoTB.Text.Trim())));

                            cmd.Parameters.AddWithValue("@email", emailTB.Text.Trim());
                            cmd.Parameters.AddWithValue("@DOB", dobTB.SelectedDate);

                            cmd.Parameters.AddWithValue("@PasswordHash", finalHash);
                            cmd.Parameters.AddWithValue("@PasswordSalt", salt);

                            cmd.Parameters.AddWithValue("@profileimg", photoTB.FileBytes);
                            cmd.Parameters.AddWithValue("@IV", Convert.ToBase64String(IV));
                            cmd.Parameters.AddWithValue("@Key", Convert.ToBase64String(Key));

                            //cmd.Connection = con;
                            //con.Open();
                            //cmd.ExecuteNonQuery();
                            //con.Close();
                            try
                            {
                                con.Open();
                                cmd.ExecuteNonQuery();
                                //con.Close();
                            }
                            catch (Exception ex)
                            {
                                //throw new Exception(ex.ToString());
                                allinputVD.Text = ex.ToString();
                            }
                            finally
                            {
                                con.Close();
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.ToString());
            }
        }

        private int chkpwstrength(string password)
        {
            int score = 0;
            //implementation

            if (password.Length < 12)
            {
                return 1;
            }
            else
            {
                score = 1;
            }

            if (Regex.IsMatch(password, "[a-z]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[A-Z]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[0-9]"))
            {
                score++;
            }
            if (Regex.IsMatch(password, "[^A-Za-z0-9]"))
            {
                score++;
            }

            return score;
        }
        protected void pwstrengthbtn()
        {
            //object sender, EventArgs e
            //implement codes for the button event
            //Extract data from textbox
            int scores = chkpwstrength(pwTB.Text);
            string status = "";
            switch (scores)
            {
                case 1:
                    status = "Very Weak";
                    break;
                case 2:
                    status = "Weak";
                    break;
                case 3:
                    status = "Medium";
                    break;
                case 4:
                    status = "Strong";
                    break;
                case 5:
                    status = "Very Strong";
                    break;
                default:
                    break;
            }
            pwstrengthLB.Text = "Status : " + status;
            if (scores > 4)
            {
                pwstrengthLB.Text = "password strength : " + status;
                pwstrengthLB.ForeColor = Color.Green;
                return;
            }

        }
    }
}