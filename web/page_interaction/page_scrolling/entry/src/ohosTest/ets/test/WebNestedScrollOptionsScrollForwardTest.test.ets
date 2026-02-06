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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = "";
const EVENT_ID_SET_SUITE_KEY = 179501;
let driver: Driver = Driver.create();

export default function webNestedScrollOptionsScrollForwardTest() {

  describe('WebNestedScrollOptionsScrollForwardTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebNestedScrollOptionsScrollForwardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNestedScrollOptionsScrollForwardTest state success " + JSON.stringify(pages));
        if (!("WebNestedScrollOptionsScrollForwardTest" == pages.name)) {
          console.info("get WebNestedScrollOptionsScrollForwardTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("NestedScrollOptionsScrollForwardTestButton"), 10000);
          console.info("push WebNestedScrollOptionsScrollForwardTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebNestedScrollOptionsScrollForwardTest page error: " + err);
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

    /**
     * @tc.name   testNestedScrollOptionsScrollForward001
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0100
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward001';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179510, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward002
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0200
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward002';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179520, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward003
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0300
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward003';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179530, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward004
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0400
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward004';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179540, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward005
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0500
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward005';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179550, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward006
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0600
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward006';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179560, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward007
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0700
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward007';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179570, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward008
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0800
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward008';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179580, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward009
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_0900
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward009';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179590, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward010
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1000
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward010';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179600, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward011
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1100
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward011';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179610, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward012
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1200
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward012';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179620, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward013
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1300
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward013';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179630, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward014
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1400
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward014';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179640, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward015
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1500
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward015';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179650, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForward016
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_1600
     * @tc.desc   test NestedScrollOptions scrollForward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForward016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForward016';
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(emitKey, true, 179660, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardTestButton", emitKey);
      await Utils.waitForExist(() => isReturn, emitKey + '_returnCheck', true, 1000);
      done();
    })

  })
}
