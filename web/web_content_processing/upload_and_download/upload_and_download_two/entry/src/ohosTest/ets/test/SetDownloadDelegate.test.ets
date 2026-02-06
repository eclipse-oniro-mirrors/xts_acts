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
import { waitAndClickComponent } from './WaitTest.test';
import events_emitter from '@ohos.events.emitter';
import Utils from './Util';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let driver: Driver = Driver.create();
let flg: boolean = false

export default function SetDownloadDelegate() {
  describe('SetDownloadDelegate', () => {
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
     * @tc.number SUB_ACE_WEB_onDownloadFinish_1003
     * @tc.name testWebView_onDownloadFinish1003
     * @tc.desc test onDownloadFinish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testWebView_onDownloadFinish1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/SetDownloadDelegate1"
      })
      Utils.emitEvent("SetDownloadDelegate1", 130620);
      Utils.registerBaseEvent("SetDownloadDelegate1", webview.WebDownloadState.CANCELED, 130630, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("001");
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_onDownloadFinish_1004
     * @tc.name testWebView_onDownloadFinish1004
     * @tc.desc test onDownloadFinish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onDownloadFinish1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/SetDownloadDelegate2"
      })
      Utils.emitEvent("SetDownloadDelegate2", 130620);
      Utils.registerBaseEvent("SetDownloadDelegate2", webview.WebDownloadState.CANCELED, 130640, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("001");
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_onDownloadFinish_1005
     * @tc.name testWebView_onDownloadFinish1005
     * @tc.desc test onDownloadFinish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onDownloadFinish1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      router.pushUrl({
        url: "testability/pages/SetDownloadDelegate3"
      })
      Utils.emitEvent("SetDownloadDelegate3", 130620);
      Utils.registerBaseEvent("SetDownloadDelegate3", webview.WebDownloadState.IN_PROGRESS, 130650, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await waitAndClickComponent("001");
      router.clear()
    })
  })
}