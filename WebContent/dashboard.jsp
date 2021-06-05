<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>RoadPay</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function ctck() {
            var sds = document.getElementById("dum");

        }
    </script>

</head>

<body>

<%
//String phonest=request.getParameter("phone"); 
//long phone=Long.parseLong(phonest);
//String password=request.getParameter("password");
//boolean  status=verifyLogin1.checkLogin(phone,password); //if(status==true){ // out.print("Welcome "  username);


if (session != null) {
         if (session.getAttribute("phone") != null) {
        	 System.out.println("in if");
            long phone = (Long)session.getAttribute("phone");
       	 System.out.println("converted to string");

   //         out.print("Hello, " + phonestr + "  Welcome to ur Profile");
         // long phone=Long.parseLong(phonestr);




Connection con=GetCon.getCon();
PreparedStatement ps=con.prepareStatement(" Select * from users where phone=?");
	ps.setLong(1,phone); //Since phone is primary key instead of walletId
                    ResultSet rs=ps.executeQuery();
                    request.setAttribute("phone",phone); 
        
	
 %>
    <main id="main-holder">
       
        </div>
       	<% //try {
	//	if(status==true){
		//	while(rs.next())
		//	{
			//	out.print("<div class='welcome'>");
			//out.print( "Welcome " + rs.getString(2));
				//out.print("</div>");
//		}
	//	}
      //  	}
		//catch (SQLException e) { e.printStackTrace(); }
        %>
        <div class="logo"> <h1 id="login-header">Dashboard</h1></div>
       <div class="content">
        <div class="options">

            <button class="buttons"><a href="update.html">Add money</a></button>
            <button class="buttons"><a href="transaction.jsp">Transactions</a></button>
            
                        <button class="buttons"><a href="changePassword.jsp">change password</a></button>
            
            <form action="Logout" method="post">
      <input class="buttons" type="submit" value="Logout">
   </form>
   
</div>
        
        <div class="details">


<table><%
try {
//	ps=con.prepareStatement(" Select * from users where phone=?");
	//ps.setLong(1,phone); //Since phone is primary key instead of walletId
      //              rs=ps.executeQuery();           		
		System.out.println("working in try");
			
				out.print("<table>");
          
				while(rs.next()){
                                int accountno1=rs.getInt(1); //This will store the first row
                                //session.setAttribute("accountno",accountno1); Probably printing name of user..sort of small use of session

                                System.out.print(phone);

                                    out.print("<tr>");
                                    out.print("<th>Wallet ID</th>");
                                    out.print("<td>" + rs.getInt(1) + "</td>");// Printing wallet
                                    
                                    out.print("<tr>");  
                                    out.print("<th>FirstName</th>");
                                    out.print("<td>" + rs.getString(2) + "</td>"); // Printing firstname
                                   
                                    out.print("<tr>");
                                    out.print("<th>LastName</th>");
                                    out.print("<td>" + rs.getString(3) + "</td>"); // Printing lastname
                                    
                                    out.print("<tr>");
                                    out.print("<th>Adress</th>");
                                    out.print("<td>" + rs.getString(4) + "</td>"); // Printing address
                                    
                                    out.print("<tr>");
                                    out.print("<th>Contac Number</th>");
                                    out.print("<td>" + rs.getLong(5) + "</td>"); //Printing phone
                                    
                                    out.print("<tr>");
                                    out.print("<th>Email ID</th>");
                                    out.print("<td>" + rs.getString(6) + "</td>"); //Email
                                    
                                    out.print("<tr>");
                                    out.print("<th>Aadhar Number</th>");
                                    out.print("<td>" + rs.getLong(7) + "</td>"); // aadhar
                                    
                                    out.print("<tr>");
                                    out.print("<th>Vehicle R/C</th>");
                                    out.print("<td>" + rs.getString(8) + "</td>"); //RCNUM
                                    
                                    out.print("<tr>");
                                    out.print("<th>Balance</th>");
                                    out.print("<td>" + rs.getInt(11) + "</td>"); //Balance ?Float ? INT? what? check is on connection
                                    
                                    		

                                }
                                out.print("</table>");



                         }catch (SQLException e) { e.printStackTrace(); } //} //} %>
        </table>
        <% %>


            </table>



        </div>
        
          </div> 
        
    </main>
     <%@ page import="java.sql.*" %>
                <%@ page import="java.io.*" %>
                    <%@ page import="javax.servlet.*" %>
                        <%@ page import="g.*" %>
                        
                        <%
                         } else {
             response.sendRedirect("index.html");
          }
       }%>
</body>

</html>