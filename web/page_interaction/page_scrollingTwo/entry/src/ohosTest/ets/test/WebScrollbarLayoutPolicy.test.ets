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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPABILITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 184001;
let driver = Driver.create();
let emitKey = ""
let tcName = ""

export default function WebScrollbarLayoutPolicyTest() {
  describe('WebScrollbarLayoutPolicyTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebScrollbarLayoutPolicy',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebScrollbarLayoutPolicy state success " + JSON.stringify(pages));
        if (!("WebScrollbarLayoutPolicy" == pages.name)) {
          console.info("get WebScrollbarLayoutPolicy state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("ScrollbarLayoutPolicyButton"), 10000);
          console.info("push WebScrollbarLayoutPolicy page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebScrollbarLayoutPolicy page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebScrollbarLayoutPolicy beforeEach start");
      done();
    })

    /**
     * @tc.name   testScrollbarLayoutPolicy001
     * @tc.number SUB_WEB_SCROLLLAYOUT_POLICY_0100
     * @tc.desc   scrollbarLayoutPolicy CONTENT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollbarLayoutPolicy001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollbarLayoutPolicy001';
      tcName = 'testScrollbarLayoutPolicy001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScrollbarLayoutPolicyButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollbarLayoutPolicy002
     * @tc.number SUB_WEB_SCROLLLAYOUT_POLICY_0200
     * @tc.desc   scrollbarLayoutPolicy SYSTEM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollbarLayoutPolicy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollbarLayoutPolicy002';
      tcName = 'testScrollbarLayoutPolicy002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184020, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScrollbarLayoutPolicyButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollbarLayoutPolicy003
     * @tc.number SUB_WEB_SCROLLLAYOUT_POLICY_0300
     * @tc.desc   scrollbarLayoutPolicy switch CONTENT to SYSTEM test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollbarLayoutPolicy003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollbarLayoutPolicy003';
      tcName = 'testScrollbarLayoutPolicy003'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184030, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScrollbarLayoutPolicyButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollbarLayoutPolicy004
     * @tc.number SUB_WEB_SCROLLLAYOUT_POLICY_0400
     * @tc.desc   scrollbarLayoutPolicy switch SYSTEM to CONTENT test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollbarLayoutPolicy004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollbarLayoutPolicy004';
      tcName = 'testScrollbarLayoutPolicy004'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184040, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScrollbarLayoutPolicyButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollbarLayoutPolicy005
     * @tc.number SUB_WEB_SCROLLLAYOUT_POLICY_0500
     * @tc.desc   scrollbarLayoutPolicy set CONTENT twice test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollbarLayoutPolicy005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollbarLayoutPolicy005';
      tcName = 'testScrollbarLayoutPolicy005'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184050, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScrollbarLayoutPolicyButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollbarLayoutPolicy006
     * @tc.number SUB_WEB_SCROLLLAYOUT_POLICY_0600
     * @tc.desc   scrollbarLayoutPolicy set SYSTEM twice test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollbarLayoutPolicy006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollbarLayoutPolicy006';
      tcName = 'testScrollbarLayoutPolicy006'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184060, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "ScrollbarLayoutPolicyButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
