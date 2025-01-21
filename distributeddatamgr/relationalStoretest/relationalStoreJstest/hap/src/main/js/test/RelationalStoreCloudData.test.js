/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium';
import cloudData from '@ohos.data.cloudData';

export default function CloudSyncConfigCallback(){
	describe('CloudSyncConfigCallback',function(){
	/**
	*@tc.name SUB_DDM_Distribute_RelationStore_SDK_CloudSyncJsAPITest_0100
	*@tc.desc Test Js Api clear which parameters number are less
	*@tc.type:FUNC
	*@tc.require:issueNumber
	*/
	
	it('SUB_DDM_cloudData_NotifyDataChangeExt_Callback_0100',0,async function(done){
	console.info('SUB_DDM_cloudData_NotifyDataChangeExt_Callback_0100');
	console.info('SUB_DDM_cloudData_NotifyDataChangeExt_Callback_0100 DATA_CHANGE_EVENT_ID='+cloudData.DATA_CHANGE_EVENT_ID);
	expect(cloudData.DATA_CHANGE_EVENT_ID == "cloud_data_change").assertTrue();
	let ExtraData = {
	  eventId:"cloud_data_change",
	  extraData:{
	    "header":{
		  "token":"bbbbbb"
		},
		  "data":{
		    "accountId":"aaa",
			"bundleName":"com.bbb.xxx",
			"containerName":"alias",
			"recordTypes":[
			  "xxx",
			  "yyy",
			  "zzz",
			]
		  }
	  }
	}
		console.info('SUB_DDM_cloudData_NotifyDataChangeExt_Callback_0100 eventId=' + ExtraData.eventId);
		console.info('SUB_DDM_cloudData_NotifyDataChangeExt_Callback_0100 extraData='+ExtraData.extraData.data.accountId);
		expect(ExtraData.eventId == "cloud_data_change").assertTrue();
		expect(ExtraData.extraData.data.accountId == "aaa").assertTrue();
		console.info('SUB_DDM_cloudData_NotifyDataChangeExt_Callback_0100 CLEAR_CLOUD_INFO='+cloudData.ClearAction.CLEAR_CLOUD_INFO);
		console.info('SUB_DDM_cloudData_NotifyDataChangeExt_Callback_0100 CLEAR_CLOUD_DATA_AND_INFO='+cloudData.ClearAction.CLEAR_CLOUD_DATA_AND_INFO);	
		expect(cloudData.ClearAction.CLEAR_CLOUD_INFO == 0).assertTrue();
		expect(cloudData.ClearAction.CLEAR_CLOUD_DATA_AND_INFO == 1).assertTrue();
		console.info('SUB_DDM_cloudData_NotifyDataChangeExt_Callback_0100 end');
		done();
	})
	})
}