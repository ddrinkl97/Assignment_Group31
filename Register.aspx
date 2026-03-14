<%@ Page Title="" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment_Group31.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-container">
        <div class="page-header">
            <h2>Join Math Leveling</h2>
            <p>Create your account to start learning with the Math Leveling system.</p>
        </div>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" DisplayMode="BulletList" />

        <div class="form-grid">
            <div class="form-group">
                <label for="<%= firstname.ClientID %>">First Name</label>
                <asp:TextBox ID="firstname" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirst" runat="server" ControlToValidate="firstname" ErrorMessage="First name is required." ForeColor="Red" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="<%= lastname.ClientID %>">Last Name</label>
                <asp:TextBox ID="lastname" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLast" runat="server" ControlToValidate="lastname" ErrorMessage="Last name is required." ForeColor="Red" Display="Dynamic" />
            </div>

            <div class="form-group full-width">
                <label for="<%= email.ClientID %>">Email Address</label>
                <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="email" ErrorMessage="Email is required." ForeColor="Red" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="<%= gender.ClientID %>">Gender</label>
                <asp:DropDownList ID="gender" runat="server" CssClass="input-field">
                    <asp:ListItem Text="Select" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvGender" runat="server" ControlToValidate="gender" InitialValue="" ErrorMessage="Gender is required." ForeColor="Red" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="<%= usertype.ClientID %>">I am a</label>
                <asp:DropDownList ID="usertype" runat="server" CssClass="input-field">
                    <asp:ListItem Text="Student" Value="Student" />
                    <asp:ListItem Text="Teacher" Value="Teacher" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="<%= username.ClientID %>">Username</label>
                <asp:TextBox ID="username" runat="server" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="username" ErrorMessage="Username is required." ForeColor="Red" Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="<%= password.ClientID %>">Password</label>
                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="password" ErrorMessage="Password is required." ForeColor="Red" Display="Dynamic" />
            </div>
        </div>

        <div class="form-actions">
            <asp:Button ID="btnRegister" runat="server" Text="Create Account" CssClass="primary-btn" OnClick="btnRegister_Click" />
        </div>

        <hr />
        <p>Staff only:</p>

        <asp:Button ID="btnAdminRegister" runat="server"
            Text="Create Admin Account"
            OnClick="btnAdminRegister_Click"
            CausesValidation="false"
            CssClass="primary-btn" />
    </div>
</asp:Content>