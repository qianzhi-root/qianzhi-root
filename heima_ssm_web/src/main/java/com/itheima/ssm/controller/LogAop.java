package com.itheima.ssm.controller;

import com.itheima.ssm.domain.SysLog;
import com.itheima.ssm.service.ISysLogService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@Component
@Aspect
public class LogAop {

    @Autowired
    private HttpServletRequest  request ;

    @Autowired
    private ISysLogService iSysLogService ;


    //环绕通知
    /**
     * proceedingJoinPoint代表AOP拦截到正在运行的方法，（也就是Contoller中的某一个方法）
     *
     * @param proceedingJoinPoint
     */
    @Around("execution(* com.itheima.ssm.controller.*.*(..))")
   public Object around(ProceedingJoinPoint proceedingJoinPoint)throws Throwable{
       SysLog sysLogs = new SysLog();
       sysLogs.setVisitTime(new Date());
       //前置
        long start = System.currentTimeMillis();//开始执行时间
        Object result = proceedingJoinPoint.proceed();//control中某个执行方法
        long end =  System.currentTimeMillis();//结束执行时间
        //后置
       sysLogs.setExecutionTime(end-start);
       sysLogs.setIp(request.getRemoteAddr());
       sysLogs.setMethod(proceedingJoinPoint.getSignature().getName());
       sysLogs.setUrl(request.getRequestURI().toString());
      User user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      sysLogs.setUsername(user.getUsername());

     //调用ISysLogService完成完成操作
        iSysLogService.save(sysLogs) ;
      return result;
    }
}
