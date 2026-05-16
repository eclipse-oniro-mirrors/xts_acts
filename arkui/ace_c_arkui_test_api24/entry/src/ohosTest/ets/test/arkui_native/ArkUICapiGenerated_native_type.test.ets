/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import arkuiCapiTest from 'libarkuicapigen.so'


export default function arkuiNativeCapiNativeType() {
  describe('NativeType (native_type)', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.number  TestArkUICapi_059
     * @tc.name    TestArkUICapi_059
     * @tc.desc    Case: TestArkUICapi_059. API: ARKUI_ELLIPSIS_MODE_MULTILINE_START. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_059', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_059()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_060
     * @tc.name    TestArkUICapi_060
     * @tc.desc    Case: TestArkUICapi_060. API: ARKUI_ELLIPSIS_MODE_MULTILINE_CENTER. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_060', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_060()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_061
     * @tc.name    TestArkUICapi_061
     * @tc.desc    Case: TestArkUICapi_061. API: ARKUI_TEXT_MENU_ITEM_ID_AUTO_FILL. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_061', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_061()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_062
     * @tc.name    TestArkUICapi_062
     * @tc.desc    Case: TestArkUICapi_062. API: ARKUI_TEXT_MENU_ITEM_ID_PASSWORD_VAULT. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_062', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_062()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_063
     * @tc.name    TestArkUICapi_063
     * @tc.desc    Case: TestArkUICapi_063. API: OH_ARKUI_HAPTIC_FEEDBACK_MODE_DISABLED. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_063', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_063()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_064
     * @tc.name    TestArkUICapi_064
     * @tc.desc    Case: TestArkUICapi_064. API: OH_ARKUI_HAPTIC_FEEDBACK_MODE_ENABLED. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_064', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_064()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_065
     * @tc.name    TestArkUICapi_065
     * @tc.desc    Case: TestArkUICapi_065. API: OH_ARKUI_HAPTIC_FEEDBACK_MODE_AUTO. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_065', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_065()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_066
     * @tc.name    TestArkUICapi_066
     * @tc.desc    Case: TestArkUICapi_066. API: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_TEXT. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_066', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_066()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_067
     * @tc.name    TestArkUICapi_067
     * @tc.desc    Case: TestArkUICapi_067. API: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_IMAGE. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_067', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_067()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_068
     * @tc.name    TestArkUICapi_068
     * @tc.desc    Case: TestArkUICapi_068. API: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_MIXED. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_068', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_068()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_069
     * @tc.name    TestArkUICapi_069
     * @tc.desc    Case: TestArkUICapi_069. API: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_BUILDER. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_069', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_069()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_070
     * @tc.name    TestArkUICapi_070
     * @tc.desc    Case: TestArkUICapi_070. API: OH_ARKUI_TEXT_EDITOR_SPAN_TYPE_DEFAULT. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_070', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_070()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_071
     * @tc.name    TestArkUICapi_071
     * @tc.desc    Case: TestArkUICapi_071. API: OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_RIGHT_CLICK. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_071', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_071()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_072
     * @tc.name    TestArkUICapi_072
     * @tc.desc    Case: TestArkUICapi_072. API: OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_LONG_PRESS. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_072', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_072()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_073
     * @tc.name    TestArkUICapi_073
     * @tc.desc    Case: TestArkUICapi_073. API: OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_SELECT. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_073', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_073()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_074
     * @tc.name    TestArkUICapi_074
     * @tc.desc    Case: TestArkUICapi_074. API: OH_ARKUI_TEXT_EDITOR_RESPONSE_TYPE_DEFAULT. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_074', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_074()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_075
     * @tc.name    TestArkUICapi_075
     * @tc.desc    Case: TestArkUICapi_075. API: OH_ARKUI_TEXT_EDITOR_SELECTION_MENU. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_075', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_075()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_076
     * @tc.name    TestArkUICapi_076
     * @tc.desc    Case: TestArkUICapi_076. API: OH_ARKUI_TEXT_EDITOR_PREVIEW_MENU. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_076', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_076()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_077
     * @tc.name    TestArkUICapi_077
     * @tc.desc    Case: TestArkUICapi_077. API: OH_ARKUI_LINE_BREAK_STRATEGY_GREEDY. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_077', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_077()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_078
     * @tc.name    TestArkUICapi_078
     * @tc.desc    Case: TestArkUICapi_078. API: OH_ARKUI_LINE_BREAK_STRATEGY_HIGH_QUALITY. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_078', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_078()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_079
     * @tc.name    TestArkUICapi_079
     * @tc.desc    Case: TestArkUICapi_079. API: OH_ARKUI_LINE_BREAK_STRATEGY_BALANCE. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_079', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_079()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_080
     * @tc.name    TestArkUICapi_080
     * @tc.desc    Case: TestArkUICapi_080. API: OH_ArkUI_DecorationStyleOptions_Create. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_080', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_080()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_081
     * @tc.name    TestArkUICapi_081
     * @tc.desc    Case: TestArkUICapi_081. API: OH_ArkUI_DecorationStyleOptions_Destroy,
     *             OH_ArkUI_DecorationStyleOptions_Create. Note: non-ASCII details are in the workbook and native C++
     *             comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_081', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_081()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_082
     * @tc.name    TestArkUICapi_082
     * @tc.desc    Case: TestArkUICapi_082. API: OH_ArkUI_DecorationStyleOptions_SetTextDecorationType,
     *             OH_ArkUI_DecorationStyleOptions, ArkUI_TextDecorationType, OH_ArkUI_DecorationStyleOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_082', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_082()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_083
     * @tc.name    TestArkUICapi_083
     * @tc.desc    Case: TestArkUICapi_083. API: OH_ArkUI_DecorationStyleOptions_GetTextDecorationType,
     *             OH_ArkUI_DecorationStyleOptions, ArkUI_TextDecorationType, OH_ArkUI_DecorationStyleOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_083', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_083()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_084
     * @tc.name    TestArkUICapi_084
     * @tc.desc    Case: TestArkUICapi_084. API: OH_ArkUI_DecorationStyleOptions_SetColor,
     *             OH_ArkUI_DecorationStyleOptions, OH_ArkUI_DecorationStyleOptions_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_084', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_084()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_085
     * @tc.name    TestArkUICapi_085
     * @tc.desc    Case: TestArkUICapi_085. API: OH_ArkUI_DecorationStyleOptions_GetColor,
     *             OH_ArkUI_DecorationStyleOptions, OH_ArkUI_DecorationStyleOptions_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_085', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_085()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_086
     * @tc.name    TestArkUICapi_086
     * @tc.desc    Case: TestArkUICapi_086. API: OH_ArkUI_DecorationStyleOptions_SetTextDecorationStyle,
     *             OH_ArkUI_DecorationStyleOptions, ArkUI_TextDecorationStyle, OH_ArkUI_DecorationStyleOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_086', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_086()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_087
     * @tc.name    TestArkUICapi_087
     * @tc.desc    Case: TestArkUICapi_087. API: OH_ArkUI_DecorationStyleOptions_GetTextDecorationStyle,
     *             OH_ArkUI_DecorationStyleOptions, ArkUI_TextDecorationStyle, OH_ArkUI_DecorationStyleOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_087', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_087()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_088
     * @tc.name    TestArkUICapi_088
     * @tc.desc    Case: TestArkUICapi_088. API: OH_ArkUI_DecorationStyleOptions_SetThicknessScale,
     *             OH_ArkUI_DecorationStyleOptions, OH_ArkUI_DecorationStyleOptions_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_088', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_088()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_089
     * @tc.name    TestArkUICapi_089
     * @tc.desc    Case: TestArkUICapi_089. API: OH_ArkUI_DecorationStyleOptions_GetThicknessScale,
     *             OH_ArkUI_DecorationStyleOptions, OH_ArkUI_DecorationStyleOptions_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_089', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_089()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_090
     * @tc.name    TestArkUICapi_090
     * @tc.desc    Case: TestArkUICapi_090. API: OH_ArkUI_TextDataDetectorConfig_Create. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_090', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_090()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_091
     * @tc.name    TestArkUICapi_091
     * @tc.desc    Case: TestArkUICapi_091. API: OH_ArkUI_TextDataDetectorConfig_Destroy,
     *             OH_ArkUI_TextDataDetectorConfig_Create. Note: non-ASCII details are in the workbook and native C++
     *             comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_091', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_091()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_092
     * @tc.name    TestArkUICapi_092
     * @tc.desc    Case: TestArkUICapi_092. API: OH_ArkUI_TextDataDetectorConfig_SetTypes,
     *             OH_ArkUI_TextDataDetectorConfig, ArkUI_TextDataDetectorType, OH_ArkUI_TextDataDetectorConfig_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_092', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_092()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_093
     * @tc.name    TestArkUICapi_093
     * @tc.desc    Case: TestArkUICapi_093. API: OH_ArkUI_TextDataDetectorConfig_GetTypes,
     *             OH_ArkUI_TextDataDetectorConfig, ArkUI_TextDataDetectorType, OH_ArkUI_TextDataDetectorConfig_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_093', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_093()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_094
     * @tc.name    TestArkUICapi_094
     * @tc.desc    Case: TestArkUICapi_094. API: OH_ArkUI_TextDataDetectorConfig_RegisterOnDetectResultUpdateCallback,
     *             OH_ArkUI_TextDataDetectorConfig, OH_ArkUI_TextDataDetectorConfig_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_094', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_094()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_095
     * @tc.name    TestArkUICapi_095
     * @tc.desc    Case: TestArkUICapi_095. API: OH_ArkUI_TextDataDetectorConfig_SetColor,
     *             OH_ArkUI_TextDataDetectorConfig, OH_ArkUI_TextDataDetectorConfig_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_095', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_095()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_096
     * @tc.name    TestArkUICapi_096
     * @tc.desc    Case: TestArkUICapi_096. API: OH_ArkUI_TextDataDetectorConfig_GetColor,
     *             OH_ArkUI_TextDataDetectorConfig, OH_ArkUI_TextDataDetectorConfig_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_096', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_096()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_097
     * @tc.name    TestArkUICapi_097
     * @tc.desc    Case: TestArkUICapi_097. API: OH_ArkUI_TextDataDetectorConfig_SetDecorationStyleOptions,
     *             OH_ArkUI_TextDataDetectorConfig, OH_ArkUI_DecorationStyleOptions,
     *             OH_ArkUI_TextDataDetectorConfig_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_097', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_097()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_098
     * @tc.name    TestArkUICapi_098
     * @tc.desc    Case: TestArkUICapi_098. API: OH_ArkUI_TextDataDetectorConfig_GetDecorationStyleOptions,
     *             OH_ArkUI_TextDataDetectorConfig, OH_ArkUI_DecorationStyleOptions,
     *             OH_ArkUI_TextDataDetectorConfig_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_098', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_098()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_099
     * @tc.name    TestArkUICapi_099
     * @tc.desc    Case: TestArkUICapi_099. API: OH_ArkUI_TextDataDetectorConfig_SetEnablePreviewMenu,
     *             OH_ArkUI_TextDataDetectorConfig, OH_ArkUI_TextDataDetectorConfig_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_099', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_099()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_100
     * @tc.name    TestArkUICapi_100
     * @tc.desc    Case: TestArkUICapi_100. API: OH_ArkUI_TextDataDetectorConfig_GetEnablePreviewMenu,
     *             OH_ArkUI_TextDataDetectorConfig, OH_ArkUI_TextDataDetectorConfig_Create, ARKUI_ERROR_CODE_NO_ERROR.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_100', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_100()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_101
     * @tc.name    TestArkUICapi_101
     * @tc.desc    Case: TestArkUICapi_101. API: OH_ArkUI_TextEditorPlaceholderOptions_Create. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_101', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_101()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_102
     * @tc.name    TestArkUICapi_102
     * @tc.desc    Case: TestArkUICapi_102. API: OH_ArkUI_TextEditorPlaceholderOptions_Destroy,
     *             OH_ArkUI_TextEditorPlaceholderOptions_Create. Note: non-ASCII details are in the workbook and native
     *             C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_102', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_102()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_103
     * @tc.name    TestArkUICapi_103
     * @tc.desc    Case: TestArkUICapi_103. API: OH_ArkUI_TextEditorPlaceholderOptions_SetValue,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_103', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_103()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_104
     * @tc.name    TestArkUICapi_104
     * @tc.desc    Case: TestArkUICapi_104. API: OH_ArkUI_TextEditorPlaceholderOptions_GetValue,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_104', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_104()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_105
     * @tc.name    TestArkUICapi_105
     * @tc.desc    Case: TestArkUICapi_105. API: OH_ArkUI_TextEditorPlaceholderOptions_SetFontSize,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_105', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_105()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_106
     * @tc.name    TestArkUICapi_106
     * @tc.desc    Case: TestArkUICapi_106. API: OH_ArkUI_TextEditorPlaceholderOptions_GetFontSize,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_106', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_106()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_107
     * @tc.name    TestArkUICapi_107
     * @tc.desc    Case: TestArkUICapi_107. API: OH_ArkUI_TextEditorPlaceholderOptions_SetFontWeight,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_107', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_107()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_108
     * @tc.name    TestArkUICapi_108
     * @tc.desc    Case: TestArkUICapi_108. API: OH_ArkUI_TextEditorPlaceholderOptions_GetFontWeight,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_108', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_108()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_109
     * @tc.name    TestArkUICapi_109
     * @tc.desc    Case: TestArkUICapi_109. API: OH_ArkUI_TextEditorPlaceholderOptions_SetFontFamily,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_109', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_109()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_110
     * @tc.name    TestArkUICapi_110
     * @tc.desc    Case: TestArkUICapi_110. API: OH_ArkUI_TextEditorPlaceholderOptions_GetFontFamily,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_110', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_110()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_111
     * @tc.name    TestArkUICapi_111
     * @tc.desc    Case: TestArkUICapi_111. API: OH_ArkUI_TextEditorPlaceholderOptions_SetFontStyle,
     *             OH_ArkUI_TextEditorPlaceholderOptions, ArkUI_FontStyle, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_111', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_111()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_112
     * @tc.name    TestArkUICapi_112
     * @tc.desc    Case: TestArkUICapi_112. API: OH_ArkUI_TextEditorPlaceholderOptions_GetFontStyle,
     *             OH_ArkUI_TextEditorPlaceholderOptions, ArkUI_FontStyle, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_112', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_112()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_113
     * @tc.name    TestArkUICapi_113
     * @tc.desc    Case: TestArkUICapi_113. API: OH_ArkUI_TextEditorPlaceholderOptions_SetFontColor,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_113', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_113()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_114
     * @tc.name    TestArkUICapi_114
     * @tc.desc    Case: TestArkUICapi_114. API: OH_ArkUI_TextEditorPlaceholderOptions_GetFontColor,
     *             OH_ArkUI_TextEditorPlaceholderOptions, OH_ArkUI_TextEditorPlaceholderOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_114', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_114()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_115
     * @tc.name    TestArkUICapi_115
     * @tc.desc    Case: TestArkUICapi_115. API: OH_ArkUI_TextEditorStyledStringController_Create. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_115', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_115()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_116
     * @tc.name    TestArkUICapi_116
     * @tc.desc    Case: TestArkUICapi_116. API: OH_ArkUI_TextEditorStyledStringController_Destroy,
     *             OH_ArkUI_TextEditorStyledStringController_Create. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_116', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_116()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_117
     * @tc.name    TestArkUICapi_117
     * @tc.desc    Case: TestArkUICapi_117. API: OH_ArkUI_TextEditorStyledStringController_SetCaretOffset,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorStyledStringController_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_117', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_117()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_118
     * @tc.name    TestArkUICapi_118
     * @tc.desc    Case: TestArkUICapi_118. API: OH_ArkUI_TextEditorStyledStringController_GetCaretOffset,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorStyledStringController_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_118', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_118()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_119
     * @tc.name    TestArkUICapi_119
     * @tc.desc    Case: TestArkUICapi_119. API: OH_ArkUI_TextEditorStyledStringController_SetSelection,
     *             OH_ArkUI_TextEditorStyledStringController, ArkUI_MenuPolicy,
     *             OH_ArkUI_TextEditorStyledStringController_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_119', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_119()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_120
     * @tc.name    TestArkUICapi_120
     * @tc.desc    Case: TestArkUICapi_120. API: OH_ArkUI_TextEditorStyledStringController_IsEditing,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorStyledStringController_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_120', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_120()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_121
     * @tc.name    TestArkUICapi_121
     * @tc.desc    Case: TestArkUICapi_121. API: OH_ArkUI_TextEditorStyledStringController_StopEditing,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorStyledStringController_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_121', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_121()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_122
     * @tc.name    TestArkUICapi_122
     * @tc.desc    Case: TestArkUICapi_122. API: OH_ArkUI_TextEditorStyledStringController_GetPreviewText,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorStyledStringController_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_122', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_122()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_123
     * @tc.name    TestArkUICapi_123
     * @tc.desc    Case: TestArkUICapi_123. API: OH_ArkUI_TextEditorStyledStringController_GetCaretRect,
     *             OH_ArkUI_TextEditorStyledStringController, ArkUI_Rect,
     *             OH_ArkUI_TextEditorStyledStringController_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_123', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_123()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_124
     * @tc.name    TestArkUICapi_124
     * @tc.desc    Case: TestArkUICapi_124. API: OH_ArkUI_TextEditorStyledStringController_DeleteBackward,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorStyledStringController_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_124', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_124()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_125
     * @tc.name    TestArkUICapi_125
     * @tc.desc    Case: TestArkUICapi_125. API: OH_ArkUI_TextEditorParagraphStyle_Create. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_125', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_125()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_126
     * @tc.name    TestArkUICapi_126
     * @tc.desc    Case: TestArkUICapi_126. API: OH_ArkUI_TextEditorParagraphStyle_Destroy,
     *             OH_ArkUI_TextEditorParagraphStyle_Create. Note: non-ASCII details are in the workbook and native C++
     *             comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_126', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_126()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_127
     * @tc.name    TestArkUICapi_127
     * @tc.desc    Case: TestArkUICapi_127. API: OH_ArkUI_TextEditorParagraphStyle_SetTextAlign,
     *             OH_ArkUI_TextEditorParagraphStyle, ArkUI_TextAlignment, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_127', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_127()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_128
     * @tc.name    TestArkUICapi_128
     * @tc.desc    Case: TestArkUICapi_128. API: OH_ArkUI_TextEditorParagraphStyle_GetTextAlign,
     *             OH_ArkUI_TextEditorParagraphStyle, ArkUI_TextAlignment, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_128', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_128()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_129
     * @tc.name    TestArkUICapi_129
     * @tc.desc    Case: TestArkUICapi_129. API: OH_ArkUI_TextEditorParagraphStyle_SetLeadingMarginPixelMap,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_PixelmapNative, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_129', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_129()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_130
     * @tc.name    TestArkUICapi_130
     * @tc.desc    Case: TestArkUICapi_130. API: OH_ArkUI_TextEditorParagraphStyle_GetLeadingMarginPixelMap,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_PixelmapNative, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_130', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_130()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_131
     * @tc.name    TestArkUICapi_131
     * @tc.desc    Case: TestArkUICapi_131. API: OH_ArkUI_TextEditorParagraphStyle_SetLeadingMarginWidth,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_131', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_131()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_132
     * @tc.name    TestArkUICapi_132
     * @tc.desc    Case: TestArkUICapi_132. API: OH_ArkUI_TextEditorParagraphStyle_GetLeadingMarginWidth,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_132', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_132()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_133
     * @tc.name    TestArkUICapi_133
     * @tc.desc    Case: TestArkUICapi_133. API: OH_ArkUI_TextEditorParagraphStyle_SetLeadingMarginHeight,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_133', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_133()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_134
     * @tc.name    TestArkUICapi_134
     * @tc.desc    Case: TestArkUICapi_134. API: OH_ArkUI_TextEditorParagraphStyle_GetLeadingMarginHeight,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_134', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_134()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_135
     * @tc.name    TestArkUICapi_135
     * @tc.desc    Case: TestArkUICapi_135. API: OH_ArkUI_TextEditorParagraphStyle_SetWordBreak,
     *             OH_ArkUI_TextEditorParagraphStyle, ArkUI_WordBreak, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_135', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_135()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_136
     * @tc.name    TestArkUICapi_136
     * @tc.desc    Case: TestArkUICapi_136. API: OH_ArkUI_TextEditorParagraphStyle_GetWordBreak,
     *             OH_ArkUI_TextEditorParagraphStyle, ArkUI_WordBreak, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_136', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_136()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_137
     * @tc.name    TestArkUICapi_137
     * @tc.desc    Case: TestArkUICapi_137. API: OH_ArkUI_TextEditorParagraphStyle_SetLineBreakStrategy,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_ArkUI_LineBreakStrategy,
     *             OH_ArkUI_TextEditorParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_137', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_137()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_138
     * @tc.name    TestArkUICapi_138
     * @tc.desc    Case: TestArkUICapi_138. API: OH_ArkUI_TextEditorParagraphStyle_GetLineBreakStrategy,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_ArkUI_LineBreakStrategy,
     *             OH_ArkUI_TextEditorParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_138', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_138()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_139
     * @tc.name    TestArkUICapi_139
     * @tc.desc    Case: TestArkUICapi_139. API: OH_ArkUI_TextEditorParagraphStyle_SetParagraphSpacing,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_139', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_139()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_140
     * @tc.name    TestArkUICapi_140
     * @tc.desc    Case: TestArkUICapi_140. API: OH_ArkUI_TextEditorParagraphStyle_GetParagraphSpacing,
     *             OH_ArkUI_TextEditorParagraphStyle, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_140', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_140()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_141
     * @tc.name    TestArkUICapi_141
     * @tc.desc    Case: TestArkUICapi_141. API: OH_ArkUI_TextEditorParagraphStyle_SetTextVerticalAlign,
     *             OH_ArkUI_TextEditorParagraphStyle, ArkUI_TextVerticalAlignment,
     *             OH_ArkUI_TextEditorParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_141', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_141()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_142
     * @tc.name    TestArkUICapi_142
     * @tc.desc    Case: TestArkUICapi_142. API: OH_ArkUI_TextEditorParagraphStyle_GetTextVerticalAlign,
     *             OH_ArkUI_TextEditorParagraphStyle, ArkUI_TextVerticalAlignment,
     *             OH_ArkUI_TextEditorParagraphStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_142', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_142()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_143
     * @tc.name    TestArkUICapi_143
     * @tc.desc    Case: TestArkUICapi_143. API: OH_ArkUI_TextEditorParagraphStyle_SetTextDirection,
     *             OH_ArkUI_TextEditorParagraphStyle, ArkUI_TextDirection, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_143', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_143()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_144
     * @tc.name    TestArkUICapi_144
     * @tc.desc    Case: TestArkUICapi_144. API: OH_ArkUI_TextEditorParagraphStyle_GetTextDirection,
     *             OH_ArkUI_TextEditorParagraphStyle, ArkUI_TextDirection, OH_ArkUI_TextEditorParagraphStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_144', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_144()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_145
     * @tc.name    TestArkUICapi_145
     * @tc.desc    Case: TestArkUICapi_145. API: OH_ArkUI_TextEditorStyledStringController_SetTypingParagraphStyle,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorParagraphStyle,
     *             OH_ArkUI_TextEditorStyledStringController_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_145', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_145()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_146
     * @tc.name    TestArkUICapi_146
     * @tc.desc    Case: TestArkUICapi_146. API: OH_ArkUI_ShadowOptions_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_146', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_146()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_147
     * @tc.name    TestArkUICapi_147
     * @tc.desc    Case: TestArkUICapi_147. API: OH_ArkUI_ShadowOptions_Destroy, OH_ArkUI_ShadowOptions_Create. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_147', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_147()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_148
     * @tc.name    TestArkUICapi_148
     * @tc.desc    Case: TestArkUICapi_148. API: OH_ArkUI_ShadowOptions_SetRadius, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_148', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_148()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_149
     * @tc.name    TestArkUICapi_149
     * @tc.desc    Case: TestArkUICapi_149. API: OH_ArkUI_ShadowOptions_GetRadius, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_149', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_149()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_150
     * @tc.name    TestArkUICapi_150
     * @tc.desc    Case: TestArkUICapi_150. API: OH_ArkUI_ShadowOptions_SetType, OH_ArkUI_ShadowOptions,
     *             ArkUI_ShadowType, OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_150', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_150()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_151
     * @tc.name    TestArkUICapi_151
     * @tc.desc    Case: TestArkUICapi_151. API: OH_ArkUI_ShadowOptions_GetType, OH_ArkUI_ShadowOptions,
     *             ArkUI_ShadowType, OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_151', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_151()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_152
     * @tc.name    TestArkUICapi_152
     * @tc.desc    Case: TestArkUICapi_152. API: OH_ArkUI_ShadowOptions_SetColor, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_152', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_152()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_153
     * @tc.name    TestArkUICapi_153
     * @tc.desc    Case: TestArkUICapi_153. API: OH_ArkUI_ShadowOptions_GetColor, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_153', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_153()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_154
     * @tc.name    TestArkUICapi_154
     * @tc.desc    Case: TestArkUICapi_154. API: OH_ArkUI_ShadowOptions_SetOffsetX, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_154', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_154()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_155
     * @tc.name    TestArkUICapi_155
     * @tc.desc    Case: TestArkUICapi_155. API: OH_ArkUI_ShadowOptions_GetOffsetX, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_155', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_155()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_156
     * @tc.name    TestArkUICapi_156
     * @tc.desc    Case: TestArkUICapi_156. API: OH_ArkUI_ShadowOptions_SetOffsetY, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_156', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_156()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_157
     * @tc.name    TestArkUICapi_157
     * @tc.desc    Case: TestArkUICapi_157. API: OH_ArkUI_ShadowOptions_GetOffsetY, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_157', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_157()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_158
     * @tc.name    TestArkUICapi_158
     * @tc.desc    Case: TestArkUICapi_158. API: OH_ArkUI_ShadowOptions_SetFill, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_158', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_158()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_159
     * @tc.name    TestArkUICapi_159
     * @tc.desc    Case: TestArkUICapi_159. API: OH_ArkUI_ShadowOptions_GetFill, OH_ArkUI_ShadowOptions,
     *             OH_ArkUI_ShadowOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_159', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_159()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_160
     * @tc.name    TestArkUICapi_160
     * @tc.desc    Case: TestArkUICapi_160. API: OH_ArkUI_TextEditorTextStyle_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_160', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_160()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_161
     * @tc.name    TestArkUICapi_161
     * @tc.desc    Case: TestArkUICapi_161. API: OH_ArkUI_TextEditorTextStyle_Destroy,
     *             OH_ArkUI_TextEditorTextStyle_Create. Note: non-ASCII details are in the workbook and native C++
     *             comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_161', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_161()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_162
     * @tc.name    TestArkUICapi_162
     * @tc.desc    Case: TestArkUICapi_162. API: OH_ArkUI_TextEditorTextStyle_SetFontColor,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_162', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_162()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_163
     * @tc.name    TestArkUICapi_163
     * @tc.desc    Case: TestArkUICapi_163. API: OH_ArkUI_TextEditorTextStyle_GetFontColor,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_163', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_163()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_164
     * @tc.name    TestArkUICapi_164
     * @tc.desc    Case: TestArkUICapi_164. API: OH_ArkUI_TextEditorTextStyle_SetFontSize, OH_ArkUI_TextEditorTextStyle,
     *             OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_164', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_164()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_165
     * @tc.name    TestArkUICapi_165
     * @tc.desc    Case: TestArkUICapi_165. API: OH_ArkUI_TextEditorTextStyle_GetFontSize, OH_ArkUI_TextEditorTextStyle,
     *             OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_165', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_165()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_166
     * @tc.name    TestArkUICapi_166
     * @tc.desc    Case: TestArkUICapi_166. API: OH_ArkUI_TextEditorTextStyle_SetFontStyle,
     *             OH_ArkUI_TextEditorTextStyle, ArkUI_FontStyle, OH_ArkUI_TextEditorTextStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_166', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_166()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_167
     * @tc.name    TestArkUICapi_167
     * @tc.desc    Case: TestArkUICapi_167. API: OH_ArkUI_TextEditorTextStyle_GetFontStyle,
     *             OH_ArkUI_TextEditorTextStyle, ArkUI_FontStyle, OH_ArkUI_TextEditorTextStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_167', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_167()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_168
     * @tc.name    TestArkUICapi_168
     * @tc.desc    Case: TestArkUICapi_168. API: OH_ArkUI_TextEditorTextStyle_SetFontWeight,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_168', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_168()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_169
     * @tc.name    TestArkUICapi_169
     * @tc.desc    Case: TestArkUICapi_169. API: OH_ArkUI_TextEditorTextStyle_GetFontWeight,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_169', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_169()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_170
     * @tc.name    TestArkUICapi_170
     * @tc.desc    Case: TestArkUICapi_170. API: OH_ArkUI_TextEditorTextStyle_SetFontFamily,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_170', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_170()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_171
     * @tc.name    TestArkUICapi_171
     * @tc.desc    Case: TestArkUICapi_171. API: OH_ArkUI_TextEditorTextStyle_GetFontFamily,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_171', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_171()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_172
     * @tc.name    TestArkUICapi_172
     * @tc.desc    Case: TestArkUICapi_172. API: OH_ArkUI_TextEditorTextStyle_SetDecoration,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_DecorationStyleOptions, OH_ArkUI_TextEditorTextStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_172', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_172()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_173
     * @tc.name    TestArkUICapi_173
     * @tc.desc    Case: TestArkUICapi_173. API: OH_ArkUI_TextEditorTextStyle_GetDecoration,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_DecorationStyleOptions, OH_ArkUI_TextEditorTextStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_173', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_173()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_174
     * @tc.name    TestArkUICapi_174
     * @tc.desc    Case: TestArkUICapi_174. API: OH_ArkUI_TextEditorTextStyle_SetTextShadows,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_ShadowOptions, OH_ArkUI_TextEditorTextStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_174', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_174()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_175
     * @tc.name    TestArkUICapi_175
     * @tc.desc    Case: TestArkUICapi_175. API: OH_ArkUI_TextEditorTextStyle_GetTextShadows,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_ShadowOptions, OH_ArkUI_TextEditorTextStyle_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_175', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_175()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_176
     * @tc.name    TestArkUICapi_176
     * @tc.desc    Case: TestArkUICapi_176. API: OH_ArkUI_TextEditorTextStyle_SetLineHeight,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_176', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_176()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_177
     * @tc.name    TestArkUICapi_177
     * @tc.desc    Case: TestArkUICapi_177. API: OH_ArkUI_TextEditorTextStyle_GetLineHeight,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_177', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_177()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_178
     * @tc.name    TestArkUICapi_178
     * @tc.desc    Case: TestArkUICapi_178. API: OH_ArkUI_TextEditorTextStyle_SetLetterSpacing,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_178', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_178()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_179
     * @tc.name    TestArkUICapi_179
     * @tc.desc    Case: TestArkUICapi_179. API: OH_ArkUI_TextEditorTextStyle_GetLetterSpacing,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_179', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_179()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_180
     * @tc.name    TestArkUICapi_180
     * @tc.desc    Case: TestArkUICapi_180. API: OH_ArkUI_TextEditorTextStyle_SetFontFeature,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_180', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_180()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_181
     * @tc.name    TestArkUICapi_181
     * @tc.desc    Case: TestArkUICapi_181. API: OH_ArkUI_TextEditorTextStyle_GetFontFeature,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_181', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_181()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_182
     * @tc.name    TestArkUICapi_182
     * @tc.desc    Case: TestArkUICapi_182. API: OH_ArkUI_TextEditorTextStyle_SetHalfLeading,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_182', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_182()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_183
     * @tc.name    TestArkUICapi_183
     * @tc.desc    Case: TestArkUICapi_183. API: OH_ArkUI_TextEditorTextStyle_GetHalfLeading,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_183', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_183()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_184
     * @tc.name    TestArkUICapi_184
     * @tc.desc    Case: TestArkUICapi_184. API: OH_ArkUI_TextEditorTextStyle_SetTextBackgroundColor,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_184', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_184()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_185
     * @tc.name    TestArkUICapi_185
     * @tc.desc    Case: TestArkUICapi_185. API: OH_ArkUI_TextEditorTextStyle_GetTextBackgroundColor,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_185', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_185()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_186
     * @tc.name    TestArkUICapi_186
     * @tc.desc    Case: TestArkUICapi_186. API: OH_ArkUI_TextEditorTextStyle_SetTextBackgroundRadius,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_186', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_186()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_187
     * @tc.name    TestArkUICapi_187
     * @tc.desc    Case: TestArkUICapi_187. API: OH_ArkUI_TextEditorTextStyle_GetTextBackgroundRadius,
     *             OH_ArkUI_TextEditorTextStyle, OH_ArkUI_TextEditorTextStyle_Create, ARKUI_ERROR_CODE_NO_ERROR. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_187', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_187()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_188
     * @tc.name    TestArkUICapi_188
     * @tc.desc    Case: TestArkUICapi_188. API: OH_ArkUI_TextEditorStyledStringController_SetTypingStyle,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorTextStyle,
     *             OH_ArkUI_TextEditorStyledStringController_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_188', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_188()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_189
     * @tc.name    TestArkUICapi_189
     * @tc.desc    Case: TestArkUICapi_189. API: OH_ArkUI_TextEditorStyledStringController_GetTypingStyle,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorTextStyle,
     *             OH_ArkUI_TextEditorStyledStringController_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_189', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_189()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_190
     * @tc.name    TestArkUICapi_190
     * @tc.desc    Case: TestArkUICapi_190. API: OH_ArkUI_TextEditorSelectionMenuOptions_Create. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_190', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_190()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_191
     * @tc.name    TestArkUICapi_191
     * @tc.desc    Case: TestArkUICapi_191. API: OH_ArkUI_TextEditorSelectionMenuOptions_Destroy,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_191', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_191()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_192
     * @tc.name    TestArkUICapi_192
     * @tc.desc    Case: TestArkUICapi_192. API: OH_ArkUI_TextEditorSelectionMenuOptions_SetSpanType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextEditorSpanType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_192', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_192()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_193
     * @tc.name    TestArkUICapi_193
     * @tc.desc    Case: TestArkUICapi_193. API: OH_ArkUI_TextEditorSelectionMenuOptions_GetSpanType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextEditorSpanType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_193', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_193()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_194
     * @tc.name    TestArkUICapi_194
     * @tc.desc    Case: TestArkUICapi_194. API: OH_ArkUI_TextEditorSelectionMenuOptions_SetContentNode,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, ArkUI_NodeHandle,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_194', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_194()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_195
     * @tc.name    TestArkUICapi_195
     * @tc.desc    Case: TestArkUICapi_195. API: OH_ArkUI_TextEditorSelectionMenuOptions_GetContentNode,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, ArkUI_NodeHandle,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_195', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_195()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_196
     * @tc.name    TestArkUICapi_196
     * @tc.desc    Case: TestArkUICapi_196. API: OH_ArkUI_TextEditorSelectionMenuOptions_SetResponseType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextEditorResponseType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_196', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_196()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_197
     * @tc.name    TestArkUICapi_197
     * @tc.desc    Case: TestArkUICapi_197. API: OH_ArkUI_TextEditorSelectionMenuOptions_GetResponseType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextEditorResponseType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_197', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_197()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_198
     * @tc.name    TestArkUICapi_198
     * @tc.desc    Case: TestArkUICapi_198. API: OH_ArkUI_TextEditorSelectionMenuOptions_SetMenuType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextMenuType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_198', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_198()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_199
     * @tc.name    TestArkUICapi_199
     * @tc.desc    Case: TestArkUICapi_199. API: OH_ArkUI_TextEditorSelectionMenuOptions_GetMenuType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextMenuType,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_199', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_199()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_200
     * @tc.name    TestArkUICapi_200
     * @tc.desc    Case: TestArkUICapi_200. API: OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuShowCallback,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextEditorSelectionMenuOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_200', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_200()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_201
     * @tc.name    TestArkUICapi_201
     * @tc.desc    Case: TestArkUICapi_201. API: OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuHideCallback,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextEditorSelectionMenuOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_201', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_201()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_202
     * @tc.name    TestArkUICapi_202
     * @tc.desc    Case: TestArkUICapi_202. API: OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuAppearCallback,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextEditorSelectionMenuOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_202', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_202()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_203
     * @tc.name    TestArkUICapi_203
     * @tc.desc    Case: TestArkUICapi_203. API:
     *             OH_ArkUI_TextEditorSelectionMenuOptions_RegisterOnMenuDisappearCallback,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_TextEditorSelectionMenuOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_203', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_203()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_204
     * @tc.name    TestArkUICapi_204
     * @tc.desc    Case: TestArkUICapi_204. API: OH_ArkUI_TextEditorSelectionMenuOptions_SetHapticFeedbackMode,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_HapticFeedbackMode,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_204', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_204()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_205
     * @tc.name    TestArkUICapi_205
     * @tc.desc    Case: TestArkUICapi_205. API: OH_ArkUI_TextEditorSelectionMenuOptions_GetHapticFeedbackMode,
     *             OH_ArkUI_TextEditorSelectionMenuOptions, OH_ArkUI_HapticFeedbackMode,
     *             OH_ArkUI_TextEditorSelectionMenuOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_205', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_205()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_206
     * @tc.name    TestArkUICapi_206
     * @tc.desc    Case: TestArkUICapi_206. API: OH_ArkUI_TextEditorStyledStringController_CloseSelectionMenu,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorStyledStringController_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_206', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_206()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_207
     * @tc.name    TestArkUICapi_207
     * @tc.desc    Case: TestArkUICapi_207. API: OH_ArkUI_TextEditorStyledStringController_GetSelection,
     *             OH_ArkUI_TextEditorStyledStringController, OH_ArkUI_TextEditorStyledStringController_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_207', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_207()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_208
     * @tc.name    TestArkUICapi_208
     * @tc.desc    Case: TestArkUICapi_208. API: OH_ArkUI_TextEditorStyledStringController_SetStyledString,
     *             OH_ArkUI_TextEditorStyledStringController, ArkUI_StyledString_Descriptor,
     *             OH_ArkUI_TextEditorStyledStringController_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_208', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_208()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_209
     * @tc.name    TestArkUICapi_209
     * @tc.desc    Case: TestArkUICapi_209. API: OH_ArkUI_TextEditorStyledStringController_GetStyledString,
     *             OH_ArkUI_TextEditorStyledStringController, ArkUI_StyledString_Descriptor,
     *             OH_ArkUI_TextEditorStyledStringController_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_209', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_209()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_210
     * @tc.name    TestArkUICapi_210
     * @tc.desc    Case: TestArkUICapi_210. API: OH_ArkUI_TextEditorStyledStringController_SetStyledPlaceholder,
     *             OH_ArkUI_TextEditorStyledStringController, ArkUI_StyledString_Descriptor,
     *             OH_ArkUI_TextEditorStyledStringController_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_210', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_210()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_211
     * @tc.name    TestArkUICapi_211
     * @tc.desc    Case: TestArkUICapi_211. API: OH_ArkUI_Matrix4ScaleOptions_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_211', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_211()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_212
     * @tc.name    TestArkUICapi_212
     * @tc.desc    Case: TestArkUICapi_212. API: OH_ArkUI_Matrix4ScaleOptions_SetCenterY, ArkUI_Matrix4ScaleOptions,
     *             OH_ArkUI_Matrix4ScaleOptions_Create, ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_212', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_212()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_213
     * @tc.name    TestArkUICapi_213
     * @tc.desc    Case: TestArkUICapi_213. API: OH_ArkUI_Matrix4RotationOptions_Create. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_213', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_213()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_214
     * @tc.name    TestArkUICapi_214
     * @tc.desc    Case: TestArkUICapi_214. API: OH_ArkUI_Matrix4TranslationOptions_Create. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_214', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_214()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_215
     * @tc.name    TestArkUICapi_215
     * @tc.desc    Case: TestArkUICapi_215. API: OH_ArkUI_Matrix4TranslationOptions_SetZ,
     *             ArkUI_Matrix4TranslationOptions, OH_ArkUI_Matrix4TranslationOptions_Create,
     *             ARKUI_ERROR_CODE_NO_ERROR. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_215', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_215()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_216
     * @tc.name    TestArkUICapi_216
     * @tc.desc    Case: TestArkUICapi_216. API: OH_ArkUI_Matrix4_CreateIdentity. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_216', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_216()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_217
     * @tc.name    TestArkUICapi_217
     * @tc.desc    Case: TestArkUICapi_217. API: OH_ArkUI_Matrix4_CreateByElements. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_217', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_217()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_218
     * @tc.name    TestArkUICapi_218
     * @tc.desc    Case: TestArkUICapi_218. API: OH_ArkUI_Matrix4_Copy. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_218', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_218()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_219
     * @tc.name    TestArkUICapi_219
     * @tc.desc    Case: TestArkUICapi_219. API: OH_ArkUI_Matrix4_Invert. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_219', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_219()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_220
     * @tc.name    TestArkUICapi_220
     * @tc.desc    Case: TestArkUICapi_220. API: OH_ArkUI_Matrix4_Combine. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_220', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_220()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_221
     * @tc.name    TestArkUICapi_221
     * @tc.desc    Case: TestArkUICapi_221. API: OH_ArkUI_Matrix4_Translate. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_221', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_221()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_222
     * @tc.name    TestArkUICapi_222
     * @tc.desc    Case: TestArkUICapi_222. API: OH_ArkUI_Matrix4_Scale. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_222', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_222()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_223
     * @tc.name    TestArkUICapi_223
     * @tc.desc    Case: TestArkUICapi_223. API: OH_ArkUI_Matrix4_Rotate. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_223', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_223()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_224
     * @tc.name    TestArkUICapi_224
     * @tc.desc    Case: TestArkUICapi_224. API: OH_ArkUI_Matrix4_Skew. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_224', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_224()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_225
     * @tc.name    TestArkUICapi_225
     * @tc.desc    Case: TestArkUICapi_225. API: OH_ArkUI_Matrix4_TransformPoint, ArkUI_PointF. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_225', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_225()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_226
     * @tc.name    TestArkUICapi_226
     * @tc.desc    Case: TestArkUICapi_226. API: OH_ArkUI_Matrix4_SetPolyToPoly, ArkUI_PointF. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_226', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_226()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_227
     * @tc.name    TestArkUICapi_227
     * @tc.desc    Case: TestArkUICapi_227. API: OH_ArkUI_Matrix4_GetElements. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_227', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_227()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_228
     * @tc.name    TestArkUICapi_228
     * @tc.desc    Case: TestArkUICapi_228. API: OH_ArkUI_FontWeightConfigs_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_228', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_228()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_229
     * @tc.name    TestArkUICapi_229
     * @tc.desc    Case: TestArkUICapi_229. API: OH_ArkUI_FontWeightConfigs_Destroy, OH_ArkUI_FontWeightConfigs_Create.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_229', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_229()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_230
     * @tc.name    TestArkUICapi_230
     * @tc.desc    Case: TestArkUICapi_230. API: OH_ArkUI_FontWeightConfigs_SetEnableVariableFontWeight. Note: non-ASCII
     *             details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_230', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_230()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_231
     * @tc.name    TestArkUICapi_231
     * @tc.desc    Case: TestArkUICapi_231. API: OH_ArkUI_FontWeightConfigs_GetEnableVariableFontWeight,
     *             OH_ArkUI_FontWeightConfigs. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_231', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_231()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_232
     * @tc.name    TestArkUICapi_232
     * @tc.desc    Case: TestArkUICapi_232. API: OH_ArkUI_FontWeightConfigs_SetEnableDeviceFontWeightCategory. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_232', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_232()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_233
     * @tc.name    TestArkUICapi_233
     * @tc.desc    Case: TestArkUICapi_233. API: OH_ArkUI_FontWeightConfigs_GetEnableDeviceFontWeightCategory,
     *             OH_ArkUI_FontWeightConfigs. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_233', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_233()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_234
     * @tc.name    TestArkUICapi_234
     * @tc.desc    Case: TestArkUICapi_234. API: OH_ArkUI_FontConfigs_Create. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_234', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_234()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_235
     * @tc.name    TestArkUICapi_235
     * @tc.desc    Case: TestArkUICapi_235. API: OH_ArkUI_FontConfigs_Destroy, OH_ArkUI_FontConfigs_Create. Note:
     *             non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_235', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_235()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_236
     * @tc.name    TestArkUICapi_236
     * @tc.desc    Case: TestArkUICapi_236. API: OH_ArkUI_FontConfigs_SetFontWeightConfigs. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_236', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_236()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_237
     * @tc.name    TestArkUICapi_237
     * @tc.desc    Case: TestArkUICapi_237. API: OH_ArkUI_FontConfigs_GetFontWeightConfigs. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_237', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_237()).assertEqual(0)
      done()
    })

  });
}
