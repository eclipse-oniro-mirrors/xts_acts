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
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 123201;
const driver = Driver.create();

export default function webCookieManagerErrorCode() {

  describe('WebCookieManagerErrorCodeTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webCookieManagerErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webCookieManagerErrorCode state success " + JSON.stringify(pages));
        if (!("webCookieManagerErrorCode" == pages.name)) {
          console.info("get webCookieManagerErrorCode state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebCookieManagerErrorCodeButton"), 10000);
          console.info("push webCookieManagerErrorCode page success ");
        }
      } catch (err) {
        console.error("push webCookieManagerErrorCode page error: " + err);
      }
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
      console.info("webCookieManagerErrorCode beforeEach start");
      done();
    })



    /**
     * @tc.name   testFetchCookieSyncIncognitoError001
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0100
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testFetchCookieSyncIncognitoError001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testFetchCookieSyncIncognitoError001", '17100002URL error. No valid cookie found for the specified URL.', 123210, done);
      Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookieSyncIncognitoError001
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_INCOGNITO_0100
     * @tc.desc   test configCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncIncognitoError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncognitoError001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testConfigCookieSyncIncognitoError001", '17100002URL error. No valid cookie found for the specified URL.', 123220, done);
      Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

    /**
     * @tc.name   testConfigCookieSyncIncognitoError002
     * @tc.number SUB_WEB_ERRORCODE_CONFIGCOOKIESYNC_INCOGNITO_0200
     * @tc.desc   test configCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncIncognitoError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testConfigCookieSyncIncognitoError002", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testConfigCookieSyncIncognitoError002", '17100005', 123230, done);
      Utils.waitAndClickComponent(driver, "WebCookieManagerErrorCodeButton");
    })

  })
}
