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
import { Constants } from './Constants';
import router from '@ohos.router';
import Utils from './Utils';

export default function webViewControllerPageUpTest() {

  describe('WebViewControllerPageUpTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebViewControllerPageUpTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerPageUpTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerPageUpTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerPageUpTest" == pages.name)) {
          console.info("get WebViewControllerPageUpTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerPageUpTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerPageUpTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebViewControllerPageUpTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerPageUpTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_PAGEUP_0100
    * @tc.name        : testWebViewControllerPageUp001
    * @tc.desc        : stress testing pageUp with bottom is true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerPageUp001', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerPageUp001", 83224, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_PAGE_UP_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_PAGEUP_0200
    * @tc.name        : testWebViewControllerPageUp002
    * @tc.desc        : stress testing pageUp with bottom is false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerPageUp002', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerPageUp002", 83226, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_PAGE_UP_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}
