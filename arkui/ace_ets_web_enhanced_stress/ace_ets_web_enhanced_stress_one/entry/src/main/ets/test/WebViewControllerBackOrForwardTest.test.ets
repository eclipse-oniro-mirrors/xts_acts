/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import { Constants } from './Constants';
import Utils from './Utils';

export default function webViewControllerBackOrForwardTest() {

  describe('WebViewControllerBackOrForwardTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerBackOrForwardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerBackOrForwardTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerBackOrForwardTest" == pages.name)) {
          console.info("get WebViewControllerBackOrForwardTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerBackOrForwardTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerBackOrForwardTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebViewControllerBackOrForwardTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerBackOrForwardTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerBackOrForwardTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_PERFORMANCE_WEBVIEWCONTROLLER_BACKORFORWARD_0100
    * @tc.name        : testWebViewControllerBackOrForward001
    * @tc.desc        : test webViewController backOrForward performance with raw files
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebViewControllerBackOrForward001', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerBackOrForward001", 90005, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_BACKORFORWARD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_PERFORMANCE_WEBVIEWCONTROLLER_BACKORFORWARD_0200
    * @tc.name        : testWebViewControllerBackOrForward002
    * @tc.desc        : test webViewController backOrForward performance with raw files
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebViewControllerBackOrForward002', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerBackOrForward002", 90007, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_BACKORFORWARD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
   * @tc.number      : SUB_WEB_PERFORMANCE_WEBVIEWCONTROLLER_BACKORFORWARD_0300
   * @tc.name        : testWebViewControllerBackOrForward003
   * @tc.desc        : test webViewController backOrForward performance with raw files
   * @tc.size        : MediumTest
   * @tc.type        : Function
   * @tc.level       : Level 1
   */
    it('testWebViewControllerBackOrForward003', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerBackOrForward003", 90009, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_BACKORFORWARD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
   * @tc.number      : SUB_WEB_PERFORMANCE_WEBVIEWCONTROLLER_BACKORFORWARD_0400
   * @tc.name        : testWebViewControllerBackOrForward004
   * @tc.desc        : test webViewController backOrForward performance with raw files
   * @tc.size        : MediumTest
   * @tc.type        : Function
   * @tc.level       : Level 1
   */
    it('testWebViewControllerBackOrForward004', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerBackOrForward004", 90011, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_BACKORFORWARD_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
