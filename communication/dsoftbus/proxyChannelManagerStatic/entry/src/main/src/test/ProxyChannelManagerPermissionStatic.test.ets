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

import hilog from '@ohos.hilog';
import proxyChannelManager from '@ohos.distributedsched.proxyChannelManager';
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
import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl';
import common from '@ohos.app.ability.common';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

let OPEN_BT_TEXT: string = "开启";
let CLOSE_BT_TEXT: string = "关闭";
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'proxyChannelManagerPermission_test'; //日志标识字符串,作为tag标识当前runner类下的测试行为

// 注册接收数据回调
const receivedDataCallback = (dataInfo: proxyChannelManager.DataInfo) => {
  hilog.info(domain, tag, 'receivedDataCallback, data is ' + JSON.stringify(dataInfo.data));
  hilog.info(domain, tag, 'receivedDataCallback, channelId is ${dataInfo.channelId}');
}

// 注册接收通道状态回调
const receivedStatusCallback = (channelStateInfo: proxyChannelManager.ChannelStateInfo) => {

  hilog.info(domain, tag, 'receivedStatusCallback, channelState is ${channelStateInfo.state}');
  hilog.info(domain, tag, 'receivedStatusCallback, channelId is ${channelStateInfo.channelId}');
}

export default function noPermissionProxyManagerTest() {
  describe('noPermissionProxyManagerTest', () => {
    beforeAll(async () => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(async () => {
    })

    /**
     * @tc.name   SUB_DSoftbus_Trans_proxyChannelManagerPermission_static_1000
     * @tc.number SUB_DSoftbus_Trans_proxyChannelManagerPermission_static_1000
     * @tc.desc   openProxyChannel未申请权限
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_Trans_proxyChannelManagerPermission_static_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
        hilog.info(domain, tag,
          "----------start SUB_DSoftbus_Trans_proxyChannelManagerPermission_static_1000----------------");
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
                "SUB_DSoftbus_Trans_proxyChannelManagerPermission_static_1000 openProxyChannel chlId:" + chlId);
            });
        } catch (error) {
          flag = true;
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManagerPermission_static_1000 error.code is " + error.code);
          hilog.info(domain, tag,
            "SUB_DSoftbus_Trans_proxyChannelManagerPermission_static_1000 error.message is " + error.message);
          expect(error.code === 201).assertTrue();
          expect(error.message !== null).assertTrue();
        } finally {
          expect(flag).assertTrue();
        }
        hilog.info(domain, tag,
          "----------end SUB_DSoftbus_Trans_proxyChannelManagerPermission_static_1000----------------");
      });
  })
}