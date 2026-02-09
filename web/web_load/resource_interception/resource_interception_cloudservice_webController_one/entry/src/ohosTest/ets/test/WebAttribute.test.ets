/*
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const EVENT_ID_SET_EMIT_KEY = 201700;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webAttribute() {

  describe('WebAttributeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webAttribute',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webAttribute state success " + JSON.stringify(pages));
        if (!("webAttribute" == pages.name)) {
          console.info("get webAttribute state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webAttribute page success");
        }
      } catch (err) {
        console.error("push webAttribute page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebAttributeButton"), 10000);
      console.log("waitForComponent WebAttributeButton");
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
      console.info("webAttribute beforeEach start");
      done();
    })

    /**
     * @tc.name   testGeolocationAccess001
     * @tc.number SUB_WEB_GEOLOCATIONACCESS_0100
     * @tc.desc   test geolocationAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGeolocationAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testGeolocationAccess001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testGeolocationAccess001",  '\"位置服务被拒绝\"', 201710, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebAttributeButton");
      if (await Utils.waitForExist(() => isReturn, 'testGeolocationAccess001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testOnResourceLoad001
     * @tc.number SUB_WEB_ONRESOURCELOAD_0100
     * @tc.desc   test onResourceLoad
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnResourceLoad001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnResourceLoad001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnResourceLoad001",  'resource://rawfile/geolocation.html', 201720, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebAttributeButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnResourceLoad001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testOnWindowNew001
     * @tc.number SUB_WEB_ONWINDOWNEW_0100
     * @tc.desc   test onWindowNew
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnWindowNew001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnWindowNew001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnWindowNew001",  true, 201730, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebAttributeButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnWindowNew001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testOnWindowNew002
     * @tc.number SUB_WEB_ONWINDOWNEW_0200
     * @tc.desc   test onWindowNew
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnWindowNew002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnWindowNew002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnWindowNew002",  false, 201740, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebAttributeButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnWindowNew002' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testOnWindowNew003
     * @tc.number SUB_WEB_ONWINDOWNEW_0300
     * @tc.desc   test onWindowNew
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnWindowNew003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnWindowNew003", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnWindowNew003",  false, 201750, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebAttributeButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnWindowNew003' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testMultiWindowAccess001
     * @tc.number SUB_WEB_MULTIWINDOWACCESS_0100
     * @tc.desc   test multiWindowAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testMultiWindowAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testMultiWindowAccess001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testMultiWindowAccess001",  false, 201760, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebAttributeButton");
      if (await Utils.waitForExist(() => isReturn, 'testMultiWindowAccess001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testJavaScriptAccess001
     * @tc.number SUB_WEB_JAVASCRIPTACCESS_0100
     * @tc.desc   test javaScriptAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJavaScriptAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testJavaScriptAccess001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testJavaScriptAccess001",  true, 201770, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebAttributeButton");
      if (await Utils.waitForExist(() => isReturn, 'testJavaScriptAccess001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}