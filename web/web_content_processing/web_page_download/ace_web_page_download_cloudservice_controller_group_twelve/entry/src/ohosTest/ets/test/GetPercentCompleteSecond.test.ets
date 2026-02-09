/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import { router } from '@kit.ArkUI';
import { accessibility, config } from '@kit.AccessibilityKit';
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import { waitForComponents } from './WaitTest.test';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let driver: Driver = Driver.create();
let flg: boolean = false

export default function GetPercentCompleteSecond() {
  describe('GetPercentCompleteSecond', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
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
      flg = false;
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      done();
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      flg = false;
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testWebView_getPercentComplete1001
     * @tc.number SUB_ACE_WEB_getPercentComplete_1001
     * @tc.desc   test getPercentComplete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getPercentComplete1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete1"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete1", 131470);
      Utils.registerBaseEvent("DownloadGetPercentComplete1", 0, 131480, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_getPercentComplete1002
     * @tc.number SUB_ACE_WEB_getPercentComplete_1002
     * @tc.desc   test getPercentComplete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getPercentComplete1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete2"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete2", 131470);
      Utils.registerBaseEvent("DownloadGetPercentComplete21", true, 131490, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_getPercentComplete1003
     * @tc.number SUB_ACE_WEB_getPercentComplete_1003
     * @tc.desc   test getPercentComplete20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getPercentComplete1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete3"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete3", 131470);
      Utils.registerBaseEvent("DownloadGetPercentComplete3", 0, 131520, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_getPercentComplete1004
     * @tc.number SUB_ACE_WEB_getPercentComplete_1004
     * @tc.desc   test getPercentComplete80
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getPercentComplete1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete4"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete4", 131470);
      Utils.registerBaseEvent("DownloadGetPercentComplete4", 0, 131530, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_getPercentComplete1005
     * @tc.number SUB_ACE_WEB_getPercentComplete_1005
     * @tc.desc   test getPercentComplete40-100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getPercentComplete1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete5"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete5", 131470);
      Utils.registerBaseEvent("DownloadGetPercentComplete5", 100, 131540, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

  })
}