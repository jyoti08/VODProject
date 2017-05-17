 <%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%
            Connection conn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vod_db", "root", "");
        }catch(Exception e){
            
            %>
            <jsp:forward page="Error.jsp?msg=DB_Connection_Error"></jsp:forward>
            <%
            e.printStackTrace();
        }
%>