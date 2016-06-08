package com.retail.datahub.peer.canal;

import java.io.Serializable;

/**
 * 描述:<br/>TODO; <br/>
 * ClassName: com.retail.datahub.peer.canal.Identity <br/>
 * date: 2016/5/24 15:01 <br/>
 *
 * @author Red(luohong@retail-tek.com)
 * @version 1.0.0
 */
public class Identity implements Serializable {

    private Integer slaveId;

    private SourceAddress sourceAddress;

    public Integer getSlaveId() {
        return slaveId;
    }

    public void setSlaveId(Integer slaveId) {
        this.slaveId = slaveId;
    }

    public SourceAddress getSourceAddress() {
        return sourceAddress;
    }

    public void setSourceAddress(SourceAddress sourceAddress) {
        this.sourceAddress = sourceAddress;
    }
}
