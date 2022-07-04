package com.AWR.controller;

import com.AWR.entity.User;
import com.AWR.service.MenuService;
import com.AWR.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;




@RestController
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @GetMapping("/query")
    public Result query(HttpServletRequest request){
        User user = (User) request.getAttribute("user");
        return Result.ok(menuService.query(user.getId()));
    }
}
