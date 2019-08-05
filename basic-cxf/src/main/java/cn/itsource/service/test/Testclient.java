package cn.itsource.service.test;

import cn.itsource.service.client.MobileCodeWSSoap;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Testclient {

    @Test
    public void client(){
        //加载配置，获取容器
        ApplicationContext applicationContext =
                new ClassPathXmlApplicationContext("applicationContext-cxf-client.xml");
        //通过容器获取service
        MobileCodeWSSoap userService = (MobileCodeWSSoap) applicationContext.getBean("mobileCodeWSSoap");

        String mobileCodeInfo = userService.getMobileCodeInfo("15984857921", "");
        System.out.println(mobileCodeInfo);
    }
}
