package com.retail.datahub.peer.controller;

import com.retail.datahub.peer.zookeeper.ZkClient;
import com.retail.datahub.peer.zookeeper.ZookeeperPathUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;

/**
 * 描述:<br/>TODO; <br/>
 * ClassName: com.retail.datahub.peer.controller.ClusterInfo <br/>
 * date: 2016/5/23 17:07 <br/>
 *
 * @author Red(luohong@retail-tek.com)
 * @version 1.0.0
 */
@Controller
@RequestMapping("/cluster")
public class ClusterInfo {

    @Resource
    private ZkClient zkClient;

    @RequestMapping("/list")
    public String getCluster(Model model) throws Exception {
        List<String> clusters = zkClient.watchedGetChildren(ZookeeperPathUtils.CANAL_CLUSTER_ROOT_NODE);

        model.addAttribute("clusters", clusters);
        return "index";
    }
}
