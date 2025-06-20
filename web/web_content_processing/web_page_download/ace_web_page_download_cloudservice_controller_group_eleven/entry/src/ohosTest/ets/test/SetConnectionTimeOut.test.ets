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
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let driver: Driver = Driver.create();
let flg: boolean = false

export default function SetConnectionTimeOut() {
  describe('SetConnectionTimeOut', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
      webview.WebviewController.setConnectionTimeout(60)
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
      await driver.delayMs(500)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      webview.WebviewController.setConnectionTimeout(60)
      await driver.delayMs(500)
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_ACE_WEB_pause_0700
     * @tc.name testWebView_pause0700
     * @tc.desc test setConnectionTimeOut5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_pause0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_pause_0700 start')
      console.info('SUB_ACE_WEB_pause_0700 start')
      await driver.delayMs(500)
      LocalContext.context.eventHub.on("setConnectionTimeOut1", (data: webview.WebDownloadState) => {
        flg = true
        expect(data).assertEqual(webview.WebDownloadState.PAUSED)
        console.info('SUB_ACE_WEB_pause_0700 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_pause_0700 end')
      })
      router.pushUrl({
        url: "testability/pages/SetConnectionTimeOut1"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(10000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_pause_0800
     * @tc.name testWebView_pause0800
     * @tc.desc test setConnectionTimeOut5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_pause0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_pause_0800 start')
      console.info('SUB_ACE_WEB_pause_0800 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("setConnectionTimeOut2", (data: webview.WebDownloadState) => {
        expect(data).assertEqual(webview.WebDownloadState.COMPLETED)
        console.info('SUB_ACE_WEB_pause_0800 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_pause_0800 end')
        done()
      })
      router.pushUrl({
        url: "testability/pages/SetConnectionTimeOut2"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_resume_0600
     * @tc.name testWebView_resume0600
     * @tc.desc test setConnectionTimeOut5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_resume0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_resume_0600 start')
      console.info('SUB_ACE_WEB_resume_0600 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("setConnectionTimeOut3", (data: webview.WebDownloadState) => {
        flg = true
        expect(data).assertEqual(webview.WebDownloadState.CANCELED)
        console.info('SUB_ACE_WEB_resume_0600 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_resume_0600 end')
      })
      router.pushUrl({
        url: "testability/pages/SetConnectionTimeOut3"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(10000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_resume_0700
     * @tc.name testWebView_resume0700
     * @tc.desc test setConnectionTimeOut5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_resume0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_resume_0700 start')
      console.info('SUB_ACE_WEB_resume_0700 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("setConnectionTimeOut4", (data: webview.WebDownloadState) => {
        flg = true
        expect(data).assertEqual(webview.WebDownloadState.PENDING)
        console.info('SUB_ACE_WEB_resume_0700 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_resume_0700 end')
      })
      router.pushUrl({
        url: "testability/pages/SetConnectionTimeOut4"
      })
      await driver.delayMs(18000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(18000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(10000)
      expect(flg).assertTrue()
      router.clear()
    })

  })
}
