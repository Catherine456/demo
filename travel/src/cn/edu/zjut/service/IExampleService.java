//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package cn.edu.zjut.service;

import cn.edu.zjut.po.Comments;
import cn.edu.zjut.po.Example;
import java.util.List;

public interface IExampleService {
    List findAllExamples(String var1);

    void putExample(Example var1);

    boolean review(Example var1, Comments var2);

    List findAll();

    List searchInFrame(String var1);

    List searchInList(List<String> var1);

    int praise(String var1);

    void star(String var1);

    void unstar(String var1);
}
