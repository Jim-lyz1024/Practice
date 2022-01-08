package com.itheima.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet("/loginservlet")
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        //获取参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String checkcode = request.getParameter("checkcode");

        //要先判断验证码是否正确，然后再判断数据库那些信息
        HttpSession session = request.getSession();
        String checkcode_session = (String) session.getAttribute("checkcode_session");

        //获取完后，立刻删除session中存储的验证码，防止验证码不刷新不安全
        session.removeAttribute("checkcode_session");
        //

        //忽略大小写比较字符串
        if (checkcode_session != null && checkcode_session.equalsIgnoreCase(checkcode)) {
            //一样了，可以来判断用户名和密码是否对了
            //将来这个地方是要查询数据库的，但是现在不用，我们先自己设一个信息
            if ("2019210142".equals(username) && "2019210142".equals(password)) {
                //登陆成功
                //存储信息，并且重定向到成功页面success.jsp
                session.setAttribute("user",username);
                response.sendRedirect(request.getContextPath() + "/pages/main.jsp");
            } else {
                //登陆失败，要转发到登陆页面重新登录
                request.setAttribute("login_error","用户名或者密码错误");//这句话存域中是要在登陆页面输出的，
                request.getRequestDispatcher("/session/login.jsp").forward(request,response);
            }
        } else {
            //不一样，证明验证码输入不对
            //存储用户名和密码信息进入request
            request.setAttribute("cc_error","验证码错误");//这句话存域中是要在登陆页面输出的，
            //转发到登陆页面,因为验证码错误，要重新登录
            request.getRequestDispatcher("/session/login.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
