<%@ Page Title="" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Assignment_Group31.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container">
        <h2>Reset Password</h2>
    <p>Enter your details to verify and reset.</p>

    <div class="form-group" style="text-align: left;">
        <label>Username</label>
        <asp:TextBox ID="txtUsername" runat="server" CssClass="input-field"></asp:TextBox>
    </div>
    <div class="form-group" style="text-align: left;">
        <label>Registered Email</label>
        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input-field"></asp:TextBox>
    </div>

    <hr style="margin: 20px 0; border: 0; border-top: 1px solid #eee;" />

    <div class="form-group" style="text-align: left;">
        <label>New Password</label>
        <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="input-field" placeholder="Enter new password"></asp:TextBox>
    </div>
    
    <div class="form-group" style="text-align: left;">
        <label>Confirm New Password</label>
        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="input-field" placeholder="Re-type new password"></asp:TextBox>
    </div>

    <asp:Button ID="btnUpdatePassword" runat="server" Text="Reset My Password" OnClick="btnUpdatePassword_Click" CssClass="submit-btn" />
    
    <p style="margin-top: 20px;"><a href="Login.aspx">Back to Login</a></p>
    </div>
</asp:Content>
