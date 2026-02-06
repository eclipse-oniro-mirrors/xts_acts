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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 201030;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webViewControllerSetConnectionTimeoutTest() {

  describe('WebViewControllerSetConnectionTimeoutTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewControllerSetConnectionTimeoutTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewControllerSetConnectionTimeoutTest state success " + JSON.stringify(pages));
        if (!("WebViewControllerSetConnectionTimeoutTest" == pages.name)) {
          console.info("get WebViewControllerSetConnectionTimeoutTest state success " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          console.info("push WebViewControllerSetConnectionTimeoutTest page success");
        }
      } catch (err) {
        console.error("push WebViewControllerSetConnectionTimeoutTest page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewControllerSetConnectionTimeoutTestButton"), 10000);
      console.log("waitForComponent WebViewControllerSetConnectionTimeoutTestButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebViewControllerSetConnectionTimeoutTest beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETCONNECTIONTIMEOUT_0100
    * @tc.name       : testWebViewControllerSetConnectionTimeout001
    * @tc.desc       : test setConnectionTimeout
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerSetConnectionTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerSetConnectionTimeout001", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewControllerSetConnectionTimeout001", "ERR_TIMED_OUT", 201040, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerSetConnectionTimeoutTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testWebViewControllerSetConnectionTimeout001' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETCONNECTIONTIMEOUT_0200
    * @tc.name       : testWebViewControllerSetConnectionTimeout002
    * @tc.desc       : test setConnectionTimeout
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerSetConnectionTimeout002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerSetConnectionTimeout002", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewControllerSetConnectionTimeout002", "ERR_TIMED_OUT", 201050, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerSetConnectionTimeoutTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testWebViewControllerSetConnectionTimeout002' + '_returnCheck', true, 1000)) {
        done();
      }
    })

    /*
    * @tc.number     : SUB_WEB_WEBVIEWCONTROLLER_SETCONNECTIONTIMEOUT_0300
    * @tc.name       : testWebViewControllerSetConnectionTimeout003
    * @tc.desc       : test setConnectionTimeout
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testWebViewControllerSetConnectionTimeout003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("testWebViewControllerSetConnectionTimeout003", EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testWebViewControllerSetConnectionTimeout003", "ERR_TIMED_OUT", 201060, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerSetConnectionTimeoutTestButton");
      if (await Utils.waitForExist(() => isReturn, 'testWebViewControllerSetConnectionTimeout003' + '_returnCheck', true, 1000)) {
        done();
      }
    })
  })
}