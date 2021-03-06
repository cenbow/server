package com.need.api.web.controller.ops;

import com.need.api.constant.ControllerMappings;
import com.need.common.core.service.ops.OpsPositionService;
import com.need.common.domain.pub.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/***
 * 
 * <p></p>
 * @author LXD 2015年10月22日 上午11:23:19
 * @ClassName GetStartOpsController
 * @Description TODO 获取启动运营位
 * @version V1.0   
 * @modificationHistory=========================逻辑或功能性重大变更记录
 * @modify by user: LXD 2015年10月22日
 * @modify by reason:{方法名}:{原因}
 */
@Controller
@RequestMapping(value = ControllerMappings.START_BANNER_OPS)
public class GetStartOpsController {
	@Autowired
	private  OpsPositionService opsPositionService;
	
	@ResponseBody
	@RequestMapping(params = "apiVersion=1.3", method = RequestMethod.GET)
	public Message getStartBannerOps_v1_3(){
		 Message success= opsPositionService.queryStartOps_v1_3();
		  return success;
		
		
	}
	
}
