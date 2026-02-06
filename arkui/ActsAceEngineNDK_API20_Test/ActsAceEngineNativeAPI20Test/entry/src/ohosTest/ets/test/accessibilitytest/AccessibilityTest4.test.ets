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

export default function AccessibilityNdkTest4() {
  describe('AccessibilityNdkTest4', () => {

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETISPASSWORD_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetIsPassword0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetIsPassword0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetIsPassword0100 start====");

        let result: number = accessibilityNdk.SetIsPassword0100();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetIsPassword0100 result====${result}`);
        expect(result).assertEqual(RESULT_SUCCESSFUL);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetIsPassword0100 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETISPASSWORD_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetIsPassword0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetIsPassword0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info("====>testOHArkUIAccessibilityElementInfoSetIsPassword0200 start====");

        let result: number = accessibilityNdk.SetIsPassword0200();
        console.info(`====>testOHArkUIAccessibilityElementInfoSetIsPassword0200 result====${result}`);
        expect(result).assertEqual(RESULT_BAD_PARAMETER);
        done()
      } catch (err) {
        console.error("====>testOHArkUIAccessibilityElementInfoSetIsPassword0200 catch err: " + err);
        expect(false).assertEqual(0);
      }
    })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSCROLLABLE_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetScrollable0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetScrollable0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetScrollable0100 start====");

          let result: number = accessibilityNdk.SetScrollable0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetScrollable0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetScrollable0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSCROLLABLE_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetScrollable0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetScrollable0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetScrollable0200 start====");

          let result: number = accessibilityNdk.SetScrollable0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetScrollable0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetScrollable0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETEDITABLE_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetEditable0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetEditable0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetEditable0100 start====");

          let result: number = accessibilityNdk.SetEditable0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetEditable0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetEditable0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETEDITABLE_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetEditable0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetEditable0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetEditable0200 start====");

          let result: number = accessibilityNdk.SetEditable0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetEditable0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetEditable0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETISHINT_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetIsHint0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetIsHint0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetIsHint0100 start====");

          let result: number = accessibilityNdk.SetIsHint0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetIsHint0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetIsHint0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETISHINT_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetIsHint0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetIsHint0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetIsHint0200 start====");

          let result: number = accessibilityNdk.SetIsHint0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetIsHint0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetIsHint0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETRANGEINFO_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetRangeInfo0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetRangeInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetRangeInfo0100 start====");

          let result: number = accessibilityNdk.SetRangeInfo0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetRangeInfo0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetRangeInfo0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETRANGEINFO_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetRangeInfo0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetRangeInfo0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetRangeInfo0200 start====");

          let result: number = accessibilityNdk.SetRangeInfo0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetRangeInfo0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetRangeInfo0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETRANGEINFO_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetRangeInfo0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetRangeInfo0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetRangeInfo0300 start====");

          let result: number = accessibilityNdk.SetRangeInfo0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetRangeInfo0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetRangeInfo0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETGRIDINFO_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetGridInfo0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetGridInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetGridInfo0100 start====");

          let result: number = accessibilityNdk.SetGridInfo0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetGridInfo0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetGridInfo0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ACCESSIBILITYELEMENTINFOSETGRIDINFO_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetGridInfo0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetGridInfo0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetGridInfo0200 start====");

          let result: number = accessibilityNdk.SetGridInfo0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetGridInfo0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetGridInfo0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ARKUI_ACCESSIBILITYELEMENTINFOSETGRIDINFO_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetGridInfo0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetGridInfo0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetGridInfo0300 start====");

          let result: number = accessibilityNdk.SetGridInfo0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetGridInfo0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetGridInfo0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETGRIDITEMINFO_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetGridItemInfo0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetGridItemInfo0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetGridItemInfo0100 start====");

          let result: number = accessibilityNdk.SetGridItemInfo0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetGridItemInfo0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetGridItemInfo0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETGRIDITEMINFO_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetGridItemInfo0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetGridItemInfo0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetGridItemInfo0200 start====");

          let result: number = accessibilityNdk.SetGridItemInfo0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetGridItemInfo0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetGridItemInfo0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETGRIDITEMINFO_0300
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetGridItemInfo0300
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetGridItemInfo0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetGridItemInfo0300 start====");

          let result: number = accessibilityNdk.SetGridItemInfo0300();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetGridItemInfo0300 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetGridItemInfo0300 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })


    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSELECTEDTEXTSTART_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetSelectedTextStart0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetSelectedTextStart0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetSelectedTextStart0100 start====");

          let result: number = accessibilityNdk.SetSelectedTextStart0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetSelectedTextStart0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetSelectedTextStart0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSELECTEDTEXTSTART_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetSelectedTextStart0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetSelectedTextStart0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetSelectedTextStart0200 start====");

          let result: number = accessibilityNdk.SetSelectedTextStart0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetSelectedTextStart0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetSelectedTextStart0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSELECTEDTEXTEND_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetSelectedTextEnd0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetSelectedTextEnd0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetSelectedTextEnd0100 start====");

          let result: number = accessibilityNdk.SetSelectedTextEnd0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetSelectedTextEnd0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetSelectedTexEnd0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETSELECTEDTEXTEND_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetSelectedTextEnd0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetSelectedTextEnd0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetSelectedTextEnd0200 start====");

          let result: number = accessibilityNdk.SetSelectedTextEnd0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetSelectedTextEnd0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetSelectedTextEnd0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCURRENTITEMINDEX_0100
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0100
     * @tc.desc    : Verify whether it can register successfully and return the success code when valid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0100 start====");

          let result: number = accessibilityNdk.SetCurrentItemIndex0100();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0100 result====${result}`);
          expect(result).assertEqual(RESULT_SUCCESSFUL);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0100 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_ArkUI_ACCESSIBILITYELEMENTINFOSETCURRENTITEMINDEX_0200
     * @tc.name    : testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0200
     * @tc.desc    : Verify whether it can return the correct parameter error code when invalid parameters
     *               are passed in.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          console.info("====>testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0200 start====");

          let result: number = accessibilityNdk.SetCurrentItemIndex0200();
          console.info(`====>testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0200 result====${result}`);
          expect(result).assertEqual(RESULT_BAD_PARAMETER);
          done()
        } catch (err) {
          console.error("====>testOHArkUIAccessibilityElementInfoSetCurrentItemIndex0200 catch err: " + err);
          expect(false).assertEqual(0);
        }
      })

  })
}