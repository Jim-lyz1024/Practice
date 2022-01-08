package com.itheima.controller;


import com.itheima.domain.Role;
import com.itheima.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@RequestMapping("/role")
@Controller
public class RoleController {

    @Autowired
    private RoleService roleService;

    public void setRoleService(RoleService roleService) {
        this.roleService = roleService;
    }
//设置视图解析器
    //查
    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView view = new ModelAndView();
        List<Role> roleList = roleService.list();
        view.addObject("rolelist",roleList);
        view.setViewName("role-list");
        return view;
    }
    //增
    @RequestMapping("/save")
    public String save(Role role) {
        roleService.save(role);
        return "redirect:/role/list";
    }

}
