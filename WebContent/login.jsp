<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>RoadPay</title>
    <link href="css/style2.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function ctck() {
            var sds = document.getElementById("dum");

        }
    </script>

</head>

<body>

    <main id="main-holder">
        <div class="logo"></div>
        <h1 id="login-header">Login</h1>

<table><%
                             String phonest=request.getParameter("phone"); 
long phone=Long.parseLong(phonest);
String password=request.getParameter("password");
boolean  status=verifyLogin1.checkLogin(phone,password); //if(status==true){ // out.print("Welcome "  username);
		try {
		if(status==true){
			out.print(" Welcome " + phone);
		System.out.println("working in try");
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement(" Select * from users where phone=?"); ps.setLong(1,phone); //Since phone is primary key instead of walletId
                                ResultSet rs=ps.executeQuery(); out.print("<table align='left' cellspacing='5' cellpadding='5'>");
                                out.print("<tr><th>Wallet ID</th>   <th>FirstName</th>    <th>LastName</th>     <th>Address</th>   <th>Phone</th>        <th>Email</th>   <th>aadhar</th>       <th>RcNumber</th>         <th>Balance</th>        </tr>");
                        		System.out.println("working in try 1");
          
				while(rs.next()){
                                int accountno1=rs.getInt(1); //This will store the first row
                                //session.setAttribute("accountno",accountno1); Probably printing name of user..sort of small use of session

                                System.out.print(phone);

                                out.print("<tr>");
                                    out.print("<td>" + rs.getInt(1) + "</td>");// Printing wallet
                                    out.print("<td>" + rs.getString(2) + "</td>"); // Printing firstname
                                    out.print("<td>" + rs.getString(3) + "</td>"); // Printing lastname
                                    out.print("<td>" + rs.getString(4) + "</td>"); // Printing address
                                    out.print("<td>" + rs.getLong(5) + "</td>"); //Printing phone
                                    out.print("<td>" + rs.getString(6) + "</td>"); //Email
                                    out.print("<td>" + rs.getLong(7) + "</td>"); // aadhar
                                    out.print("<td>" + rs.getString(8) + "</td>"); //RCNUM
                                    out.print("<td>" + rs.getInt(10) + "</td>"); //Balance ?Float ? INT? what? check is on connection
                                    out.print("</tr>");

                                }
                                out.print("</table>");



                        }
                        else{
                        out.print("Please check your Phone and Password");
                        request.setAttribute("balance","Please check your Phone and Password");
                        %>
                        <jsp:forward page="balance1.jsp"></jsp:forward>
                        <% } }catch (SQLException e) { e.printStackTrace(); } //} //} %>
        </table>
        <% %>


            </table>

    </main>



            <%@ page import="java.sql.*" %>
                <%@ page import="java.io.*" %>
                    <%@ page import="javax.servlet.*" %>
                        <%@ page import="g.*" %>

</body>
</html>