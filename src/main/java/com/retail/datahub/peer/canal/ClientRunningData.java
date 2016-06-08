package com.retail.datahub.peer.canal;

import java.io.Serializable;

public class ClientRunningData implements Serializable {

    private short   clientId;
    private String  address;
    private boolean active = false;

    public short getClientId() {
        return clientId;
    }

    public void setClientId(short clientId) {
        this.clientId = clientId;
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
