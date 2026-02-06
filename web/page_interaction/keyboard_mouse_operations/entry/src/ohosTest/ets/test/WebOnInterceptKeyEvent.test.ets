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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 175201;
const driver = Driver.create();

export default function webOnInterceptKeyEvent() {
  describe('WebOnInterceptKeyEventTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnInterceptKeyEvent',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnInterceptKeyEvent state success " + JSON.stringify(pages));
        if (!("WebOnInterceptKeyEvent" == pages.name)) {
          console.info("get WebOnInterceptKeyEvent state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebOnInterceptKeyEventTestButton"), 10000);
          console.info("push WebOnInterceptKeyEvent page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnInterceptKeyEvent page error: " + err);
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
      done();
    })

    /*
    * @tc.number      : SUB_WEB_ONINTERCEPTKEYEVENT_0200
    * @tc.name        : testOnInterceptKeyEvent002
    * @tc.desc        : test onInterceptKeyEvent when return true
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnInterceptKeyEvent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptKeyEvent002", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("emitOnInterceptKeyEvent002", 2047, 175210, done);
      Utils.waitAndClickComponent(driver, "WebOnInterceptKeyEventTestButton");
    })

    /*
    * @tc.number      : SUB_WEB_ONINTERCEPTKEYEVENT_0300
    * @tc.name        : testOnInterceptKeyEvent003
    * @tc.desc        : test onInterceptKeyEvent when return false
    * @tc.size        : MediumTest
    * @tc.type        : Function
    * @tc.level       : Level 1
    */
    it('testOnInterceptKeyEvent003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnInterceptKeyEvent003", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testOnInterceptKeyEvent003", 2047, 175220, done);
      Utils.waitAndClickComponent(driver, "WebOnInterceptKeyEventTestButton");
    })
  })
}