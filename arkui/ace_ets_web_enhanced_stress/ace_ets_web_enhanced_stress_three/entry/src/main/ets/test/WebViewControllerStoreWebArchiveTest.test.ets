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

export default function webViewControllerStoreWebArchiveTest() {

  describe('WebViewControllerStoreWebArchiveTest', () => {
    beforeEach(async (done: Function) => {
      console.info("WebViewControllerStoreWebArchiveTest beforeEach start");
      done();
    })

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerStoreWebArchiveTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerStoreWebArchiveTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerStoreWebArchiveTest" == pages.name)) {
          console.info("get WebViewControllerStoreWebArchiveTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerStoreWebArchiveTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerStoreWebArchiveTest page error: " + err);
      }
      done()
    });

    afterEach(async (done: Function) => {
      console.info("WebViewControllerStoreWebArchiveTest afterEach start");
      await Utils.sleep(2000);
      console.info("WebViewControllerStoreWebArchiveTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0100
    * @tc.name        : testWebViewControllerStoreWebArchive001
    * @tc.desc        : stress testing storeWebArchive
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerStoreWebArchive001', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerStoreWebArchive001", 83040,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_STORE_WEBARCHIVE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0200
    * @tc.name        : testWebViewControllerStoreWebArchive002
    * @tc.desc        : stress testing storeWebArchive
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerStoreWebArchive002', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerStoreWebArchive002", 83042,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_STORE_WEBARCHIVE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0300
    * @tc.name        : testWebViewControllerStoreWebArchive003
    * @tc.desc        : stress testing storeWebArchive
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerStoreWebArchive003', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerStoreWebArchive003", 83044,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_STORE_WEBARCHIVE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
    /*
    * @tc.number      : SUB_WEB_STRESS_WEBVIEWCONTROLLER_STOREWEBARCHIVE_0400
    * @tc.name        : testWebViewControllerStoreWebArchive004
    * @tc.desc        : stress testing storeWebArchive
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testWebViewControllerStoreWebArchive004', 0, async (done: Function) => {
      Utils.doIt("testWebViewControllerStoreWebArchive004", 83046,
        Constants.USE_LOW_STRESS_TIMES ? Constants.LOW_STRESS_TIMES : Constants.DEFAULT_STRESS_TIMES,
        Constants.WEB_VIEW_CONTROLLER_STORE_WEBARCHIVE_BUTTON_KEY,
        (testCaseName: string, callBackId: number) => {
          Utils.registerEvent(testCaseName, true, callBackId, done);
        })
    });
  })
}
