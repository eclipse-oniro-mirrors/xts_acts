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

import { describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import nativexcomponent from 'libnativexcomponent.so';
import Utils from "../common/Utils";

export default function NodeAttribute() {
  describe('NodeAttribute', () => {
    /**
     * @tc.name   testCheckNodeTextHalfLeading
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_HALF_LEADING_0100
     * @tc.desc   Test get CheckNodeTextHalfLeading's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextHalfLeading', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_HALF_LEADING_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextHalfLeading();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_HALF_LEADING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextLineCount
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_LINE_COUNT_0100
     * @tc.desc   Test get CheckNodeTextLineCount's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextLineCount', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_LINE_COUNT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextLineCount();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_LINE_COUNT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextOptimizeTrailingSpace
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_OPTIMIZE_TRAILING_SPACE_0100
     * @tc.desc   Test get CheckNodeTextOptimizeTrailingSpace's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextOptimizeTrailingSpace', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_OPTIMIZE_TRAILING_SPACE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextOptimizeTrailingSpace();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_OPTIMIZE_TRAILING_SPACE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextLinearGradient
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_LINEAR_GRADIENT_0100
     * @tc.desc   Test get CheckNodeTextLinearGradient's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextLinearGradient', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_LINEAR_GRADIENT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextLinearGradient();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_LINEAR_GRADIENT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextRadialGradient
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_RADIAL_GRADIENT_0100
     * @tc.desc   Test get CheckNodeTextRadialGradient's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextRadialGradient', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_RADIAL_GRADIENT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextRadialGradient();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_RADIAL_GRADIENT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextVerticalAlign
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_VERTICAL_ALIGN_0100
     * @tc.desc   Test get CheckNodeTextVerticalAlign's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextVerticalAlign', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_VERTICAL_ALIGN_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextVerticalAlign();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_VERTICAL_ALIGN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextInputHalfLeading
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_HALF_LEADING_0100
     * @tc.desc   Test get CheckNodeTextInputHalfLeading's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextInputHalfLeading', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_HALF_LEADING_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextInputHalfLeading();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_HALF_LEADING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextInputKeyboardAppearance
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_KEYBOARD_APPEARANCE_0100
     * @tc.desc   Test get CheckNodeTextInputKeyboardAppearance's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextInputKeyboardAppearance', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_KEYBOARD_APPEARANCE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextInputKeyboardAppearance();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_KEYBOARD_APPEARANCE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextInputEnableFillAnimation
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_ENABLE_FILL_ANIMATION_0100
     * @tc.desc   Test get CheckNodeTextInputEnableFillAnimation's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextInputEnableFillAnimation', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_ENABLE_FILL_ANIMATION_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextInputEnableFillAnimation();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_ENABLE_FILL_ANIMATION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextInputLineHeight
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_LINE_HEIGHT_0100
     * @tc.desc   Test get CheckNodeTextInputLineHeight's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextInputLineHeight', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_LINE_HEIGHT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextInputLineHeight();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_INPUT_LINE_HEIGHT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextAreaInputFilter
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_INPUT_FILTER_0100
     * @tc.desc   Test get CheckNodeTextAreaInputFilter's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextAreaInputFilter', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_INPUT_FILTER_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextAreaInputFilter();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_INPUT_FILTER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextAreaContentType
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_CONTENT_TYPE_0100
     * @tc.desc   Test get CheckNodeTextAreaContentType's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextAreaContentType', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_CONTENT_TYPE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextAreaContentType();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_CONTENT_TYPE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextAreaHalfLeading
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_HALF_LEADING_0100
     * @tc.desc   Test get CheckNodeTextAreaHalfLeading's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextAreaHalfLeading', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_HALF_LEADING_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextAreaHalfLeading();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_HALF_LEADING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextAreaKeyboardAppearance
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_KEYBOARD_APPEARANCE_0100
     * @tc.desc   Test get CheckNodeTextAreaKeyboardAppearance's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextAreaKeyboardAppearance', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_KEYBOARD_APPEARANCE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextAreaKeyboardAppearance();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_KEYBOARD_APPEARANCE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextAreaMaxLines
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_MAX_LINES_0100
     * @tc.desc   Test get CheckNodeTextAreaMaxLines's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextAreaMaxLines', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_MAX_LINES_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextAreaMaxLines();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_MAX_LINES_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextAreaLineSpacing
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_LINE_SPACING_0100
     * @tc.desc   Test get CheckNodeTextAreaLineSpacing's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextAreaLineSpacing', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_LINE_SPACING_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextAreaLineSpacing();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_LINE_SPACING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextAreaMinLines
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_MIN_LINES_0100
     * @tc.desc   Test get CheckNodeTextAreaMinLines's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextAreaMinLines', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_MIN_LINES_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextAreaMinLines();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_MIN_LINES_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextAreaMaxLinesWithScroll
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_MAX_LINES_WITH_SCROLL_0100
     * @tc.desc   Test get CheckNodeTextAreaMaxLinesWithScroll's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextAreaMaxLinesWithScroll', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_MAX_LINES_WITH_SCROLL_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextAreaMaxLinesWithScroll();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_MAX_LINES_WITH_SCROLL_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextAreaLineHeight
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_LINE_HEIGHT_0100
     * @tc.desc   Test get CheckNodeTextAreaLineHeight's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextAreaLineHeight', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_LINE_HEIGHT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextAreaLineHeight();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_AREA_LINE_HEIGHT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTextPickSelectedBackgroundStyle
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_PICKER_SELECTED_BACKGROUND_STYLE_0100
     * @tc.desc   Test get CheckNodeTextPickSelectedBackgroundStyle's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTextPickSelectedBackgroundStyle', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_PICKER_SELECTED_BACKGROUND_STYLE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTextPickSelectedBackgroundStyle();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TEXT_PICKER_SELECTED_BACKGROUND_STYLE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeBorderWidthPercent
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BORDER_WIDTH_PERCENT_0100
     * @tc.desc   Test get CheckNodeBorderWidthPercent's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeBorderWidthPercent', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BORDER_WIDTH_PERCENT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeBorderWidthPercent();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BORDER_WIDTH_PERCENT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeUniqueId
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_UNIQUE_ID_0100
     * @tc.desc   Test get CheckNodeUniqueId's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeUniqueId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_UNIQUE_ID_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeUniqueId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_UNIQUE_ID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeFocusBox
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_FOCUS_BOX_0100
     * @tc.desc   Test get CheckNodeFocusBox's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeFocusBox', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_FOCUS_BOX_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeFocusBox();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_FOCUS_BOX_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeClickDistance
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CLICK_DISTANCE_0100
     * @tc.desc   Test get CheckNodeClickDistance's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeClickDistance', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CLICK_DISTANCE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeClickDistance();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CLICK_DISTANCE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTabStop
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TAB_STOP_0100
     * @tc.desc   Test get CheckNodeTabStop's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTabStop', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TAB_STOP_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTabStop();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TAB_STOP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeBackgroundImageResizableWithSlice
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE_0100
     * @tc.desc   Test get CheckNodeBackgroundImageResizableWithSlice's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeBackgroundImageResizableWithSlice', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeBackgroundImageResizableWithSlice();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BACKGROUND_IMAGE_RESIZABLE_WITH_SLICE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeNextFocus
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_NEXT_FOCUS_0100
     * @tc.desc   Test get CheckNodeNextFocus's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeNextFocus', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_NEXT_FOCUS_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeNextFocus();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_NEXT_FOCUS_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeVisibleAreaApproximateChangeRatio
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_VISIBLE_AREA_APPROXIMATE_CHANGE_RATIO_0100
     * @tc.desc   Test get CheckNodeVisibleAreaApproximateChangeRatio's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeVisibleAreaApproximateChangeRatio', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_` +
                     `NODE_VISIBLE_AREA_APPROXIMATE_CHANGE_RATIO_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeVisibleAreaApproximateChangeRatio();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_` +
                      `NODE_VISIBLE_AREA_APPROXIMATE_CHANGE_RATIO_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTranslateWidthPercent
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TRANSLATE_WITH_PERCENT_0100
     * @tc.desc   Test get CheckNodeTranslateWidthPercent's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTranslateWidthPercent', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_` +
                     `NODE_TRANSLATE_WITH_PERCENT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTranslateWidthPercent();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_` +
                      `NODE_TRANSLATE_WITH_PERCENT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeRotateAngle
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_ROTATE_ANGLE_0100
     * @tc.desc   Test get CheckNodeRotateAngle's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeRotateAngle', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_ROTATE_ANGLE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeRotateAngle();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_ROTATE_ANGLE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeImmutableFontWeight
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_IMMUTABLE_FONT_WEIGHT_0100
     * @tc.desc   Test get CheckNodeImmutableFontWeight's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeImmutableFontWeight', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_IMMUTABLE_FONT_WEIGHT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeImmutableFontWeight();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_IMMUTABLE_FONT_WEIGHT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeImageSpanBaselineOffset
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_IMAGE_SPAN_BASELINE_OFFSET_0100
     * @tc.desc   Test get CheckNodeImageSpanBaselineOffset's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeImageSpanBaselineOffset', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_IMAGE_SPAN_BASELINE_OFFSET_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeImageSpanBaselineOffset();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_IMAGE_SPAN_BASELINE_OFFSET_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeButtonMinFontScale
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BUTTON_MIN_FONT_SCALE_0100
     * @tc.desc   Test get CheckNodeButtonMinFontScale's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeButtonMinFontScale', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BUTTON_MIN_FONT_SCALE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeButtonMinFontScale();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BUTTON_MIN_FONT_SCALE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeButtonMaxFontScale
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BUTTON_MAX_FONT_SCALE_0100
     * @tc.desc   Test get CheckNodeButtonMaxFontScale's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeButtonMaxFontScale', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BUTTON_MAX_FONT_SCALE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeButtonMaxFontScale();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_BUTTON_MAX_FONT_SCALE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeXComponentSurfaceSize
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_XCOMPONENT_SURFACE_SIZE_0100
     * @tc.desc   Test get CheckNodeXComponentSurfaceSize's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeXComponentSurfaceSize', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_XCOMPONENT_S` +
                     `URFACE_SIZE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeXComponentSurfaceSize();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_XCOMPONENT_S` +
                      `URFACE_SIZE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeXComponentSurfaceRect
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_XCOMPONENT_SURFACE_RECT_0100
     * @tc.desc   Test get CheckNodeXComponentSurfaceRect's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeXComponentSurfaceRect', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_XCOMPONENT_S` +
          `URFACE_RECT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeXComponentSurfaceRect();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_XCOMPONENT_S` +
          `URFACE_RECT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeDatePickerCanLoop
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_DATE_PICKER_CAN_LOOP_0100
     * @tc.desc   Test get CheckNodeDatePickerCanLoop's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeDatePickerCanLoop', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_DATE_PICKER_CAN_LOOP_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeDatePickerCanLoop();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_DATE_PICKER_CAN_LOOP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTimePickerStart
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TIME_PICKER_START_0100
     * @tc.desc   Test get CheckNodeTimePickerStart's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTimePickerStart', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TIME_PICKER_START_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTimePickerStart();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TIME_PICKER_START_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeTimePickerEnd
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TIME_PICKER_END_0100
     * @tc.desc   Test get CheckNodeTimePickerEnd's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeTimePickerEnd', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TIME_PICKER_END_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeTimePickerEnd();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_TIME_PICKER_END_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeSliderPrefix
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SLIDER_PREFIX_0100
     * @tc.desc   Test get CheckNodeSliderPrefix's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeSliderPrefix', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SLIDER_PREFIX_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeSliderPrefix();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SLIDER_PREFIX_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeSliderSuffix
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SLIDER_SUFFIX_0100
     * @tc.desc   Test get CheckNodeSliderSuffix's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeSliderSuffix', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SLIDER_SUFFIX_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeSliderSuffix();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SLIDER_SUFFIX_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeCheckboxGroupSelectedColor
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_SELECTED_COLOR_0100
     * @tc.desc   Test get CheckNodeCheckboxGroupSelectedColor's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeCheckboxGroupSelectedColor', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_SELECTED_COLOR_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeCheckboxGroupSelectedColor();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_SELECTED_COLOR_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeCheckboxGroupUnselectedColor
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_UNSELECTED_COLOR_0100
     * @tc.desc   Test get CheckNodeCheckboxGroupUnselectedColor's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeCheckboxGroupUnselectedColor', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_UNSELECTED_COLOR_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeCheckboxGroupUnselectedColor();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_UNSELECTED_COLOR_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeCheckboxGroupMark
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_MARK_0100
     * @tc.desc   Test get CheckNodeCheckboxGroupMark's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeCheckboxGroupMark', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_MARK_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeCheckboxGroupMark();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_MARK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeCheckboxGroupShape
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_SHAPE_0100
     * @tc.desc   Test get CheckNodeCheckboxGroupShape's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeCheckboxGroupShape', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_SHAPE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeCheckboxGroupShape();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_CHECKBOX_GROUP_SHAPE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeScrollFling
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_FLING_0100
     * @tc.desc   Test get CheckNodeScrollFling's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeScrollFling', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_FLING_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeScrollFling();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_FLING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeScrollFadingEdge
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_FADING_EDGE_0100
     * @tc.desc   Test get CheckNodeScrollFadingEdge's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeScrollFadingEdge', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_FADING_EDGE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeScrollFadingEdge();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_FADING_EDGE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeScrollFlingSpeedLimit
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_FLING_SPEED_LIMIT_0100
     * @tc.desc   Test get CheckNodeScrollFlingSpeedLimit's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeScrollFlingSpeedLimit', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_FLING_SPEED_LIMIT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeScrollFlingSpeedLimit();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_FLING_SPEED_LIMIT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeScrollClipContent
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_CLIP_CONTENT_0100
     * @tc.desc   Test get CheckNodeScrollClipContent's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeScrollClipContent', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_CLIP_CONTENT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeScrollClipContent();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_CLIP_CONTENT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeScrollBarMargin
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_BAR_MARGIN_0100
     * @tc.desc   Test get CheckNodeScrollBarMargin's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeScrollBarMargin', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_BAR_MARGIN_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeScrollBarMargin();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SCROLL_BAR_MARGIN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeListStackFromEnd
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_LIST_STACK_FROM_END_0100
     * @tc.desc   Test get CheckNodeListStackFromEnd's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeListStackFromEnd', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_LIST_STACK_FROM_END_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeListStackFromEnd();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_LIST_STACK_FROM_END_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeListFocusWrapMode
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_LIST_FOCUS_WRAP_MODE_0100
     * @tc.desc   Test get CheckNodeListFocusWrapMode's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeListFocusWrapMode', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_LIST_FOCUS_WRAP_MODE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeListFocusWrapMode();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_LIST_FOCUS_WRAP_MODE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeSwiperIndicatorInteractive
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_INDICATOR_INTERACTIVE_0100
     * @tc.desc   Test get CheckNodeSwiperIndicatorInteractive's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeSwiperIndicatorInteractive', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_INDICATOR_INTERACTIVE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeSwiperIndicatorInteractive();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_INDICATOR_INTERACTIVE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeSwiperPageFlipMode
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_PAGE_FLIP_MODE_0100
     * @tc.desc   Test get CheckNodeSwiperPageFlipMode's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeSwiperPageFlipMode', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_PAGE_FLIP_MODE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeSwiperPageFlipMode();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_PAGE_FLIP_MODE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeSwiperAutoFill
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_AUTO_FILL_0100
     * @tc.desc   Test get CheckNodeSwiperAutoFill's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeSwiperAutoFill', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_AUTO_FILL_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeSwiperAutoFill();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_AUTO_FILL_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeSwiperMaintainVisibleContentPosition
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION_0100
     * @tc.desc   Test get CheckNodeSwiperMaintainVisibleContentPosition's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeSwiperMaintainVisibleContentPosition', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeSwiperMaintainVisibleContentPosition();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_SWIPER_MAINTAIN_VISIBLE_CONTENT_POSITION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeRefreshMaxPullDownDistance
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_REFRESH_MAX_PULL_DOWN_DISTANCE_0100
     * @tc.desc   Test get CheckNodeRefreshMaxPullDownDistance's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeRefreshMaxPullDownDistance', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_REFRESH_MAX_PULL_DOWN_DISTANCE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeRefreshMaxPullDownDistance();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_REFRESH_MAX_PULL_DOWN_DISTANCE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeWaterFlowLayoutMode
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_WATER_FLOW_LAYOUT_MODE_0100
     * @tc.desc   Test get CheckNodeWaterFlowLayoutMode's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeWaterFlowLayoutMode', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_WATER_FLOW_LAYOUT_MODE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeWaterFlowLayoutMode();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_WATER_FLOW_LAYOUT_MODE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeRelativeContainerGuideLine
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_RELATIVE_CONTAINER_GUIDE_LINE_0100
     * @tc.desc   Test get CheckNodeRelativeContainerGuideLine's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeRelativeContainerGuideLine', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_RELATIVE_CONTAINER_GUIDE_LINE_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeRelativeContainerGuideLine();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_RELATIVE_CONTAINER_GUIDE_LINE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeRelativeContainerBarrier
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_RELATIVE_CONTAINER_BARRIER_0100
     * @tc.desc   Test get CheckNodeRelativeContainerBarrier's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeRelativeContainerBarrier', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_RELATIVE_CONTAINER_BARRIER_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeRelativeContainerBarrier();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_RELATIVE_CONTAINER_BARRIER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCheckNodeEmbeddedComponentWant
     * @tc.number SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_EMBEDDED_COMPONENT_WANT_0100
     * @tc.desc   Test get CheckNodeEmbeddedComponentWant's result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckNodeEmbeddedComponentWant', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_EMBEDDED_COMPONENT_WANT_0100 start<====`);
        let Result: number = nativexcomponent.CheckNodeEmbeddedComponentWant();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_ARKUI_NODEATTRIBUTETYPE_NODE_EMBEDDED_COMPONENT_WANT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
  })
}