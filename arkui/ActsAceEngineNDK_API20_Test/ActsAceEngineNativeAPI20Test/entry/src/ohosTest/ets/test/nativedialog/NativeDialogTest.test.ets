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

import { describe, beforeAll, it, expect, TestType, Size, Level, afterAll } from '@ohos/hypium'
import nativedialog from 'libnativedialog.so'

const ARKUI_ERROR_CODE_NO_ERROR = 0;

export default function NativeDialogTest() {
  describe('NativeDialogTest', () => {

    /**
     * @tc.name   ArkUiLevelModeEmbedded001
     * @tc.number SUB_ARKUI_LEVELMODEEMBEDDED_0100
     * @tc.desc   test ARKUI_LEVEL_MODE_EMBEDDED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUiLevelModeEmbedded001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>ArkUiLevelModeEmbedded001 start====");
        let result : number = nativedialog.ArkUILevelModeEmbedded();
        console.info("====>ArkUiLevelModeEmbedded001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUiLevelModeEmbedded001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUIImmersiveModeExtend001
     * @tc.number SUB_ARKUI_IMMERSIVEMODEEXTEND_0100
     * @tc.desc   test ARKUI_IMMERSIVE_MODE_EXTEND
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIImmersiveModeExtend001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>ArkUIImmersiveModeExtend001 start====");
        let result : number = nativedialog.ArkUIImmersiveModeExtend();
        console.info("====>ArkUIImmersiveModeExtend001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUIImmersiveModeExtend001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUIRegisterOnWillDismissWithUserData001
     * @tc.number SUB_ARKUI_REGISTERONWILLDISMISSWITHUSERDATA_0100
     * @tc.desc   test registerOnWillDismissWithUserData
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIRegisterOnWillDismissWithUserData001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>ArkUIRegisterOnWillDismissWithUserData001 start====");
        let result : number = nativedialog.ArkUIRegisterOnWillDismissWithUserData();
        console.info("====>ArkUIRegisterOnWillDismissWithUserData001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUIRegisterOnWillDismissWithUserData001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUINativeDialogAPI1001
     * @tc.number SUB_ARKUI_NATIVEDIALOGAPI1_0100
     * @tc.desc   test nativeDialogAPI1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUINativeDialogAPI1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>ArkUINativeDialogAPI1001 start====");
        let result : number = nativedialog.ArkUINativeDialogAPI1();
        console.info("====>ArkUINativeDialogAPI1001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUINativeDialogAPI1001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUISetKeyboardAvoidDistance001
     * @tc.number SUB_ARKUI_SETKEYBOARDAVOIDDISTANCE_0100
     * @tc.desc   test setKeyboardAvoidDistance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUISetKeyboardAvoidDistance001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>ArkUISetKeyboardAvoidDistance001 start====");
        let result : number = nativedialog.ArkUISetKeyboardAvoidDistance();
        console.info("====>ArkUISetKeyboardAvoidDistance001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUISetKeyboardAvoidDistance001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUINativeDialogAPI2001
     * @tc.number SUB_ARKUI_NATIVEDIALOGAPI2_0100
     * @tc.desc   test nativeDialogAPI2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUINativeDialogAPI2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>ArkUINativeDialogAPI2001 start====");
        let result : number = nativedialog.ArkUINativeDialogAPI2();
        console.info("====>ArkUINativeDialogAPI2001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUINativeDialogAPI2001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUISetLevelOrder001
     * @tc.number SUB_ARKUI_SETLEVELORDER_0100
     * @tc.desc   test setLevelOrder
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUISetLevelOrder001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>ArkUISetLevelOrder001 start====");
        let result : number = nativedialog.ArkUISetLevelOrder();
        console.info("====>ArkUISetLevelOrder001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUISetLevelOrder001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUIRegisterOnWillAppear001
     * @tc.number SUB_ARKUI_REGISTERONWILLAPPEAR_0100
     * @tc.desc   test registerOnWillAppear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIRegisterOnWillAppear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>ArkUIRegisterOnWillAppear001 start====");
        let result : number = nativedialog.ArkUIRegisterOnWillAppear();
        console.info("====>ArkUIRegisterOnWillAppear001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUIRegisterOnWillAppear001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUIRegisterOnDidAppear001
     * @tc.number SUB_ARKUI_REGISTERONDIDAPPEAR_0100
     * @tc.desc   test registerOnDidAppear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIRegisterOnDidAppear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>ArkUIRegisterOnDidAppear001 start====");
        let result : number = nativedialog.ArkUIRegisterOnDidAppear();
        console.info("====>ArkUIRegisterOnDidAppear001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUIRegisterOnDidAppear001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUIRegisterOnWillDisappear001
     * @tc.number SUB_ARKUI_REGISTERONWILLDISAPPEAR_0100
     * @tc.desc   test registerOnWillDisappear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIRegisterOnWillDisappear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      try {
        console.info("====>ArkUIRegisterOnWillDisappear001 start====");
        let result : number = nativedialog.ArkUIRegisterOnWillDisappear();
        console.info("====>ArkUIRegisterOnWillDisappear001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUIRegisterOnWillDisappear001 catch err: " + err);
      }
    })

    /**
     * @tc.name   ArkUIRegisterOnDidDisappear001
     * @tc.number SUB_ARKUI_REGISTERONDIDDISAPPEAR_0100
     * @tc.desc   test registerOnDidDisappear
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUIRegisterOnDidDisappear001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>ArkUIRegisterOnDidDisappear001 start====");
          let result : number = nativedialog.ArkUIRegisterOnDidDisappear();
          console.info("====>ArkUIRegisterOnDidDisappear001 result: " + result);
          expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
          done()
        } catch (err) {
          console.error("====>ArkUIRegisterOnDidDisappear001 catch err: " + err);
        }
    })

    /**
     * @tc.name   ArkUISetFocusable001
     * @tc.number SUB_ARKUI_SETFOCUSABLE_0100
     * @tc.desc   test setFocusable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArkUISetFocusable001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>ArkUISetFocusable001 start====");
        let result : number = nativedialog.ArkUISetFocusable();
        console.info("====>ArkUISetFocusable001 result: " + result);
        expect(result).assertEqual(ARKUI_ERROR_CODE_NO_ERROR);
        done()
      } catch (err) {
        console.error("====>ArkUISetFocusable001 catch err: " + err);
      }
    })
  })
}
