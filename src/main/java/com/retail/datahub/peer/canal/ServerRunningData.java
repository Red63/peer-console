package com.retail.datahub.peer.canal;

import java.io.Serializable;

/**
 * 描述:<br/>TODO; <br/>
 * ClassName: com.retail.datahub.peer.canal.ServerRunningData <br/>
 * date: 2016/5/24 11:15 <br/>
 *
 * @author Red(luohong@retail-tek.com)
 * @version 1.0.0
 */
public class ServerRunningData implements Serializable {

    private short   cid;
    private String  address;
    private boolean active = false;

    public short getCid() {
        return cid;
    }

    public void setCid(short cid) {
        this.cid = cid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}
