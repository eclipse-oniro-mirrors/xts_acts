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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect,  TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { webview } from '@kit.ArkWeb';
import { LocalContext } from './GloablConfig';
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let driver: Driver = Driver.create();
let flg: boolean = false

export default function webRequestHeaderList() {
  describe('WebRequestHeaderListTest', () => {
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
     * @tc.number SUB_ACE_WEB_start_0100
     * @tc.name testWebView_start0100
     * @tc.desc test WebView_start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_start0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_start_0100 start')
      console.info('SUB_ACE_WEB_start_0100 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("StartTest-success", () => {
        flg = true
        console.info('SUB_ACE_WEB_start_0100 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_start_0100 end')
      })
      router.pushUrl({
        url: "testability/pages/StartDownloadTest"
      })
      await driver.delayMs(2000)
      sendEventByKey("01", 10, '')
      await driver.delayMs(1000)
      sendEventByKey("02", 10, '')
      await driver.delayMs(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_start_0105
     * @tc.name testWebView_start0105
     * @tc.desc test WebDownloadState
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_start0105',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_start_0105 start')
      console.info('SUB_ACE_WEB_start_0105 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("WebDownloadState", (data: string) => {
        flg = true
        expect(data).assertEqual("4")
        console.info('SUB_ACE_WEB_start_0105 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_start_0105 end')
      })
      router.pushUrl({
        url: "testability/pages/PendingTest"
      })
      await driver.delayMs(2000)
      sendEventByKey("05", 10, '')
      await driver.delayMs(2000)
      sendEventByKey("06", 10, '')
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
    })

  })
}