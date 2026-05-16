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
const EVENT_ID_SET_SUITE_KEY = 184101;
let driver = Driver.create();

export default function webNestedScrollOptionsScrollBackwardHorizontalTest() {

  describe('WebNestedScrollOptionsScrollBackwardHorizontalTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebNestedScrollOptionsScrollBackwardHorizontalTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNestedScrollOptionsScrollBackwardHorizontalTest state success " + JSON.stringify(pages));
        if (!("WebNestedScrollOptionsScrollBackwardHorizontalTest" == pages.name)) {
          console.info("get WebNestedScrollOptionsScrollBackwardHorizontalTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("NestedScrollOptionsScrollBackwardHorizontalTestButton"),10000);
          console.info("push WebNestedScrollOptionsScrollBackwardHorizontalTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebNestedScrollOptionsScrollBackwardHorizontalTest page error: " + err);
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
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal001
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0100
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal001';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184110, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal002
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0200
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal002';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184120, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal003
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0300
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal003';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal003'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184130, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal004
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0400
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal004';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal004'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184140, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal005
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0500
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal005';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal005'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184150, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal006
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0600
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal006';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal006'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184160, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal007
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0700
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal007';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal007'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 9007, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal008
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0800
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal008';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal008'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184180, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal009
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_0900
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal009';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal009'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184190, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal010
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1000
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal010';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal010'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184200, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal011
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1100
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal011';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal011'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184210, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal012
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1200
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal012';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal012'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184220, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal013
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1300
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal013';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal013'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184230, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal014
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1400
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal014';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal014'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184240, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal015
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1500
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal015';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal015'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184250, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackwardHorizontal016
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_HORIZONTAL_1600
     * @tc.desc   test NestedScrollOptions scrollBackward horizontal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackwardHorizontal016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackwardHorizontal016';
      tcName = 'testNestedScrollOptionsScrollBackwardHorizontal016'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 184260, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardHorizontalTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

  })
}
