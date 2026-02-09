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

const EVENT_ID_SET_SUITE_KEY = 183121;
const driver = Driver.create();

export default function WebViewGetAcceptType() {

  describe('WebViewGetAcceptTypeTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewGetAcceptType',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewGetAcceptType state success " + JSON.stringify(pages));
        if (!("WebViewGetAcceptType" == pages.name)) {
          console.info("get WebViewGetAcceptType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewGetAcceptType page success " + JSON.stringify(result));
          await driver.waitForComponent(ON.id("WebViewGetAcceptTypeButton"), 10000)
        }
      } catch (err) {
        console.error("push WebViewGetAcceptType page error: " + err);
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
     * @tc.name   testWebViewGetAcceptType01
     * @tc.number SUB_WEB_WEBVIEWGETACCEPTTYPE_0100
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewGetAcceptType01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewGetAcceptType01", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebViewGetAcceptType01", true, 20251118, done);
      await Utils.waitAndClickComponent(driver, "WebViewGetAcceptTypeButton","testWebViewGetAcceptType01");
    })

    /**
     * @tc.name   testWebViewGetAcceptType02
     * @tc.number SUB_WEB_WEBVIEWGETACCEPTTYPE_0200
     * @tc.desc   test onShowFileSelector
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebViewGetAcceptType02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewGetAcceptType02", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebViewGetAcceptType02", true, 20251119, done);
      await Utils.waitAndClickComponent(driver, "WebViewGetAcceptTypeButton","testWebViewGetAcceptType02");
    })

  })
}
