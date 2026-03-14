<%@ Page Title="" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment_Group31.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2>Welcome Back!</h2>
        <p>Please log in to access your math activities.</p>
        
        <div class="form-group" style="text-align: left;">
            <label>Username</label>
            <asp:TextBox ID="username" runat="server" CssClass="input-field" placeholder="Enter your username"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUser" runat="server" ControlToValidate="username" 
                ErrorMessage="Username is required!" ForeColor="Red" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group" style="text-align: left;">
            <label>Password</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input-field" placeholder="••••••••"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="password" 
                ErrorMessage="Password is required!" ForeColor="Red" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="submit-btn" />

        <p style="margin-top: 15px; font-size: 0.85rem;">
            <a href="ForgotPassword.aspx" style="color: var(--text-secondary); text-decoration: none;">Forgot Password?</a>
        </p>
        
        <p style="margin-top: 20px; font-size: 0.9rem;">
            Don't have an account? <a href="Register.aspx" style="color: var(--primary-color); font-weight: 600;">Register here</a>
        </p>
    </div>
</asp:Content>
