//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Example;
import java.io.File;

public interface IDesignerService {
    boolean upload(Example var1, File[] var2, File[] var3);

    boolean removeCase(Integer var1);

    boolean viewExampleDetails(Designer var1, Example var2);

    boolean putDesigner(Designer var1);

    boolean judgeIdentity();

    boolean login(Designer var1);

    boolean registerDes(Designer var1);

    boolean findAll();

    boolean findByPraise();

    boolean findByScore();

    boolean logout();

    boolean update(Designer var1, File var2, String var3);

    boolean update2(Designer var1, File var2, String var3);

    boolean recommend1(int var1);

    boolean recommend2(int var1);

    boolean recommend3(String var1);

    boolean searchByAccount(String var1);
}
