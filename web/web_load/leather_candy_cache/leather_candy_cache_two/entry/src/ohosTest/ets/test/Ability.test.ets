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
import { temp } from './Const';
import { BusinessError } from '@kit.BasicServicesKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
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
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.name   testPrefetchResource07
     * @tc.number Sub_WEB_PrefetchResource_0700
     * @tc.desc   test Arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testPrefetchResource07', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0700 start')
      console.info('Sub_WEB_PrefetchResource_0700 start')
      let info: webview.RequestInfo = {
        url: "http://collect-v6.51.la/v6/collect?dt=4",
        method: "POST",
        formData: ""
      }
      let hands: Array<webview.WebHeader> = [{
        headerKey: "user-agent",
        headerValue: "",
      }, {
        headerKey: "content-type",
        headerValue: "application/json; charset=UTF-8"
      }
      ]

      try {
        webview.WebviewController.prefetchResource(info, hands, "event", -1)
      } catch (e) {
        console.error(`[PrefetchResource] ErrorCode: ${(e as BusinessError).code},  Message: ${(e as BusinessError).message}`);
        expect(e.code).assertEqual("401")
        expect(e.message).assertEqual("Invalid input parameter")
        console.info('Sub_WEB_PrefetchResource_0700 end')
        hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0700 end')
        return
      }
      expect(false).assertTrue()
      console.info('Sub_WEB_PrefetchResource_0700 end')
      hilog.info(0x0000, 'testTag', '%{public}s', 'Sub_WEB_PrefetchResource_0700 end')
    })


  })
}
