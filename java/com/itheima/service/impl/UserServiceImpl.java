package com.itheima.service.impl;

import com.itheima.dao.RoleDao;
import com.itheima.dao.UserDao;
import com.itheima.domain.Role;
import com.itheima.domain.User;
import com.itheima.service.UserService;

import java.util.List;

public class UserServiceImpl implements UserService{
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    private RoleDao roleDao;

    public void setRoleDao(RoleDao roleDao) {
        this.roleDao = roleDao;
    }

    public List<User> list() {
        List<User> userList = userDao.findAll();
        for (User user : userList) {
            //获得user的id
            Long id = user.getId();
            List<Role> roles = roleDao.fingRoleByUserId(id);
            user.setRoles(roles);
        }
        return userList;
    }

    public void save(User user, Long[] roleIds) {
        //向sys表中存储数据
        Long userId = userDao.save(user);
        userDao.saveUserRoleRel(userId,roleIds);
    }

    public void del(Long userId) {
        userDao.delUserRoleRel(userId);
        userDao.del(userId);
    }
}
