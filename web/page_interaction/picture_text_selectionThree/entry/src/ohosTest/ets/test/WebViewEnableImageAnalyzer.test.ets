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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
import events_emitter from '@ohos.events.emitter';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 183004;
const driver = Driver.create();

export default function WebViewEnableImageAnalyzerCase() {
  describe('WebViewEnableImageAnalyzerTest', () => {

    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewEnableImageAnalyzer',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewEnableImageAnalyzer state success " + JSON.stringify(pages));
        if (!("WebViewEnableImageAnalyzer" == pages.name)) {
          console.info("get WebViewEnableImageAnalyzer state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewEnableImageAnalyzer page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewEnableImageAnalyzer page error: " + err);
      }
      await driver.waitForComponent(ON.id("EnableImageAnalyzerButton"),10000);
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebViewRequestPasswordAutoFill afterEach start");
      console.info("WebViewRequestPasswordAutoFill afterEach end");
      done();
    })


    /**
     * @tc.name   testEnableImageAnalyzer01
     * @tc.number SUB_WEB_ENABLEIMAGEANALYZER_0100
     * @tc.desc   enableImageAnalyzer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testEnableImageAnalyzer01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitEnableImageAnalyzer01", EVENT_ID_SET_SUITE_KEY)
      Utils.registerBaseEvent("testEnableImageAnalyzer01", true,
        20230121, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'EnableImageAnalyzerButton', 'emitEnableImageAnalyzer01');
    })

    /**
     * @tc.name   testEnableImageAnalyzer02
     * @tc.number SUB_WEB_ENABLEIMAGEANALYZER_0200
     * @tc.desc   enableImageAnalyzer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testEnableImageAnalyzer02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitEnableImageAnalyzer02", EVENT_ID_SET_SUITE_KEY)
      Utils.registerBaseEvent("testEnableImageAnalyzer02", false,
        20230122, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'EnableImageAnalyzerButton', 'emitEnableImageAnalyzer02');
    })



  })
}
