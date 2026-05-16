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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import webView from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest';
import events_emitter from '@ohos.events.emitter';
import { Driver } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const driver = Driver.create();

export default function webViewControllerDownloadServerTest() {
  describe('WebViewControllerDownloadServerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerDownloadServerTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerDownloadServerTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerDownloadServerTest" == pages.name)) {
          console.info("get WebViewControllerDownloadServerTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewControllerDownloadServerTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerDownloadServerTest page error: " + err);
      }
      await waitForComponents('WebViewControllerDownloadServerTestButton');
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
      console.info("WebViewControllerDownloadServerTest afterEach start");
      console.info("WebViewControllerDownloadServerTest afterEach end");
      done();
    })

    /**
     * @tc.name   testDownloadServer001
     * @tc.number SUB_WEB_WEBDOWNLOADERRORCODE_SERVER_0100
     * @tc.desc   test WebDownloadErrorCode.SERVER_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDownloadServer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDownloadServer001", 131890)
      Utils.registerBaseEvent("testDownloadServer001", webView.WebDownloadErrorCode.SERVER_FAILED, 131900, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadServerTestButton');
    })

    /**
     * @tc.name   testDownloadServer002
     * @tc.number SUB_WEB_WEBDOWNLOADERRORCODE_SERVER_0200
     * @tc.desc   test WebDownloadErrorCode.SERVER_BAD_CONTENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDownloadServer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDownloadServer002", 131890)
      Utils.registerBaseEvent("testDownloadServer002", webView.WebDownloadErrorCode.SERVER_BAD_CONTENT, 131910, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadServerTestButton');
    })

    /**
     * @tc.name   testDownloadServer003
     * @tc.number SUB_WEB_WEBDOWNLOADERRORCODE_SERVER_0300
     * @tc.desc   test WebDownloadErrorCode.SERVER_UNAUTHORIZED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDownloadServer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDownloadServer003", 131890)
      Utils.registerBaseEvent("testDownloadServer003", webView.WebDownloadErrorCode.SERVER_UNAUTHORIZED, 131920, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadServerTestButton');
    })

    /**
     * @tc.name   testDownloadServer004
     * @tc.number SUB_WEB_WEBDOWNLOADERRORCODE_SERVER_0400
     * @tc.desc   test WebDownloadErrorCode.SERVER_FORBIDDEN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDownloadServer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDownloadServer004", 131890)
      Utils.registerBaseEvent("testDownloadServer004", webView.WebDownloadErrorCode.SERVER_FORBIDDEN, 131930, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'WebViewControllerDownloadServerTestButton');
    })

  })
}