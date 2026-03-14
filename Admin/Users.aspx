<%@ Page Title="Manage Users" Language="C#"
    MasterPageFile="~/Admin/Admin.Master"
    AutoEventWireup="true" CodeBehind="Users.aspx.cs"
    Inherits="Assignment_Group31.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Manage Users</h3>

    <asp:Label runat="server" ID="lblMessage" ForeColor="Red" />

    <h4>Add New User</h4>
    <table>
        <tr>
            <td>Full Name:</td>
            <td><asp:TextBox ID="txtFullName" runat="server" /></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><asp:TextBox ID="txtEmail" runat="server" /></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" /></td>
        </tr>
        <tr>
            <td>Role:</td>
            <td><asp:DropDownList ID="ddlRole" runat="server" /></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnAddUser" runat="server"
                    Text="Add User" OnClick="btnAddUser_Click" />
            </td>
        </tr>
    </table>

    <hr />

    <h4>All Users</h4>
    <asp:GridView ID="gvUsers" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="Id"
        OnRowEditing="gvUsers_RowEditing"
        OnRowCancelingEdit="gvUsers_RowCancelingEdit"
        OnRowUpdating="gvUsers_RowUpdating"
        OnRowDeleting="gvUsers_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="True" />
            <asp:BoundField DataField="username" HeaderText="Username" />
            <asp:BoundField DataField="firstname" HeaderText="First Name" />
            <asp:BoundField DataField="lastname" HeaderText="Last Name" />
            <asp:BoundField DataField="email" HeaderText="Email" />
            <asp:BoundField DataField="usertype" HeaderText="User Type" />
            <asp:BoundField DataField="gender" HeaderText="Gender" />
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
</asp:Content>