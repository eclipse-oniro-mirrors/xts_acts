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

const EVENT_ID_SET_SUITE_KEY = 182001;
let driver = Driver.create();
let emitKey = ""
let tcName = ""

export default function webNestedScrollOptionsScrollBackwardTest() {

  describe('WebNestedScrollOptionsScrollBackwardTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebNestedScrollOptionsScrollBackwardTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebNestedScrollOptionsScrollBackwardTest state success " + JSON.stringify(pages));
        if (!("WebNestedScrollOptionsScrollBackwardTest" == pages.name)) {
          console.info("get WebNestedScrollOptionsScrollBackwardTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("NestedScrollOptionsScrollBackwardTestButton"), 10000);
          console.info("push WebNestedScrollOptionsScrollBackwardTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebNestedScrollOptionsScrollBackwardTest page error: " + err);
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
     * @tc.name   testNestedScrollOptionsScrollBackward001
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0100
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward001';
      tcName = 'testNestedScrollOptionsScrollBackward001'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward002
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0200
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward002';
      tcName = 'testNestedScrollOptionsScrollBackward002'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182020, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward003
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0300
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward003';
      tcName = 'testNestedScrollOptionsScrollBackward003'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182030, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward004
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0400
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward004';
      tcName = 'testNestedScrollOptionsScrollBackward004'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182040, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward005
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0500
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward005';
      tcName = 'testNestedScrollOptionsScrollBackward005'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182050, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward006
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0600
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward006';
      tcName = 'testNestedScrollOptionsScrollBackward006'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182060, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward007
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0700
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward007';
      tcName = 'testNestedScrollOptionsScrollBackward007'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182070, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward008
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0800
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward008';
      tcName = 'testNestedScrollOptionsScrollBackward008'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182080, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward009
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_0900
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward009';
      tcName = 'testNestedScrollOptionsScrollBackward009'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182090, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward010
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1000
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward010';
      tcName = 'testNestedScrollOptionsScrollBackward010'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182100, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward011
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1100
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward011';
      tcName = 'testNestedScrollOptionsScrollBackward011'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182110, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward012
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1200
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward012';
      tcName = 'testNestedScrollOptionsScrollBackward012'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182120, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward013
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1300
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward013';
      tcName = 'testNestedScrollOptionsScrollBackward013'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182130, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward014
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1400
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward014';
      tcName = 'testNestedScrollOptionsScrollBackward014'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182140, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward015
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1500
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward015';
      tcName = 'testNestedScrollOptionsScrollBackward015'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182150, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testNestedScrollOptionsScrollBackward016
     * @tc.number SUB_WEB_NESTEDSCROLLOPTIONS_SCROLLBACKWARD_1600
     * @tc.desc   test NestedScrollOptions scrollBackward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNestedScrollOptionsScrollBackward016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'testNestedScrollOptionsScrollBackward016';
      tcName = 'testNestedScrollOptionsScrollBackward016'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, true, 182160, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "NestedScrollOptionsScrollBackwardTestButton", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

  })
}
