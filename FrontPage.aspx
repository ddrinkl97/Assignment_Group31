<%@ Page Title="" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="FrontPage.aspx.cs" Inherits="Assignment_Group31.FrontPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="home" class="hero">
        <div class="shape shape-1"></div>
        <div class="shape shape-2"></div>
        <div class="hero-content">
            <h1>Let’s Learn Math Together!</h1>
            <p class="subtitle">Learn math step by step with fun lessons and activities.</p>
            <p style="margin-bottom: 30px; opacity: 0.9; max-width: 600px; margin-left: auto; margin-right: auto;">
                A place where students can practice math and teachers can guide them through different levels.
            </p>
            <a href="Register.aspx" class="cta-button">Start Learning Now!</a>
        </div>
    </section>

    <section id="about" class="container">
        <h3 class="section-title">Our Mission</h3>
        <div class="about-text">
            <p>Math Leveling helps students practice math in a simple and fun way.</p>
            <p>Students can start with easy topics and slowly move to harder problems. Teachers can also add lessons to help students learn better.</p>
            
            <h4 style="margin-top: 30px; color: var(--primary-color);">Key Features</h4>
            <div class="skills">
                <span class="skill-tag">Interactive Lessons – Fun math activities.</span>
                <span class="skill-tag">Self-Tests – Quizzes to check understanding.</span>
                <span class="skill-tag">Progress Tracking – See your scores.</span>
            </div>
        </div>
    </section>

    <section id="features" style="background: var(--bg-secondary);">
        <div class="container">
            <h3 class="section-title" style="text-align:center;">How It Works</h3>
            <div class="feature-grid">
                
                <div class="feature-card">
                    <h4 style="color: var(--secondary-color); margin-bottom: 15px;">For Students</h4>
                    <ul class="feature-list">
                        <li>Learn different elementary math topics</li>
                        <li>Try fun activities and quizzes</li>
                        <li>Check your scores and progress</li>
                    </ul>
                </div>

                <div class="feature-card">
                    <h4 style="color: var(--primary-color); margin-bottom: 15px;">For Teachers</h4>
                    <ul class="feature-list">
                        <li>Create math lessons and modules</li>
                        <li>Upload learning materials</li>
                        <li>Check students’ progress and results</li>
                    </ul>
                </div>

            </div>
        </div>
    </section>

    <section id="contact">
        <div class="login-container">
            <h2>Contact Us</h2>
            <p style="text-align: center; color: var(--text-secondary); margin-bottom: 20px;">
                Need help? We are happy to assist you.
            </p>

            <div class="parent-info-box">
                <strong>Notice for Parents:</strong><br />
                Parents can request their child’s results by providing the Student ID. We will send the results to your email.
            </div>

            <div class="form-group">
                <label>Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="input-field" placeholder="Full Name"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" TextMode="Email" placeholder="Your Email"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Message</label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="input-field" TextMode="MultiLine" Rows="4" placeholder="How can we help?"></asp:TextBox>
            </div>

            <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" CssClass="submit-btn" OnClick="btnSendMessage_Click" />
        </div>
    </section>

</asp:Content>
