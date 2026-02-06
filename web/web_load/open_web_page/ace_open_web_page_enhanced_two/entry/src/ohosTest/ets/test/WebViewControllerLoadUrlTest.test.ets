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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201110;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerLoadUrlTest() {

  describe('WebViewControllerLoadUrlTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerLoadUrlTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerLoadUrlTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerLoadUrlTest" == pages.name)) {
          console.info("get WebViewControllerLoadUrlTest state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebViewControllerLoadUrlTest page success");
        }
      } catch (err) {
        console.error("push WebViewControllerLoadUrlTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewControllerLoadUrlTestButton"), 10000);
      console.log("waitForComponent WebViewControllerLoadUrlTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewControllerLoadUrlTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0500
    * @tc.name       : testLoadUrl005
    * @tc.desc       : test loadUrl with headers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('testLoadUrl005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("testLoadUrl005", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl005", "second", 201120, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerLoadUrlTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testLoadUrl005' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0600
    * @tc.name       : testLoadUrl006
    * @tc.desc       : test loadUrl with headers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl006", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl006", "Example Domain", 201130, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerLoadUrlTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testLoadUrl006' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0700
    * @tc.name       : testLoadUrl007
    * @tc.desc       : test loadUrl with headers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl007", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl007", "second", 201140, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerLoadUrlTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testLoadUrl007' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_LOADURL_0800
    * @tc.name       : testLoadUrl008
    * @tc.desc       : test loadUrl with headers
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testLoadUrl008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testLoadUrl008", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testLoadUrl008", "second", 201150, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerLoadUrlTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testLoadUrl008' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}