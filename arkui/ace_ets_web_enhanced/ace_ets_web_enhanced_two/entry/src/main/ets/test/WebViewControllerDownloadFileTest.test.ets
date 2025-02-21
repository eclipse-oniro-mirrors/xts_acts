/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import Utils from './Utils';
import webView from '@ohos.web.webview';

export default function webViewControllerDownloadFileTest() {
  describe('WebViewControllerDownloadFileTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/WebViewControllerDownloadFileTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerDownloadFileTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerDownloadFileTest" == pages.name)) {
          console.info("get WebViewControllerDownloadFileTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerDownloadFileTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerDownloadFileTest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerDownloadFileTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebViewControllerDownloadFileTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADERRORCODE_FILE_0100
    * @tc.name        : testDownloadFile001
    * @tc.desc        : test WebDownloadErrorCode.FILE_ACCESS_DENIED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDownloadFile001', 0, async (done: Function) => {
      Utils.emitEvent("testDownloadFile001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDownloadFile001", webView.WebDownloadErrorCode.FILE_ACCESS_DENIED, 79300, done);
      sendEventByKey('WebViewControllerDownloadFileTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADERRORCODE_FILE_0200
    * @tc.name        : testDownloadFile002
    * @tc.desc        : test WebDownloadErrorCode.USER_CANCELED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDownloadFile002', 0, async (done: Function) => {
      Utils.emitEvent("testDownloadFile002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDownloadFile002", webView.WebDownloadErrorCode.USER_CANCELED, 79302, done);
      sendEventByKey('WebViewControllerDownloadFileTestButton', 10, '');
    })

  })
}