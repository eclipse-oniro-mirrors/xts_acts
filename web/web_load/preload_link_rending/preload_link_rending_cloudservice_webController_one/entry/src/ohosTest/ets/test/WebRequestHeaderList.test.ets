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
import { BusinessError } from '@kit.BasicServicesKit';
import { accessibility, config } from '@kit.AccessibilityKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
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
     * @tc.name   testWebView_warmupServiceWorker0002
     * @tc.number SUB_ACE_WEB_WarmupServiceWorker_0002
     * @tc.desc   test warmupServiceWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_warmupServiceWorker0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WarmupServiceWorker_0002 start')
      console.info('SUB_ACE_WEB_WarmupServiceWorker_0002 start')

      try {
        webview.WebviewController.warmupServiceWorker("https://");
      } catch (error) {
        flg = true
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual("17100002")
        expect(error.message).assertEqual("URL error. The webpage corresponding to the URL is invalid, or the URL length exceeds 2*1024*1024.")
      }
      expect(flg).assertTrue()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WarmupServiceWorker_0002 end')
      console.info('SUB_ACE_WEB_WarmupServiceWorker_0002 end')
    })

    /**
     * @tc.name   testWebView_warmupServiceWorker0003
     * @tc.number SUB_ACE_WEB_WarmupServiceWorker_0003
     * @tc.desc   test warmupServiceWorker
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebView_warmupServiceWorker0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WarmupServiceWorker_0003 start')
      console.info('SUB_ACE_WEB_WarmupServiceWorker_0003 start')

      try {
        webview.WebviewController.warmupServiceWorker(null);
      } catch (error) {
        flg = true
        console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
        expect(error.code).assertEqual("17100002")
        expect(error.message).assertEqual("URL error. The webpage corresponding to the URL is invalid, or the URL length exceeds 2*1024*1024.")
      }

      expect(flg).assertTrue()
      hilog.info(0x0000, 'testTag', '%{public}s', 'SUB_ACE_WEB_WarmupServiceWorker_0003 end')
      console.info('SUB_ACE_WEB_WarmupServiceWorker_0003 end')
    })
  })
}