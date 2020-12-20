//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Employer;
import cn.edu.zjut.po.Orderr;

public interface IOrderrService {
    boolean changeOrderrSt(String var1, String var2);

    Orderr getOrderrByID(String var1);

    boolean SubmitOrderr(Orderr var1, Designer var2, Employer var3);

    Orderr app(String var1);

    boolean pay(String var1);

    boolean finish(String var1);
}
