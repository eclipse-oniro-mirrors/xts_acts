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

export default function webViewControllerRefreshTest() {

  describe('WebViewControllerRefreshTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebViewControllerRefreshTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerRefreshTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerRefreshTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerRefreshTest" == pages.name)) {
          console.info("get WebViewControllerRefreshTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerRefreshTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerRefreshTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebViewControllerRefreshTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerRefreshTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_REFRESH_0100
    * @tc.name        : testWebViewControllerRefresh001
    * @tc.desc        : stress testing Refresh
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerRefresh001', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerRefresh001", 80700, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_REFRESH_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });


    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_REFRESH_0200
    * @tc.name        : testWebViewControllerRefresh002
    * @tc.desc        : stress testing Refresh
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerRefresh002', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerRefresh002", 80701, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_REFRESH_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });


    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_REFRESH_0300
    * @tc.name        : testWebViewControllerRefresh003
    * @tc.desc        : stress testing Refresh
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerRefresh003', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerRefresh003", 80702, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_REFRESH_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });


    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_REFRESH_0400
    * @tc.name        : testWebViewControllerRefresh004
    * @tc.desc        : stress testing Refresh
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerRefresh004', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerRefresh004", 80703, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_REFRESH_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
