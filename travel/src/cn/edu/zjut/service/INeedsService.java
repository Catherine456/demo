//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Needs;
import java.util.List;

public interface INeedsService {
    boolean wanted(Needs var1);

    List findneeds(String var1, int var2, int var3, int var4);

    Needs getNeedsByID(int var1);

    boolean SignUp(int var1);

    boolean selectDes(Needs var1, Designer var2);

    boolean cancelSignUp(int var1);

    boolean cancelNeeds(int var1);
}
