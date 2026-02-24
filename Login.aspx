<%@ Page Title="" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment_Group31.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2>Welcome Back!</h2>
        <p>Please log in to access your math activities.</p>
        
        <div class="form-group">
            <label>Username:</label>
            <asp:TextBox ID="username" runat="server" CssClass="input-field"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUser" runat="server" ControlToValidate="username" 
                ErrorMessage="Username is required!" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="password" 
                ErrorMessage="Password is required!" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn-submit" />
        
        <p>Don't have an account? <a href="Register.aspx">Register here</a></p>
    </div>
</asp:Content>
