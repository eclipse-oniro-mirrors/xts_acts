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

const EVENT_ID_SET_EMIT_KEY = 201780;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webController() {

  describe('WebControllerTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webController state success " + JSON.stringify(pages));
        if (!("webController" == pages.name)) {
          console.info("get webController state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push webController page success");
        }
      } catch (err) {
        console.error("push webController page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebControllerButton"), 10000);
      console.log("waitForComponent WebControllerButton");
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
      console.info("webController beforeEach start");
      done();
    })



    /**
     * @tc.name   testImageAccess001
     * @tc.number SUB_WEB_IMAGEACCESS_0100
     * @tc.desc   test imageAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testImageAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testImageAccess001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testImageAccess001",  '"01"', 201790, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testImageAccess001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testImageAccess002
     * @tc.number SUB_WEB_IMAGEACCESS_0200
     * @tc.desc   test imageAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testImageAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testImageAccess002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testImageAccess002", "\"load complete02\"", 201800, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testImageAccess002' + '_returnCheck', 1, 1000)) {
        done();
      }
    })



    /**
     * @tc.name   testOnlineImageAccess001
     * @tc.number SUB_WEB_ONLINEIMAGEACCESS_0100
     * @tc.desc   test onlineImageAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnlineImageAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnlineImageAccess001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testOnlineImageAccess001", '""', 201810, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnlineImageAccess001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testOnlineImageAccess002
     * @tc.number SUB_WEB_ONLINEIMAGEACCESS_0200
     * @tc.desc   test onlineImageAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnlineImageAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testOnlineImageAccess002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testImageAccess002", "\"load image complete\"", 201820, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testOnlineImageAccess002' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testFileAccess001
     * @tc.number SUB_WEB_FILEACCESS_0100
     * @tc.desc   test fileAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFileAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFileAccess001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testFileAccess001", "\"second\"", 201830, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testFileAccess001' + '_returnCheck', 1, 1000)) {
        done();
      }
    })

    /**
     * @tc.name   testFileAccess002
     * @tc.number SUB_WEB_FILEACCESS_0200
     * @tc.desc   test fileAccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFileAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testFileAccess002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = 0;
      Utils.registerEvent("testFileAccess002", "\"second\"", 201840, () => { isReturn = 1 });
      await Utils.waitAndClickComponent(driver, "WebControllerButton");
      if (await Utils.waitForExist(() => isReturn, 'testFileAccess002' + '_returnCheck', 1, 1000)) {
        done();
      }
    })
  })
}