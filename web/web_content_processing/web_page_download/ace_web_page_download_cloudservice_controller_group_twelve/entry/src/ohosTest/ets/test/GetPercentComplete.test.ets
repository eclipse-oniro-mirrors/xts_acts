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
import { Driver, ON } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import { router } from '@kit.ArkUI';
import { accessibility, config } from '@kit.AccessibilityKit';
import Utils from './Util';
import events_emitter from '@ohos.events.emitter';
import { waitForComponents } from './WaitTest.test';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let driver: Driver = Driver.create();
let flg: boolean = false

export default function GetPercentComplete() {
  describe('getPercentComplete', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      flg = false;
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
     * @tc.number SUB_ACE_WEB_getPercentComplete_1006
     * @tc.name testWebView_getPercentComplete1006
     * @tc.desc test getPercentComplete80-90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testWebView_getPercentComplete1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete6"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete6", 131370);
      Utils.registerBaseEvent("DownloadGetPercentComplete6", true, 131380, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1007
     * @tc.name testWebView_getPercentComplete1007
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete7"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete7", 131370);
      Utils.registerBaseEvent("DownloadGetPercentComplete71", true, 131390, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1008
     * @tc.name testWebView_getPercentComplete1008
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete8"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete8", 131370);
      Utils.registerBaseEvent("DownloadGetPercentComplete8", 0, 131420, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1010
     * @tc.name testWebView_getPercentComplete1010
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete10"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete10", 131370);
      Utils.registerBaseEvent("DownloadGetPercentComplete101", 0, 131430, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1011
     * @tc.name testWebView_getPercentComplete1011
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/GetPercentComplete11"
      })
      await waitForComponents('001');
      Utils.emitEvent("DownloadGetPercentComplete11", 131370);
      Utils.registerBaseEvent("DownloadGetPercentComplete11", 0, 131460, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, "001");
      router.clear()
    })
  })
}