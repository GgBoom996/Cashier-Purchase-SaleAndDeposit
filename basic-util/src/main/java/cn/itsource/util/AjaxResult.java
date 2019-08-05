package cn.itsource.util;

public class AjaxResult {

    private boolean success = true;

    private String msg;


    public static AjaxResult success(){
        return new AjaxResult();
    }



    public static AjaxResult error(String msg){
        AjaxResult ajaxResult = success();
        ajaxResult.setSuccess(false);
        ajaxResult.setMsg(msg);
        return ajaxResult;
    }

    public AjaxResult(Boolean success, String msg) {

        this.success = success;
        this.msg = msg;
    }
    public AjaxResult() {
    }


    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
