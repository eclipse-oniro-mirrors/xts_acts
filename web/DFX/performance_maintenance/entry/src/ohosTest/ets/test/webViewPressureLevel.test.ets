/**
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
import { afterEach, beforeAll, beforeEach, describe, it, expect , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
// @ts-nocheck
let emitKey = ""

const EVENT_ID_SET_SUITE_KEY = 126001;
let driver = Driver.create();


export default function ActsAceWebviewPressureLevel() {
  describe('ActsAceWebviewPressureLevel', () => {

    beforeAll(async (done: Function) => {
      let options : router.RouterOptions = {
        url: 'testability/pages/webViewPressureLevel',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get webViewPressureLevel state success " + JSON.stringify(pages));
        if (!("webViewPressureLevel" == pages.name)) {
          console.info("get webViewPressureLevel state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push webViewPressureLevel state success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push webViewPressureLevel page error:" + err);
      }
      await driver.waitForComponent(ON.id("webviewPressureLevelButton"), 10000);
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      await driver.waitForComponent(ON.id("webviewPressureLevelButton"), 10000);
      done();
    })


    /**
     * @tc.name   testWebviewPressureLevelModerate
     * @tc.number SUB_ACE_WEBVIEW_PRESSURE_LEVEL_API_0001
     * @tc.desc   test testWebviewPressureLevelModerate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebviewPressureLevelModerate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = "emitWebviewPressureLevelModerate"
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testWebviewPressureLevelModerate", "success", 126010,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent(driver, "webviewPressureLevelButton");
    })


    /**
     * @tc.name   testWebviewPressureLevelCritical
     * @tc.number SUB_ACE_WEBVIEW_PRESSURE_LEVEL_API_0002
     * @tc.desc   test testWebviewPressureLevelCritical
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWebviewPressureLevelCritical', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitWebviewPressureLevelCritical"
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testWebviewPressureLevelCritical", "success", 126020,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      Utils.waitAndClickComponent(driver, "webviewPressureLevelButton");
    })
  })
}
