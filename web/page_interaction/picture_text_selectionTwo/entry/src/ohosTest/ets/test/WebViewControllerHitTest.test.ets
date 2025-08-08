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

import { afterEach, beforeAll, beforeEach, describe, it } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import webView from '@ohos.web.webview';

export default function webViewControllerHitTest() {

  describe('WebViewControllerHitTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerHitTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerHitTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerHitTest" == pages.name)) {
          console.info("get WebViewControllerHitTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push WebViewControllerHitTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewControllerHitTest page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      await Utils.sleep(2000);
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewControllerHitTest afterEach start");
      await Utils.sleep(1000);
      console.info("WebViewControllerHitTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0100
    * @tc.name        : testGetHitTestValue001
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.EditText
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue001', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue001", webView.WebHitTestType.EditText, 70101, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0200
    * @tc.name        : testGetHitTestValue002
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.Email
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue002', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue002", webView.WebHitTestType.Email, 70103, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0300
    * @tc.name        : testGetHitTestValue003
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.HttpAnchor
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue003', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue003", webView.WebHitTestType.HttpAnchor, 70105, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0400
    * @tc.name        : testGetHitTestValue004
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.HttpAnchorImg
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue004', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue004", webView.WebHitTestType.HttpAnchorImg, 70107, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0500
    * @tc.name        : testGetHitTestValue005
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.Img
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue005', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue005", webView.WebHitTestType.Img, 70109, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0700
    * @tc.name        : testGetHitTestValue007
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.Phone
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue007', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue007", webView.WebHitTestType.Phone, 70113, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0800
    * @tc.name        : testGetHitTestValue008
    * @tc.desc        : test HitTestValue.type is webView.WebHitTestType.Unknown
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue008', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue008", webView.WebHitTestType.Unknown, 70115, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_0900
    * @tc.name        : testGetHitTestValue009
    * @tc.desc        : test HitTestValue.value is url of Email
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue009', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue009", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue009", '123@123.com', 70117, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_1000
    * @tc.name        : testGetHitTestValue010
    * @tc.desc        : test HitTestValue.value is url of HttpAnchor
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue010', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue010", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue010", 'https://openharmony.cn/', 70119, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_1100
    * @tc.name        : testGetHitTestValue011
    * @tc.desc        : test HitTestValue.value is url of HttpAnchorImg
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue011', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue011", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue011", 'resource://rawfile/icon.png', 70121, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_1200
    * @tc.name        : testGetHitTestValue012
    * @tc.desc        : test HitTestValue.value is url of Img
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue012', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue012", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue012", 'resource://rawfile/icon.png', 70123, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTESTVALUE_1300
    * @tc.name        : testGetHitTestValue013
    * @tc.desc        : test HitTestValue.value is url of phone
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTestValue013', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTestValue013", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTestValue013", '123456789', 70125, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0100
    * @tc.name        : testGetHitTest001
    * @tc.desc        : test getHitTest return webView.WebHitTestType.EditText
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest001', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest001", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest001", webView.WebHitTestType.EditText, 70127, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0200
    * @tc.name        : testGetHitTest002
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Email
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest002', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest002", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest002", webView.WebHitTestType.Email, 70129, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0300
    * @tc.name        : testGetHitTest003
    * @tc.desc        : test getHitTest return webView.WebHitTestType.HttpAnchor
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest003', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest003", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest003", webView.WebHitTestType.HttpAnchor, 70131, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0400
    * @tc.name        : testGetHitTest004
    * @tc.desc        : test getHitTest return webView.WebHitTestType.HttpAnchorImg
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest004', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest004", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest004", webView.WebHitTestType.HttpAnchorImg, 70133, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0500
    * @tc.name        : testGetHitTest005
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Img
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest005', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest005", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest005", webView.WebHitTestType.Img, 70135, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0700
    * @tc.name        : testGetHitTest007
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Phone
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest007', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest007", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest007", webView.WebHitTestType.Phone, 70139, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })

    /*
    * @tc.number      : SUB_WEB_GETHITTEST_0800
    * @tc.name        : testGetHitTest008
    * @tc.desc        : test getHitTest return webView.WebHitTestType.Unknown
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testGetHitTest008', 0, async (done: Function) => {
      Utils.emitEvent("emitGetHitTest008", 10)
      await Utils.sleep(2000);
      Utils.registerEvent("testGetHitTest008", webView.WebHitTestType.Unknown, 70141, done);
      sendEventByKey('WebViewControllerHitTestButton', 10, '');
    })
  })
}
