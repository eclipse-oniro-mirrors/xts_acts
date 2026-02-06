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
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0003
     * @tc.name testWebView_onOverrideUrlLoading0003
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0003 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0003 start')
      LocalContext.context.eventHub.on("onOverrideUrlLoading0003", () => {
        flg = !flg
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading3"
      })
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0003 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0003 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0004
     * @tc.name testWebView_onOverrideUrlLoading0004
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0004 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0004 start')

      LocalContext.context.eventHub.on("onOverrideUrlLoading0004", () => {
        flg = true
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading4"
      })
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0004 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0004 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0006
     * @tc.name testWebView_onOverrideUrlLoading0006
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0006 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0006 start')

      LocalContext.context.eventHub.on("onOverrideUrlLoading0006", () => {
        flg = !flg
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading6"
      })
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0006 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0006 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0007
     * @tc.name testWebView_onOverrideUrlLoading0007
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0007 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0007 start')

      LocalContext.context.eventHub.on("onOverrideUrlLoading0007", () => {
        flg = !flg
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading7"
      })
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0007 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0007 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_onOverrideUrlLoading_0008
     * @tc.name testWebView_onOverrideUrlLoading0007
     * @tc.desc test onOverrideUrlLoading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onOverrideUrlLoading0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0008 start')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0008 start')

      LocalContext.context.eventHub.on("onOverrideUrlLoading0008", () => {
        flg = !flg
      })

      router.pushUrl({
        url: "testability/pages/OnOverrideUrlLoading8"
      })
      expect(flg).assertTrue()
      router.clear()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onOverrideUrlLoading_0008 end')
      console.info('SUB_ACE_WEB_onOverrideUrlLoading_0008 end')
    })
  })
}