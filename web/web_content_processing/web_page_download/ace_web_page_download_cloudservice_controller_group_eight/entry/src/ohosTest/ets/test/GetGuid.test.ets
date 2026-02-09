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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import { LocalContext } from './GloablConfig';
import { router } from '@kit.ArkUI';
import { accessibility, config } from '@kit.AccessibilityKit';
import Utils from './Util';
import { waitForComponents } from './WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let driver: Driver = Driver.create();
let flg: boolean = false

export default function WebDownloadItem() {
  describe('WebDownloadItem', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      await waitForComponents('001');
      done();
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
    afterEach(() => {
      flg = false;
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testWebView_getGuid1000
     * @tc.number SUB_ACE_WEB_getGuid_1000
     * @tc.desc   test getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getGuid1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetGuidTest"
      })
      Utils.emitEvent("BeforeDownloadGetGuid", 130760);
      Utils.registerBaseEvent("BeforeDownloadGetGuid", '', 130770, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
    })

    /**
     * @tc.name   testWebView_getGuid2000
     * @tc.number SUB_ACE_WEB_getGuid_2000
     * @tc.desc   test getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getGuid2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetGuidTest1"
      })
      Utils.emitEvent("DownloadGetGuid", 130760);
      Utils.registerBaseEvent("DownloadGetGuid", '', 130780, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_getGuid3000
     * @tc.number SUB_ACE_WEB_getGuid_3000
     * @tc.desc   test getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getGuid3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetGuidTest2"
      })
      Utils.emitEvent("DownloadGetGuidFailed", 130760);
      Utils.registerBaseEvent("DownloadGetGuidFailed", true, 130790, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_getGuid4000
     * @tc.number SUB_ACE_WEB_getGuid_4000
     * @tc.desc   test getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getGuid4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetGuidTest3"
      })
      Utils.emitEvent("BeforeDownloadGetGuidUpdated", 130760);
      Utils.registerBaseEvent("BeforeDownloadGetGuidUpdated", true, 130800, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_getGuid5000
     * @tc.number SUB_ACE_WEB_getGuid_5000
     * @tc.desc   test getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getGuid5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetGuidTest4"
      })
      Utils.emitEvent("BeforeDownloadGetGuidUpdated30", 130760);
      Utils.registerBaseEvent("BeforeDownloadGetGuidUpdated30", true, 130810, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_getGuid6000
     * @tc.number SUB_ACE_WEB_getGuid_6000
     * @tc.desc   test getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getGuid6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetGuidTest5"
      })
      Utils.emitEvent("BeforeDownloadGetGuidUpdated", 130760);
      Utils.registerBaseEvent("BeforeDownloadGetGuidUpdated100", true, 130820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_getGuid7000
     * @tc.number SUB_ACE_WEB_getGuid_7000
     * @tc.desc   test getGuid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_getGuid7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetGuidTest6"
      })
      Utils.emitEvent("BeforeDownloadGetGuidUpdatedTimeOut", 130760);
      Utils.registerBaseEvent("BeforeDownloadGetGuidUpdatedTimeOut", true, 130850, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })
  })
}