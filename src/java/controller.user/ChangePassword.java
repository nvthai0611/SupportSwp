/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/changepassword"})
public class ChangePassword extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword atsdsdsd " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);

    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          UserDAO dao = new UserDAO();
          User user = dao.getUserById(3);
          HttpSession session = request.getSession();
          String currenPassword = request.getParameter("current_password");
          String newPassword = request.getParameter("new_password");
          String confirmNewPass = request.getParameter("confirm_password");
          //sai mat khau hien tai
          if(user.getPassWord() != currenPassword ){
              session.setAttribute("errCurrentPassword", "Curren password is wrong!!!");
              response.sendRedirect(request.getContextPath() + "/home");
              return;
          }
          //mat khau moi va confirm sai
          if(!newPassword.equals(confirmNewPass)){
              session.setAttribute("errConfirmPass", "New password and confirm password is not match!!!");
              response.sendRedirect(request.getContextPath() + "/home");
              return;
          }
          
          dao.updatePassword(newPassword, 3);
          session.setAttribute("Success", "Change password success!!!");
          response.sendRedirect(request.getContextPath() + "/home");
          
    }
}
