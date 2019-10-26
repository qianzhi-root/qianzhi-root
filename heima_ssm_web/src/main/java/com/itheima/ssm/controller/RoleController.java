package com.itheima.ssm.controller;


import com.itheima.ssm.domain.Permission;
import com.itheima.ssm.domain.Role;
import com.itheima.ssm.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private IRoleService iRoleService ;

    //为角色添加权限
    @RequestMapping("/addPermissionToRole.do")
    public String addPermissionToRole(@RequestParam(name = "roleId" ,required = true)String roleId,@RequestParam(name = "ids" ,required = true)String[] permissionsIds)throws Exception{

     iRoleService.addPermissionToRole(roleId,permissionsIds) ;
     return  "redirect:findAll.do" ;

    }

    //根据roleId查询role,并查询出可以添加的权限
    @RequestMapping("/findRoleByIdAndAllPermission.do")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id" ,required = true) String roleId)throws Exception{
        ModelAndView mv = new ModelAndView() ;
      //根据roleId查询role
       Role role = iRoleService.findById(roleId);
     //根据roleId查询可以添加的权限
       List<Permission> otherPermissions = iRoleService.findOtherPermissions(roleId);
       mv.addObject("role",role);
       mv.addObject("otherPermissions",otherPermissions) ;
       mv.setViewName("role-permission-add");
       return  mv ;

    }

    //添加角色信息
    @RequestMapping("/save.do")
    public  String  save(Role role) throws Exception{
        iRoleService.save(role);
        return "redirect:findAll.do" ;
    }

    //查询所有角色
    @RequestMapping("/findAll.do")
    public ModelAndView findAll() throws Exception{
        ModelAndView mv  = new ModelAndView() ;
        List<Role> roleList = iRoleService.findAll();
           mv.addObject("roleList",roleList);
           mv.setViewName("role-list");
        return  mv ;
    }
}
