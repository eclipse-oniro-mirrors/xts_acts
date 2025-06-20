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

export default function GetPercentCompleteSecond() {
  describe('GetPercentCompleteSecond', () => {
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
     * @tc.number SUB_ACE_WEB_getPercentComplete_1001
     * @tc.name testWebView_getPercentComplete1001
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1001 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1001 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete1", (data: number) => {
        flg = true
        expect(data).assertEqual(0)
        console.info('SUB_ACE_WEB_getPercentComplete_1001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1001 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete1"
      })
      await driver.delayMs(2000)
      sendEventByKey('0022', 10, '')
      await driver.delayMs(1000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1002
     * @tc.name testWebView_getPercentComplete1002
     * @tc.desc test getPercentComplete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1002 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1002 start')
      let callbackNum1: number = 0;
      let callbackNum2: number = 0;
      let callbackNum3: number = 0;
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete21", (data: number) => {
        callbackNum1++
        expect(data > 0).assertTrue()
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete22", (data: number) => {
        callbackNum2++
        expect(data > 0).assertTrue()
      })

      LocalContext.context.eventHub.on("DownloadGetPercentComplete23", (data: number) => {
        callbackNum3++
        expect(data > 0).assertTrue()
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete2"
      })

      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(30000)
      expect(callbackNum1 > 0).assertTrue()
      expect(callbackNum2 > 0).assertTrue()
      expect(callbackNum3 > 0).assertTrue()
      router.clear()
      console.info('SUB_ACE_WEB_getPercentComplete_1002 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1002 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1003
     * @tc.name testWebView_getPercentComplete1003
     * @tc.desc test getPercentComplete20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1003 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1003 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete3", (data: number) => {
        expect(data).assertEqual(0)
        console.info('SUB_ACE_WEB_getPercentComplete_1003 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1003 end')
        done()
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete3"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1004
     * @tc.name testWebView_getPercentComplete1004
     * @tc.desc test getPercentComplete80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1004 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1004 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete4", (data: number) => {
        expect(data).assertEqual(0)
        console.info('SUB_ACE_WEB_getPercentComplete_1004 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1004 end')
        done()
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete4"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getPercentComplete_1005
     * @tc.name testWebView_getPercentComplete1005
     * @tc.desc test getPercentComplete40-100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getPercentComplete1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1005 start')
      console.info('SUB_ACE_WEB_getPercentComplete_1005 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetPercentComplete5", (data: number) => {
        expect(data).assertEqual(100)
        console.info('SUB_ACE_WEB_getPercentComplete_1005 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getPercentComplete_1005 end')
      })
      router.pushUrl({
        url: "testability/pages/GetPercentComplete5"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      done()
      router.clear()
    })

  })
}