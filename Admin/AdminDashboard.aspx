<%@ Page Title="Admin Dashboard" Language="C#"
    MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs"
    Inherits="Assignment_Group31.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-welcome-card">
        <h2>Welcome, <asp:Label ID="lblAdminName" runat="server" />!</h2>
        <p>Use the admin tools below to manage users, content, and reports.</p>
    </div>

    <div class="dashboard-grid">
        <div class="dashboard-card">
            <h3>Manage Users</h3>
            <p>Create, edit, and organize admin, teacher, and student accounts.</p>
            <a class="primary-btn admin-link-btn" runat="server" href="~/Admin/Users.aspx">Open Users</a>
        </div>

        <div class="dashboard-card">
            <h3>Public Admin Page</h3>
            <p>Access the public-facing admin page and review account information.</p>
            <a class="primary-btn admin-link-btn" runat="server" href="~/HiAdmin.aspx">Open Page</a>
        </div>

        <div class="dashboard-card">
            <h3>Reports</h3>
            <p>Review learning progress, performance summaries, and system activity.</p>
            <asp:Button ID="btnReports" runat="server" Text="Coming Soon" CssClass="primary-btn" Enabled="false" />
        </div>

        <div class="dashboard-card">
            <h3>Manage Content</h3>
            <p>Organize quizzes, activities, and educational materials for students.</p>
            <asp:Button ID="btnContent" runat="server" Text="Coming Soon" CssClass="primary-btn" Enabled="false" />
        </div>
    </div>
</asp:Content>