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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import webView from '@ohos.web.webview';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerDownloadServerTest() {
  describe('WebViewControllerDownloadServerTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerDownloadServerTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerDownloadServerTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerDownloadServerTest" == pages.name)) {
          console.info("get WebViewControllerDownloadServerTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerDownloadServerTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerDownloadServerTest page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerDownloadServerTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebViewControllerDownloadServerTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADERRORCODE_SERVER_0100
    * @tc.name        : testDownloadServer001
    * @tc.desc        : test WebDownloadErrorCode.SERVER_FAILED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDownloadServer001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDownloadServer001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDownloadServer001", webView.WebDownloadErrorCode.SERVER_FAILED, 79000, done);
      sendEventByKey('WebViewControllerDownloadServerTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADERRORCODE_SERVER_0200
    * @tc.name        : testDownloadServer002
    * @tc.desc        : test WebDownloadErrorCode.SERVER_BAD_CONTENT
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDownloadServer002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDownloadServer002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDownloadServer002", webView.WebDownloadErrorCode.SERVER_BAD_CONTENT, 79002, done);
      sendEventByKey('WebViewControllerDownloadServerTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADERRORCODE_SERVER_0300
    * @tc.name        : testDownloadServer003
    * @tc.desc        : test WebDownloadErrorCode.SERVER_UNAUTHORIZED
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDownloadServer003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDownloadServer003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDownloadServer003", webView.WebDownloadErrorCode.SERVER_UNAUTHORIZED, 79004, done);
      sendEventByKey('WebViewControllerDownloadServerTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_WEBDOWNLOADERRORCODE_SERVER_0400
    * @tc.name        : testDownloadServer004
    * @tc.desc        : test WebDownloadErrorCode.SERVER_FORBIDDEN
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testDownloadServer004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testDownloadServer004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testDownloadServer004", webView.WebDownloadErrorCode.SERVER_FORBIDDEN, 79006, done);
      sendEventByKey('WebViewControllerDownloadServerTestButton', 10, '');
    })

  })
}