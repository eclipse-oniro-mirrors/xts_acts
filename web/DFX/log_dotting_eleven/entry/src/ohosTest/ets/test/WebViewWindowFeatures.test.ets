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
export default function WebViewWindowFeaturesTest() {

  describe('WebViewWindowFeaturesTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewWindowFeatures',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewWindowFeatures state success " + JSON.stringify(pages));
        if (!("WebViewWindowFeatures" == pages.name)) {
          console.info("get WebViewWindowFeatures state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewWindowFeatures page success " + JSON.stringify(result));
          let driver: Driver = Driver.create();
          await driver.waitForComponent(ON.id("WebViewWindowFeaturesButton"),10000);
        }
      } catch (err) {
        console.error("push WebViewWindowFeatures page error: " + err);
      }


      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewWindowFeatures beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewWindowFeatures afterEach start");
      console.info("WebViewWindowFeatures afterEach end");
      done();
    })

    /**
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0100
     * @tc.name       testWebViewWindowFeatures001
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewWindowFeatures001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewWindowFeatures001', 101016)
      Utils.registerEvent('testWebViewWindowFeatures001', 600, 20260123, done);
      await Utils.waitAndClickComponent(driver, "WebViewWindowFeaturesButton","testWebViewWindowFeatures001");
    })
    /**
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0200
     * @tc.name       testWebViewWindowFeatures002
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewWindowFeatures002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewWindowFeatures002', 101016)
      Utils.registerEvent('testWebViewWindowFeatures002', 500, 20260124, done);
      await Utils.waitAndClickComponent(driver, "WebViewWindowFeaturesButton","testWebViewWindowFeatures002");
    })

    /**
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0300
     * @tc.name       testWebViewWindowFeatures003
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewWindowFeatures003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewWindowFeatures003', 101016)
      Utils.registerEvent('testWebViewWindowFeatures003', 10, 20260125, done);
      await Utils.waitAndClickComponent(driver, "WebViewWindowFeaturesButton","testWebViewWindowFeatures003");
    })

    /**
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0400
     * @tc.name       testWebViewWindowFeatures004
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewWindowFeatures004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewWindowFeatures004', 101016)
      Utils.registerEvent('testWebViewWindowFeatures004', 20, 20260126, done);
      await Utils.waitAndClickComponent(driver, "WebViewWindowFeaturesButton","testWebViewWindowFeatures004");
    })

    /**
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0500
     * @tc.name       testWebViewWindowFeatures005
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewWindowFeatures005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewWindowFeatures005', 101016)
      Utils.registerEvent('testWebViewWindowFeatures005', 0, 20260127, done);
      await Utils.waitAndClickComponent(driver, "WebViewWindowFeaturesButton","testWebViewWindowFeatures005");
    })
    /**
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0600
     * @tc.name       testWebViewWindowFeatures006
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewWindowFeatures006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewWindowFeatures006', 101016)
      Utils.registerEvent('testWebViewWindowFeatures006', 0, 20260128, done);
      await Utils.waitAndClickComponent(driver, "WebViewWindowFeaturesButton","testWebViewWindowFeatures006");
    })

    /**
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0700
     * @tc.name       testWebViewWindowFeatures007
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewWindowFeatures007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewWindowFeatures007', 101016)
      Utils.registerEvent('testWebViewWindowFeatures007', 0, 20260129, done);
      await Utils.waitAndClickComponent(driver, "WebViewWindowFeaturesButton","testWebViewWindowFeatures007");
    })
    /**
     * @tc.number     SUB_WEB_WEBVIEWWINDOWFEATURES_0800
     * @tc.name       testWebViewWindowFeatures008
     * @tc.desc       onWindowNewExt
     * @tc.size       MEDIUM
     * @tc.type       Function
     * @tc.level      Level 0
     */
    it('testWebViewWindowFeatures008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitWebViewWindowFeatures008', 101016)
      Utils.registerEvent('testWebViewWindowFeatures008', 0, 20260130, done);
      await Utils.waitAndClickComponent(driver, "WebViewWindowFeaturesButton","testWebViewWindowFeatures008");
    })
  })
}
