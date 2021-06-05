<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>RoadPay</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
   

</head>

<body>
<%
//int debitstr=request.getParameter("phone");
//int debit=Integer.parseInt(debit);

int credit = Integer.parseInt(request.getParameter("credit"));
 
long phone = (Long)session.getAttribute("phone");
System.out.println( "session phun"+phone);
System.out.println( "form debit rs"+credit);
try
{


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");



//FETCHING  LAST BALANCE WHERE PHONE =?


PreparedStatement ps3=con.prepareStatement("SELECT * FROM trans WHERE phone=?");
ps3.setLong(1, phone);
ResultSet rs3=ps3.executeQuery();
int fetched_balance =0;

if(rs3.next()==false){
fetched_balance =0;
System.out.println("RS3 loop is empty = "+ fetched_balance);
}else{
do{

	fetched_balance = rs3.getInt("balance");

	}while(rs3.next());
}

System.out.println("LAST balance from table = "+ fetched_balance);




PreparedStatement ps2=con.prepareStatement("SELECT COUNT (*) FROM trans");

 ResultSet rs=ps2.executeQuery();
  
int transid=0;
 while(rs.next()){
	 
	 transid=rs.getInt(1) +1; 
	 out.print( "transid inside loop 29"+ transid  );
 }
 System.out.println("out of loop " +  transid  );



 
//CHECKING IF ADD BALANCE  is positive 

int updated_balance=fetched_balance;
if(credit >0){
	updated_balance = credit + updated_balance;
}
 int debit =0;
 
 
 //           					INSERTING TRANSID, PHONE ETC IN TRANS TABLE
//Statement st=con.createStatement();
/////////

PreparedStatement ps;
ps = con.prepareStatement("Insert into trans (transid,phone,time,debit,credit,balance) values(?,?, LOCALTIMESTAMP(2),?,?,? )");
ps.setInt(1,transid);
ps.setLong(2,phone);
ps.setInt(3,debit);
ps.setInt(4,credit);
ps.setInt(5,updated_balance);

int i = ps.executeUpdate();
/////////////
//int i=st.executeUpdate("insert into trans(transid,phone,time)values('"+transid+"','"+phone+"', LOCALTIMESTAMP(2))");

 out.println("<script type=\"text/javascript\">");
   out.println("alert('Data is successfully inserted!');");
   out.println("location='update.html';");
   out.println("</script>");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>

</html>