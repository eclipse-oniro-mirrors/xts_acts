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

import { describe, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { UiDriver } from '@ohos.UiTest'

const TestTag = 'testTag';
const ErrorCode = 401;
const OldErrorCode = 5;

export default function uitestEnumTest() {
  describe('UitestUiDriver401ErrorCode', () => {
    /**
     * @tc.name   testApi8_UiDriver_findComponent_5
     * @tc.number UiTest_uitest401_019
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_findComponent_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_findComponent_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.findComponent(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_findComponent_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.findComponent(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_findComponent_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_findComponent_5 END`);
    })

    /**
     * @tc.name   testApi8_UiDriver_findComponents_5
     * @tc.number UiTest_uitest401_020
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_findComponents_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_findComponents_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.findComponents(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_findComponents_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.findComponents(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_findComponents_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_findComponents_5 END`);
    })

    /**
     * @tc.name   testApi8_UiDriver_assertComponentExist_5
     * @tc.number UiTest_uitest401_021
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_assertComponentExist_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_assertComponentExist_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.assertComponentExist(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_assertComponentExist_5 by = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.assertComponentExist(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_assertComponentExist_5 by = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_assertComponentExist_5 END`);
    })

    /**
     * @tc.name   testApi8_UiDriver_triggerKey_5
     * @tc.number UiTest_uitest401_022
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_triggerKey_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_triggerKey_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.triggerKey(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_triggerKey_5 keycode = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.triggerKey(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_triggerKey_5 keycode = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_triggerKey_5 END`);
    })

    /**
     * @tc.name   testApi8_UiDriver_click_5
     * @tc.number UiTest_uitest401_023
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_click_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_click_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.click(null, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_click_5 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.click(undefined, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_click_5 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.click(100, null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_click_5 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.click(100, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_click_5 undefined = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_click_5 END`);
    })

    /**
     * @tc.name   testApi8_UiDriver_doubleClick_5
     * @tc.number UiTest_uitest401_024
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_doubleClick_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.doubleClick(null, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.doubleClick(undefined, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.doubleClick(100, null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.doubleClick(100, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 undefined = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_doubleClick_5 END`);
    })

    /**
     * @tc.name   testApi8_UiDriver_longClick_5
     * @tc.number UiTest_uitest401_025
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_longClick_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_longClick_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.longClick(null, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_longClick_5 x = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.longClick(undefined, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_longClick_5 x = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.longClick(100, null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_longClick_5 y = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.longClick(100, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_longClick_5 undefined = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_longClick_5 END`);
    })

    /**
     * @tc.name   testApi8_UiDriver_swipe_5
     * @tc.number UiTest_uitest401_026
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_swipe_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_swipe_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.swipe(null, 100, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 startx = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(undefined, 100, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 startx = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(100, null, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 starty = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(100, undefined, 100, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 starty = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(100, 100, null, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 endx = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(100, 100, undefined, 100);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 endx = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 endy = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.swipe(100, 100, 100, undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_swipe_5 endy = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_swipe_5 END`);
    })

    /**
     * @tc.name   testApi8_UiDriver_screenCap_401
     * @tc.number UiTest_uitest401_027
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_screenCap_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_screenCap_401 start`);
      let driver = UiDriver.create();
      try {
        await driver.screenCap('');
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_screenCap_401 path = '' error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.screenCap(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_screenCap_401 path = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      try {
        await driver.screenCap(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_screenCap_401 path = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(ErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_screenCap_401 END`);
    })

    /**
     * @tc.name   testApi8_UiDriver_delayMs_5
     * @tc.number UiTest_uitest401_018
     * @tc.desc   type 401 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testApi8_UiDriver_delayMs_5', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.log(`${TestTag}, testApi8_UiDriver_delayMs_5 start`);
      let driver = UiDriver.create();
      try {
        await driver.delayMs(null);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_delayMs_5 d = null error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      try {
        await driver.delayMs(undefined);
        expect().assertFail();
      } catch (error) {
        console.log(`${TestTag}, testApi8_UiDriver_delayMs_5 d = undefined error, ${JSON.stringify(error)}`);
        expect(error.code).assertEqual(OldErrorCode);
      }
      console.log(`${TestTag}, testApi8_UiDriver_delayMs_5 END`);
    })

  })
}