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
const EVENT_ID_SET_SUITE_KEY = 185001;
let driver = Driver.create();
let emitKey = ""
let tcName = ""

export default function WebScrollDirectionalLockTest() {
  describe('WebScrollDirectionalLockTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebScrollDirectionalLock',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebScrollDirectionalLock state success " + JSON.stringify(pages));
        if (!("WebScrollDirectionalLock" == pages.name)) {
          console.info("get WebScrollDirectionalLock state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebScrollDirectionalLockButton"), 10000);
          console.info("push WebScrollDirectionalLock page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebScrollDirectionalLock page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebScrollDirectionalLock beforeEach start");
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock001
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0100
     * @tc.desc   enableScrollDirectionalLock enable true with ScrollDirectionalLockType.ALL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock001';
      tcName = 'testScrollDirectionalLock001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock002
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0200
     * @tc.desc   enableScrollDirectionalLock enable true with ScrollDirectionalLockType.NESTED_SCROLL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock002';
      tcName = 'testScrollDirectionalLock002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185020, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock003
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0300
     * @tc.desc   enableScrollDirectionalLock enable false with ScrollDirectionalLockType.ALL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock003';
      tcName = 'testScrollDirectionalLock003'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185030, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock004
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0400
     * @tc.desc   enableScrollDirectionalLock enable false with ScrollDirectionalLockType.NESTED_SCROLL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock004';
      tcName = 'testScrollDirectionalLock004'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185040, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock005
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0500
     * @tc.desc   enableScrollDirectionalLock switch type from ALL to NESTED_SCROLL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock005';
      tcName = 'testScrollDirectionalLock005'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185050, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock006
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0600
     * @tc.desc   enableScrollDirectionalLock switch type from NESTED_SCROLL to ALL test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock006';
      tcName = 'testScrollDirectionalLock006'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185060, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock007
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0700
     * @tc.desc   enableScrollDirectionalLock switch value from true to false with ALL type test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock007';
      tcName = 'testScrollDirectionalLock007'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185070, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock008
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0800
     * @tc.desc   enableScrollDirectionalLock switch value from false to true with NESTED_SCROLL type test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock008';
      tcName = 'testScrollDirectionalLock008'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185080, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock009
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_0900
     * @tc.desc   enableScrollDirectionalLock set same type ALL twice test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock009';
      tcName = 'testScrollDirectionalLock009'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185090, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScrollDirectionalLock010
     * @tc.number SUB_WEB_WEBATTRIBUTE_ENABLESCROLLDIRECTIONALLOCK_PARAM_1100
     * @tc.desc   enableScrollDirectionalLock set same type NESTED_SCROLL twice test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testScrollDirectionalLock010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      emitKey = 'emitScrollDirectionalLock010';
      tcName = 'testScrollDirectionalLock010'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 185100, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebScrollDirectionalLockButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })
  })
}
