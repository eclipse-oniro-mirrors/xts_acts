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

export default function WebViewRequestPasswordAutoFill() {
  describe('WebViewRequestPasswordAutoFillTest', () => {

    beforeAll(async () => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewRequestPasswordAutoFill',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewRequestPasswordAutoFill state success " + JSON.stringify(pages));
        if (!("WebViewRequestPasswordAutoFill" == pages.name)) {
          console.info("get WebViewRequestPasswordAutoFill state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewRequestPasswordAutoFill page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewRequestPasswordAutoFill page error: " + err);
      }
      await driver.waitForComponent(ON.id("RequestPasswordAutoFillButton"),10000);
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
     * @tc.name   testRequestPasswordAutoFill01
     * @tc.number SUB_WEB_REQUESTPASSWORDAUTOFILL_0100
     * @tc.desc   requestPasswordAutoFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL0
     */
    it('testRequestPasswordAutoFill01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitRequestPasswordAutoFill01", EVENT_ID_SET_SUITE_KEY)
      Utils.registerBaseEvent("testRequestPasswordAutoFill01", 'requestPasswordAutoFill',
        20260111, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'RequestPasswordAutoFillButton', 'emitRequestPasswordAutoFill01');
    })

    /**
     * @tc.name   testRequestPasswordAutoFill02
     * @tc.number SUB_WEB_REQUESTPASSWORDAUTOFILL_0200
     * @tc.desc   requestPasswordAutoFill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testRequestPasswordAutoFill02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitRequestPasswordAutoFill02", EVENT_ID_SET_SUITE_KEY)
      Utils.registerBaseEvent("testRequestPasswordAutoFill02", 'autofill',
        20260112, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'RequestPasswordAutoFillButton', 'emitRequestPasswordAutoFill02');
    })



  })
}
