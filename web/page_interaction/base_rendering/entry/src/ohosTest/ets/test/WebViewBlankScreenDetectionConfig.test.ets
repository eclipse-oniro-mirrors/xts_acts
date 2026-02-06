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

const EVENT_ID_SET_SUITE_KEY = 183117;
const driver = Driver.create();

export default function WebViewBlankScreenDetectionConfigSuite() {

  describe('WebViewBlankScreenDetectionConfigTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewBlankScreenDetectionConfig',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewBlankScreenDetectionConfig state success " + JSON.stringify(pages));
        if (!("WebViewBlankScreenDetectionConfig" == pages.name)) {
          console.info("get WebViewBlankScreenDetectionConfig state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewBlankScreenDetectionConfig page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewBlankScreenDetectionConfig page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebViewBlankScreenDetectionConfigButton"), 10000)
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
    * @tc.number     SUB_WEB_ONDETECTEDBLANKSCREEN_0100
    * @tc.name       testWebViewBlankScreenDetectionConfig
    * @tc.desc       DetectedBlankScreenReason
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testWebViewBlankScreenDetectionConfig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewBlankScreenDetectionConfig", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testWebViewBlankScreenDetectionConfig", 'onDetectedBlankScreen', 20251110, done);
      await Utils.waitAndClickComponent(driver, "WebViewBlankScreenDetectionConfigButton","testWebViewBlankScreenDetectionConfig");
    })

    /** 
    * @tc.number     SUB_WEB_ONDETECTEDBLANKSCREEN_0200
    * @tc.name       testDetectedBlankScreenReason01
    * @tc.desc       DetectedBlankScreenReason
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testDetectedBlankScreenReason01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDetectedBlankScreenReason01", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testDetectedBlankScreenReason01", true, 20251207, done);
      await Utils.waitAndClickComponent(driver, "WebViewBlankScreenDetectionConfigButton","testDetectedBlankScreenReason01");
    })

    /** 
    * @tc.number     SUB_WEB_ONDETECTEDBLANKSCREEN_0300
    * @tc.name       testDetectedBlankScreenReason02
    * @tc.desc       DetectedBlankScreenReason
    * @tc.size       MediumTest
    * @tc.type       Function
    * @tc.level      Level 1
    */
    it('testDetectedBlankScreenReason02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitDetectedBlankScreenReason02", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testDetectedBlankScreenReason02", true, 20251208, done);
      await Utils.waitAndClickComponent(driver, "WebViewBlankScreenDetectionConfigButton","testDetectedBlankScreenReason02");
    })

  })
}
