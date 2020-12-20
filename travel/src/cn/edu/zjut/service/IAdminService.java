//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Example;
import java.util.List;

public interface IAdminService {
    boolean Logout(String var1, String var2);

    boolean Recommend(Designer var1);

    boolean Recommend1(Example var1, Designer var2);

    List displayDes();

    List displayExp();

    List display();

    void Exit();

    boolean Authen(Designer var1);

    void View(Designer var1);

    List display1();

    List display2();
}
