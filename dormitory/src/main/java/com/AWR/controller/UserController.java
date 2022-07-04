package com.AWR.controller;

import com.github.pagehelper.PageInfo;
import com.AWR.entity.User;
import com.AWR.service.UserService;
import com.AWR.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;





@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("create")
    public Result create(@RequestBody User user){       // 映射到Json对象
        int flag = userService.create(user);
        if(flag>0){
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    @GetMapping("delete")
    public Result delete(String ids){
        int flag = userService.delete(ids);
        if(flag>0){
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    @PostMapping("update")
    public Result update(@RequestBody User user){
        int flag = userService.updateSelective(user);       // 选择性修改
        if(flag>0){
            return Result.ok();
        }else{
            return Result.fail();
        }
    }

    @GetMapping("detail")
    public User detail(Integer id){
        return userService.detail(id);
    }

    //查询
    @PostMapping("query")
    public Map<String,Object> query(@RequestBody User user){            // @RequestBody:将json格式的数据转为java对象
        PageInfo<User> pageInfo = userService.query(user);
        return Result.ok(pageInfo);
    }

}
