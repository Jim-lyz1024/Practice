package com.itheima.login;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

@WebServlet("/checkcode")
public class checkcode extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int width = 100;
        int height = 50;
        //1.创建一对象，在内存中图片（验证码图片对象）
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        //2.美化图片
        //2.1填充背景色
        Graphics g = image.getGraphics();//画笔对象
        g.setColor(Color.blue);//设置画笔颜色
        g.fillRect(0, 0, width, height);

        //2.2画边框
        g.setColor(Color.GRAY);
        g.drawRect(0, 0, width - 1, height - 1);


        //让他随机起来
        String str = "ABCDEFGHIGKLMNOPQRSTUVMXYZ";

        //
        StringBuilder sb = new StringBuilder();
        //


        //生成随机角标
        Random ran = new Random();
        for (int i = 0; i < 4; i++) {
            int index = ran.nextInt(str.length());
            //获取字符
            char ch = str.charAt(index);
            sb.append(ch);
            //2.3写验证码
            g.drawString(ch + "", width / 5 * i, height / 2);
        }

        //把验证码存入域中
        String checkcode_session = sb.toString();
        request.getSession().setAttribute("checkcode_session", checkcode_session);
        //

        //2。4画干扰线
        g.setColor(Color.BLACK);
        for (int i = 0; i < 10; i++) {
            int x1 = ran.nextInt(width);
            int x2 = ran.nextInt(width);
            int y1 = ran.nextInt(height);
            int y2 = ran.nextInt(height);
            g.drawLine(x1, y1, x2, y2);
        }


        //3.将图片输出到浏览器显示
        ImageIO.write(image, "jpg", response.getOutputStream());
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
