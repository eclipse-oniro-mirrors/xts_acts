/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
const driver = Driver.create();
export default function WebViewOnWindowNewExtTest() {

  describe('WebViewOnWindowNewExtTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewOnWindowNewExt',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewOnWindowNewExt state success " + JSON.stringify(pages));
        if (!("WebViewOnWindowNewExt" == pages.name)) {
          console.info("get WebViewOnWindowNewExt state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewOnWindowNewExt page success " + JSON.stringify(result));
          let driver: Driver = Driver.create();
          await driver.waitForComponent(ON.id("WebViewOnWindowNewExtButton"),10000);
        }
      } catch (err) {
        console.error("push WebViewOnWindowNewExt page error: " + err);
      }


      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewOnWindowNewExt beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewOnWindowNewExt afterEach start");
      console.info("WebViewOnWindowNewExt afterEach end");
      done();
    })

    /**
     * @tc.number     SUB_WEB_WINDOWPANE_0100
     * @tc.name       testWebViewOnWindowNewExt001
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewOnWindowNewExt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewOnWindowNewExt001', 101009)
      Utils.registerEvent('testWebViewOnWindowNewExt001', true, 20260118, done);
      await Utils.waitAndClickComponent(driver, "WebViewOnWindowNewExtButton","testWebViewOnWindowNewExt001");
    })
    /**
     * @tc.number     SUB_WEB_WINDOWPANE_0200
     * @tc.name       testWebViewOnWindowNewExt002
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewOnWindowNewExt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewOnWindowNewExt002', 101009)
      Utils.registerEvent('testWebViewOnWindowNewExt002', false, 20260119, done);
      await Utils.waitAndClickComponent(driver, "WebViewOnWindowNewExtButton","testWebViewOnWindowNewExt002");
    })

    /**
     * @tc.number     SUB_WEB_WINDOWPANE_0300
     * @tc.name       testWebViewOnWindowNewExt003
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewOnWindowNewExt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewOnWindowNewExt003', 101009)
      Utils.registerEvent('testWebViewOnWindowNewExt003', true, 20260120, done);
      await Utils.waitAndClickComponent(driver, "WebViewOnWindowNewExtButton","testWebViewOnWindowNewExt003");
    })

    /**
     * @tc.number     SUB_WEB_WINDOWPANE_0400
     * @tc.name       testWebViewOnWindowNewExt004
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewOnWindowNewExt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewOnWindowNewExt004', 101009)
      Utils.registerEvent('testWebViewOnWindowNewExt004', 'https://www.baidu.com/', 20260121, done);
      await Utils.waitAndClickComponent(driver, "WebViewOnWindowNewExtButton","testWebViewOnWindowNewExt004");
    })

    /**
     * @tc.number     SUB_WEB_WINDOWPANE_0500
     * @tc.name       testWebViewOnWindowNewExt005
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewOnWindowNewExt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewOnWindowNewExt005', 101009)
      Utils.registerEvent('testWebViewOnWindowNewExt005', 2, 20260122, done);
      await Utils.waitAndClickComponent(driver, "WebViewOnWindowNewExtButton","testWebViewOnWindowNewExt005");
    })

  })
}
