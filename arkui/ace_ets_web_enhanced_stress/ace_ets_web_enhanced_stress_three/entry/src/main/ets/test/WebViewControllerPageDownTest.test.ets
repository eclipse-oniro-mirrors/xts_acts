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

export default function webViewControllerPageDownTest() {

  describe('WebViewControllerPageDownTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebViewControllerPageDownTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerPageDownTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerPageDownTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerPageDownTest" == pages.name)) {
          console.info("get WebViewControllerPageDownTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerPageDownTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerPageDownTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebViewControllerPageDownTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerPageDownTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_PAGEDOWN_0100
    * @tc.name        : testWebViewControllerPageDown001
    * @tc.desc        : stress testing pageDown with bottom is true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerPageDown001', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerPageDown001", 83214, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_PAGE_DOWN_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_PAGEDOWN_0200
    * @tc.name        : testWebViewControllerPageDown002
    * @tc.desc        : stress testing pageDown with bottom is false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerPageDown002', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerPageDown002", 83216, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_PAGE_DOWN_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}
