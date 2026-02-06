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
import { BusinessError } from '@kit.BasicServicesKit'

let logTag = "[proxyChannelManager_log]";
let OPEN_BT_TEXT:string = "开启";
let CLOSE_BT_TEXT:string = "关闭";
let PERMISION_ONT:string = "允许";

async function sleep(ms:number): Promise<void>{
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function requestPermission(){
  let permissions: Array<Permissions> = ["ohos.permission.ACCESS_BLUETOOTH"];
  let context:common.UIAbilityContext | undefined = AppStorage.get("context") as common.UIAbilityContext;
  console.info(logTag + "context is " + context);
  let atManager:abilityAccessCtrl.AtManager =
    abilityAccessCtrl.createAtManager();
  atManager.requestPermissionsFromUser(context, permissions).then((data) => {
    console.info("request success" + JSON.stringify(data));
  })
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
  console.info(logTag +'receivedDataCallback, channelId is ' + JSON.stringify(dataInfo.channelId));
}


// 注册接收通道状态回调
const receivedStatusCallback = (channelStateInfo: proxyChannelManager.ChannelStateInfo) => {

  console.info(logTag +'receivedStatusCallback, channelId is ' + JSON.stringify(channelStateInfo.channelId));
  switch (channelStateInfo.state) {
    case proxyChannelManager.ChannelState.CHANNEL_WAIT_RESUME:
      console.info(logTag +'connection has been disconnected, the channel is unavailable');
      break;
    case proxyChannelManager.ChannelState.CHANNEL_RESUME:
      console.info(logTag +'connection has been restored, the channel is available');
      break;
    case proxyChannelManager.ChannelState.CHANNEL_EXCEPTION_SOFTWARE_FAILED:
      console.info(logTag +'other software errors caused the channel to be unavailable');
      break;
    case proxyChannelManager.ChannelState.CHANNEL_BR_NO_PAIRED:
      console.info(logTag +'bluetooth pairing relationship has been deleted, the channel is unavailable');
      break;
    default:
      console.info(logTag +'channelStateInfo state is invalid');
  }
}

export default function proxyChannelMgr() {
  describe('proxyChannelMgr', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      console.info('getPermission beforeAll');
      await requestPermission();
      await sleep(1000);
      await clickRequestPermission(PERMISION_ONT);
      await sleep(1000);
      await tryToEnableBt()
      await sleep(1000);
      done();
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
      await clickRequestPermission(CLOSE_BT_TEXT);
      done();
    })

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_0100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_0100
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr结构错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_0100----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: proxyChannelManager.LinkType.LINK_BR,
        peerDevAddr: "00:11:22:33:44:55:66:77",
        peerUuid: "00000000-0000-0000-0000-000000000000",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_0100 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0100 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0100 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_0100----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_0300
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_0300
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr长度为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_0300----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "",
        peerUuid: "00000000-0000-0000-0000-000000000000",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_0300 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0300 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0300 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_0300----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_0400
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_0400
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr为空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_0400----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: " ",
        peerUuid: "00000000-0000-0000-0000-000000000000",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_0400 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0400 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0400 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_0400----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr为特殊字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "@@@@@@",
        peerUuid: "00000000-0000-0000-0000-000000000000",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500 error.message is " + error.message);
      }finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_0500----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_0600
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_0600
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid长度为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_0600----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "00:11:22:33:44:55",
        peerUuid: "",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_0600 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0600 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0600 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_0600----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_0700
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_0700
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid为空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_0700----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "00:11:22:33:44:55",
        peerUuid: " ",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_0700 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0700 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0700 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_0700----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_0900
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_0900
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid超max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_0900----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "00:11:22:33:44:55",
        peerUuid: "00000000-0000-0000-0000-0000000000000000000000",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_0900 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0900 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0900 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_0900 eflag is " + flag);
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_0900----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1000
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1000
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid为特殊字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1000----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "00:11:22:33:44:55",
        peerUuid: "@@@",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_1000 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1000 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1000 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1000----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid格式错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "00:11:22:33:44:55",
        peerUuid: "00000000-0000:0000-0000:000000000000",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100 openProxyChannel chlId:" + chlId);
          })
          .catch((error: BusinessError) => {
             flag = true;
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100 error.code is " + error.code);
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100 error.message is " + error.message);
             expect(error.code == 32390006).assertTrue();
             expect(error.message != null).assertTrue();
          })
          .finally(() => {
            console.info(logTag + 'SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100 sendData finish');
            expect(flag).assertTrue();
          })
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100 error.message is " + error.message);
        expect().assertFail();
      }
      await sleep(3000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1100----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1200
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1200
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr格式错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1200----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "000:111:222:333:44:55",
        peerUuid: "00000000-0000:0000-0000:000000000000",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_1200 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1200 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1200 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1200----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1300
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1300
     * @tc.desc   closeProxyChannel接口入参channelId为无效值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1300----------------");
      let flag = false;
      let channelId: number = 3;
      try {
        console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_1300 closeProxyChannel channelId:" + channelId);
        await proxyChannelManager.closeProxyChannel(channelId);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1300 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1300 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1300----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1400
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1400
     * @tc.desc   closeProxyChannel接口入参channelId为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1400----------------");
      let flag = false;
      let channelId: number = 0;
      try {
        console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_1400 closeProxyChannel channelId:" + channelId);
        await proxyChannelManager.closeProxyChannel(channelId);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1400 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1400 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1400----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1500
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1500
     * @tc.desc   closeProxyChannel接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1500----------------");
      let flag = false;
      let channelId: number = -1;
      try {
        console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_1500 closeProxyChannel channelId:" + channelId);
        await proxyChannelManager.closeProxyChannel(channelId);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1500 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1500 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1500----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1600
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1600
     * @tc.desc   closeProxyChannel接口入参channelId为 1.0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1600----------------");
      let flag = false;
      let channelId: number = 1.111;
      try {
        console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_1600 closeProxyChannel channelId:" + channelId);
        await proxyChannelManager.closeProxyChannel(channelId);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1600 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1600 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1600----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1700
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1700
     * @tc.desc   closeProxyChannel接口入参channelId为 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1700----------------");
      let flag = false;
      let channelId = null;
      try {
        console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_1700 closeProxyChannel channelId:" + channelId);
        await proxyChannelManager.closeProxyChannel(channelId);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1700 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1700 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1700----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1800
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1800
     * @tc.desc   closeProxyChannel接口入参channelId为 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1800----------------");
      let flag = false;
      let channelId = undefined;
      try {
        console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_1800 closeProxyChannel channelId:" + channelId);
        await proxyChannelManager.closeProxyChannel(channelId);
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1800 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1800 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1800----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900
     * @tc.desc   sendData接口入参channelId为无效值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900----------------");
      let flag = false;
      let channelId: number = 1;
      let arraybuffer = new ArrayBuffer(1024);
      try {
        await proxyChannelManager.sendData(channelId, arraybuffer)
          .then(() => {
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900 sendData success data.length is " + arraybuffer);
          })
          .catch((error: BusinessError) => {
             flag = true;
             console.error(logTag + 'SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900 sendData failed : ' + JSON.stringify(error));
             expect(error.code == 32390004).assertTrue();
             expect(error.message != null).assertTrue();
          })
          .finally(() => {
            console.info(logTag + 'SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900 sendData fimish');
            expect(flag).assertTrue();
          })
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900 error.message is " + error.message);
        expect().assertFail();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_1900----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000
     * @tc.desc   sendData接口入参channelId为 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000----------------");
      let flag = false;
      let channelId = null;
      let arraybuffer = new ArrayBuffer(1024);
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000 channelId is " + channelId);
        await proxyChannelManager.sendData(channelId, arraybuffer)
          .then(() => {
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000 sendData success data.length is " + arraybuffer);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000 error.message is " + error.message);
       expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000 finally done flag is " + flag);
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2000----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100
     * @tc.desc   sendData接口入参channelId为 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100----------------");
      let flag = false;
      let channelId = undefined;
      let arraybuffer = new ArrayBuffer(1024);
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100 channelId is " + channelId);
        await proxyChannelManager.sendData(channelId, arraybuffer)
          .then(() => {
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100 sendData success data.length is " + arraybuffer);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100 finally done flag is " + flag);
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2100----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200
     * @tc.desc   sendData接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200----------------");
      let flag = false;
      let channelId: number = -1;
      let arraybuffer = new ArrayBuffer(1024);
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200 channelId is " + channelId);
        await proxyChannelManager.sendData(channelId, arraybuffer)
          .then(() => {
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200 sendData success data.length is " + arraybuffer);
          })
          .catch((error: BusinessError) => {
             flag = true;
             console.error(logTag + 'SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200 sendData failed : ' + JSON.stringify(error));
             expect(error.code == 32390004).assertTrue();
             expect(error.message != null).assertTrue();
          })
          .finally(() => {
            console.info(logTag + 'SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200 sendData fimish');
            expect(flag).assertTrue();
          })
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200 error.message is " + error.message);
        expect().assertFail();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2200----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300
     * @tc.desc   sendData接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300----------------");
      let flag = false;
      let channelId: number = 0;
      let arraybuffer = new ArrayBuffer(1024);
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300 channelId is " + channelId);
        await proxyChannelManager.sendData(channelId, arraybuffer)
          .then(() => {
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300 sendData success data.length is " + arraybuffer);
          })
          .catch((error: BusinessError) => {
            flag = true;
            console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300 error.code is " + error.code);
            console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300 error.message is " + error.message);
            expect(error.code == 32390004).assertTrue();
            expect(error.message != null).assertTrue();
          })
          .finally(() => {
             expect(flag).assertTrue();
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300 finally done flag is " + flag);
          })
      }catch (error) {
            console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300 error.code is " + error.code);
            console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300 error.message is " + error.message);
            expect().assertFail();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2300----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2400
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2400
     * @tc.desc   sendData接口入参channelId为 1.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2400----------------");
      let flag = false;
      let channelId: number = 1.1;
      let arraybuffer = new ArrayBuffer(1024);
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2400 channelId is " + channelId);
        await proxyChannelManager.sendData(channelId, arraybuffer)
          .then(() => {
             console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2400 sendData success data.length is " + arraybuffer);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2400 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2400 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2400----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2500
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2500
     * @tc.desc   proxyChannelManager.on("receiveData")接口入参channelId为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2500----------------");
      let flag = false;
      let channelId: number = 1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2500 channelId is " + channelId);
        await proxyChannelManager.on("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2500 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2500 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2500----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2600
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2600
     * @tc.desc   proxyChannelManager.on("receiveData")接口入参channelId为 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2600----------------");
      let flag = false;
      let channelId = null;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2600 channelId is " + channelId);
        await proxyChannelManager.on("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2600 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2600 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2600----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2700
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2700
     * @tc.desc   proxyChannelManager.on("receiveData")接口入参channelId为 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2700----------------");
      let flag = false;
      let channelId = undefined;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2700 channelId is " + channelId);
        await proxyChannelManager.on("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2700 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2700 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2700----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2800
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2800
     * @tc.desc   proxyChannelManager.on("receiveData")接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2800----------------");
      let flag = false;
      let channelId: number = -1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2800 channelId is " + channelId);
        await proxyChannelManager.on("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2800 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2800 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2800----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_2900
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_2900
     * @tc.desc   proxyChannelManager.on("receiveData")接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_2900----------------");
      let flag = false;
      let channelId: number = 0;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2900 channelId is " + channelId);
        await proxyChannelManager.on("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2900 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_2900 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_2900----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3000
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3000
     * @tc.desc   proxyChannelManager.on("receiveData")接口入参channelId为 1.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3000----------------");
      let flag = false;
      let channelId: number = 1.1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3000 channelId is " + channelId);
        await proxyChannelManager.on("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3000 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3000 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3000----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3010
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3010
     * @tc.desc   proxyChannelManager.on("receiveData")接口入参channelId为 max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3010----------------");
      let flag = false;
      let channelId: number = 2147483647;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3010 channelId is " + channelId);
        await proxyChannelManager.on("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3010 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3010 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3010----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3020
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3020
     * @tc.desc   proxyChannelManager.on("receiveData")接口入参channelId为 max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3020----------------");
      let flag = false;
      let channelId: number = 2147483648;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3020 channelId is " + channelId);
        await proxyChannelManager.on("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3020 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3020 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3020----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3100
     * @tc.desc   proxyChannelManager.off("receiveData")接口入参channelId为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3100----------------");
      let flag = false;
      let channelId: number = 1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3100 channelId is " + channelId);
        await proxyChannelManager.off("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3100 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3100 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3100----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3200
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3200
     * @tc.desc   proxyChannelManager.off("receiveData")接口入参channelId为 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3200----------------");
      let flag = false;
      let channelId = null;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3200 channelId is " + channelId);
        await proxyChannelManager.off("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3200 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3200 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3200----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3300
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3300
     * @tc.desc   proxyChannelManager.off("receiveData")接口入参channelId为 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3300----------------");
      let flag = false;
      let channelId = undefined;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3300 channelId is " + channelId);
        await proxyChannelManager.off("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3300 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3300 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3300----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3400
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3400
     * @tc.desc   proxyChannelManager.off("receiveData")接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3400----------------");
      let flag = false;
      let channelId = -1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3400 channelId is " + channelId);
        await proxyChannelManager.off("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3400 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3400 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3400----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3500
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3500
     * @tc.desc   proxyChannelManager.off("receiveData")接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3500----------------");
      let flag = false;
      let channelId = 0;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3500 channelId is " + channelId);
        await proxyChannelManager.off("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3500 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3500 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3500----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3600
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3600
     * @tc.desc   proxyChannelManager.off("receiveData")接口入参channelId为 1.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3600----------------");
      let flag = false;
      let channelId = 1.1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3600 channelId is " + channelId);
        await proxyChannelManager.off("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3600 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3600 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3600----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3610
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3610
     * @tc.desc   proxyChannelManager.off("receiveData")接口入参channelId为 max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3610----------------");
      let flag = false;
      let channelId = 2147483647;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3610 channelId is " + channelId);
        await proxyChannelManager.off("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3610 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3610 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3610----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3620
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3620
     * @tc.desc   proxyChannelManager.off("receiveData")接口入参channelId为 max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3620----------------");
      let flag = false;
      let channelId = 2147483648;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3620 channelId is " + channelId);
        await proxyChannelManager.off("receiveData", channelId, receivedDataCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3620 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3620 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3620----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3700
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3700
     * @tc.desc   proxyChannelManager.on("channelStateChange")接口入参channelId为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3700----------------");
      let flag = false;
      let channelId: number = 1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3700 channelId is " + channelId);
        await proxyChannelManager.on("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3700 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3700 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3700----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3800
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3800
     * @tc.desc   proxyChannelManager.on("channelStateChange")接口入参channelId为 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3800----------------");
      let flag = false;
      let channelId = null;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3800 channelId is " + channelId);
        await proxyChannelManager.on("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3800 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3800 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3800----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_3900
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_3900
     * @tc.desc   proxyChannelManager.on("channelStateChange")接口入参channelId为 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_3900----------------");
      let flag = false;
      let channelId = undefined;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3900 channelId is " + channelId);
        await proxyChannelManager.on("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3900 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_3900 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_3900----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4000
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4000
     * @tc.desc   proxyChannelManager.on("channelStateChange")接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4000----------------");
      let flag = false;
      let channelId: number = -1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4000 channelId is " + channelId);
        await proxyChannelManager.on("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4000 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4000 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4000----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4100
     * @tc.desc   proxyChannelManager.on("channelStateChange")接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4100----------------");
      let flag = false;
      let channelId: number = 0;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4100 channelId is " + channelId);
        await proxyChannelManager.on("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4100 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4100 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4100----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4200
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4200
     * @tc.desc   proxyChannelManager.on("channelStateChange")接口入参channelId为 1.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4200----------------");
      let flag = false;
      let channelId: number = 1.1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4200 channelId is " + channelId);
        await proxyChannelManager.on("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4200 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4200 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4200----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4210
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4210
     * @tc.desc   proxyChannelManager.on("channelStateChange")接口入参channelId为 max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4210----------------");
      let flag = false;
      let channelId: number = 2147483647;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4210 channelId is " + channelId);
        await proxyChannelManager.on("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4210 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4210 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4210----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4220
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4220
     * @tc.desc   proxyChannelManager.on("channelStateChange")接口入参channelId为 max+1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4220----------------");
      let flag = false;
      let channelId: number = 2147483648;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4220 channelId is " + channelId);
        await proxyChannelManager.on("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4220 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4220 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4220----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4300
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4300
     * @tc.desc   proxyChannelManager.off("channelStateChange")接口入参channelId为 无效值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4300----------------");
      let flag = false;
      let channelId: number = 1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4300 channelId is " + channelId);
        await proxyChannelManager.off("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4300 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4300 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4300----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4400
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4400
     * @tc.desc   proxyChannelManager.off("channelStateChange")接口入参channelId为 null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4400----------------");
      let flag = false;
      let channelId = null;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4400 channelId is " + channelId);
        await proxyChannelManager.off("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4400 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4400 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4400----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4500
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4500
     * @tc.desc   proxyChannelManager.off("channelStateChange")接口入参channelId为 undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4500----------------");
      let flag = false;
      let channelId = undefined;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4500 channelId is " + channelId);
        await proxyChannelManager.off("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4500 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4500 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4500----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4600
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4600
     * @tc.desc   proxyChannelManager.off("channelStateChange")接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4600----------------");
      let flag = false;
      let channelId = -1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4600 channelId is " + channelId);
        await proxyChannelManager.off("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4600 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4600 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4600----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4700
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4700
     * @tc.desc   proxyChannelManager.off("channelStateChange")接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4700----------------");
      let flag = false;
      let channelId = 0;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4700 channelId is " + channelId);
        await proxyChannelManager.off("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4700 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4700 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4700----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4800
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4800
     * @tc.desc   proxyChannelManager.off("channelStateChange")接口入参channelId为 1.1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4800----------------");
      let flag = false;
      let channelId = 1.1;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4800 channelId is " + channelId);
        await proxyChannelManager.off("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4800 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4800 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4800----------------");
    });
    
    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4810
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4810
     * @tc.desc   proxyChannelManager.off("channelStateChange")接口入参channelId为 max值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4810----------------");
      let flag = false;
      let channelId = 2147483647;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4810 channelId is " + channelId);
        await proxyChannelManager.off("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4810 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4810 error.message is " + error.message);
        expect(error.code == 32390004).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4810----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4820
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4820
     * @tc.desc   proxyChannelManager.off("channelStateChange")接口入参channelId为 max+1值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4820----------------");
      let flag = false;
      let channelId = 2147483648;
      try {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4820 channelId is " + channelId);
        await proxyChannelManager.off("channelStateChange", channelId, receivedStatusCallback);
      } catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4820 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4820 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      } finally {
        expect(flag).assertTrue();
      }
      await sleep(1000);
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4820----------------");
    });
    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr失效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900----------------");
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
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900 openProxyChannel chlId:" + chlId);
          })
          .catch((error: BusinessError) => {
            flag = true;
            console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900 error.code is " + error.code);
            console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900 error.message is " + error.message);
            expect(error.code == 32390101).assertTrue();
            expect(error.message != null).assertTrue();
          })
          .finally(() => {
            expect(flag).assertTrue();
          })
          await sleep(3000);
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900 error.message is " + error.message);
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_4900----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr使用macHash失效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: 0,
        peerDevAddr: "00000000000000000000000000000000",
        peerUuid: "00000000-0000-0000-0000-000000000000",
      }
      try {
       await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100 openProxyChannel chlId:" + chlId);
          })
          .catch((error: BusinessError) => {
            flag = true;
            console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100 error.code is " + error.code);
            console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100 error.message is " + error.message);
            expect(error.code == 32390101).assertTrue();
            expect(error.message != null).assertTrue();
          })
          .finally(() => {
            expect(flag).assertTrue();
          })
          await sleep(3000);
      }catch (error) {
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100 error.message is " + error.message);
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_5100----------------");
    });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelMgrAPI_5200
     * @tc.number SUB_DSoftbus_Trans_proxyChannelMgrAPI_5200
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr的长度超过限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelMgrAPI_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info(logTag + "----------start SUB_DSoftbus_Trans_proxyChannelMgrAPI_5200----------------");
      let flag = false;
      let chlId: number = -1;
      let channelInfo: proxyChannelManager.ChannelInfo = {
        linkType: proxyChannelManager.LinkType.LINK_BR,
        peerDevAddr: "000000000000000000000000000000000",
        peerUuid: "00000000-0000-0000-0000-000000000000",
      }
      try {
        await proxyChannelManager.openProxyChannel(channelInfo)
          .then((channelId: number) => {
            chlId = channelId;
            console.info(logTag+"SUB_DSoftbus_Trans_proxyChannelMgrAPI_5200 openProxyChannel chlId:" + chlId);
          })
      }catch (error) {
        flag = true;
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5200 error.code is " + error.code);
        console.info(logTag + "SUB_DSoftbus_Trans_proxyChannelMgrAPI_5200 error.message is " + error.message);
        expect(error.code == 32390006).assertTrue();
        expect(error.message != null).assertTrue();
      }finally {
        expect(flag).assertTrue();
      }
      console.info(logTag + "----------end SUB_DSoftbus_Trans_proxyChannelMgrAPI_5200----------------");
    });
  })
}