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
import { webview } from '@kit.ArkWeb';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let driver = Driver.create();

export default function AceWeb() {

  describe('AceWeb', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async () => {
      await driver.delayMs(500)
      webview.WebviewController.initializeWebEngine()
      router.pushUrl({
        url: "testability/pages/IndexOthers"
      })
      await driver.delayMs(2000);
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      router.clear()
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number Sub_WEB_javaScriptProxy_asyncMethodList_0100
     * @tc.name testAsyncMethodList0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testAsyncMethodList0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_javaScriptProxy_asyncMethodList_0100 start')
      console.info('Sub_WEB_javaScriptProxy_asyncMethodList_0100 start')
      let driver = await Driver.create();

      let accept2 = await driver.findComponent(ON.id('Register'));
      await accept2.click();
      await driver.delayMs(1000);

      let accept1 = await driver.findComponent(ON.id('refresh'));
      await accept1.click();
      await driver.delayMs(1000);
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_javaScriptProxy_asyncMethodList_0100 end')
      console.info('Sub_WEB_javaScriptProxy_asyncMethodList_0100 end')
      done();
    })

    /**
     * @tc.number Sub_WEB_javaScriptProxy_asyncMethodList_0200
     * @tc.name testAsyncMethodList0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testAsyncMethodList0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_javaScriptProxy_asyncMethodList_0200 start')
      console.info('Sub_WEB_javaScriptProxy_asyncMethodList_0200 start')
      let driver = await Driver.create();

      let accept2 = await driver.findComponent(ON.id('Sub_WEB_javaScriptProxy_asyncMethodList_0200'));
      await accept2.click();
      await driver.delayMs(1000);

      let accept1 = await driver.findComponent(ON.id('refresh'));
      await accept1.click();
      await driver.delayMs(1000);
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_javaScriptProxy_asyncMethodList_0200 end')
      console.info('Sub_WEB_javaScriptProxy_asyncMethodList_0200 end')
      done();
    })

    /**
     * @tc.number Sub_WEB_registerJavaScriptProxy_asyncMethodList_0100
     * @tc.name testRegisterJavaScriptProxyAsyncMethodList0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("testRegisterJavaScriptProxyAsyncMethodList0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'testRegisterJavaScriptProxyAsyncMethodList0100 start')
      console.info('testRegisterJavaScriptProxyAsyncMethodList0100 start')
      let driver = await Driver.create();

      let accept2 = await driver.findComponent(ON.id('Sub_WEB_registerJavaScriptProxy_asyncMethodList_0100'));
      await accept2.click();
      await driver.delayMs(1000);

      let accept1 = await driver.findComponent(ON.id('refresh'));
      await accept1.click();
      await driver.delayMs(1000);
      hilog.info(0x0000, 'testTag', '%{public}s', 'testRegisterJavaScriptProxyAsyncMethodList0100 end')
      console.info('testRegisterJavaScriptProxyAsyncMethodList0100 end')
      done();
    })

  })
}

interface ErrorHttp {
  code: string
}