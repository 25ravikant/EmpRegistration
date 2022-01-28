<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%

    if(request.getParameter("submit")!=null)
    {
        String e_name = request.getParameter("ename");
        String e_email = request.getParameter("eemail");
        String e_contact = request.getParameter("econtact");
        String e_address = request.getParameter("eaddress");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.cj.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appmaven?useSSL=true", "root","root");
                    System.out.println("Success");
        pst = con.prepareStatement("insert into employee(Emp_Name,Emp_Email,Emp_Contact,Emp_Address)values(?,?,?,?)");
        pst.setString(1, e_name);
        pst.setString(2, e_email);
        pst.setString(3, e_contact);
        pst.setString(4, e_address);
        pst.executeUpdate();
        con.close();
        %>
    <script>
        alert("Record has been Saved");
          window.location= "index.jsp";
    </script>
    <%
    }
   %>


<html>
<body>
<h2 style="text-align: center">Employee Registation</h2>
<hr/>
 <div style="text-align: center">
 <form  method="POST" action="#" >
        <label>Employee Name</label>
        <input type="text" id="ename" name="ename" required/><br/><br/>
        <label>Employee Email</label>
        <input type="text" id="eemail" name="eemail"/><br/><br/>
        <label>Employee Contact</label>
        <input type="text" id="econtact" name="econtact"/><br/><br>
        <label>Employee Address</label>
        <input type="text" id="eaddress" name="eaddress"/><br/></br>
        <input style="Background-Color:Blue; Color:white; width:100px;Margin-Left:100px" type="submit" id="submit" name="submit" value="Save"/>
        <input style="Background-Color:Blue; Color:white; width:100px;Margin-Left:10px" type="reset" id="reset" value="reset" name="reset">
    </form>
    </div>
     <table border="1" width="100%">
      <tr>

        <th>Emp Name</th>
        <th>Emp Email</th>
        <th>Emp Contact</th>
        <th>Emp Address</th>
        <th>Action</th>
        </tr>
        <%

         Connection con;
         PreparedStatement pst;
         ResultSet rs;
         Class.forName("com.mysql.cj.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appmaven?useSSL=true", "root","root");
         String query = "select * from employee";
         Statement st = con.createStatement();
         rs =  st.executeQuery(query);
         while(rs.next())
         {
         String id = rs.getString("id");
         %>
         <tr>

         <td><%=rs.getString("Emp_Name") %></td>
         <td><%=rs.getString("Emp_Email") %></td>
         <td><%=rs.getString("Emp_Contact") %></td>
         <td><%=rs.getString("Emp_Address") %></td>
         <td><a href="Update.jsp?id=<%=id%>">Edit</a></td>
         <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
         </tr>
         <%
         }
         %>
     </table>
</body>
</html>
