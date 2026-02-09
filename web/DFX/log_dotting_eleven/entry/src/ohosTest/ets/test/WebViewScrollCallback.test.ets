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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import webview from '@ohos.web.webview';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@ohos.UiTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function WebViewScrollCallbackTest() {

  describe('WebViewScrollCallbackTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewScrollCallback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewScrollCallback state success " + JSON.stringify(pages));
        if (!("WebViewScrollCallback" == pages.name)) {
          console.info("get WebViewScrollCallback state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewScrollCallback page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewScrollCallback page error: " + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("WebViewScrollCallbackButton"),10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewScrollCallback beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewScrollCallback afterEach start");
      console.info("WebViewScrollCallback afterEach end");
      done();
    })

    /**
    * @tc.number     SUB_WEB_SCROLLCALLBACK_0100
    * @tc.name       testWebViewScrollCallback001
    * @tc.desc       ScrollCallback
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testWebViewScrollCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewScrollCallback001', 10)
      Utils.registerEvent('testWebViewScrollCallback001', true, 20251222, done);
      sendEventByKey('WebViewScrollCallbackButton', 10, '');
    })
    /**
     * @tc.number     SUB_WEB_SCROLLCALLBACK_0200
     * @tc.name       testWebViewScrollCallback002
     * @tc.desc       ScrollCallback
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewScrollCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewScrollCallback002', 10)
      Utils.registerEvent('testWebViewScrollCallback002', true, 20251223, done);
      sendEventByKey('WebViewScrollCallbackButton', 10, '');
    })
    /**
     * @tc.number     SUB_WEB_REGISTERSCROLLCALLBACK_0300
     * @tc.name       testWebViewNativeWebInitFalse003
     * @tc.desc       OH_ArkWeb_RegisterScrollCallback
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewNativeWebInitFalse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewNativeWebInitFalse003', 10)
      Utils.registerEvent('testWebViewNativeWebInitFalse003', false, 20251227, done);
      sendEventByKey('WebViewScrollCallbackButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_REGISTERSCROLLCALLBACK_0400
     * @tc.name       testWebViewNativeWebInitTrue004
     * @tc.desc       OH_ArkWeb_RegisterScrollCallback
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewNativeWebInitTrue004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewNativeWebInitTrue004', 10)
      Utils.registerEvent('testWebViewNativeWebInitTrue004', true, 20251228, done);
      sendEventByKey('WebViewScrollCallbackButton', 10, '');
    })

  })
}
