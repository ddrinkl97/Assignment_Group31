<%@ Page Title="Contact" Language="C#" MasterPageFile="~/MainPageMaster.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Assignment_Group31.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-container" style="margin-top: 120px;">
        <h2>Get in Touch</h2>
        <p style="text-align: center; color: var(--text-secondary); margin-bottom: 20px;">Have questions? Send us a message!</p>
        
        <div class="form-group">
            <label>Name:</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="input-field" placeholder="Your Name"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="input-field" TextMode="Email" placeholder="Your Email"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Message:</label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="input-field" TextMode="MultiLine" Rows="4" placeholder="How can we help?"></asp:TextBox>
        </div>

        <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" CssClass="submit-btn" OnClick="btnSendMessage_Click" />
    </div>
</asp:Content>
