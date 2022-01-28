<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String e_name = request.getParameter("ename");
        String e_mail = request.getParameter("eemail");
        String e_contact = request.getParameter("econtact");
        String e_address = request.getParameter("eaddress");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appmaven?useSSL=true", "root","root");
        pst = con.prepareStatement("update employee set Emp_Name = ?,Emp_Email =?,Emp_Contact= ?,Emp_Address=? where id = ?");
        pst.setString(1, e_name);
        pst.setString(2, e_mail);
        pst.setString(3, e_contact);
        pst.setString(4, e_address);
        pst.setString(5, id);
        pst.executeUpdate();
        %>
        <script>
            alert("Record has been Updated");
            window.location= "index.jsp";
       </script>
    <%
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h2 style="text-align: center">Update Employee</h2>
        <hr/>
        <div style="text-align: center">
                <form  method="POST" action="#" >
                   <%
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
                         Class.forName("com.mysql.cj.jdbc.Driver");
                         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appmaven?useSSL=true", "root","root");
                          String id = request.getParameter("id");
                        pst = con.prepareStatement("select * from employee where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                         while(rs.next())
                         {
                    %>
                    <label>Employee Name</label>
                    <input type="text" id="ename" name="ename" value="<%= rs.getString("Emp_Name")%>" required/><br/><br/>
                    <label>Employee Email</label>
                    <input type="text" id="eemail" name="eemail" value="<%= rs.getString("Emp_Email")%>" /><br/><br/>
                    <label>Employee Contact</label>
                    <input type="text" id="econtact" name="econtact" value="<%= rs.getString("Emp_Contact")%>" /><br/><br>
                     <label>Employee Address</label>
                     <input type="text" id="eaddress" name="eaddress" value="<%= rs.getString("Emp_Address")%>" /><br/></br>
                    <% }  %>
                         </br>
                     <input style="Background-Color:Blue; Color:white; width:100px;Margin-Left:100px" type="submit" id="submit" name="submit" value="Save"/>
                     <a href="index.jsp">Click Back</a>

                     </form>
                      </div>

    </body>
</html>