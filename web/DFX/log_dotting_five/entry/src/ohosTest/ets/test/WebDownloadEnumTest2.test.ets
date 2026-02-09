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

import { afterEach, beforeAll, beforeEach, describe, expect, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import wifiMg from '@ohos.wifiManager';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
import {waitForExist} from '../test/WaitTest';
import { Driver,ON } from '@ohos.UiTest';
let driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webDownloadEnumTestTwo() {
  let emitKey = "";

  describe('webDownloadEnumTestTwo', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebDownloadEnumTest2',
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
        if (data.chload >= 900 || data.rssi <= -80) {
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
     * @tc.name   testWebDownloadEnumGroup001
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0100
     * @tc.desc   test the value of WebDownloadErrorCode.ERROR_UNKNOWN is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum001";
      Utils.emitEvent("testWebDownloadEnum001", 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum001", 0, 119480,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup002
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0200
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_FAILED is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum002";
      Utils.emitEvent("testWebDownloadEnum002", 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum002", 1, 119490,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup003
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0300
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_ACCESS_DENIED is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnumGroup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum003";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum003", 2, 119500,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup004
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0400
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_NO_SPACE is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnumGroup004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum004";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum004", 3, 119510,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup005
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0500
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_NAME_TOO_LONG is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum005";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum005", 5, 119520,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup006
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0600
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_TOO_LARGE is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum006";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum006", 6, 119530,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup007
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0700
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_TRANSIENT_ERROR is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum007";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum007", 10, 119540,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup008
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0800
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_BLOCKED is 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum008";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum008", 11, 119550,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup009
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_0900
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_TOO_SHORT is 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum009";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum009", 13, 119560,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup010
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1000
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_HASH_MISMATCH is 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum010";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum010", 14, 119570,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup011
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1100
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_SAME_AS_SOURCE is 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum011";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum011", 15, 119580,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup012
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1200
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_FAILED is 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum012";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum012", 20, 119590,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup013
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1300
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_TIMEOUT is 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum013";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum013", 21, 119600,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup014
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1400
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_DISCONNECTED is 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum014";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum014", 22, 119610,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup015
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1500
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_SERVER_DOWN is 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnumGroup015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum015";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum015", 23, 119620,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup016
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1600
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_INVALID_REQUEST is 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum016";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum016", 24, 119630,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup017
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1700
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_FAILED is 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum017";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum017", 30, 119640,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup018
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1800
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_NO_RANGE is 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebDownloadEnumGroup018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testWebDownloadEnum018";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum018", 31, 119650,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup019
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_1900
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_BAD_CONTENT is 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum019";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum019", 33, 119660,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup020
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2000
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_UNAUTHORIZED is 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum020";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum020", 34, 119670,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup021
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2100
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_CERT_PROBLEM is 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum021";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum021", 35, 119680,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup022
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2200
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_FORBIDDEN is 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum022";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum022", 36, 119690,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup023
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2300
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_UNREACHABLE is 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum023";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum023", 37, 119700,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup024
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2400
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH is 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum024";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum024", 38, 119710,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup025
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2500
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT is 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum025";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum025", 39, 119720,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup026
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2600
     * @tc.desc   test the value of WebDownloadErrorCode.USER_CANCELED is 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum026";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum026", 40, 119730,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup027
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2700
     * @tc.desc   test the value of WebDownloadErrorCode.USER_SHUTDOWN is 41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum027";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum027", 41, 119740,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumGroup028
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_GROUP_2800
     * @tc.desc   test the value of WebDownloadErrorCode.CRASH is 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadEnumGroup028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "testWebDownloadEnum028";
      Utils.emitEvent(emitKey, 119470)
      let isReturn = false;
      Utils.registerEvent("testWebDownloadEnum028", 50, 119750,() => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebDownloadEnumTestButton", emitKey);
      await waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    
  })
}
