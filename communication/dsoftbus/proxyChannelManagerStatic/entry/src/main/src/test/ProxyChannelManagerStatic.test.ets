'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  Hypium,
  it,
  Level,
  Size,
  TestType
} from '../../../hypium/index';
import hilog from '@ohos.hilog';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import Utils from './Util.test';
import { Driver, ON } from '@ohos.UiTest';

import abilityAccessCtrl, { PermissionRequestResult } from '@ohos.abilityAccessCtrl';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Permissions } from 'permissions';
import common from '@ohos.app.ability.common';
import proxyChannelManager from '@ohos.distributedsched.proxyChannelManager';
import btAccess from '@ohos.bluetooth.access';


let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'proxyChannelManager_test'; //日志标识字符串,作为tag标识当前runner类下的测试行为
let OPEN_BT_TEXT: string = "开启";
let CLOSE_BT_TEXT: string = "关闭";
let PERMISION_ONT: string = "允许";
let g_context: common.UIAbilityContext;
let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

async function requestPermission() {
  let permissions: Array<Permissions> = new Array<Permissions>();
  permissions.push('ohos.permission.ACCESS_BLUETOOTH');
  let context = AppStorage.get<common.UIAbilityContext>("context") as common.UIAbilityContext;
  hilog.info(domain, tag, "context is11111 " + context);
  let atManager: abilityAccessCtrl.AtManager =
    abilityAccessCtrl.createAtManager();
  hilog.info(domain, tag, "context is22222 ");
  atManager.requestPermissionsFromUser(context, permissions,
    (err: BusinessError<void> | null, data: PermissionRequestResult | undefined) => {
      hilog.info(domain, tag, 'data:' + JSON.stringify(data));
      hilog.info(domain, tag, 'data permissions:' + data?.permissions);
      hilog.info(domain, tag, 'data authResults:' + data?.authResults);
      hilog.info(domain, tag, 'data dialogShownResults:' + data?.dialogShownResults);
    })
}

// 注册接收数据回调
const receivedDataCallback = (dataInfo: proxyChannelManager.DataInfo) => {
  hilog.info(domain, tag, 'receivedDataCallback, data is ' + JSON.stringify(dataInfo.data));
  hilog.info(domain, tag, 'receivedDataCallback, channelId is ' + JSON.stringify(dataInfo.channelId));
}

// 注册接收通道状态回调
const receivedStatusCallback = (channelStateInfo: proxyChannelManager.ChannelStateInfo) => {

  hilog.info(domain, tag, 'receivedStatusCallback, channelId is ' + JSON.stringify(channelStateInfo.channelId));
  switch (channelStateInfo.state) {
    case proxyChannelManager.ChannelState.CHANNEL_WAIT_RESUME:
      hilog.info(domain, tag, 'connection has been disconnected, the channel is unavailable');
      break;
    case proxyChannelManager.ChannelState.CHANNEL_RESUME:
      hilog.info(domain, tag, 'connection has been restored, the channel is available');
      break;
    case proxyChannelManager.ChannelState.CHANNEL_EXCEPTION_SOFTWARE_FAILED:
      hilog.info(domain, tag, 'other software errors caused the channel to be unavailable');
      break;
    case proxyChannelManager.ChannelState.CHANNEL_BR_NO_PAIRED:
      hilog.info(domain, tag, 'bluetooth pairing relationship has been deleted, the channel is unavailable');
      break;
    default:
      hilog.info(domain, tag, 'channelStateInfo state is invalid');
  }
}

