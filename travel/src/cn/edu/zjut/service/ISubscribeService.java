//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.po.Subscribe;

public interface ISubscribeService {
    boolean subscribe(Subscribe var1, String var2, String var3);

    void putSubscribe(Subscribe var1);

    void accept(String var1);

    void reject(Subscribe var1);

    void cancelSub(String var1);
}
