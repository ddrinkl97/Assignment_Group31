<%@ Page Title="" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment_Group31.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Small tweak to make the dropdowns match the input fields */
        select {
            width: 100%;
            padding: 0.8rem;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            background: #f8fafc;
            color: var(--text-primary);
        }
        .admin-section {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px dashed #cbd5e1;
            text-align: center;
        }
        .admin-btn {
            background: #64748b !important; /* Slate color for admin to distinguish it */
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="register-container">
        <h2>Join Math Leveling</h2>
        <p style="text-align:center; color: var(--text-secondary); margin-bottom: 25px;">Create your account to start learning</p>
        
        <div class="form-group">
            <label>First Name</label>
            <asp:TextBox ID="firstname" runat="server" CssClass="input-field" placeholder="Enter first name"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Last Name</label>
            <asp:TextBox ID="lastname" runat="server" CssClass="input-field" placeholder="Enter last name"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <asp:TextBox ID="email" runat="server" TextMode="Email" CssClass="input-field" placeholder="email@example.com"></asp:TextBox>
        </div>

        <div style="display: flex; gap: 15px;">
            <div class="form-group" style="flex: 1;">
                <label>Gender</label>
                <asp:DropDownList ID="gender" runat="server">
                    <asp:ListItem Text="Select" Value="" />
                    <asp:ListItem Text="Male" Value="Male" />
                    <asp:ListItem Text="Female" Value="Female" />
                </asp:DropDownList>
            </div>

            <div class="form-group" style="flex: 1;">
                <label>I am a:</label>
                <asp:DropDownList ID="usertype" runat="server">
                    <asp:ListItem Text="Student" Value="Student" />
                    <asp:ListItem Text="Teacher" Value="Teacher" />
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label>Username</label>
            <asp:TextBox ID="username" runat="server" CssClass="input-field" placeholder="Choose a username"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="input-field" placeholder="••••••••"></asp:TextBox>
        </div>

        <asp:Button ID="btnRegister" runat="server" Text="Create Account" OnClick="btnRegister_Click" CssClass="submit-btn" />

        <p style="text-align:center; margin-top: 20px; font-size: 0.9rem;">
            Already have an account? <a href="Login.aspx" style="color: var(--primary-color); font-weight: 600;">Login here</a>
        </p>

        <div class="admin-section" style="margin-top: 30px; padding-top: 20px; border-top: 1px dashed #cbd5e1; text-align: center;">
            <p style="font-size: 0.8rem; color: var(--text-secondary); margin-bottom: 10px;">Staff only:</p>
            <asp:Button ID="btnAdminRegister" runat="server" 
                Text="Create Admin Account" 
                OnClick="btnAdminRegister_Click" 
                CausesValidation="false" 
                CssClass="submit-btn admin-btn" />
        </div>
    </div>
</asp:Content>
