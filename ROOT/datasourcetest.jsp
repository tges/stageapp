<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.lang.*"%>
<%@ page contentType="text/html;charset=MS949";%>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=MS949">
</head>
<%
	   Statement stmt = null;
	   ResultSet rs = null;
	   Connection conn = null;
	   DataSource ds = null;
	   Context ctx=null;
	   try{
	   
	   /* driver
		Class.forName("oracle.jdbc.driver.OracleDriver").newInstance(); //Driver����
	       	Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:kkamidb", "SCOTT",  "TIGER"); 		      	
          */
        // datasource
		    
    		Hashtable ht=new Hashtable(); 	              
    		ht.put ( Context.INITIAL_CONTEXT_FACTORY,"weblogic.jndi.WLInitialContextFactory");
   		  ht.put ( Context.PROVIDER_URL,"t3://localhost:7100");
    		ctx=new InitialContext(ht);
    		ds=(DataSource)ctx.lookup("altibase");
    		conn = ds.getConnection();
    		
	   
	   // weblogic pool�� ��������
	   //	Driver driver = (java.sql.Driver)Class.forName("Altibase5.jdbc.driver.AltibaseDriver").newInstance();
	   // Connection connNum = driver.connect ("jdbc:weblogic:pool:testAlti", null);
	   

	       	stmt = conn.createStatement(); //SQL������ ����  
	        	     		    	   
	        String sqlstr = "SELECT dno FROM wlmem";	    	   
	        stmt.executeQuery(sqlstr);	//SQL���� ����    	   
	        rs = stmt.getResultSet();	// ResultSet�� ���´�.
	   
	   //	PreparedStatement stmt = conn.prepareStatement(sqlstr,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
	   //	ResultSet rs = stmt.executeQuery();
%>
<html>
<body>
<table border=1 cellpadding=0 cellspacing=1 >
<tr height="25" bgcolor="#E2EBF3"> 
<td width="100" align="center"> dno

</tr> 
<%	        	
	        while(rs.next()) { 
//ResultSet�� ���� row�� �̵���Ų�� ���ϰ��� ���� row�� ������ ��true�� out.println(" <tr bgcolor=#FCFEE9> ");			

//	         	System.out.println(rs.getString(1));
//	         	System.out.println(rs.getString(2));
//            System.out.println(rs.getString(3));
%>

<tr height="25">
		<td width="100" align="center"><%= rs.getString(1)%>
				
</tr>

<%
            }
            Thread.sleep(10000);
	    }catch(Exception e) {		   
	        System.out.println("Error : " + e.toString());		
	    }finally{
	        rs.close();		    			   		  		 
	        stmt.close();		  
	        conn.close();
}
%>
</table>
</body>
</html>		 
