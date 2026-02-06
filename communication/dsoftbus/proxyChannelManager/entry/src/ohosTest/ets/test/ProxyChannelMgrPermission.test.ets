/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { hilog } from '@kit.PerformanceAnalysisKit';
import proxyChannelManager from '@ohos.distributedsched.proxyChannelManager';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import abilityAccessCtrl ,{ Permissions } from '@ohos.abilityAccessCtrl';
import {common} from '@kit.AbilityKit';
import { Driver, ON } from '@ohos.UiTest';
import btAccess from '@ohos.bluetooth.access';
import { buffer, util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

let logTag = "[proxyChannelManager_log]";
let OPEN_BT_TEXT:string = "开启";
let CLOSE_BT_TEXT:string = "关闭";

async function sleep(ms:number): Promise<void>{
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function clickRequestPermission(text:string) {
  console.info(logTag +'[bluetooth_js] clickRequestPermission start');
  let driver = await Driver.create();
  try {
    let button = await driver.findComponent(ON.text(text));
    await sleep(1000);
    await button.click();
    await sleep(1000);
    console.info(logTag +'[bluetooth_js] clickRequestPermission end');
  } catch (err) {
    console.info(logTag +'[bluetooth_js] clickRequestPermission failed. ' + err);
  }
}

async function tryToEnableBt() {
  let sta = btAccess.getState();
  console.info(logTag +'[bluetooth_js] bt turn off:'+ JSON.stringify(sta));
  switch(sta){
    case 0:
      btAccess.enableBluetooth();
      await sleep(5000);
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta1 = btAccess.getState();
      console.info(logTag +'[bluetooth_js] bt turn off1:'+ JSON.stringify(sta1));
      break;
    case 1:
      console.info(logTag +'[bluetooth_js] bt turning on2:'+ JSON.stringify(sta));
      await sleep(3000);
      break;
    case 2:
      console.info(logTag +'[bluetooth_js] bt turn on3:'+ JSON.stringify(sta));
      break;
    case 3:
      btAccess.enableBluetooth();
      await sleep(3000);
      await clickRequestPermission(OPEN_BT_TEXT);
      await sleep(10000);
      let sta2 = btAccess.getState();
      console.info(logTag +'[bluetooth_js] bt turning off4:'+ JSON.stringify(sta2));
      break;
    default:
      console.info(logTag +'[bluetooth_js] enable success');
  }
}

// 注册接收数据回调
const receivedDataCallback = (dataInfo: proxyChannelManager.DataInfo) => {
  console.info(logTag +'receivedDataCallback, data is '+ JSON.stringify(dataInfo.data));
  console.info(logTag +'receivedDataCallback, channelId is ${dataInfo.channelId}');
}

// 注册接收通道状态回调
const receivedStatusCallback = (channelStateInfo: proxyChannelManager.ChannelStateInfo) => {

  console.info(logTag +'receivedStatusCallback, channelState is ${channelStateInfo.state}');
  console.info(logTag +'receivedStatusCallback, channelId is ${channelStateInfo.channelId}');
}

export default function noPermissionProxyMgr() {
  describe('noPermissionProxyMgr', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      console.info('beforeAll');
      await tryToEnableBt();
      await sleep(1000);
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async (done: Function) => {
      console.info(logTag +'[bluetooth_js] bt close');
      btAccess.disableBluetooth();
      await sleep(5000);
      done();
    })

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr结构错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "00:11:22:33:44:55",
        peerUuid: "00000000-0000-0000-0000-000000000000",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000 openProxyChannel chlId:" + chlId);
          })
          .catch((error: BusinessError) => {
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000 error.code is " + error.code);
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000 error.message is " + error.message);
             expect(error.code == 201).assertTrue();
             expect(error.message != null).assertTrue();
          })
          .finally (() =>{
           console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000 proxyChannelManager is finish!!!");
      })
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000 error.message is " + error.message);
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_5000----------------");
    });
  })
}