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

import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium'
import nativerenderndk from 'libnoderenderndk.so'
import Utils from '../common/Utils';

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;
const ARKUI_ERROR_CODE_ERROR = 1;

export default function KeyEventTest() {
  describe('KeyEventTest', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`KeyEventTest/KeyEventTest`, done);
    });

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIKeyEventIsNumLockOn_0100
     * @tc.name       : testOHArkUIKeyEventIsNumLockOn0100
     * @tc.desc       : testing OH_ArkUI_KeyEvent_IsNumLockOn interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */

    it('testOHArkUIKeyEventIsNumLockOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyEventIsNumLockOn0100 start====");
          await Utils.driver.triggerKey(2022);
          let result: number = nativerenderndk.IsNumLockOnTest_001()
          console.info(`====>testOHArkUIKeyEventIsNumLockOn0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);;
          done();
        } catch (err) {
          console.error("====>testOHArkUIKeyEventIsNumLockOn0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
     * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIKeyEventIsNumLockOn_0200
     * @tc.name       : testOHArkUIKeyEventIsNumLockOn0200
     * @tc.desc       : testing OH_ArkUI_KeyEvent_IsNumLockOn interface
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it('testOHArkUIKeyEventIsNumLockOn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyEventIsNumLockOn0200 start====");
          await Utils.driver.triggerKey(2022);
          let result: number = nativerenderndk.IsNumLockOnTest_002()
          console.info(`====>testOHArkUIKeyEventIsNumLockOn0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);;
          done();
        } catch (err) {
          console.error("====>testOHArkUIKeyEventIsNumLockOn0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIKeyEventIsCapsLockOn_0100
       * @tc.name       : testOHArkUIKeyEventIsCapsLockOn0100
       * @tc.desc       : testing OH_ArkUI_KeyEvent_IsCapsLockOn interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIKeyEventIsCapsLockOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyEventIsCapsLockOn0100 start====");
          await Utils.driver.triggerKey(2022);
          let result: number = nativerenderndk.IsCapsLockOnTest_001()
          console.info(`====>testOHArkUIKeyEventIsCapsLockOn0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIKeyEventIsCapsLockOn0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
       * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIKeyEventIsCapsLockOn_0200
       * @tc.name       : testOHArkUIKeyEventIsCapsLockOn0200
       * @tc.desc       : testing OH_ArkUI_KeyEvent_IsCapsLockOn interface
       * @tc.size       : MediumTest
       * @tc.type       : Function
       * @tc.level      : Level 1
       */
    it('testOHArkUIKeyEventIsCapsLockOn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyEventIsCapsLockOn0200 start====");
          await Utils.driver.triggerKey(2022);
          let result: number = nativerenderndk.IsCapsLockOnTest_002()
          console.info(`====>testOHArkUIKeyEventIsCapsLockOn0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIKeyEventIsCapsLockOn0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
        }
      })

    /*
    * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIKeyEventIsScrollLockOn_0100
    * @tc.name       : testOHArkUIKeyEventIsScrollLockOn0100
    * @tc.desc       : testing OH_ArkUI_KeyEvent_IsScrollLockOn interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOHArkUIKeyEventIsScrollLockOn0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyEventIsScrollLockOn0100 start====");
          await Utils.driver.triggerKey(2022);
          let result: number = nativerenderndk.IsScrollLockOnTest_001()
          console.info(`====>testOHArkUIKeyEventIsScrollLockOn0100 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIKeyEventIsScrollLockOn0100 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

    /*
    * @tc.number     : SUB_ArkUI_ACE_ENGINE_OHArkUIKeyEventIsScrollLockOn_0200
    * @tc.name       : testOHArkUIKeyEventIsScrollLockOn0200
    * @tc.desc       : testing OH_ArkUI_KeyEvent_IsScrollLockOn interface
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('testOHArkUIKeyEventIsScrollLockOn0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIKeyEventIsScrollLockOn0200 start====");
          await Utils.driver.triggerKey(2022);
          let result: number = nativerenderndk.IsScrollLockOnTest_002()
          console.info(`====>testOHArkUIKeyEventIsScrollLockOn0200 result====${result}`);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done();
        } catch (err) {
          console.error("====>testOHArkUIKeyEventIsScrollLockOn0200 catch err: " + err);
          expect(false).assertEqual(ARKUI_ERROR_CODE_ERROR);
          done();
        }
      })

  })
}