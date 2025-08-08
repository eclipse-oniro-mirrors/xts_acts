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
      await driver.delayMs(500)
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      await driver.delayMs(500)
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
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1006 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1006 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete6", (data: number) => {
        expect(data >= 90).assertTrue()
        console.info('SUB_ACE_WEB_getPercentComplete_1006 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1006 end')
        done()
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete6"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
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
    it('testWebView_getPercentComplete1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1007 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1007 start')
      let callbackNum1: number = 0;
      let callbackNum2: number = 0;
      let callbackNum3: number = 0;
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete71", (data: number) => {
        callbackNum1++
        expect(data >= 40).assertTrue()
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete72", (data: number) => {
        callbackNum2++
        expect(data >= 60).assertTrue()
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete73", (data: number) => {
        callbackNum3++
        expect(data >= 70).assertTrue()
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete7"
      })

      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(60000)
      expect(callbackNum1 > 0).assertTrue()
      expect(callbackNum2 > 0).assertTrue()
      expect(callbackNum3 > 0).assertTrue()
      router.clear()
      console.info('SUB_ACE_WEB_getPercentComplete_1007 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1007 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1008
     * @tc.name testWebView_getPercentComplete1008
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1008 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1008 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete8", (data: number) => {
        flg = true
        expect(data).assertEqual(0)
        console.info('SUB_ACE_WEB_getPercentComplete_1008 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1008 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete8"
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
     * @tc.number SUB_ACE_WEB_getPercentComplete_1010
     * @tc.name testWebView_getPercentComplete1010
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1010 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1010 start')
      let callbackNum1: number = 0;
      let callbackNum2: number = 0;
      let callbackNum3: number = 0;
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete101", (data: number) => {
        callbackNum1++
        expect(data).assertEqual(0)
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete102", (data: number) => {
        callbackNum2++
        expect(data).assertEqual(0)
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete103", (data: number) => {
        callbackNum3++
        expect(data).assertEqual(0)
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete10"
      })

      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(10000)
      expect(callbackNum1 == 1).assertTrue()
      expect(callbackNum2 == 1).assertTrue()
      expect(callbackNum3 == 1).assertTrue()
      router.clear()
      console.info('SUB_ACE_WEB_getPercentComplete_1010 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1010 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1011
     * @tc.name testWebView_getPercentComplete1011
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1011 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1011 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete11", (data: number) => {
        flg = true
        expect(data).assertEqual(0)
        console.info('SUB_ACE_WEB_getPercentComplete_1011 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1011 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete11"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(10000)
      expect(flg).assertTrue()
      router.clear()
    })
  })
}