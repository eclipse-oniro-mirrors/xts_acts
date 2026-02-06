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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import accessibilityNdk from 'libaccessibilityndk.so'

const RESULT_SUCCESSFUL = 0
const RESULT_BAD_PARAMETER = -2

export default function AccessibilityNdkTest3() {
  describe('AccessibilityNdkTest3', () => {
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCHECKABLE_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetCheckable0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetCheckable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetCheckable0100 start====");

          let result: number = accessibilityNdk.SetCheckable0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetCheckable0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetCheckable0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCHECKABLE_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetCheckable0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetCheckable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetCheckable0200 start====");

          let result: number = accessibilityNdk.SetCheckable0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetCheckable0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetCheckable0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCHECKED_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetChecked0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetChecked0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetChecked0100 start====");

          let result: number = accessibilityNdk.SetChecked0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetChecked0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetChecked0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCHECKED_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetChecked0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetChecked0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetChecked0200 start====");

          let result: number = accessibilityNdk.SetChecked0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetChecked0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetChecked0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETFOCUSABLE_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetFocusable0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetFocusable0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetFocusable0100 start====");

          let result: number = accessibilityNdk.SetFocusable0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetFocusable0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetFocusable0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETFOCUSABLE_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetFocusable0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetFocusable0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetFocusable0200 start====");

          let result: number = accessibilityNdk.SetFocusable0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetFocusable0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetFocusable0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETFOCUSED_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetFocused0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetFocused0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetFocused0100 start====");

          let result: number = accessibilityNdk.SetFocused0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetFocused0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetFocused0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETFOCUSED_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetFocused0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetFocused0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetFocused0200 start====");

          let result: number = accessibilityNdk.SetFocused0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetFocused0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetFocused0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETVISIBLE_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetVisible0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetVisible0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetVisible0100 start====");

          let result: number = accessibilityNdk.SetVisible0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetVisible0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetVisible0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETVISIBLE_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetVisible0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetVisible0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetVisible0200 start====");

          let result: number = accessibilityNdk.SetVisible0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetVisible0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetVisible0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYFOCUSED_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0100', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0100 start====");

        let result: number = accessibilityNdk.SetAccessibilityFocused0100();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0100 result====${result}`);
        expect(result).assertEqual(RESULT_SUCCESSFUL);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0100 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETACCESSIBILITYFOCUSED_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0200', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0200 start====");

        let result: number = accessibilityNdk.SetAccessibilityFocused0200();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0200 result====${result}`);
        expect(result).assertEqual(RESULT_BAD_PARAMETER);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetAccessibilityFocused0200 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSELECTED_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetSelected0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetSelected0100', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetSelected0100 start====");

        let result: number = accessibilityNdk.SetSelected0100();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetSelected0100 result====${result}`);
        expect(result).assertEqual(RESULT_SUCCESSFUL);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetSelected0100 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSELECTED_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetSelected0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetSelected0200', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetSelected0200 start====");

        let result: number = accessibilityNdk.SetSelected0200();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetSelected0200 result====${result}`);
        expect(result).assertEqual(RESULT_BAD_PARAMETER);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetSelected0200 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCLICKABLE_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetClickable0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetClickable0100', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetClickable0100 start====");

        let result: number = accessibilityNdk.SetClickable0100();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetClickable0100 result====${result}`);
        expect(result).assertEqual(RESULT_SUCCESSFUL);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetClickable0100 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCLICKABLE_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetClickable0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetClickable0200', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetClickable0200 start====");

        let result: number = accessibilityNdk.SetClickable0200();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetClickable0200 result====${result}`);
        expect(result).assertEqual(RESULT_BAD_PARAMETER);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetClickable0200 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETLONGCLICKABLE_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetLongClickable0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetLongClickable0100', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetLongClickable0100 start====");

        let result: number = accessibilityNdk.SetLongClickable0100();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetLongClickable0100 result====${result}`);
        expect(result).assertEqual(RESULT_SUCCESSFUL);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetLongClickable0100 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETLONGCLICKABLE_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetLongClickable0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetLongClickable0200', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetLongClickable0200 start====");

        let result: number = accessibilityNdk.SetLongClickable0200();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetLongClickable0200 result====${result}`);
        expect(result).assertEqual(RESULT_BAD_PARAMETER);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetLongClickable0200 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETENABLED_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetEnabled0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetEnabled0100', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetEnabled0100 start====");

        let result: number = accessibilityNdk.SetEnabled0100();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetEnabled0100 result====${result}`);
        expect(result).assertEqual(RESULT_SUCCESSFUL);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetEnabled0100 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETENABLED_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetEnabled0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetEnabled0200', TestType.FUNCTION | Size.MEDIUMTEST |
    Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetEnabled0200 start====");

        let result: number = accessibilityNdk.SetEnabled0200();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetEnabled0200 result====${result}`);
        expect(result).assertEqual(RESULT_BAD_PARAMETER);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetEnabled0200 catch err: " + err);
        expect(false).assertEqual(0);
        done()
      }
    })

  })
}