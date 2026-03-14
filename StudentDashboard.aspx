<%@ Page Title="Student Dashboard" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="Assignment_Group31.StudentDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="page-section">
        <div class="content-card">
            <div class="page-header">
                <h2>Student Dashboard</h2>
                <p>Welcome to your learning space. Track your progress and continue your math activities.</p>
            </div>

            <div class="dashboard-grid">
                <div class="dashboard-card">
                    <h3>My Profile</h3>
                    <p>View and manage your account details.</p>
                    <asp:Button ID="btnStudentProfile" runat="server" Text="View Profile" CssClass="primary-btn" />
                </div>

                <div class="dashboard-card">
                    <h3>Start Quiz</h3>
                    <p>Begin a new math quiz and test your skills.</p>
                    <asp:Button ID="btnStartQuiz" runat="server" Text="Start Quiz" CssClass="primary-btn" />
                </div>

                <div class="dashboard-card">
                    <h3>My Progress</h3>
                    <p>Check your completed activities and results.</p>
                    <asp:Button ID="btnViewProgress" runat="server" Text="View Progress" CssClass="primary-btn" />
                </div>

                <div class="dashboard-card">
                    <h3>Learning Resources</h3>
                    <p>Access study materials and practice content.</p>
                    <asp:Button ID="btnResources" runat="server" Text="Open Resources" CssClass="primary-btn" />
                </div>
            </div>
        </div>
    </section>
</asp:Content>