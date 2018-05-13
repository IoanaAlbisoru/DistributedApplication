package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Category
 */
@WebServlet("/Category")
public class Category extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Category() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html");
        
        try {
        	Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/distapp","root","");
            System.out.println("Connected from Category!");
            String categ = request.getParameter("category");
 
            ArrayList<String> al = null;
            ArrayList<ArrayList<String>> pid_list = new ArrayList<ArrayList<String>>();
            String sql, sql1, sql2, sql3, sql4, sql5, sql6;
            Statement st, st1, st2, st3, st4, st5, st6;
            ArrayList<String> query = new ArrayList<String>();
            ArrayList<Statement> statement = new ArrayList<Statement>();
            
            System.out.print("Categorie:" +categ);
            if(categ=="BooksAudible"){
            	System.out.println("Am ajuns aici");
				sql1 = "select * from product where category='book'or category='movie' or category='music'";
				st1 = conn.createStatement();
				query.add(sql1);
				statement.add(st1);
            } else if(categ=="ElectronicsComp"){
				sql2 = "select * from product where category='electronic'";	
				st2 = conn.createStatement();
				query.add(sql2);
				statement.add(st2);
            } else if(categ=="Clothes"){
				sql3 = "select * from product where category='cloth'";
				st3 = conn.createStatement();
				query.add(sql3);
				statement.add(st3);
            } else if(categ=="HomeGarden"){
				sql4 = "select * from product where category='home'";
				st4 = conn.createStatement();
				query.add(sql4);
				statement.add(st4);
            } else if(categ=="HealthBeauty"){
				sql5 = "select * from product where category='beauty'";	
				st5 = conn.createStatement();
				query.add(sql5);
				statement.add(st5);
            } else if(categ=="ToysBaby"){
				sql6 = "select * from product where category='toy'";
				st6 = conn.createStatement();
				query.add(sql6);
				statement.add(st6);
            }
            
            sql = query.get(0);
            st = statement.get(0);
        	ResultSet rs = st.executeQuery(sql);
        	query.remove(0);
        	statement.remove(0);
            		 
            while (rs.next()) {
                 al = new ArrayList<String>();
        
                 al.add(rs.getString(1));
                 al.add(rs.getString(2));
                 al.add(rs.getString(3));
                 al.add(rs.getString(4));
                 al.add(rs.getString(5));
                 al.add(rs.getString(6));
                               
                 System.out.println("al :: " + al);
                 pid_list.add(al);
            }
            	
            request.setAttribute("piList", pid_list);
            RequestDispatcher view = request.getRequestDispatcher("/category.jsp");
            view.forward(request, response);
            conn.close();
            System.out.println("Disconnected!");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	
	public String getServletInfo() {
        return "Short description";
    }


}
