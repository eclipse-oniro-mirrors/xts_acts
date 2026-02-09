/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { CommonConstants } from './Constant.test'
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webAttributeTest() {

  describe('WebAttributeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
      await waitForComponent("WebAttributeTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      try {
        console.info('======> wifi_test/isWifiActive :' + wifiMg.isWifiActive());
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info('======> Internet WifiLinkedInfo : ' + JSON.stringify(data));
        console.info('======> Internet speed : ' + JSON.stringify(data.linkSpeed));
        console.info('======> Internet chload : ' + JSON.stringify(data.chload));
        console.info('======> Internet rssi : ' + JSON.stringify(data.rssi));
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info('======> WLAN connection established ');
        } else {
          expect().message('======> WLAN Network error').assertFail();
          done()
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message('======> WLAN Network error').assertFail();
          done();
        } else if (data.chload >= 500) {
          console.info('======> The internet connection is poor. ');
        }
      } catch (err) {
        console.info('======> getLinkedInfo promise failed, err : ' + JSON.stringify(err));
        throw (err as Error);
        done();
      }
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebAttributeTest afterEach start");
      console.info("WebAttributeTest afterEach end");
      done();
    })

    /**
     * @tc.name   testBlockNetWork001
     * @tc.number SUB_WEB_BLOCKNETWORK_0100
     * @tc.desc   test blockNetWork true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testBlockNetWork001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork001", 134350)
      Utils.registerEvent("emitBlockNetWork001", CommonConstants.EXAMPLE_URL, 134360, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /**
     * @tc.name   testBlockNetWork002
     * @tc.number SUB_WEB_BLOCKNETWORK_0200
     * @tc.desc   test blockNetWork false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBlockNetWork002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork002", 134350)
      Utils.registerEvent("emitBlockNetWork002", '', 134370, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /**
     * @tc.name   testBlockNetWork003
     * @tc.number SUB_WEB_BLOCKNETWORK_0300
     * @tc.desc   test blockNetWork true when load raw file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBlockNetWork003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork003", 134350)
      Utils.registerEvent("emitBlockNetWork003", '', 134380, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /**
     * @tc.name   testBlockNetWork004
     * @tc.number SUB_WEB_BLOCKNETWORK_0400
     * @tc.desc   test blockNetWork true when load resources
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBlockNetWork004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork004", 134350)
      Utils.registerEvent("emitBlockNetWork004", '', 134390, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })

    /**
     * @tc.name   testBlockNetWork005
     * @tc.number SUB_WEB_BLOCKNETWORK_0500
     * @tc.desc   test blockNetWork true when local file
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testBlockNetWork005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitBlockNetWork005", 134350)
      Utils.registerEvent("emitBlockNetWork005", '', 134400, done);
      sendEventByKey('WebAttributeTestButton', 10, '');
    })
  })
}
