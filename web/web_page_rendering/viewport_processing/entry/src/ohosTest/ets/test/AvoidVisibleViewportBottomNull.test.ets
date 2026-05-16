/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { beforeAll, afterEach, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { waitForComponent, waitAndClickComponent } from './WaitTest.test';

const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const EVENT_ID_SET_SUITE_KEY = 153948;
const EVENT_ID_RESULT = 153941;

let emitKey = "";

export default function AvoidVisibleViewportBottomNullTest() {
  describe('AvoidVisibleViewportBottomNullTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/AvoidVisibleViewportBottomNull',
      }
      try {
        await Utils.sleep(1000);
        router.clear();
        let pages = router.getState();
        console.info("get AvoidVisibleViewportBottomNull state success " + JSON.stringify(pages));
        if (!("AvoidVisibleViewportBottomNull" == pages.name)) {
          console.info("get AvoidVisibleViewportBottomNull state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push AvoidVisibleViewportBottomNull page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AvoidVisibleViewportBottomNull page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      try {
        await driver.waitForComponent(ON.id("avoidVisibleViewportBottomNullClick"), 10000);
      } catch (e) {
        const error = e as BusinessError;
        console.error(`${emitKey} ErrorCode: ${error.code},  Message: ${error.message}`);
      }
      done();
    })

    afterEach(async (done: Function) => {
      console.info("web afterEach start:" + emitKey);
      try {
        let backData: events_emitter.EventData = {
          data: {
            "ACTION": emitKey
          }
        };
        let backEvent: events_emitter.InnerEvent = {
          eventId: EVENT_ID_SET_SUITE_KEY,
          priority: events_emitter.EventPriority.LOW
        };
        console.info("start send emitKey");
        events_emitter.emit(backEvent, backData);
      } catch (err) {
        console.info("emit emitKey  err: " + JSON.stringify(err));
      }
      done();
    })

    /**
     * @tc.name   testAvoidVisibleViewportBottomNull001
     * @tc.number SUB_WEB_WEBVIEW_CONTROLLER_AVOID_VISIBLE_VIEWPORT_BOTTOM_NULL_001
     * @tc.desc   Test avoidVisibleViewportBottom with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAvoidVisibleViewportBottomNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testAvoidVisibleViewportBottomNull001';
      let tcName = 'testAvoidVisibleViewportBottomNull001';
      let isReturn = false;
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent(tcName, "error", EVENT_ID_RESULT, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "avoidVisibleViewportBottomNullClick", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    });
  })
}
