package com.retail.datahub.peer.canal;

import java.io.Serializable;

/**
 * 描述:<br/>TODO; <br/>
 * ClassName: com.retail.datahub.peer.canal.CursorData <br/>
 * date: 2016/5/24 14:27 <br/>
 *
 * @author Red(luohong@retail-tek.com)
 * @version 1.0.0
 */
public class CursorData implements Serializable {


    private Identity identity;

    private Postion postion;

    public Identity getIdentity() {
        return identity;
    }

    public void setIdentity(Identity identity) {
        this.identity = identity;
    }

    public Postion getPostion() {
        return postion;
    }

    public void setPostion(Postion postion) {
        this.postion = postion;
    }
}
