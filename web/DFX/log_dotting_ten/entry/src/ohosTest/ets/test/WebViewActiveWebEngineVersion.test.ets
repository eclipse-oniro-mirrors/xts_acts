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

export default function WebViewActiveWebEngineVersion() {

  describe('WebViewActiveWebEngineVersionTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewActiveWebEngineVersion',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewActiveWebEngineVersion state success " + JSON.stringify(pages));
        if (!("WebViewActiveWebEngineVersion" == pages.name)) {
          console.info("get WebViewActiveWebEngineVersion state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewActiveWebEngineVersion page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewActiveWebEngineVersion page error: " + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("WebViewActiveWebEngineVersionButton"),10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewActiveWebEngineVersion beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewActiveWebEngineVersion afterEach start");
      console.info("WebViewActiveWebEngineVersion afterEach end");
      done();
    })

    /**
    * @tc.number     SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0100
    * @tc.name       testActiveWebEngineVersion001
    * @tc.desc       WebEngineVersion
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testActiveWebEngineVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion001', 10)
      Utils.registerEvent('testActiveWebEngineVersion001', webview.ArkWebEngineVersion.M132, 20250903, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })

    /**
    * @tc.number     SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0200
    * @tc.name       testActiveWebEngineVersion002
    * @tc.desc       WebEngineVersion
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 2
    */
    it('testActiveWebEngineVersion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion002', 10)
      Utils.registerEvent('testActiveWebEngineVersion002', true, 20250904, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })

    /**
    * @tc.number     SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0300
    * @tc.name       testActiveWebEngineVersion003
    * @tc.desc       WebEngineVersion
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testActiveWebEngineVersion003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion003', 10)
      Utils.registerEvent('testActiveWebEngineVersion003', webview.ArkWebEngineVersion.M132, 20250905, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })

    /**
    * @tc.number     SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0400
    * @tc.name       testActiveWebEngineVersion004
    * @tc.desc       WebEngineVersion
    * @tc.size       MEDIUM
    * @tc.type       Function
    * @tc.level      Level 0
    */
    it('testActiveWebEngineVersion004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion004', 10)
      Utils.registerEvent('testActiveWebEngineVersion004', webview.ArkWebEngineVersion.M132, 20250940, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })

    /**
     * @tc.number     SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0500
     * @tc.name       testActiveWebEngineVersion005
     * @tc.desc       WebEngineVersion
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testActiveWebEngineVersion005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion005', 10)
      Utils.registerEvent('testActiveWebEngineVersion005', webview.ArkWebEngineVersion.M132, 20251218, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })
    /**
     * @tc.number     SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0600
     * @tc.name       testActiveWebEngineVersion006
     * @tc.desc       WebEngineVersion
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testActiveWebEngineVersion006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion006', 10)
      Utils.registerEvent('testActiveWebEngineVersion006', webview.ArkWebEngineVersion.M132, 20251219, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })
    /**
     * @tc.number     SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0700
     * @tc.name       testActiveWebEngineVersion007
     * @tc.desc       WebEngineVersion
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testActiveWebEngineVersion007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion007', 10)
      Utils.registerEvent('testActiveWebEngineVersion007', true, 20251220, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })
    /**
     * @tc.number     SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0800
     * @tc.name       testActiveWebEngineVersion008
     * @tc.desc       WebEngineVersion
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testActiveWebEngineVersion008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion008', 10)
      Utils.registerEvent('testActiveWebEngineVersion008', true, 20251221, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })

    /**
     * @tc.name   emitIsActiveWebEngineEvergreen009
     * @tc.number SUB_ACE_BASIC_ETS_ISACTIVEWEBENGINEEVERGREEN_0900
     * @tc.desc   IsActiveWebEngineEvergreen
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('emitIsActiveWebEngineEvergreen009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitIsActiveWebEngineEvergreen009', 10)
      Utils.registerEvent('emitIsActiveWebEngineEvergreen009', true, 20251226, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })

  })
}
