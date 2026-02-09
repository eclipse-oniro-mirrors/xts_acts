/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 201070;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webOptions() {
  describe('WebOptionsTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOptions state success " + JSON.stringify(pages));
        if (!("WebOptions" == pages.name)) {
          console.info("get WebOptions state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebOptions page success");
        }
      } catch (err) {
        console.error("push WebOptions page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebOptionsTestButton"), 10000);
      console.log("waitForComponent WebOptionsTestButton");
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
        if (data.chload >= 800 || data.rssi <= -80) {
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

    /**
     * @tc.name   testWebOptionsSrc001
     * @tc.number SUB_WEB_WEBOPTIONS_SRC_0100
     * @tc.desc   test WebOptions.src with rawfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebOptionsSrc001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebOptions001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebOptions001", "index", 201080, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebOptionsTestButton");
      if (await Utils.waitForExist(() => isReturn, 'WebOptionsTestButton' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testWebOptionsSrc002
     * @tc.number SUB_WEB_WEBOPTIONS_SRC_0200
     * @tc.desc   test WebOptions.src with resource
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebOptionsSrc002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebOptions002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebOptions002", "second", 201090, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebOptionsTestButton");
      if (await Utils.waitForExist(() => isReturn, 'WebOptionsTestButton' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testWebOptionsSrc003
     * @tc.number SUB_WEB_WEBOPTIONS_SRC_0300
     * @tc.desc   test WebOptions.src with url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebOptionsSrc003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("emitWebOptions003", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebOptions003", "Example Domain", 201100, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebOptionsTestButton");
      if (await Utils.waitForExist(() => isReturn, 'WebOptionsTestButton' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}