<%@ Page Title="" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment_Group31.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-container">
        <h2>Join Math Leveling</h2>
        
        <div class="form-group">
            <label>First Name:</label>
            <asp:TextBox ID="firstname" runat="server" CssClass="input-field"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFirst" runat="server" ControlToValidate="firstname" ErrorMessage="*" ForeColor="Red" />
        </div>

        <div class="form-group">
            <label>Last Name:</label>
            <asp:TextBox ID="lastname" runat="server" CssClass="input-field"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvLast" runat="server" ControlToValidate="lastname" ErrorMessage="*" ForeColor="Red" />
        </div>

        <div class="form-group">
            <label>Email:</label>
            <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input-field"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email" ErrorMessage="*" ForeColor="Red" />
        </div>

        <div class="form-group">
            <label>Gender:</label>
            <asp:DropDownList ID="gender" runat="server">
                <asp:ListItem Text="Select" Value="" />
                <asp:ListItem Text="Male" Value="Male" />
                <asp:ListItem Text="Female" Value="Female" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>I am a:</label>
            <asp:DropDownList ID="usertype" runat="server">
                <asp:ListItem Text="Student" Value="Student" />
                <asp:ListItem Text="Teacher" Value="Teacher" />
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Username:</label>
            <asp:TextBox ID="username" runat="server" CssClass="input-field"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" Strict="true"></asp:TextBox>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Create Account" OnClick="btnRegister_Click" />
    </div>
</asp:Content>
