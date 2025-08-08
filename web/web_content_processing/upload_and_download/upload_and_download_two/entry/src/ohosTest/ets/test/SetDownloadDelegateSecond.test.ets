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

export default function SetDownloadDelegateSecond() {
  describe('SetDownloadDelegateSecond', () => {
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
     * @tc.number SUB_ACE_WEB_onDownloadFailed_1001
     * @tc.name testWebView_onDownloadFailed1001
     * @tc.desc test onDownloadFinish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_onDownloadFailed1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onDownloadFailed_1001 start')
      console.info('SUB_ACE_WEB_onDownloadFailed_1001 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("SetDownloadDelegate4", (data: number) => {
        expect(data).assertEqual(webview.WebDownloadState.CANCELED)
        console.info('SUB_ACE_WEB_onDownloadFailed_1001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_onDownloadFailed_1001 end')
        done()
      })
      router.pushUrl({
        url: "testability/pages/SetDownloadDelegate4"
      })
      await driver.delayMs(2000)
      sendEventByKey('001', 10, '')
      await driver.delayMs(2000)
      sendEventByKey('002', 10, '')
      router.clear()
    })

    /**
     * @tc.number SUB_ACE_WEB_getUrl_2000
     * @tc.name testWebView_getUrl1000
     * @tc.desc test onDownloadFinish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getUrl1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getUrl_2000 start')
      console.info('SUB_ACE_WEB_getUrl_2000 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("SetDownloadDelegate5", (data: number) => {
        flg = true
        expect(data).assertEqual('https:' +
          '//mirrors.huaweicloud.com/npm-software/v6.14.16.tar.gz0')
        console.info('SUB_ACE_WEB_getUrl_2000 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getUrl_2000 end')
      })
      router.pushUrl({
        url: "testability/pages/SetDownloadDelegate5"
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
     * @tc.number SUB_ACE_WEB_getUrl_2001
     * @tc.name testWebView_getUrl1001
     * @tc.desc test onDownloadFinish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getUrl1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getUrl_2001 start')
      console.info('SUB_ACE_WEB_getUrl_2001 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("SetDownloadDelegate5", (data: number) => {
        flg = true
        expect(data).assertEqual('https:' +
          '//mirrors.huaweicloud.com/npm-software/v6.14.16.tar.gz0')
        console.info('SUB_ACE_WEB_getUrl_2001 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getUrl_2001 end')
      })
      router.pushUrl({
        url: "testability/pages/SetDownloadDelegate5"
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
     * @tc.number SUB_ACE_WEB_getUrl_2002
     * @tc.name testWebView_getUrl1002
     * @tc.desc test onDownloadFinish
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebView_getUrl1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getUrl_2002 start')
      console.info('SUB_ACE_WEB_getUrl_2002 start')
      await driver.delayMs(500)

      LocalContext.context.eventHub.on("SetDownloadDelegate6", (data: number) => {
        flg = true
        expect(data).assertEqual(webview.WebDownloadState.PENDING)
        console.info('SUB_ACE_WEB_getUrl_2002 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_getUrl_2002 end')
      })
      router.pushUrl({
        url: "testability/pages/SetDownloadDelegate6"
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