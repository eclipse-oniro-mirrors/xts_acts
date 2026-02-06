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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponents } from './WaitTest.test';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = ""

export default function webMediaPlayGestureAccess() {
  describe('WebMediaPlayGestureAccessTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebMediaPlayGestureAccess',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebMediaPlayGestureAccess state success " + JSON.stringify(pages));
        if (!("WebMediaPlayGestureAccess" == pages.name)) {
          console.info("get WebMediaPlayGestureAccess state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebMediaPlayGestureAccess page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebMediaPlayGestureAccess page error: " + err);
      }
      await waitForComponents('WebMediaPlayGestureAccessTestButton');
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
      console.info("WebMediaPlayGestureAccessTest afterEach start");
      console.info("WebMediaPlayGestureAccessTest afterEach end");
      done();
    })

    /*
    * @tc.number      : SUB_WEB_MEDIAPLAYGESTUREACCESS_0100
    * @tc.name        : testMediaPlayGestureAccess001
    * @tc.desc        : test mediaPlayGestureAccess true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testMediaPlayGestureAccess001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      emitKey = "emitMediaPlayGestureAccessTrue"
      Utils.emitEvent(emitKey, 300710)
      Utils.registerBaseEvent("testMediaPlayGestureAccess001", "false_", 300720, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver,'WebMediaPlayGestureAccessTestButton')
    })

    /*
    * @tc.number      : SUB_WEB_MEDIAPLAYGESTUREACCESS_0200
    * @tc.name        : testMediaPlayGestureAccess002
    * @tc.desc        : test mediaPlayGestureAccess false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testMediaPlayGestureAccess002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      emitKey = "emitMediaPlayGestureAccessFalsePlay";
      Utils.emitEvent(emitKey, 300710)
      Utils.registerBaseEvent("testMediaPlayGestureAccess002", "true_true_", 300730, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver,'WebMediaPlayGestureAccessTestButton')
    })

    /*
    * @tc.number      : SUB_WEB_MEDIAPLAYGESTUREACCESS_0300
    * @tc.name        : testMediaPlayGestureAccess003
    * @tc.desc        : test mediaPlayGestureAccess false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 2
    */
    it('testMediaPlayGestureAccess003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      emitKey = "emitMediaPlayGestureAccessFalsePause";
      Utils.emitEvent(emitKey, 300710)
      Utils.registerBaseEvent("testMediaPlayGestureAccess003", "true_false_false_", 300740, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      await Utils.waitAndClickComponent(driver,'WebMediaPlayGestureAccessTestButton')
    })
  })
}