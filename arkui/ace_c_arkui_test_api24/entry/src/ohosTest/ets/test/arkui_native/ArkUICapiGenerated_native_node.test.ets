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


export default function arkuiNativeCapiNativeNode() {
  describe('NativeNode (native_node)', () => {
    beforeEach(async (done: Function) => {
      await Utils.sleep(50);
      done();
    });

    /**
     * @tc.number  TestArkUICapi_008
     * @tc.name    TestArkUICapi_008
     * @tc.desc    Case: TestArkUICapi_008. API: ARKUI_NODE_TEXT_EDITOR. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_008', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_008()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_009
     * @tc.name    TestArkUICapi_009
     * @tc.desc    Case: TestArkUICapi_009. API: NODE_SPAN_FONT. Note: non-ASCII details are in the workbook and native
     *             C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_009', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_009()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_010
     * @tc.name    TestArkUICapi_010
     * @tc.desc    Case: TestArkUICapi_010. API: NODE_SPAN_FONT_WEIGHT. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_010', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_010()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_011
     * @tc.name    TestArkUICapi_011
     * @tc.desc    Case: TestArkUICapi_011. API: NODE_TEXT_INPUT_ELLIPSIS_MODE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_011', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_011()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_012
     * @tc.name    TestArkUICapi_012
     * @tc.desc    Case: TestArkUICapi_012. API: NODE_TEXT_INPUT_TEXT_OVERFLOW. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_012', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_012()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_013
     * @tc.name    TestArkUICapi_013
     * @tc.desc    Case: TestArkUICapi_013. API: NODE_TEXT_AREA_ELLIPSIS_MODE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_013', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_013()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_014
     * @tc.name    TestArkUICapi_014
     * @tc.desc    Case: TestArkUICapi_014. API: NODE_TEXT_AREA_HORIZONTAL_SCROLLING. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_014', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_014()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_015
     * @tc.name    TestArkUICapi_015
     * @tc.desc    Case: TestArkUICapi_015. API: NODE_TEXT_AREA_TEXT_OVERFLOW. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_015', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_015()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_016
     * @tc.name    TestArkUICapi_016
     * @tc.desc    Case: TestArkUICapi_016. API: NODE_TEXT_EDITOR_ENTER_KEY_TYPE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_016', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_016()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_017
     * @tc.name    TestArkUICapi_017
     * @tc.desc    Case: TestArkUICapi_017. API: NODE_TEXT_EDITOR_CARET_COLOR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_017', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_017()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_018
     * @tc.name    TestArkUICapi_018
     * @tc.desc    Case: TestArkUICapi_018. API: NODE_TEXT_EDITOR_SCROLL_BAR_COLOR. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_018', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_018()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_019
     * @tc.name    TestArkUICapi_019
     * @tc.desc    Case: TestArkUICapi_019. API: NODE_TEXT_EDITOR_BAR_STATE. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_019', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_019()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_020
     * @tc.name    TestArkUICapi_020
     * @tc.desc    Case: TestArkUICapi_020. API: NODE_TEXT_EDITOR_ENABLE_DATA_DETECTOR. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_020', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_020()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_021
     * @tc.name    TestArkUICapi_021
     * @tc.desc    Case: TestArkUICapi_021. API: NODE_TEXT_EDITOR_DATA_DETECTOR_CONFIG. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_021', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_021()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_022
     * @tc.name    TestArkUICapi_022
     * @tc.desc    Case: TestArkUICapi_022. API: NODE_TEXT_EDITOR_EDIT_MENU_OPTIONS. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_022', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_022()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_023
     * @tc.name    TestArkUICapi_023
     * @tc.desc    Case: TestArkUICapi_023. API: NODE_TEXT_EDITOR_PLACEHOLDER. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_023', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_023()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_024
     * @tc.name    TestArkUICapi_024
     * @tc.desc    Case: TestArkUICapi_024. API: NODE_TEXT_EDITOR_STYLED_STRING_CONTROLLER. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_024', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_024()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_025
     * @tc.name    TestArkUICapi_025
     * @tc.desc    Case: TestArkUICapi_025. API: NODE_TEXT_EDITOR_ENABLE_PREVIEW_TEXT. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_025', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_025()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_026
     * @tc.name    TestArkUICapi_026
     * @tc.desc    Case: TestArkUICapi_026. API: NODE_TEXT_EDITOR_LAYOUT_MANAGER. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_026', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_026()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_027
     * @tc.name    TestArkUICapi_027
     * @tc.desc    Case: TestArkUICapi_027. API: NODE_TEXT_EDITOR_ENABLE_SELECTED_DATA_DETECTOR. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_027', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_027()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_028
     * @tc.name    TestArkUICapi_028
     * @tc.desc    Case: TestArkUICapi_028. API: NODE_TEXT_EDITOR_SELECTED_BACKGROUND_COLOR. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_028', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_028()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_029
     * @tc.name    TestArkUICapi_029
     * @tc.desc    Case: TestArkUICapi_029. API: NODE_TEXT_EDITOR_ENABLE_KEYBOARD_ON_FOCUS. Note: non-ASCII details are
     *             in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_029', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_029()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_030
     * @tc.name    TestArkUICapi_030
     * @tc.desc    Case: TestArkUICapi_030. API: NODE_TEXT_EDITOR_MAX_LENGTH. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_030', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_030()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_031
     * @tc.name    TestArkUICapi_031
     * @tc.desc    Case: TestArkUICapi_031. API: NODE_TEXT_EDITOR_MAX_LINES. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_031', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_031()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_032
     * @tc.name    TestArkUICapi_032
     * @tc.desc    Case: TestArkUICapi_032. API: NODE_TEXT_EDITOR_ENABLE_HAPTIC_FEEDBACK. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_032', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_032()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_033
     * @tc.name    TestArkUICapi_033
     * @tc.desc    Case: TestArkUICapi_033. API: NODE_TEXT_EDITOR_COPY_OPTIONS. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_033', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_033()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_034
     * @tc.name    TestArkUICapi_034
     * @tc.desc    Case: TestArkUICapi_034. API: NODE_TEXT_EDITOR_KEYBOARD_APPEARANCE. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_034', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_034()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_035
     * @tc.name    TestArkUICapi_035
     * @tc.desc    Case: TestArkUICapi_035. API: NODE_TEXT_EDITOR_STOP_BACK_PRESS. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_035', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_035()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_036
     * @tc.name    TestArkUICapi_036
     * @tc.desc    Case: TestArkUICapi_036. API: NODE_TEXT_EDITOR_ENABLE_AUTO_SPACING. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_036', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_036()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_037
     * @tc.name    TestArkUICapi_037
     * @tc.desc    Case: TestArkUICapi_037. API: NODE_TEXT_EDITOR_CUSTOM_KEYBOARD. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_037', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_037()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_038
     * @tc.name    TestArkUICapi_038
     * @tc.desc    Case: TestArkUICapi_038. API: NODE_TEXT_EDITOR_BIND_SELECTION_MENU. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_038', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_038()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_039
     * @tc.name    TestArkUICapi_039
     * @tc.desc    Case: TestArkUICapi_039. API: NODE_TEXT_EDITOR_INCLUDE_FONT_PADDING. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_039', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_039()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_040
     * @tc.name    TestArkUICapi_040
     * @tc.desc    Case: TestArkUICapi_040. API: NODE_TEXT_EDITOR_FALLBACK_LINE_SPACING. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_040', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_040()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_041
     * @tc.name    TestArkUICapi_041
     * @tc.desc    Case: TestArkUICapi_041. API: NODE_TEXT_EDITOR_COMPRESS_LEADING_PUNCTUATION. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_041', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_041()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_042
     * @tc.name    TestArkUICapi_042
     * @tc.desc    Case: TestArkUICapi_042. API: NODE_TEXT_EDITOR_SELECTED_DRAG_PREVIEW_STYLE. Note: non-ASCII details
     *             are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_042', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_042()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_043
     * @tc.name    TestArkUICapi_043
     * @tc.desc    Case: TestArkUICapi_043. API: NODE_TEXT_EDITOR_SINGLE_LINE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_043', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_043()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_044
     * @tc.name    TestArkUICapi_044
     * @tc.desc    Case: TestArkUICapi_044. API: NODE_ON_DIGITAL_CROWN. Note: non-ASCII details are in the workbook and
     *             native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_044', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_044()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_045
     * @tc.name    TestArkUICapi_045
     * @tc.desc    Case: TestArkUICapi_045. API: NODE_ON_CUSTOM_OVERFLOW_SCROLL. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_045', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_045()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_046
     * @tc.name    TestArkUICapi_046
     * @tc.desc    Case: TestArkUICapi_046. API: NODE_ON_STACK_OVERFLOW_SCROLL. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_046', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_046()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_047
     * @tc.name    TestArkUICapi_047
     * @tc.desc    Case: TestArkUICapi_047. API: NODE_ON_NEED_SOFTKEYBOARD. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_047', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_047()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_048
     * @tc.name    TestArkUICapi_048
     * @tc.desc    Case: TestArkUICapi_048. API: NODE_TEXT_EDITOR_ON_SELECTION_CHANGE. Note: non-ASCII details are in
     *             the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_048', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_048()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_049
     * @tc.name    TestArkUICapi_049
     * @tc.desc    Case: TestArkUICapi_049. API: NODE_TEXT_EDITOR_ON_READY. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_049', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_049()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_050
     * @tc.name    TestArkUICapi_050
     * @tc.desc    Case: TestArkUICapi_050. API: NODE_TEXT_EDITOR_ON_PASTE. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_050', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_050()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_051
     * @tc.name    TestArkUICapi_051
     * @tc.desc    Case: TestArkUICapi_051. API: NODE_TEXT_EDITOR_ON_EDITING_CHANGE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_051', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_051()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_052
     * @tc.name    TestArkUICapi_052
     * @tc.desc    Case: TestArkUICapi_052. API: NODE_TEXT_EDITOR_ON_SUBMIT. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_052', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_052()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_053
     * @tc.name    TestArkUICapi_053
     * @tc.desc    Case: TestArkUICapi_053. API: NODE_TEXT_EDITOR_ON_CUT. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_053', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_053()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_054
     * @tc.name    TestArkUICapi_054
     * @tc.desc    Case: TestArkUICapi_054. API: NODE_TEXT_EDITOR_ON_COPY. Note: non-ASCII details are in the workbook
     *             and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_054', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_054()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_055
     * @tc.name    TestArkUICapi_055
     * @tc.desc    Case: TestArkUICapi_055. API: NODE_TEXT_EDITOR_ON_WILL_CHANGE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_055', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_055()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_056
     * @tc.name    TestArkUICapi_056
     * @tc.desc    Case: TestArkUICapi_056. API: NODE_TEXT_EDITOR_ON_DID_CHANGE. Note: non-ASCII details are in the
     *             workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_056', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_056()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_057
     * @tc.name    TestArkUICapi_057
     * @tc.desc    Case: TestArkUICapi_057. API: OH_ArkUI_NodeEvent_GetTextEditorOnWillChangeEvent, NODE_ON_WILL_CHANGE.
     *             Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_057', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_057()).assertEqual(0)
      done()
    })

    /**
     * @tc.number  TestArkUICapi_058
     * @tc.name    TestArkUICapi_058
     * @tc.desc    Case: TestArkUICapi_058. API: OH_ArkUI_NativeModule_GetPageRootNodeHandleByContext,
     *             OH_ArkUI_GetContextFromNapiValue. Note: non-ASCII details are in the workbook and native C++ comments
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     */
    it('TestArkUICapi_058', Level.LEVEL1, async (done: Function) => {
      expect(arkuiCapiTest.TestArkUICapi_058()).assertEqual(0)
      done()
    })

  });
}
