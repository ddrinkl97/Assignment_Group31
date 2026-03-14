using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Assignment_Group31
{
    public partial class Users : System.Web.UI.Page
    {
        private readonly string connStr = ConfigurationManager.ConnectionStrings["ConnectionUser"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin-only
            if (Session["UserID"] == null || Session["RoleName"] == null || Session["RoleName"].ToString() != "Admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadRolesDropDown();
                BindUserGrid();
            }
        }

        private void LoadRolesDropDown()
        {
            ddlRole.Items.Clear();
            ddlRole.Items.Add(new ListItem("Admin", "Admin"));
            ddlRole.Items.Add(new ListItem("Teacher", "Teacher"));
            ddlRole.Items.Add(new ListItem("Student", "Student"));
            ddlRole.SelectedIndex = 0;
        }

        private void BindUserGrid()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    Id,
                    username,
                    firstname,
                    lastname,
                    email,
                    usertype,
                    gender
                FROM dbo.UserTable
                ORDER BY Id DESC;", conn))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    gvUsers.DataSource = dt;
                    gvUsers.DataBind();
                }
            }
        }

        // CREATE (uses your existing UI fields: txtFullName/txtEmail/txtPassword)
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.ForeColor = System.Drawing.Color.Red;

            if (string.IsNullOrWhiteSpace(txtFullName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text) ||
                ddlRole.SelectedItem == null)
            {
                lblMessage.Text = "Full Name, Email, Password and Role are required.";
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim(); // plain text for assignment
            string usertype = ddlRole.SelectedValue;

            // Minimal mapping: store full name into firstname; lastname left NULL
            string firstname = fullName;
            object lastname = DBNull.Value;

            // Create a simple username from email prefix if your UI doesn't have username
            string username = email.Contains("@") ? email.Split('@')[0] : email;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand(@"
                    INSERT INTO dbo.UserTable (username, [password], firstname, lastname, usertype, gender, email)
                    VALUES (@username, @password, @firstname, @lastname, @usertype, @gender, @email);", conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);
                    cmd.Parameters.AddWithValue("@firstname", firstname);
                    cmd.Parameters.AddWithValue("@lastname", lastname);
                    cmd.Parameters.AddWithValue("@usertype", usertype);
                    cmd.Parameters.AddWithValue("@gender", DBNull.Value); // your UI doesn't have gender
                    cmd.Parameters.AddWithValue("@email", email);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                txtFullName.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                ddlRole.SelectedIndex = 0;

                BindUserGrid();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "User added successfully.";
            }
            catch (SqlException ex)
            {
                if (ex.Message != null && ex.Message.ToLower().Contains("ix_usertable_email"))
                    lblMessage.Text = "That email is already registered. Please use a different email.";
                else
                    lblMessage.Text = "Database error: " + ex.Message;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        // GridView: start editing
        protected void gvUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvUsers.EditIndex = e.NewEditIndex;
            BindUserGrid();
        }

        // GridView: cancel edit
        protected void gvUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvUsers.EditIndex = -1;
            BindUserGrid();
        }

        // GridView: update row (updates email/usertype; keeps things simple)
        protected void gvUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.ForeColor = System.Drawing.Color.Red;

            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            // NOTE: These cell indexes must match your GridView column order.
            // If this misbehaves, paste Users.aspx markup and I'll switch to FindControl().
            string username = ((TextBox)gvUsers.Rows[e.RowIndex].Cells[1].Controls[0]).Text.Trim();
            string firstname = ((TextBox)gvUsers.Rows[e.RowIndex].Cells[2].Controls[0]).Text.Trim();
            string lastname = ((TextBox)gvUsers.Rows[e.RowIndex].Cells[3].Controls[0]).Text.Trim();
            string email = ((TextBox)gvUsers.Rows[e.RowIndex].Cells[4].Controls[0]).Text.Trim();
            string usertype = ((TextBox)gvUsers.Rows[e.RowIndex].Cells[5].Controls[0]).Text.Trim();
            string gender = ((TextBox)gvUsers.Rows[e.RowIndex].Cells[6].Controls[0]).Text.Trim();

            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(usertype))
            {
                lblMessage.Text = "Email and User Type cannot be empty.";
                return;
            }

            if (usertype != "Admin" && usertype != "Teacher" && usertype != "Student")
            {
                lblMessage.Text = "User Type must be Admin, Teacher, or Student.";
                return;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand(@"
                    UPDATE dbo.UserTable
                    SET username = @username,
                        firstname = @firstname,
                        lastname = @lastname,
                        email = @email,
                        usertype = @usertype,
                        gender = @gender
                    WHERE Id = @id;", conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@firstname", string.IsNullOrWhiteSpace(firstname) ? (object)DBNull.Value : firstname);
                    cmd.Parameters.AddWithValue("@lastname", string.IsNullOrWhiteSpace(lastname) ? (object)DBNull.Value : lastname);
                    cmd.Parameters.AddWithValue("@email", email);
                    cmd.Parameters.AddWithValue("@usertype", usertype);
                    cmd.Parameters.AddWithValue("@gender", string.IsNullOrWhiteSpace(gender) ? (object)DBNull.Value : gender);
                    cmd.Parameters.AddWithValue("@id", id);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                gvUsers.EditIndex = -1;
                BindUserGrid();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "User updated successfully.";
            }
            catch (SqlException ex)
            {
                if (ex.Message != null && ex.Message.ToLower().Contains("ix_usertable_email"))
                    lblMessage.Text = "That email is already registered. Please use a different email.";
                else
                    lblMessage.Text = "Database error: " + ex.Message;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        // GridView: delete row
        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            lblMessage.Text = "";
            lblMessage.ForeColor = System.Drawing.Color.Red;

            int id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = new SqlCommand("DELETE FROM dbo.UserTable WHERE Id = @id;", conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }

                BindUserGrid();

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "User deleted successfully.";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}