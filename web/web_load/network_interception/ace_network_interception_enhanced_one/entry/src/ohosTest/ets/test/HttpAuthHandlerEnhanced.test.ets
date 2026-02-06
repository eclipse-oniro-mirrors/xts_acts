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

import { beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { waitForComponent } from './WaitTest.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

export default function httpAuthHandlerEnhanced() {

  describe('HttpAuthHandlerEnhancedTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/httpAuthHandlerEnhanced',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get httpAuthHandlerEnhanced state success " + JSON.stringify(pages));
        if (!("httpAuthHandlerEnhanced" == pages.name)) {
          console.info("get httpAuthHandlerEnhanced state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push httpAuthHandlerEnhanced page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push httpAuthHandlerEnhanced page error: " + err);
      }
      await waitForComponent("HttpAuthHandlerEnhancedButton");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("httpAuthHandlerEnhanced beforeEach start");
      done();
    })

    /**
    * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONFIRM_FALSE_0100
    * @tc.name   testHttpAuthHandlerConfirmFalse
    * @tc.desc   test HttpAuthHandler confirm false
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  Level 0
    */
    it('testHttpAuthHandlerConfirmFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent("emitHttpAuthHandlerConfirmFalse", 121)
      Utils.registerBaseEvent("testHttpAuthHandlerConfirmFalse", false, 2025102107,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('HttpAuthHandlerEnhancedButton', 10, '');
    })



  })
}
