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

import { afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
const CAPABILITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 186001;
const driver = Driver.create();

export default function WebKeyboardAppearanceTest() {
  describe('WebKeyboardAppearanceTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebKeyboardAppearance',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebKeyboardAppearance state success " + JSON.stringify(pages));
        if (!("WebKeyboardAppearance" == pages.name)) {
          console.info("get WebKeyboardAppearance state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("webKeyboardAppearanceButton"), 10000);
          console.info("push WebKeyboardAppearance page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebKeyboardAppearance page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPABILITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance001
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_0100
     * @tc.desc   test keyboardAppearance NONE_IMMERSIVE mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance001", true, 186010, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance001");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance002
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_0200
     * @tc.desc   test keyboardAppearance IMMERSIVE mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance002", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance002", true, 186020, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance002");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance002" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance003
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_0300
     * @tc.desc   test keyboardAppearance LIGHT_IMMERSIVE mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance003", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance003", true, 186030, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance003");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance003" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance004
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_0400
     * @tc.desc   test keyboardAppearance DARK_IMMERSIVE mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance004", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance004", true, 186040, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance004");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance004" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance005
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_0500
     * @tc.desc   test switch from NONE_IMMERSIVE to IMMERSIVE dynamically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance005", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance005", true, 186050, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance005");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance005" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance006
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_0600
     * @tc.desc   test switch from IMMERSIVE to LIGHT_IMMERSIVE dynamically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance006", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance006", true, 186060, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance006");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance006" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance007
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_0700
     * @tc.desc   test switch from LIGHT_IMMERSIVE to DARK_IMMERSIVE dynamically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance007", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance007", true, 186070, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance007");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance007" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance008
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_0800
     * @tc.desc   test switch from DARK_IMMERSIVE to NONE_IMMERSIVE dynamically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance008", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance008", true, 186080, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance008");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance008" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance009
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_0900
     * @tc.desc   test set keyboardAppearance then trigger keyboard show
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance009", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance009", true, 186090, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance009");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance009" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testKeyboardAppearance010
     * @tc.number SUB_WEB_KEYBOARD_APPEARANCE_1000
     * @tc.desc   test default behavior without calling keyboardAppearance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testKeyboardAppearance010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitKeyboardAppearance010", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testKeyboardAppearance010", true, 186100, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "webKeyboardAppearanceButton", "testKeyboardAppearance010");
      await Utils.waitForExist(() => isReturn, "testKeyboardAppearance010" + '_returnCheck', true, 1000);
      done();
    })

  })
}
