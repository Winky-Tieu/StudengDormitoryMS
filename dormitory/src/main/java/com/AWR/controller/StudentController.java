package com.AWR.controller;

import com.AWR.entity.User;
import com.AWR.service.BuildingService;
import com.AWR.service.RoomService;
import com.AWR.service.UserService;
import com.AWR.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;





@RestController
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private UserService userService;
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private RoomService roomService;

    @GetMapping("/info")
    public Result info(HttpServletRequest request){
        User param = (User)request.getAttribute("user");        // 获取前端发起请求的用户信息
        System.out.println(param);
        User student = userService.detail(param.getId());
        student.setRoom(roomService.detail(student.getRoomId()));
        student.setBuilding(buildingService.detail(student.getRoomId()));
        System.out.println(student);
        return Result.ok(student);
    }

}
