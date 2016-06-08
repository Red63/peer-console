package com.retail.datahub.peer.canal;

import java.io.Serializable;

/**
 * 描述:<br/>TODO; <br/>
 * ClassName: com.retail.datahub.peer.canal.SourceAddress <br/>
 * date: 2016/5/24 15:01 <br/>
 *
 * @author Red(luohong@retail-tek.com)
 * @version 1.0.0
 */
public class SourceAddress implements Serializable {
    private String address;

    private Integer port;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getPort() {
        return port;
    }

    public void setPort(Integer port) {
        this.port = port;
    }
}
