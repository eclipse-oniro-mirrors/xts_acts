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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function TextEnumTest() {
  describe('TextEnumTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextEnumTest beforeEach start");
      done();
    })

    // ==================== TextEnumTest 枚举值测试 ====================

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100
     * @tc.number SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100
     * @tc.desc   Test NODE_TEXT_ON_TEXT_SELECTION_CHANGE == 1002
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100 START');
      expect(nativeFunc.TextEnumTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_ON_TEXT_SELECTION_CHANGE_0100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_ON_COPY_0200
     * @tc.number SUB_ARKUI_NODE_TEXT_ON_COPY_0200
     * @tc.desc   Test ARKUI_COMPETITION_STRATEGY_COMPETITION == 1003
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_NODE_TEXT_ON_COPY_0200', Level.LEVEL0, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_ON_COPY_0200 START');
      expect(nativeFunc.TextEnumTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_ON_COPY_0200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300
     * @tc.number SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300
     * @tc.desc   Test NODE_TEXT_ON_WILL_COPY == 1004
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300 START');
      expect(nativeFunc.TextEnumTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_ON_WILL_COPY_0300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400
     * @tc.number SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400
     * @tc.desc   Test NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION == 1047
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400 START');
      expect(nativeFunc.TextEnumTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_ORPHAN_CHAR_OPTIMIZATION_0400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_CONTROLLER_0500
     * @tc.number SUB_ARKUI_NODE_TEXT_CONTROLLER_0500
     * @tc.desc   Test NODE_TEXT_CONTROLLER == 1054
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_CONTROLLER_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_CONTROLLER_0500 START');
      expect(nativeFunc.TextEnumTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_CONTROLLER_0500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600
     * @tc.desc   Test NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION == 22028
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600 START');
      expect(nativeFunc.TextEnumTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_ORPHAN_CHAR_OPTIMIZATION_0600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700
     * @tc.number SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700
     * @tc.desc   Test NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING == 22029
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700 START');
      expect(nativeFunc.TextEnumTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_NODE_TEXT_EDITOR_HORIZONTAL_SCROLLING_0700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800
     * @tc.number SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800
     * @tc.desc   Test OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING == 8
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800 START');
      expect(nativeFunc.TextEnumTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ARKUI_STYLEDSTRINGKEY_LINE_SPACING_0800 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_0900
     * @tc.number SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_0900
     * @tc.desc   Test OH_ArkUI_TextController_SetStyledString: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_0900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_0900 START');
      expect(nativeFunc.TextEnumTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_0900 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1000
     * @tc.number SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1000
     * @tc.desc   Test OH_ArkUI_TextController_SetStyledString: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1000', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1000 START');
      expect(nativeFunc.TextEnumTest_010()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1000 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1100
     * @tc.number SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1100
     * @tc.desc   Test OH_ArkUI_TextController_SetStyledString: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1100 START');
      expect(nativeFunc.TextEnumTest_011()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_TextController_SetStyledString_1100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1200
     * @tc.number SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1200
     * @tc.desc   Test OH_ArkUI_LineHeightStyle_SetLineHeightMultiple: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1200 START');
      expect(nativeFunc.TextEnumTest_012()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1300
     * @tc.number SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1300
     * @tc.desc   Test OH_ArkUI_LineHeightStyle_GetLineHeightMultiple: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1300 START');
      expect(nativeFunc.TextEnumTest_013()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1400
     * @tc.number SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1400
     * @tc.desc   Test OH_ArkUI_LineHeightStyle_SetLineHeightMultiple: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1400 START');
      expect(nativeFunc.TextEnumTest_014()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeightMultiple_1400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1500
     * @tc.number SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1500
     * @tc.desc   Test OH_ArkUI_LineHeightStyle_GetLineHeightMultiple: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1500 START');
      expect(nativeFunc.TextEnumTest_015()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_GetLineHeightMultiple_1500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_1600
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_1600
     * @tc.desc   Test OH_ArkUI_SpanStyle_SetLineSpacingStyle: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_1600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_1600 START');
      expect(nativeFunc.TextEnumTest_016()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_1600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1700
     * @tc.number SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1700
     * @tc.desc   Test OH_ArkUI_LineSpacingStyle_SetLineSpacing: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1700 START');
      expect(nativeFunc.TextEnumTest_017()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1800
     * @tc.number SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1800
     * @tc.desc   Test OH_ArkUI_LineSpacingStyle_SetLineSpacing: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1800 START');
      expect(nativeFunc.TextEnumTest_018()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetLineSpacing_1800 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_1900
     * @tc.number SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_1900
     * @tc.desc   Test OH_ArkUI_LineSpacingStyle_GetLineSpacing: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_1900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_1900 START');
      expect(nativeFunc.TextEnumTest_019()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_1900 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2000
     * @tc.number SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2000
     * @tc.desc   Test OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2000', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2000 START');
      expect(nativeFunc.TextEnumTest_020()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2000 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2100
     * @tc.number SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2100
     * @tc.desc   Test OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines: ARKUI_ERROR_CODE_NO_ERROR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2100 START');
      expect(nativeFunc.TextEnumTest_021()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2200
     * @tc.number SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2200
     * @tc.desc   Test OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2200 START');
      expect(nativeFunc.TextEnumTest_022()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_SetOnlyBetweenLines_2200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_2300
     * @tc.number SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_2300
     * @tc.desc   Test OH_ArkUI_LineSpacingStyle_GetLineSpacing: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_2300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_2300 START');
      expect(nativeFunc.TextEnumTest_023()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetLineSpacing_2300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2400
     * @tc.number SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2400
     * @tc.desc   Test OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2400 START');
      expect(nativeFunc.TextEnumTest_024()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineSpacingStyle_GetOnlyBetweenLines_2400 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2500
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2500
     * @tc.desc   Test OH_ArkUI_SpanStyle_SetLineSpacingStyle: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2500 START');
      expect(nativeFunc.TextEnumTest_025()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2500 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2600
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2600
     * @tc.desc   Test OH_ArkUI_SpanStyle_SetLineSpacingStyle: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2600 START');
      expect(nativeFunc.TextEnumTest_026()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2600 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2700
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2700
     * @tc.desc   Test OH_ArkUI_SpanStyle_SetLineSpacingStyle: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2700 START');
      expect(nativeFunc.TextEnumTest_027()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLineSpacingStyle_2700 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_SetStart_2800
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_SetStart_2800
     * @tc.desc   Test OH_ArkUI_SpanStyle_SetStart: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_SetStart_2800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetStart_2800 START');
      expect(nativeFunc.TextEnumTest_028()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetStart_2800 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_SetLength_2900
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_SetLength_2900
     * @tc.desc   Test OH_ArkUI_SpanStyle_SetLength: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLength_2900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLength_2900 START');
      expect(nativeFunc.TextEnumTest_029()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_SetLength_2900 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeight_3000
     * @tc.number SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeight_3000
     * @tc.desc   Test OH_ArkUI_LineHeightStyle_SetLineHeight: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeight_3000', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeight_3000 START');
      expect(nativeFunc.TextEnumTest_030()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LineHeightStyle_SetLineHeight_3000 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3100
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3100
     * @tc.desc   Test OH_ArkUI_SpanStyle_GetLineSpacingStyle: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3100 START');
      expect(nativeFunc.TextEnumTest_031()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3100 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3200
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3200
     * @tc.desc   Test OH_ArkUI_SpanStyle_GetLineSpacingStyle: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3200 START');
      expect(nativeFunc.TextEnumTest_032()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3200 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3300
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3300
     * @tc.desc   Test OH_ArkUI_SpanStyle_GetLineSpacingStyle: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3300 START');
      expect(nativeFunc.TextEnumTest_033()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3300 END');
    });

    /**
     * @tc.name   SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3400
     * @tc.number SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3400
     * @tc.desc   Test OH_ArkUI_SpanStyle_GetLineSpacingStyle: ARKUI_ERROR_CODE_PARAM_INVALID
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3400 START');
      expect(nativeFunc.TextEnumTest_034()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_SpanStyle_GetLineSpacingStyle_3400 END');
    });
  });
}