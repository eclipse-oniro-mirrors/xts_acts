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
const driver = Driver.create();
export default function WebViewNavigationPolicyTest() {

  describe('WebViewNavigationPolicyTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewNavigationPolicy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewNavigationPolicy state success " + JSON.stringify(pages));
        if (!("WebViewNavigationPolicy" == pages.name)) {
          console.info("get WebViewNavigationPolicy state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewNavigationPolicy page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewNavigationPolicy page error: " + err);
      }
      let driver: Driver = Driver.create();
      await driver.waitForComponent(ON.id("WebViewNavigationPolicyButton"),10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewNavigationPolicy beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewNavigationPolicy afterEach start");
      console.info("WebViewNavigationPolicy afterEach end");
      done();
    })

    /**
     * @tc.number     SUB_WEB_NAVIGATIONAL_0100
     * @tc.name       testWebViewNavigationPolicy001
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewNavigationPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewNavigationPolicy001', 101008)
      Utils.registerEvent('testWebViewNavigationPolicy001', NavigationPolicy.NEW_POPUP, 20260113, done);
      await Utils.waitAndClickComponent(driver, "WebViewNavigationPolicyButton","testWebViewNavigationPolicy001");
    })
    /**
     * @tc.number     SUB_WEB_NAVIGATIONAL_0200
     * @tc.name       testWebViewNavigationPolicy002
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewNavigationPolicy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewNavigationPolicy002', 101008)
      Utils.registerEvent('testWebViewNavigationPolicy002', NavigationPolicy.NEW_WINDOW, 20260114, done);
      await Utils.waitAndClickComponent(driver, "WebViewNavigationPolicyButton","testWebViewNavigationPolicy002");
    })
    /**
     * @tc.number     SUB_WEB_NAVIGATIONAL_0300
     * @tc.name       testWebViewNavigationPolicy003
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewNavigationPolicy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewNavigationPolicy003', 101008)
      Utils.registerEvent('testWebViewNavigationPolicy003', NavigationPolicy.NEW_BACKGROUND_TAB, 20260115, done);
      await Utils.waitAndClickComponent(driver, "WebViewNavigationPolicyButton","testWebViewNavigationPolicy003");
    })

    /**
     * @tc.number     SUB_WEB_NAVIGATIONAL_0400
     * @tc.name       testWebViewNavigationPolicy004
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewNavigationPolicy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewNavigationPolicy004', 101008)
      Utils.registerEvent('testWebViewNavigationPolicy004', NavigationPolicy.NEW_BACKGROUND_TAB, 20260116, done);
      await Utils.waitAndClickComponent(driver, "WebViewNavigationPolicyButton","testWebViewNavigationPolicy004");
    })
    /**
     * @tc.number     SUB_WEB_NAVIGATIONAL_0500
     * @tc.name       testWebViewNavigationPolicy005
     * @tc.desc       navigationPolicy
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewNavigationPolicy005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewNavigationPolicy005', 101008)
      Utils.registerEvent('testWebViewNavigationPolicy005', NavigationPolicy.NEW_FOREGROUND_TAB, 20260117, done);
      await Utils.waitAndClickComponent(driver, "WebViewNavigationPolicyButton","testWebViewNavigationPolicy005");
    })
  })
}
