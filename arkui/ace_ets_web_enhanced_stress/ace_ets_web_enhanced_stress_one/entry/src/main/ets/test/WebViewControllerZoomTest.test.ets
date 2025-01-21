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

export default function webViewControllerZoomTest() {

  describe('WebViewControllerZoomTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebViewControllerZoomTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerZoomTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerZoomTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerZoomTest" == pages.name)) {
          console.info("get WebViewControllerZoomTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerZoomTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerZoomTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebViewControllerZoomTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerZoomTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_ZOOM_0100
    * @tc.name        : testWebViewControllerZoom001
    * @tc.desc        : stress testing zoom when using the parameter 1
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerZoom001', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerZoom001", 80820, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_ZOOM_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_ZOOM_0200
    * @tc.name        : testWebViewControllerZoom002
    * @tc.desc        : stress testing zoom when using the parameter 0.5
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerZoom002', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerZoom002", 80830, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_ZOOM_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_ZOOM_0300
    * @tc.name        : testWebViewControllerZoom003
    * @tc.desc        : stress testing zoom when using the parameter 2
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerZoom003', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerZoom003", 80840, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_ZOOM_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}
