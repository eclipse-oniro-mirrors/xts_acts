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
import { webview } from '@kit.ArkWeb';
import { router } from '@kit.ArkUI';
import { accessibility, config } from '@kit.AccessibilityKit';
import Utils from './Util';
import { waitForComponents } from './WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import { Driver } from '@kit.TestKit';
import wifiMg from '@ohos.wifiManager';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const driver = Driver.create();

export default function SetConnectionTimeOut() {
  describe('SetConnectionTimeOut', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      webview.WebviewController.initializeWebEngine()
      webview.WebviewController.setConnectionTimeout(60)
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
      done();
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(async () => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      webview.WebviewController.setConnectionTimeout(60)
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.name   testWebView_pause0700
     * @tc.number SUB_ACE_WEB_pause_0700
     * @tc.desc   test setConnectionTimeOut5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_pause0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/SetConnectionTimeOut1"
      })
      Utils.emitEvent("setConnectionTimeOut1", 131050);
      Utils.registerBaseEvent("setConnectionTimeOut1", true, 131060, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_pause0800
     * @tc.number SUB_ACE_WEB_pause_0800
     * @tc.desc   test setConnectionTimeOut5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_pause0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/SetConnectionTimeOut2"
      })
      Utils.emitEvent("setConnectionTimeOut2", 131050);
      Utils.registerBaseEvent("setConnectionTimeOut2", true, 131070, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_resume0600
     * @tc.number SUB_ACE_WEB_resume_0600
     * @tc.desc   test setConnectionTimeOut5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_resume0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/SetConnectionTimeOut3"
      })
      Utils.emitEvent("setConnectionTimeOut3", 131050);
      Utils.registerBaseEvent("setConnectionTimeOut3", true, 131080, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.name   testWebView_resume0700
     * @tc.number SUB_ACE_WEB_resume_0700
     * @tc.desc   test setConnectionTimeOut5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebView_resume0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/SetConnectionTimeOut4"
      })
      Utils.emitEvent("setConnectionTimeOut4", 131050);
      Utils.registerBaseEvent("setConnectionTimeOut4", true, 131090, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

  })
}
