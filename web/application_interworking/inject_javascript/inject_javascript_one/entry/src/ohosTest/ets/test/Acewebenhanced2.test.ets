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

import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level } from '@ohos/hypium';
import { webview } from '@kit.ArkWeb';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { router } from '@kit.ArkUI';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();


export default function AceWeb() {

  describe('AceWeb', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/IndexOthers',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get IndexOthers state success ' + JSON.stringify(pages));
        if (!("IndexOthers" == pages.name)) {
          console.info('get IndexOthers state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push IndexOthers page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push IndexOthers page error: ' + err);
      }
      await driver.waitForComponent(ON.id("registerJavaScriptProxyAsyncMethodListButton"), 10000);
      done()
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('IndexOthers beforeEach start');
      done();
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
     * @tc.level Level 0
     */
    it("testAsyncMethodList0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitAsyncMethodList0100", 172120);
      Utils.registerBaseEvent("testAsyncMethodList0100", true, 172130, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'registerJavaScriptProxyAsyncMethodListButton');
    })

    /**
     * @tc.number Sub_WEB_javaScriptProxy_asyncMethodList_0200
     * @tc.name testAsyncMethodList0200
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testAsyncMethodList0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitAsyncMethodList0200", 172120);
      Utils.registerBaseEvent("testAsyncMethodList0200", true, 172140, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'registerJavaScriptProxyAsyncMethodListButton');
    })

    /**
     * @tc.number Sub_WEB_registerJavaScriptProxy_asyncMethodList_0100
     * @tc.name testRegisterJavaScriptProxyAsyncMethodList0100
     * @tc.desc test Arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegisterJavaScriptProxyAsyncMethodList0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRegisterJavaScriptProxyAsyncMethodList0100", 172120);
      Utils.registerBaseEvent("testRegisterJavaScriptProxyAsyncMethodList0100", true, 172150, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'registerJavaScriptProxyAsyncMethodListButton');
    })

  })
}

interface ErrorHttp {
  code: string
}