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

export default function WebDownloadItem() {
  describe('WebDownloadItem', () => {
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
     * @tc.number SUB_ACE_WEB_getGuid_1000
     * @tc.name testWebView_getGuid1000
     * @tc.desc test getGuid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getGuid1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_1000 start')
      console.info('SUB_ACE_WEB_getGuid_1000 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("BeforeDownloadGetGuid", (data: string) => {
        flg = true
        expect(data).assertEqual('')
        console.info('SUB_ACE_WEB_getGuid_1000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_1000 end')
      })
      router.pushUrl({
        url: "testability/pages/GetGuidTest"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getGuid_2000
     * @tc.name testWebView_getGuid2000
     * @tc.desc test getGuid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getGuid2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_2000 start')
      console.info('SUB_ACE_WEB_getGuid_2000 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetGuid", (data: string) => {
        flg = true
        expect(data).assertEqual('')
        console.info('SUB_ACE_WEB_getGuid_2000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_2000 end')
      })
      router.pushUrl({
        url: "testability/pages/GetGuidTest1"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(2000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getGuid_3000
     * @tc.name testWebView_getGuid3000
     * @tc.desc test getGuid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getGuid3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_3000 start')
      console.info('SUB_ACE_WEB_getGuid_3000 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("DownloadGetGuidFailed", (data: string) => {
        flg = true
        expect(data.length > 0).assertTrue()
        console.info('DownloadGetGuidFailed: ', data)
        console.info('SUB_ACE_WEB_getGuid_3000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_3000 end')
      })
      router.pushUrl({
        url: "testability/pages/GetGuidTest2"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(6000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getGuid_4000
     * @tc.name testWebView_getGuid4000
     * @tc.desc test getGuid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getGuid4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_4000 start')
      console.info('SUB_ACE_WEB_getGuid_4000 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("BeforeDownloadGetGuidUpdated", (data: string) => {
        flg = true
        expect(data.length > 0).assertTrue()
        console.info('SUB_ACE_WEB_getGuid_4000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_4000 end')
      })
      router.pushUrl({
        url: "testability/pages/GetGuidTest3"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(6000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getGuid_5000
     * @tc.name testWebView_getGuid5000
     * @tc.desc test getGuid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getGuid5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_5000 start')
      console.info('SUB_ACE_WEB_getGuid_5000 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("BeforeDownloadGetGuidUpdated30", (data: string) => {
        flg = true
        expect(data.length > 0).assertTrue()
        console.info('SUB_ACE_WEB_getGuid_5000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_5000 end')
      })
      router.pushUrl({
        url: "testability/pages/GetGuidTest4"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(40000)
      expect(flg).assertTrue()
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getGuid_6000
     * @tc.name testWebView_getGuid6000
     * @tc.desc test getGuid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getGuid6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_6000 start')
      console.info('SUB_ACE_WEB_getGuid_6000 start')
      await driver.delayMs(500)
      let callbackNum1: number = 0
      let callbackNum2: number = 0
      let callbackNum3: number = 0

      LocalContext.context.eventHub.on("BeforeDownloadGetGuidUpdated100", (data: string) => {
        callbackNum1++
        expect(data.length > 0).assertTrue()
      })

      LocalContext.context.eventHub.on("BeforeDownloadGetGuidUpdatedPause", (data: string) => {
        callbackNum2++
        expect(data.length > 0).assertTrue()
      })

      LocalContext.context.eventHub.on("BeforeDownloadGetGuidUpdatedResume", (data: string) => {
        callbackNum3++
        expect(data.length > 0).assertTrue()
      })
      router.pushUrl({
        url: "testability/pages/GetGuidTest5"
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
      console.info('SUB_ACE_WEB_getGuid_6000 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_6000 end')
    })

    /**
     * @tc.number SUB_ACE_WEB_getGuid_7000
     * @tc.name testWebView_getGuid7000
     * @tc.desc test getGuid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getGuid7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_7000 start')
      console.info('SUB_ACE_WEB_getGuid_7000 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("BeforeDownloadGetGuidUpdatedTimeOut", (data: string) => {
        flg = true
        expect(data.length > 0).assertTrue()
        console.info('SUB_ACE_WEB_getGuid_7000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getGuid_7000 end')
      })
      router.pushUrl({
        url: "testability/pages/GetGuidTest6"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      await driver.delayMs(40000)
      expect(flg).assertTrue()
      router.clear()
    })
  })
}