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

export default function webViewControllerAccessStepTest() {

  describe('WebViewControllerAccessStepTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerAccessStepTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerAccessStepTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerAccessStepTest" == pages.name)) {
          console.info("get WebViewControllerAccessStepTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerAccessStepTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerAccessStepTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      console.info("WebViewControllerAccessStepTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerAccessStepTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerAccessStepTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_ACCESSSTEP_0100
    * @tc.name        : testWebViewControllerAccessStep001
    * @tc.desc        : stress testing accessStep
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testWebViewControllerAccessStep001', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerAccessStep001", 110091, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_ACCESSSTEP_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
   * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_ACCESSSTEP_0200
   * @tc.name        : testWebViewControllerAccessStep002
   * @tc.desc        : stress testing accessStep
   * @tc.size        : MediumTest
   * @tc.type        : Function
   * @tc.level       : Level 1
   */
    it('testWebViewControllerAccessStep002', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerAccessStep002", 110092, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_ACCESSSTEP_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
  * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_ACCESSSTEP_0300
  * @tc.name        : testWebViewControllerAccessStep003
  * @tc.desc        : stress testing accessStep
  * @tc.size        : MediumTest
  * @tc.type        : Function
  * @tc.level       : Level 1
  */
    it('testWebViewControllerAccessStep003', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerAccessStep003", 110093, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_ACCESSSTEP_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
  * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_ACCESSSTEP_0400
  * @tc.name        : testWebViewControllerAccessStep004
  * @tc.desc        : stress testing accessStep
  * @tc.size        : MediumTest
  * @tc.type        : Function
  * @tc.level       : Level 1
  */
    it('testWebViewControllerAccessStep004', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerAccessStep004", 110094, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_ACCESSSTEP_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
