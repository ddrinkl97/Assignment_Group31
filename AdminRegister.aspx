<%@ Page Title="Admin Registration" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="Assignment_Group31.AdminRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Small style for the secret key section to make it look important */
        .secret-key-area {
            background-color: #fff5f5;
            border: 1px solid #feb2b2;
            padding: 15px;
            border-radius: 12px;
            margin-top: 10px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-container">
        <h2>Create Admin Account</h2>
        <p style="text-align:center; color: var(--text-secondary); margin-bottom: 25px;">New administrator registration </p>

        <div class="form-group">
            <label>First Name</label>
            <asp:TextBox ID="firstname" runat="server" CssClass="input-field" placeholder="Admin First Name"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Last Name</label>
            <asp:TextBox ID="lastname" runat="server" CssClass="input-field" placeholder="Admin Last Name"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input-field" placeholder="admin@mathleveling.com"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Gender</label>
            <asp:DropDownList ID="gender" runat="server" CssClass="input-field">
                <asp:ListItem Text="Select Gender" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Username</label>
            <asp:TextBox ID="username" runat="server" CssClass="input-field" placeholder="Admin Username"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input-field" placeholder="••••••••"></asp:TextBox>
        </div>

        <div class="secret-key-area">
            <div class="form-group" style="margin-bottom: 0;">
                <label style="color: #c53030;"><strong>Admin Secret Key</strong></label>
                <asp:TextBox ID="adminSecret" runat="server" CssClass="input-field" TextMode="Password" placeholder="Enter Master Code"></asp:TextBox>
                <small style="color: #9b2c2c; display: block; margin-top: 5px;">Required to enable administrator creation.</small>
            </div>
        </div>

        <asp:Button ID="btnConfirmAdmin" runat="server" Text="Register Administrator" OnClick="btnConfirmAdmin_Click" CssClass="submit-btn admin-btn" style="margin-top: 25px;" CausesValidation="false" />
        
        <p style="text-align:center; margin-top: 20px; font-size: 0.9rem;">
            <a href="Login.aspx" style="color: var(--text-secondary);">Back to Login</a>
        </p>
    </div>
</asp:Content>
