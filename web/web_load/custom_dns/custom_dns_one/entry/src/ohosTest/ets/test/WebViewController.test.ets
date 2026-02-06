/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
const driver = Driver.create();

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function webViewController() {

  let emitKey = ""
  const EVENT_ID_SET_EMIT_KEY = 330000;

  describe('WebViewControllerTestSuite', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewController',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewController state success " + JSON.stringify(pages));
        if (!("webViewController" == pages.name)) {
          console.info("get webViewController state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewController page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewController page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewControllerButton"), 10000);
      console.log("WebViewControllerButton");
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
    * @tc.number       SUB_WEB_SECUREDNSMODE_OFF_0100
    * @tc.name         testSecureDnsModeOFF001
    * @tc.desc         test SecureDnsMode OFF
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 1
    */
    it('testSecureDnsModeOFF001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testSecureDnsModeOFF001";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testSecureDnsModeOFF001", "Example Domain", 330010, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
    * @tc.number       SUB_WEB_SECUREDNSMODE_AUTO_0100
    * @tc.name         testSecureDnsModeAUTO001
    * @tc.desc         test SecureDnsMode AUTO
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 1
    */
    it('testSecureDnsModeAUTO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testSecureDnsModeAUTO001";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testSecureDnsModeAUTO001", "Example Domain", 330020, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })

    /**
    * @tc.number       SUB_WEB_SECUREDNSMODE_SECURE_ONLY_0100
    * @tc.name         testSecureDnsModeSECURE_ONLY001
    * @tc.desc         test SecureDnsMode SECURE_ONLY
    * @tc.size         MediumTest
    * @tc.type         Function
    * @tc.level        Level 1
    */
    it('testSecureDnsModeSECURE_ONLY001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "testSecureDnsModeSECURE_ONLY001";
      Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
      let isReturn = false;
      Utils.registerEvent("testSecureDnsModeSECURE_ONLY001", "Example Domain", 330030, () => { isReturn = true });
      await Utils.waitAndClickComponent(driver, "WebViewControllerButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 500);
      done();
    })
  })
}
