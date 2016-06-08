package com.retail.datahub.peer.canal;

import java.io.Serializable;

/**
 * 描述:<br/>TODO; <br/>
 * ClassName: com.retail.datahub.peer.canal.Postion <br/>
 * date: 2016/5/24 15:02 <br/>
 *
 * @author Red(luohong@retail-tek.com)
 * @version 1.0.0
 */
public class Postion implements Serializable {

    private Boolean included;

    private String journalName;

    private Long position;

    private String timestamp;

    public Boolean getIncluded() {
        return included;
    }

    public void setIncluded(Boolean included) {
        this.included = included;
    }

    public String getJournalName() {
        return journalName;
    }

    public void setJournalName(String journalName) {
        this.journalName = journalName;
    }

    public Long getPosition() {
        return position;
    }

    public void setPosition(Long position) {
        this.position = position;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
}
