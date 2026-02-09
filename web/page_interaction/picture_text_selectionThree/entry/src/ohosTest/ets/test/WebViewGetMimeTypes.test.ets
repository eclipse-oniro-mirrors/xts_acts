/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { waitForExist} from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 183119;
const driver = Driver.create();

export default function WebViewGetMimeTypes() {

  describe('WebViewGetMimeTypesTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewGetMimeTypes',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewGetMimeTypes state success " + JSON.stringify(pages));
        if (!("WebViewGetMimeTypes" == pages.name)) {
          console.info("get WebViewGetMimeTypes state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewGetMimeTypes page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("WebViewGetMimeTypesButton"), 10000)
        }
      } catch (err) {
        console.error("push WebViewGetMimeTypes page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewController beforeEach start");
      done();
    })


    /**
     * @tc.name   testWebViewGetMimeTypes01
     * @tc.number SUB_WEB_WEBVIEWGETMIMETYPES_0100
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewGetMimeTypes01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewGetMimeTypes01", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebViewGetMimeTypes01", true, 20251111, done);
      await Utils.waitAndClickComponent(driver, "WebViewGetMimeTypesButton","testWebViewGetMimeTypes01");
    })

    /**
     * @tc.name   testWebViewGetMimeTypes02
     * @tc.number SUB_WEB_WEBVIEWGETMIMETYPES_0200
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewGetMimeTypes02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewGetMimeTypes02", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebViewGetMimeTypes02", true, 20251112, done);
      await Utils.waitAndClickComponent(driver, "WebViewGetMimeTypesButton","testWebViewGetMimeTypes02");
    })

  })
}
