<%@page import="java.sql.*" %>
<%
        String id = request.getParameter("id");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
         Class.forName("com.mysql.cj.jdbc.Driver");
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/appmaven?useSSL=true", "root","root");
        pst = con.prepareStatement("delete from employee where id = ?");
         pst.setString(1, id);
        pst.executeUpdate();


 %>
 <script>
 alert("Record has been Deleted");
  window.location= "index.jsp";
 </script>