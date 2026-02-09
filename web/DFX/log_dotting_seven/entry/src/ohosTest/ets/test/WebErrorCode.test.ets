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
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 123101;
const driver = Driver.create();

export default function webErrorCode() {

  describe('WebErrorCodeTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webErrorCode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webErrorCode state success ' + JSON.stringify(pages));
        if (!('webErrorCode' == pages.name)) {
          console.info('get webErrorCode state success ' + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await driver.waitForComponent(ON.id("ErrorCodeTestSuiteButton"), 10000);
          console.info('push webErrorCode page success ');
        }
      } catch (err) {
        console.error('push webErrorCode page error: ' + err);
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
      console.info('web beforeEach start');
      done();
    })

    /**
     * @tc.name   testRegisterJavaScriptProxyFullParamsError001
     * @tc.number SUB_WEB_ERRORCODE_REGISTERJAVASCRIPTPROXY_0100
     * @tc.desc   test registerJavaScriptProxy fullParams error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testRegisterJavaScriptProxyFullParamsError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testRegisterJavaScriptProxyFullParamsError001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testRegisterJavaScriptProxyFullParamsError001", '17100001', 123110, done);
      Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })

    /**
     * @tc.name   testLoadUrlWithHeadersError001
     * @tc.number testLoadUrlWithHeadersError001
     * @tc.desc   testLoadUrlWithHeadersError001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlWithHeadersError001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testLoadUrlWithHeadersError001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testLoadUrlWithHeadersError001", '17100001', 123120, done);
      Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })
    /**
     * @tc.name   testLoadUrlWithHeadersError002
     * @tc.number SUB_WEB_ERRORCODE_LOADURLWITHHEADERS_0200
     * @tc.desc   test loadurl headersParams error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlWithHeadersError002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testLoadUrlWithHeadersError002", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testLoadUrlWithHeadersError002", '17100002', 123130, done);
      Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })
    /**
     * @tc.name   testLoadUrlWithHeadersError003
     * @tc.number SUB_WEB_ERRORCODE_LOADURLWITHHEADERS_0300
     * @tc.desc   test loadurl headersParams error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlWithHeadersError003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testLoadUrlWithHeadersError003", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testLoadUrlWithHeadersError003", '17100003', 123140, done);
      Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })
    /**
     * @tc.name   testSslErrorHandler001
     * @tc.number SUB_WEB_SSLERRORHANDLER_0100
     * @tc.desc   test sslErrorHandler
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSslErrorHandler001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testSslErrorHandler001", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testSslErrorHandler001", 1, 123150, done);
      Utils.waitAndClickComponent(driver, "ErrorCodeTestSuiteButton");
    })
  })
}
