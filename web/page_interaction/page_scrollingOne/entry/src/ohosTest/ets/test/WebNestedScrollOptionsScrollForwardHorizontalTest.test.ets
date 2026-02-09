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

let emitKey = ""
let tcName = ""
const EVENT_ID_SET_SUITE_KEY = 184301;
let driver = Driver.create();

export default function webNestedScrollOptionsScrollForwardHorizontalTest() {

  describe('WebNestedScrollOptionsScrollForwardHorizontalTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebNestedScrollOptionsScrollForwardHorizontalTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNestedScrollOptionsScrollForwardHorizontalTest state success " + JSON.stringify(pages));
        if (!("WebNestedScrollOptionsScrollForwardHorizontalTest" == pages.name)) {
          console.info("get WebNestedScrollOptionsScrollForwardHorizontalTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("NestedScrollOptionsScrollForwardHorizontalTestButton"),10000);
          console.info("push WebNestedScrollOptionsScrollForwardHorizontalTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebNestedScrollOptionsScrollForwardHorizontalTest page error: " + err);
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
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal001
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0100
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal001';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184310, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal002
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0200
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal002';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184320, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal003
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0300
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal003';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal003'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184330, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal004
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0400
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal004';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal004'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184340, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal005
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0500
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal005';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal005'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184350, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal006
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0600
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal006';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal006'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184360, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal007
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0700
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal007';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal007'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184370, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal008
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0800
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal008';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal008'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184380, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal009
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_0900
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal009';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal009'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184390, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal010
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1000
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal010';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal010'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184400, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal011
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1100
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal011';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal011'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184410, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal012
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1200
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal012';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal012'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184420, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal013
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1300
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal013';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal013'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184430, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal014
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1400
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal014';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal014'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184440, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal015
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1500
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal015';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal015'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184450, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollForwardHorizontal016
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLFORWARD_HORIZONTAL_1600
     * @tc.desc   test NestedScrollOptions scrollForward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollForwardHorizontal016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollForwardHorizontal016';
      tcName = 'testNestedScrollOptionsScrollForwardHorizontal016'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184460, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollForwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

  })
}
