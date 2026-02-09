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

import { afterEach, beforeAll, beforeEach, describe, it , expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import wifiMg from '@ohos.wifiManager';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
import { Driver,ON } from '@ohos.UiTest';
import {waitForExist} from '../test/WaitTest';
let driver = Driver.create();
let emitKey = "";

  const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webDownloadEnumTest() {

  describe('WebDownloadEnumTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDownloadEnumTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebDownloadEnumTest state success " + JSON.stringify(pages));
        if (!("WebDownloadEnumTest" == pages.name)) {
          console.info("get WebDownloadEnumTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebDownloadEnumTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebDownloadEnumTest page error: " + err);
      }
      await waitForComponent("WebDownloadEnumTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      if(!wifiMg.isWifiActive()){
        console.info("======> wifi_test/enable wifi:" + wifiMg.enableWifi());
        await Utils.sleep(5000);
      }

      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
        console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
        console.info("======> Internet chload : " + JSON.stringify(data.chload));
        console.info("======> Internet rssi : " + JSON.stringify(data.rssi));

        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info("======> WLAN connection established ");
        } else {
          expect().message("======> WLAN Network error").assertFail(); //方式一
          //throw new Error("======> WLAN Network error");//方式二
          done();
        }
        if (data.chload >= 800 || data.rssi <= -80) {
          expect().message("======> WLAN Network error").assertFail();//方式一
          //throw new Error("======> WLAN Network error");//方式二
          done();
        } else if (data.chload >= 500) {
          console.info("======> The internet connection is poor. ");
        }

      } catch (err) {
        console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
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
      console.info("WebDownloadEnumTest afterEach start");
      console.info("WebDownloadEnumTest afterEach end");
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum001
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0100
     * @tc.desc   test the value of WebDownloadErrorCode.ERROR_UNKNOWN is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum001";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum001", 0, 119120,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum002
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0200
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_FAILED is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum002";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum002", 1, 119130,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum003
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0300
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_ACCESS_DENIED is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum003";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum003", 2, 119140,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum004
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0400
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_NO_SPACE is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum004";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum004", 3, 119150,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum005
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0500
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_NAME_TOO_LONG is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum005";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum005", 5, 119160,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum006
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0600
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_TOO_LARGE is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum006";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum006", 6, 119170,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum007
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0700
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_TRANSIENT_ERROR is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum007";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum007", 10, 119180,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum008
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0800
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_BLOCKED is 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum008";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum008", 11, 119190,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum009
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0900
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_TOO_SHORT is 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum009";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum009", 13, 119200,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum010
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1000
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_HASH_MISMATCH is 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum010";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum010", 14, 119210,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum011
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1100
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_SAME_AS_SOURCE is 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum011";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum011", 15, 119220,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum012
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1200
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_FAILED is 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum012";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum012", 20, 119230,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum013
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1300
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_TIMEOUT is 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum013";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum013", 21, 119240,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum014
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1400
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_DISCONNECTED is 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum014";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum014", 22, 119250,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum015
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1500
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_SERVER_DOWN is 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum015";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum015", 23, 119260,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum016
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1600
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_INVALID_REQUEST is 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum016";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum016", 24, 119270,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum017
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1700
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_FAILED is 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum017";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum017", 30, 119280,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum018
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1800
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_NO_RANGE is 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum018";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum018", 31, 119290,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum019
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1900
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_BAD_CONTENT is 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum019";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum019", 33, 119300,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum020
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2000
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_UNAUTHORIZED is 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum020";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum020", 34, 119310,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum021
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2100
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_CERT_PROBLEM is 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum021";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum021", 35, 119320,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum022
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2200
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_FORBIDDEN is 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum022";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum022", 36, 119330,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum023
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2300
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_UNREACHABLE is 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum023";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum023", 37, 119340,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum024
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2400
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH is 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum024";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum024", 38, 119350,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum025
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2500
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT is 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum025";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum025", 39, 119360,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum026
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2600
     * @tc.desc   test the value of WebDownloadErrorCode.USER_CANCELED is 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum026";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum026", 40, 119370,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum027
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2700
     * @tc.desc   test the value of WebDownloadErrorCode.USER_SHUTDOWN is 41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum027";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum027", 41, 119380,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum028
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2800
     * @tc.desc   test the value of WebDownloadErrorCode.CRASH is 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum028";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum028", 50, 119390,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum029
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2900
     * @tc.desc   test the value of WebDownloadState.IN_PROGRESS is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum029";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum029", 0, 119400,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum030
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3000
     * @tc.desc   test the value of WebDownloadState.COMPLETED is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum030";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum030", 1, 119410,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum031
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3100
     * @tc.desc   test the value of WebDownloadState.CANCELED is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum031";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum031", 2, 119420,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum032
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3200
     * @tc.desc   test the value of WebDownloadState.INTERRUPTED is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum032";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum032", 3, 119430,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum033
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3300
     * @tc.desc   test the value of WebDownloadState.PENDING is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum033";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum033", 4, 119440,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum034
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3400
     * @tc.desc   test the value of WebDownloadState.PAUSED is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum034";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum034", 5, 119450,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnum035
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3500
     * @tc.desc   test the value of WebDownloadState.UNKNOWN is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnum035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum035";
      Utils.emitEvent(emitKey, 119110)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum035", 6, 119460,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}
