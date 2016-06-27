package org.pan.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import java.util.Arrays;

/**
 * Created by Administrator on 2016/6/3.
 */

@Aspect
@Component
public class LogAop {

    private Logger LOGGER = LoggerFactory.getLogger(LogAop.class);

    @Before(value = "execution(* org.pan.controller.*.*(..))")
    public void beforeMethod(JoinPoint point) {
        LOGGER.debug("method:{} args:{}", point.getSignature().getName(), Arrays.toString(point.getArgs()));
    }
}
