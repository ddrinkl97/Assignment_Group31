<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HiStudent.aspx.cs" Inherits="Assignment_Group31.HiStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Hi Student</h1>
            <h2>Welcome, <asp:Label ID="lblFirstName" runat="server" />!</h2>
            <p><b>Username:</b> <asp:Label ID="lblUser" runat="server" /></p>
            <p><b>Email:</b> <asp:Label ID="lblEmail" runat="server" /></p>
            <p><b>Gender:</b> <asp:Label ID="lblGender" runat="server" /></p>
            <p><b>LastName:</b> <asp:Label ID="lblLastName" runat="server" /></p>
        </div>
    </form>
</body>
</html>
