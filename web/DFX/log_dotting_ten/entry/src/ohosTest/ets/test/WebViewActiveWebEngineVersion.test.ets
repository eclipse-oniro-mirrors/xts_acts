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
          await Utils.sleep(2000);
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
      await Utils.sleep(2000);
      console.info("WebViewActiveWebEngineVersion afterEach end");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0100
    * @tc.name       : emitActiveWebEngineVersion001
    * @tc.desc       : emitActiveWebEngineVersion001
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitActiveWebEngineVersion001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion001', 10)
      Utils.registerEvent('emitActiveWebEngineVersion001', webview.ArkWebEngineVersion.M132, 20250903, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0200
    * @tc.name       : emitActiveWebEngineVersion002
    * @tc.desc       : emitActiveWebEngineVersion002
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('emitActiveWebEngineVersion002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion002', 10)
      Utils.registerEvent('emitActiveWebEngineVersion002', webview.ArkWebEngineVersion.M114, 20250904, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWACTIVEWEBENGINEVERSION_0300
    * @tc.name       : emitActiveWebEngineVersion003
    * @tc.desc       : emitActiveWebEngineVersion003
    * @tc.size       : MEDIUM
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitActiveWebEngineVersion003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitActiveWebEngineVersion003', 10)
      Utils.registerEvent('emitActiveWebEngineVersion003', webview.ArkWebEngineVersion.M132, 20250905, done);
      sendEventByKey('WebViewActiveWebEngineVersionButton', 10, '');
    })

  })
}
