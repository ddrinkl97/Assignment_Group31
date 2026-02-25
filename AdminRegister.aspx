<%@ Page Title="Admin Registration" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="AdminRegister.aspx.cs" Inherits="Assignment_Group31.AdminRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-container">
        <h2>Create Admin Account</h2>

        <div class="form-group">
            <label>First Name:</label>
            <asp:TextBox ID="firstname" runat="server" CssClass="input-field"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Last Name:</label>
            <asp:TextBox ID="lastname" runat="server" CssClass="input-field"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input-field"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Gender:</label>
            <asp:DropDownList ID="gender" runat="server">
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Username:</label>
            <asp:TextBox ID="username" runat="server" CssClass="input-field"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
        </div>

        <div class="form-group" style="background-color: #f8d7da; padding: 10px; border-radius: 5px;">
            <label><strong>Admin Secret Key:</strong></label>
            <asp:TextBox ID="adminSecret" runat="server" CssClass="input-field" TextMode="Password" OnTextChanged="adminSecret_TextChanged"></asp:TextBox>
            <small>Enter the master code to enable admin creation.</small>
        </div>

        <asp:Button ID="btnConfirmAdmin" runat="server" Text="Register Administrator" OnClick="btnConfirmAdmin_Click" />
    </div>
</asp:Content>
