package com.itheima.dao;

import com.itheima.domain.Role;

import java.util.List;

public interface RoleDao {
    List<Role> findAll();

    void save(Role role);

    List<Role> fingRoleByUserId(Long id);
}
