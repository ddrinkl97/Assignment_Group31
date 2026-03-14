<%@ Page Title="Teacher Dashboard" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="TeacherDashboard.aspx.cs" Inherits="Assignment_Group31.TeacherDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section">
        <div class="content-card">
            <div class="page-header">
                <h2>Teacher Dashboard</h2>
                <p>Manage students, content, and classroom learning activities from one place.</p>
            </div>

            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <h3>Student Management</h3>
                    <p>View student information and manage student records.</p>
                    <asp:Button ID="btnManageStudents" runat="server" Text="Manage Students" CssClass="primary-btn" />
                </div>

                <div class="dashboard-card">
                    <h3>Manage Content</h3>
                    <p>Create, edit, or organize learning materials and quizzes.</p>
                    <asp:Button ID="btnManageContent" runat="server" Text="Manage Content" CssClass="primary-btn" />
                </div>

                <div class="dashboard-card">
                    <h3>Reports</h3>
                    <p>Review student performance and progress reports.</p>
                    <asp:Button ID="btnTeacherReports" runat="server" Text="View Reports" CssClass="primary-btn" />
                </div>

                <div class="dashboard-card">
                    <h3>My Profile</h3>
                    <p>Update your teacher profile and account settings.</p>
                    <asp:Button ID="btnTeacherProfile" runat="server" Text="View Profile" CssClass="primary-btn" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>