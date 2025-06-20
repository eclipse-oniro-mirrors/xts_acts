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

let driver: Driver = Driver.create();
let flg: boolean = false

export default function hasGesture() {
  describe('HasGestureTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      webview.WebviewController.initializeWebEngine()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number SUB_ACE_WEB_getHttpBodyStream_0100
     * @tc.name testWebView_getHttpBodyStream0100
     * @tc.desc test getHttpBodyStream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testWebView_getHttpBodyStream0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getHttpBodyStream_0100 start')
      console.info('SUB_ACE_WEB_getHttpBodyStream_0100 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("GetHttpBodyStreamTest", () => {
        flg = true
        console.info('SUB_ACE_WEB_getHttpBodyStream_0100 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getHttpBodyStream_0100 end')
      })
      router.pushUrl({
        url: "testability/pages/GetHttpBodyStreamTest"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_setStatus_0100
     * @tc.name testWebView_setStatus0100
     * @tc.desc test SetStatus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWebView_setStatus0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_setStatus_0100 start')
      console.info('SUB_ACE_WEB_setStatus_0100 start')
      await driver.delayMs(500)
      LocalContext.context.eventHub.on("SetStatusTest", (data: string) => {
        flg = true
        expect(data).assertEqual("12")
        console.info('SUB_ACE_WEB_setStatus_0100 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_setStatus_0100 end')
      })
      router.pushUrl({
        url: "testability/pages/SetStatusTest"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_setStatus_0200
     * @tc.name testWebView_setStatus0200
     * @tc.desc test SetStatus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWebView_setStatus0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_setStatus_0200 start')
      console.info('SUB_ACE_WEB_setStatus_0200 start')
      await driver.delayMs(500)
      LocalContext.context.eventHub.on("SetStatusTest1", (data: string) => {
        flg = true
        expect(data).assertEqual("-12")
        console.info('SUB_ACE_WEB_setStatus_0200 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_setStatus_0200 end')
      })
      router.pushUrl({
        url: "testability/pages/SetStatusTest1"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_setStatus_0300
     * @tc.name testWebView_setStatus0300
     * @tc.desc test SetStatus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testWebView_setStatus0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_setStatus_0300 start')
      console.info('SUB_ACE_WEB_setStatus_0300 start')
      await driver.delayMs(500)
      LocalContext.context.eventHub.on("SetStatusTest2", (code: string, message: string) => {
        flg = true
        expect(code).assertEqual("401")
        expect(message).assertEqual("BusinessError 401: Parameter error. The type of 'code' must be int.")
        console.info('SUB_ACE_WEB_setStatus_0300 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_setStatus_0300 end')
      })
      router.pushUrl({
        url: "testability/pages/SetStatusTest2"
      })
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
    })
  })
}