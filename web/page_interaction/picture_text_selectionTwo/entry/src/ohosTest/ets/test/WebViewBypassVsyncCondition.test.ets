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
import Utils from './Utils';
import { Driver, ON, MouseButton } from '@ohos.UiTest';
import { accessibility, config } from '@kit.AccessibilityKit';
import events_emitter from '@ohos.events.emitter';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 183001;
const driver = Driver.create();

export default function WebViewBypassVsyncCondition() {

  describe('WebViewWebViewBypassVsyncConditionTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewBypassVsyncCondition',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewBypassVsyncCondition state success " + JSON.stringify(pages));
        if (!("WebViewBypassVsyncCondition" == pages.name)) {
          console.info("get WebViewBypassVsyncCondition state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewBypassVsyncCondition page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewBypassVsyncCondition page error: " + err);
      }
      await driver.waitForComponent(ON.id("BypassVsyncConditionButton"),10000);
      done()
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
      console.info("WebViewBypassVsyncCondition afterEach start");
      console.info("WebViewBypassVsyncCondition afterEach end");
      done();
    })


    /*
    * @tc.number     : SUB_WEB_BYPASSVSYNCCONDITION_0100
    * @tc.name       : emitBypassVsyncCondition01
    * @tc.desc       : emitBypassVsyncCondition01
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 0
    */
    it('emitBypassVsyncCondition01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitBypassVsyncCondition01", EVENT_ID_SET_SUITE_KEY)
      Utils.registerBaseEvent("emitBypassVsyncCondition01", WebBypassVsyncCondition.SCROLLBY_FROM_ZERO_OFFSET, 
        183010, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'BypassVsyncConditionButton', 'emitBypassVsyncCondition01');
    })

    /*
    * @tc.number     : SUB_WEB_BYPASSVSYNCCONDITION_0200
    * @tc.name       : emitBypassVsyncCondition02
    * @tc.desc       : emitBypassVsyncCondition02
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitBypassVsyncCondition02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitBypassVsyncCondition02", EVENT_ID_SET_SUITE_KEY)
      Utils.registerBaseEvent("emitBypassVsyncCondition02", WebBypassVsyncCondition.NONE, 
        183020, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver, 'BypassVsyncConditionButton', 'emitBypassVsyncCondition02');
    })



  })
}
