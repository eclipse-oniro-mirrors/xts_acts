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

import { afterEach, beforeEach, describe, it } from '@ohos/hypium';
import { Constants } from './Constants';
import Utils from './Utils';

export default function webViewControllerLoadUrlTest() {

  describe('WebViewControllerLoadUrlTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebViewControllerLoadUrlTest beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerLoadUrlTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerLoadUrlTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_LOADURL_0100
    * @tc.name        : testWebViewControllerLoadUrl001
    * @tc.desc        : stress testing loadUrl
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerLoadUrl001', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerLoadUrl001", 100000, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_LOADURL_0200
    * @tc.name        : testWebViewControllerLoadUrl002
    * @tc.desc        : stress testing loadUrl when using the resource
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerLoadUrl002', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerLoadUrl002", 100020, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_LOADURL_0300
    * @tc.name        : testWebViewControllerLoadUrl003
    * @tc.desc        : stress testing loadUrl when using the url
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerLoadUrl003', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerLoadUrl003", 100040, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_LOADURL_0400
    * @tc.name        : testWebViewControllerLoadUrl004
    * @tc.desc        : stress testing loadUrl when using the sandbox file
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerLoadUrl004', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerLoadUrl004", 100041, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_LOADURL_0500
    * @tc.name        : testWebViewControllerLoadUrl005
    * @tc.desc        : stress testing loadUrl when using the raw file
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerLoadUrl005', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerLoadUrl005", 100043, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_LOADURL_0600
    * @tc.name        : testWebViewControllerLoadUrl006
    * @tc.desc        : stress testing loadUrl when using the resource
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerLoadUrl006', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerLoadUrl006", 100045, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_LOADURL_0700
    * @tc.name        : testWebViewControllerLoadUrl007
    * @tc.desc        : stress testing loadUrl when using the url
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerLoadUrl007', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerLoadUrl007", 100046, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_LOADURL_0800
    * @tc.name        : testWebViewControllerLoadUrl008
    * @tc.desc        : stress testing loadUrl when using the sandbox file
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerLoadUrl008', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerLoadUrl008", 100049, Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_LOAD_URL_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });

  })
}