export default function proxyChannelManagerTest() {
  describe('proxyChannelManagerTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      hilog.info(domain, tag, 'getPermission beforeAll');
      await abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.example.proxychannelmanager.static");
      await Utils.msSleep(5000);
      await requestPermission();
      await Utils.msSleep(5000);
      await Utils.clickRequestPermission(PERMISION_ONT);
      await Utils.msSleep(10000);
      await Utils.openBluetooth()
      await Utils.msSleep(5000);
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
    afterAll(async () => {
      hilog.info(domain, tag, '[bluetooth_js] bt close');
      btAccess.disableBluetooth();
      await Utils.msSleep(5000);
      await Utils.clickRequestPermission(CLOSE_BT_TEXT);
    })

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_0100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_0100
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr结构错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_0100----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "00:11:22:33:44:55:66:77",
          peerUuid: "00000000-0000-0000-0000-000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_0100 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0100 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0100 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_0100----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_0200
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_0200
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_0200----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "",
          peerUuid: "00000000-0000-0000-0000-000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_0200 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0200 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0200 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_0200----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_0300
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_0300
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr为空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_0300----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: " ",
          peerUuid: "00000000-0000-0000-0000-000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_0300 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0300 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0300 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_0300----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_0400
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_0400
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr为特殊字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_0400----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "@@@@@@",
          peerUuid: "00000000-0000-0000-0000-000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_0400 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0400 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0400 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0400 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0400 error.message is " + error.message);
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_0400----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_0500
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_0500
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_0500----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "00:11:22:33:44:55",
          peerUuid: "",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_0500 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0500 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0500 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_0500----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_0600
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_0600
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid为空格
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_0600----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "00:11:22:33:44:55",
          peerUuid: " ",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_0600 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0600 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0600 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_0600----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_0700
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_0700
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid超max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_0700----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "00:11:22:33:44:55",
          peerUuid: "00000000-0000-0000-0000-0000000000000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_0700 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0700 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0700 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0700 eflag is " + flag);
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_0700----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_0800
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_0800
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid为特殊字符
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_0800----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "00:11:22:33:44:55",
          peerUuid: "@@@",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_0800 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0800 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0800 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_0800----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_0900
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_0900
     * @tc.desc   openProxyChannel接口入参channelInfo中peerUuid格式错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_0900----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "00:11:22:33:44:55",
          peerUuid: "00000000-0000:0000-0000:000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_0900 openProxyChannel chlId:" + chlId);
            });
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_0900 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_0900 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(3000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_0900----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1000
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1000
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr格式错误
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1000----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "000:111:222:333:44:55",
          peerUuid: "00000000-0000:0000-0000:000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_1000 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1000 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1000 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1000----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1100
     * @tc.desc   closeProxyChannel接口入参channelId为无效值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1100----------------");
        let flag = false;
        let channelId: int = 3;
        try {
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1100 closeProxyChannel channelId:" + channelId);
          proxyChannelManager.closeProxyChannel(channelId);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1100 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1100 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1100----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1200
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1200
     * @tc.desc   closeProxyChannel接口入参channelId为0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1200----------------");
        let flag = false;
        let channelId: int = 0;
        try {
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1200 closeProxyChannel channelId:" + channelId);
          proxyChannelManager.closeProxyChannel(channelId);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1200 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1200 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1200----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1300
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1300
     * @tc.desc   closeProxyChannel接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1300----------------");
        let flag = false;
        let channelId: int = -1;
        try {
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1300 closeProxyChannel channelId:" + channelId);
          proxyChannelManager.closeProxyChannel(channelId);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1300 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1300 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1300----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1400
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1400
     * @tc.desc   sendData接口入参channelId为无效值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1400----------------");
        let flag = false;
        let channelId: int = 1;
        let arraybuffer = new ArrayBuffer(1024);
        try {
          await proxyChannelManager.sendData(channelId, arraybuffer)
            .then(() => {
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_1400 sendData success data.length is " + arraybuffer);
            });
        } catch (error) {
          flag = true;
          hilog.error(domain, tag,
            'SUB_DSoftbus_Trans_proxyChannelManager_static_1400 sendData failed : ' + JSON.stringify(error));
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1400----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1500
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1500
     * @tc.desc   sendData接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1500----------------");
        let flag = false;
        let channelId: int = -1;
        let arraybuffer = new ArrayBuffer(1024);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1500 channelId is " + channelId);
          await proxyChannelManager.sendData(channelId, arraybuffer)
            .then(() => {
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_1500 sendData success data.length is " + arraybuffer);
            });
        } catch (error) {
          flag = true;
          hilog.error(domain, tag,
            'SUB_DSoftbus_Trans_proxyChannelManager_static_1500 sendData failed : ' + JSON.stringify(error));
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1500----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1600
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1600
     * @tc.desc   sendData接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1600----------------");
        let flag = false;
        let channelId: int = 0;
        let arraybuffer = new ArrayBuffer(1024);
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1600 channelId is " + channelId);
          await proxyChannelManager.sendData(channelId, arraybuffer)
            .then(() => {
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_1600 sendData success data.length is " + arraybuffer);
            });
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1600 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1600 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1600----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1700
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1700
     * @tc.desc   proxyChannelManager.onReceiveData接口入参channelId为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1700----------------");
        let flag = false;
        let channelId: int = 1;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1700 channelId is " + channelId);
          proxyChannelManager.onReceiveData(channelId, receivedDataCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1700 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1700 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1700----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1800
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1800
     * @tc.desc   proxyChannelManager.onReceiveData接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1800----------------");
        let flag = false;
        let channelId: int = -1;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1800 channelId is " + channelId);
          proxyChannelManager.onReceiveData(channelId, receivedDataCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1800 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1800 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1800----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_1900
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_1900
     * @tc.desc   proxyChannelManager.onReceiveData接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_1900----------------");
        let flag = false;
        let channelId: int = 0;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1900 channelId is " + channelId);
          proxyChannelManager.onReceiveData(channelId, receivedDataCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_1900 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_1900 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_1900----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2000
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2000
     * @tc.desc   proxyChannelManager.onReceiveData接口入参channelId为 max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2000----------------");
        let flag = false;
        let channelId: int = 2147483647;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2000 channelId is " + channelId);
          proxyChannelManager.onReceiveData(channelId, receivedDataCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2000 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2000 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2000----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2100
     * @tc.desc   proxyChannelManager.offReceiveData接口入参channelId为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2100----------------");
        let flag = false;
        let channelId: int = 1;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2100 channelId is " + channelId);
          proxyChannelManager.offReceiveData(channelId, receivedDataCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2100 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2100 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2100----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2200
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2200
     * @tc.desc   proxyChannelManager.offReceiveData接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2200----------------");
        let flag = false;
        let channelId = -1;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2200 channelId is " + channelId);
          proxyChannelManager.offReceiveData(channelId, receivedDataCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2200 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2200 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2200----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2300
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2300
     * @tc.desc   proxyChannelManager.offReceiveData接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2300----------------");
        let flag = false;
        let channelId = 0;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2300 channelId is " + channelId);
          proxyChannelManager.offReceiveData(channelId, receivedDataCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2300 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2300 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2300----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2400
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2400
     * @tc.desc   proxyChannelManager.offReceiveData接口入参channelId为 max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2400----------------");
        let flag = false;
        let channelId = 2147483647;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2400 channelId is " + channelId);
          proxyChannelManager.offReceiveData(channelId, receivedDataCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2400 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2400 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2400----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2500
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2500
     * @tc.desc   proxyChannelManager.onChannelStateChange接口入参channelId为 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2500----------------");
        let flag = false;
        let channelId: int = 1;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2500 channelId is " + channelId);
          proxyChannelManager.onChannelStateChange(channelId, receivedStatusCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2500 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2500 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2500----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2600
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2600
     * @tc.desc   proxyChannelManager.onChannelStateChange接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2600----------------");
        let flag = false;
        let channelId: int = -1;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2600 channelId is " + channelId);
          proxyChannelManager.onChannelStateChange(channelId, receivedStatusCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2600 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2600 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2600----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2700
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2700
     * @tc.desc   proxyChannelManager.onChannelStateChange接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2700----------------");
        let flag = false;
        let channelId: int = 0;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2700 channelId is " + channelId);
          proxyChannelManager.onChannelStateChange(channelId, receivedStatusCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2700 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2700 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2700----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2800
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2800
     * @tc.desc   proxyChannelManager.onChannelStateChange接口入参channelId为 max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2800----------------");
        let flag = false;
        let channelId: int = 2147483647;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2800 channelId is " + channelId);
          proxyChannelManager.onChannelStateChange(channelId, receivedStatusCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2800 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2800 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2800----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_2900
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_2900
     * @tc.desc   proxyChannelManager.offChannelStateChange接口入参channelId为 无效值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_2900----------------");
        let flag = false;
        let channelId: int = 1;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2900 channelId is " + channelId);
          proxyChannelManager.offChannelStateChange(channelId, receivedStatusCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_2900 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_2900 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_2900----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_3000
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_3000
     * @tc.desc   proxyChannelManager.offChannelStateChange接口入参channelId为 -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_3000----------------");
        let flag = false;
        let channelId = -1;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_3000 channelId is " + channelId);
          proxyChannelManager.offChannelStateChange(channelId, receivedStatusCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_3000 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_3000 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_3000----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_3100
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_3100
     * @tc.desc   proxyChannelManager.offChannelStateChange接口入参channelId为 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_3100----------------");
        let flag = false;
        let channelId = 0;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_3100 channelId is " + channelId);
          proxyChannelManager.offChannelStateChange(channelId, receivedStatusCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_3100 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_3100 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_3100----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_3200
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_3200
     * @tc.desc   proxyChannelManager.offChannelStateChange接口入参channelId为 max值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_3200----------------");
        let flag = false;
        let channelId = 2147483647;
        try {
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_3200 channelId is " + channelId);
          proxyChannelManager.offChannelStateChange(channelId, receivedStatusCallback);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_3200 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_3200 error.message is " + error.message);
          expect(error.code === 32390004).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        await Utils.msSleep(1000);
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_3200----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_3300
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_3300
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr失效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_3300----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "00:11:22:33:44:55",
          peerUuid: "00000000-0000-0000-0000-000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_3300 openProxyChannel chlId:" + chlId);
            });
          await Utils.msSleep(3000);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_3300 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_3300 error.message is " + error.message);
          expect(error.code === 32390101 || error.code === 32390100).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_3300----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_3400
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_3400
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr使用macHash失效
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_3400----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "00000000000000000000000000000000",
          peerUuid: "00000000-0000-0000-0000-000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_3400 openProxyChannel chlId:" + chlId);
            });
          await Utils.msSleep(3000);
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_3400 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_3400 error.message is " + error.message);
          expect(error.code === 32390101 || error.code === 32390100).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_3400----------------");
      });

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManager_static_3500
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManager_static_3500
     * @tc.desc   openProxyChannel接口入参channelInfo中peerDevAddr的长度超过限制
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManager_static_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        hilog.info(domain, tag, "----------start SUB_DSoftbus_Trans_proxyChannelManager_static_3500----------------");
        let flag = false;
        let chlId: int = -1;
        let channelInfo: proxyChannelManager.ChannelInfo = {
          linkType: proxyChannelManager.LinkType.LINK_BR,
          peerDevAddr: "000000000000000000000000000000000",
          peerUuid: "00000000-0000-0000-0000-000000000000",
        }
        try {
          await proxyChannelManager.openProxyChannel(channelInfo)
            .then((channelId: int) => {
              chlId = channelId;
              hilog.info(domain, tag,
                "SUB_DSoftbus_Trans_proxyChannelManager_static_3500 openProxyChannel chlId:" + chlId);
            })
        } catch (error) {
          flag = true;
          hilog.info(domain, tag, "SUB_DSoftbus_Trans_proxyChannelManager_static_3500 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManager_static_3500 error.message is " + error.message);
          expect(error.code === 32390006).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag, "----------end SUB_DSoftbus_Trans_proxyChannelManager_static_3500----------------");
      });
  })
}