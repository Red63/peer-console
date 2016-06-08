package com.retail.datahub.peer.controller;

import com.retail.datahub.peer.canal.*;
import com.retail.datahub.peer.utils.JsonUtils;
import com.retail.datahub.peer.zookeeper.ZkClient;
import com.retail.datahub.peer.zookeeper.ZookeeperPathUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 描述:<br/>TODO; <br/>
 * ClassName: com.retail.datahub.peer.controller.destinations <br/>
 * date: 2016/5/24 10:09 <br/>
 *
 * @author Red(luohong@retail-tek.com)
 * @version 1.0.0
 */
@Controller
@RequestMapping("/destinations")
public class destinations {
    private static final Logger LOGGER = LoggerFactory.getLogger(destinations.class);

    @Resource
    private ZkClient zkClient;

    @RequestMapping("/list")
    public String destinationsInfo(Model model) {

        List<String> destinations = null;
        try {
            destinations = zkClient.watchedGetChildren(ZookeeperPathUtils.DESTINATION_ROOT_NODE);
        } catch (Exception e) {
            LOGGER.error("获取订阅点错误", e);
        }

        model.addAttribute("destinations", destinations);

        return "destinations";
    }

    @RequestMapping("/destinationDetail")
    public String destinationDetail(Model model, String destination) {
        List<ServerRunningData> servers = new ArrayList<>();

        try {
            List<String> cs = zkClient.watchedGetChildren(ZookeeperPathUtils.getDestinationClusterRoot(destination));
            ServerRunningData serverRunningData = getRunningServer(destination);

            for (String canal: cs){
                ServerRunningData sr = new ServerRunningData();
                sr.setAddress(canal);

                if(StringUtils.equals(canal, serverRunningData.getAddress())){
                    sr.setActive(true);
                    sr.setCid(serverRunningData.getCid());
                }

                servers.add(sr);
            }
        } catch (Exception e) {
            LOGGER.error("获取服务器列表错误", e);
        }


        ClientRunningData client = null;

        try {
            byte[] data = zkClient.getData(ZookeeperPathUtils.getDestinationClientRunning(destination, (short) 1001));
            client = JsonUtils.unmarshalFromByte(data, ClientRunningData.class);
        } catch (Exception e) {
            LOGGER.error("获取运行的客户端错误", e);
        }

        CursorData cursor = getCursorData(destination);

        model.addAttribute("servers", servers);
        model.addAttribute("client", client);
        model.addAttribute("cursor", cursor);

        return "destinationDetail";
    }

    private CursorData getCursorData(String destination){
        CursorData cursorData = null;
        try {
            byte[] data = zkClient.getData(ZookeeperPathUtils.getCursorPath(destination, (short)1001));
            LOGGER.info("cursor:" + new String(data));

            Map<String, Object> map = JsonUtils.unmarshalFromByte(data, HashMap.class);

            cursorData = convent(map);
        } catch (Exception e){
            LOGGER.error("获取订阅点消费位置错误", e);
        }

        return cursorData;
    }

    private ServerRunningData getRunningServer(String destination){
        ServerRunningData serverRunningData = new ServerRunningData();
        try {
            byte[] srunning = zkClient.getData(ZookeeperPathUtils.getDestinationServerRunning(destination));
            serverRunningData = JsonUtils.unmarshalFromByte(srunning, ServerRunningData.class);
        } catch (Exception e){
            LOGGER.error("获取正在运行的服务器错误", e);
        }

        return serverRunningData;
    }


    private CursorData convent(Map map){
        if (map == null) return null;

        Map<String, Object> identityMap = (Map<String, Object>) map.get("identity");
        Map<String, Object> postionMap = (Map<String, Object>) map.get("postion");
        Map<String, Object> sourceAddressMap = (Map<String, Object>) identityMap.get("sourceAddress");

        SourceAddress sourceAddress = new SourceAddress();
        sourceAddress.setAddress((String) sourceAddressMap.get("address"));
        sourceAddress.setPort((Integer) sourceAddressMap.get("port"));

        Identity identity = new Identity();
        identity.setSourceAddress(sourceAddress);
        identity.setSlaveId((Integer) identityMap.get("slaveId"));

        Postion postion = new Postion();
        postion.setIncluded((Boolean) postionMap.get("included"));
        postion.setJournalName(String.valueOf(postionMap.get("journalName")));
        postion.setPosition(Long.valueOf(String.valueOf(postionMap.get("position"))));

        Long timestamp = (Long) postionMap.get("timestamp");
        Date date = new Date(timestamp);
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        postion.setTimestamp(sf.format(date));

        CursorData cursorData = new CursorData();
        cursorData.setIdentity(identity);
        cursorData.setPostion(postion);

        return cursorData;
    }

}
