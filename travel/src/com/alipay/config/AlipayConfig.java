//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
    public static String app_id = "2016101500696000";
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDDnza6pwUs9KgdcCiMecd6f6OrplCu5uVImYkahCGqNAgwqAgMtfDc63stlK072GgyjKfVI+Ga39rcfRUipIDbUgQoAq7sPvMLjnSMxFToInSBo3DD6mArWZuGYSJ+ceKgkZAW5juQlOPmP9e6iB9AuXQuA9s93ZJlSSnsC/rQgaYXHk1Trszx96KOYwDTOT6S9g3Z6K3EHQmqEkwoPVM1nA7/To0QIIRTCIxymJyq/Q+EeeY2MC0JhrGrmllT+aEwjjBNVDG9yrtTlK1DMNWR10iN2Z4rux3lpDu4ykgRKMdGXJbgvaufcVn+KWL91EA7tObDxCvQZVyBBnUPmLcZAgMBAAECggEBAIgIwcBOwTSf9gByrF/zl5pCBIkrINRf0HYJ/uOnmtmHUWK0ltRv+U1Hm+L4jvcc6Giuk0+OoiZXIRVPDlGG3+ykPiusogO7SrxwlfAF352FyEsWYyZ6Z+H9cD+kcJ5Jh/VtBCxIcod6YnkNUHFwk3so+/e7ysxctp8kn7h8JDC1oBElGLZQWCKEk4Mv0VJqyJGBxJFD0eN88hH/P474+ZlDeEC52ChAtMK8OVuDm73fOkzwQ7op/OFDPnqtDSP+b9lAT20OcR5SC6O47hnqtoPtcXP0fJuSAJwGIlH5rNwlg5T96XqUn1dmjylbC3YyRA39jKeOcnix63GsbAMO/DkCgYEA7Ott7eEAAGVgGMWq3JwfmqAzey6QrYo3dCVPt9QnSDB0KvYlLinlDgsykq0EjPI/l1SQiPXg1PdkKCePIKhM3OVR3cqfPcQHC4tFP0r2eeyw/sUweQHMgvbuqtTaoLi4mhg4iZOoeyXtPwKthrJCvlvjOIZAkbfBG9Bk1OfCrFcCgYEA02BZgjjUn3uc1zmBhx9LMK5RVxkreOCIeabcTDDOjgvm2Iq0rzmtVxjKo7p5KLXEzfvhrReb6Y+/NBEbRsZ10eDMoBaTZQj952fZDYoUoVQ3dT3+cgS+FR5T+Fv5/vbR2b0rds0h/GFZ6rJyhSRzk8fV71OeCVhIYFnbZSHxkg8CgYEAlfS54qvcPWPs/CD48aOb2Vn228vwZPcr/Ea1e2w75NROYvbjN6HqygXKX85FKBUYrOcoiJfgU8u2SDgpvojoBZTcSV67hfOyZdsj3FjNQwTOTqNu99hsoqQ7EkOhkcL5jQcxmdqs9C1gSdafELd5yVUNr7RB4DmHb9xqRdvfewcCgYBmO3ZvLi9gBzg/PBfyk2cZX2YF2y2UY/x94f8wdnagaw82cjebfCjjNCFl+N16nBdYjNeEkSOeXiDa/N8VZw06+h/d2a1mM2giEK8BBmSd9o5wDRDQcozAyA9S0qFh+FxclEq+Rc6HM0p64d3TmWKw+fj1rJqF6IXw2+Tpz/X3bwKBgC0pe5ku8hfuVlJk/HZFcwZ/RDs/fIlAd3rTSCN994uOVYAsJTwsyhih25L5FXPUPGtfiXSljgCjt0I2IkY8YhA+Rdi0Qxu5WbAL/FhwLGbsvD+3SS7E8UlozJaWJH/FtYto/M2rt1sTjrsYQme4WEvI/mx5Xiw3VRvstXk2vIiN";
    public static String alipay_public_key = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDIgHnOn7LLILlKETd6BFRJ0GqgS2Y3mn1wMQmyh9zEyWlz5p1zrahRahbXAfCfSqshSNfqOmAQzSHRVjCqjsAw1jyqrXaPdKBmr90DIpIxmIyKXv4GGAkPyJ/6FTFY99uhpiq0qadD/uSzQsefWo0aTvP/65zi3eof7TcZ32oWpwIDAQAB";
    public static String notify_url = "http://rvf23e.natappfree.cc/designe3.0/paySuccess.jsp";
    public static String return_url = "http://rvf23e.natappfree.cc/designer3.0/paySuccess.jsp";
    public static String sign_type = "RSA2";
    public static String charset = "utf-8";
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
    public static String log_path = "C:\\";

    public AlipayConfig() {
    }

    public static void logResult(String sWord) {
        FileWriter writer = null;

        try {
            String var10002 = log_path;
            writer = new FileWriter(var10002 + "alipay_log_" + System.currentTimeMillis() + ".txt");
            writer.write(sWord);
        } catch (Exception var11) {
            var11.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException var10) {
                    var10.printStackTrace();
                }
            }

        }

    }
}
