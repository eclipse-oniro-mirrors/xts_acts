/*
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewControllerPostUrlTest() {

  describe('WebViewControllerPostUrlTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerPostUrlTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerPostUrlTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerPostUrlTest" == pages.name)) {
          console.info("get WebViewControllerPostUrlTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerPostUrlTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerPostUrlTest page error: " + err);
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
      console.info("WebViewControllerPostUrlTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLE_RPOSTURL_0100
    * @tc.name       : testWebViewControllerPostUrl001
    * @tc.desc       : test postUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerPostUrl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerPostUrl001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebViewControllerPostUrl001", 'http://www.example.com/', 4001, done);
      sendEventByKey('WebViewControllerPostUrlTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLE_RPOSTURL_0200
    * @tc.name       : testWebViewControllerPostUrl002
    * @tc.desc       : test postUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerPostUrl002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerPostUrl002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebViewControllerPostUrl002", 'resource://rawfile/second.html', 4002, done);
      sendEventByKey('WebViewControllerPostUrlTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLE_RPOSTURL_0300
    * @tc.name       : testWebViewControllerPostUrl003
    * @tc.desc       : test postUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerPostUrl003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerPostUrl003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebViewControllerPostUrl003", 'file:///data/storage/el2/base/files/index.html', 4003, done);
      sendEventByKey('WebViewControllerPostUrlTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLE_RPOSTURL_0400
    * @tc.name       : testWebViewControllerPostUrl004
    * @tc.desc       : test postUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerPostUrl004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerPostUrl004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebViewControllerPostUrl004", 'http://www.example.com/', 4004, done);
      sendEventByKey('WebViewControllerPostUrlTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLE_RPOSTURL_0500
    * @tc.name       : testWebViewControllerPostUrl005
    * @tc.desc       : test postUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerPostUrl005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerPostUrl005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebViewControllerPostUrl005", 'resource://rawfile/second.html', 4005, done);
      sendEventByKey('WebViewControllerPostUrlTestButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLE_RPOSTURL_0600
    * @tc.name       : testWebViewControllerPostUrl006
    * @tc.desc       : test postUrl
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerPostUrl006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerPostUrl006", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testWebViewControllerPostUrl006", 'file:///data/storage/el2/base/files/index.html', 4006, done);
      sendEventByKey('WebViewControllerPostUrlTestButton', 10, '');
    })

  })
}
