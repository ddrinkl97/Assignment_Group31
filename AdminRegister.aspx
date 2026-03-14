<%@ Page Title="Admin Registration" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="Assignment_Group31.AdminRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section">
        <div class="register-container">
            <div class="page-header">
                <h2>Create Admin Account</h2>
                <p>Register a new administrator account for the Math Leveling system.</p>
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label for="<%= firstname.ClientID %>">First Name</label>
                    <asp:TextBox ID="firstname" runat="server" CssClass="input-field"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="<%= lastname.ClientID %>">Last Name</label>
                    <asp:TextBox ID="lastname" runat="server" CssClass="input-field"></asp:TextBox>
                </div>

                <div class="form-group full-width">
                    <label for="<%= email.ClientID %>">Email Address</label>
                    <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input-field"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="<%= gender.ClientID %>">Gender</label>
                    <asp:DropDownList ID="gender" runat="server" CssClass="input-field">
                        <asp:ListItem Text="Male" Value="Male" />
                        <asp:ListItem Text="Female" Value="Female" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="<%= username.ClientID %>">Username</label>
                    <asp:TextBox ID="username" runat="server" CssClass="input-field"></asp:TextBox>
                </div>

                <div class="form-group full-width">
                    <label for="<%= password.ClientID %>">Password</label>
                    <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
                </div>

                <div class="form-group full-width admin-secret-box">
                    <label for="<%= adminSecret.ClientID %>">Admin Secret Key</label>
                    <asp:TextBox ID="adminSecret" runat="server" CssClass="input-field" TextMode="Password" OnTextChanged="adminSecret_TextChanged"></asp:TextBox>
                    <small>Enter the master code to enable admin creation.</small>
                </div>
            </div>

            <div class="form-actions">
                <asp:Button ID="btnConfirmAdmin" runat="server" Text="Register Administrator" CssClass="primary-btn" OnClick="btnConfirmAdmin_Click" />
            </div>
        </div>
    </section>
</asp:Content>