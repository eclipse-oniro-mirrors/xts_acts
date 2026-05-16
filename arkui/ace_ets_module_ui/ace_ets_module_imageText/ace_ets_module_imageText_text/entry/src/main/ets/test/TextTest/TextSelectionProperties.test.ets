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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';

export default function TextSelectionPropertiesTest() {
  describe('TextSelectionPropertiesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextSelectionPropertiesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextSelectionProperties',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextSelectionPropertiesTest state pages: " + JSON.stringify(pages));
        if (!("TextSelectionProperties" == pages.name)) {
          console.info("get TextSelectionPropertiesTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextSelectionPropertiesTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextSelectionPropertiesTest page error: " + err);
      }
      done();
    })

    // ==================== selection 属性测试 ====================

    /**
     * @tc.name   textSelectionNull_0100
     * @tc.number SUB_ARKUI_TEXT_SELECTION_NULL_PARAM_001
     * @tc.desc   Test Text selection(null, null) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textSelectionNull_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textSelectionNull_0100 START');

      // Get default selection for comparison
      let strJsonDefault: string = getInspectorByKey('text_selection_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get selection with null parameters
      let strJson: string = getInspectorByKey('text_selection_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify selection exists and is not undefined
      expect(obj.$attrs.selection).not().assertUndefined();
      console.info('textSelectionNull_0100 objDefault: ' + objDefault.$attrs.selection);
      console.info('textSelectionNull_0100 obj:' + obj.$attrs.selection);
      // Verify null parameter restores default value
      expect(obj.$attrs.selection).assertEqual(objDefault.$attrs.selection);

      console.info('TextSelectionPropertiesTest', 'textSelectionNull_0100 END');
    });

    /**
     * @tc.name   textSelectionUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_SELECTION_UNDEFINED_PARAM_001
     * @tc.desc   Test Text selection(undefined, undefined) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textSelectionUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textSelectionUndefined_0100 START');

      // Get default selection for comparison
      let strJsonDefault: string = getInspectorByKey('text_selection_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get selection with undefined parameters
      let strJson: string = getInspectorByKey('text_selection_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify selection exists and is not undefined
      expect(obj.$attrs.selection).not().assertUndefined();
      console.info('textSelectionUndefined_0100 objDefault: ' + objDefault.$attrs.selection);
      console.info('textSelectionUndefined_0100 obj:' + obj.$attrs.selection);
      // Verify undefined parameter restores default value
      expect(obj.$attrs.selection).assertEqual(objDefault.$attrs.selection);

      console.info('TextSelectionPropertiesTest', 'textSelectionUndefined_0100 END');
    });

    // ==================== caretColor 属性测试 ====================

    /**
     * @tc.name   textCaretColorNull_0100
     * @tc.number SUB_ARKUI_TEXT_CARETCOLOR_NULL_PARAM_001
     * @tc.desc   Test Text caretColor(null) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textCaretColorNull_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textCaretColorNull_0100 START');

      // Get default caretColor for comparison
      let strJsonDefault: string = getInspectorByKey('text_caretcolor_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get caretColor with null parameter
      let strJson: string = getInspectorByKey('text_caretcolor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify caretColor exists and is not undefined
      expect(obj.$attrs.caretColor).not().assertUndefined();
      console.info('textCaretColorNull_0100 objDefault: ' + objDefault.$attrs.caretColor);
      console.info('textCaretColorNull_0100 obj:' + obj.$attrs.caretColor);
      // Verify null parameter restores default value
      expect(obj.$attrs.caretColor).assertEqual(objDefault.$attrs.caretColor);

      console.info('TextSelectionPropertiesTest', 'textCaretColorNull_0100 END');
    });

    /**
     * @tc.name   textCaretColorUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_CARETCOLOR_UNDEFINED_PARAM_001
     * @tc.desc   Test Text caretColor(undefined) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textCaretColorUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textCaretColorUndefined_0100 START');

      // Get default caretColor for comparison
      let strJsonDefault: string = getInspectorByKey('text_caretcolor_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get caretColor with undefined parameter
      let strJson: string = getInspectorByKey('text_caretcolor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify caretColor exists and is not undefined
      expect(obj.$attrs.caretColor).not().assertUndefined();
      console.info('textCaretColorUndefined_0100 objDefault: ' + objDefault.$attrs.caretColor);
      console.info('textCaretColorUndefined_0100 obj:' + obj.$attrs.caretColor);
      // Verify undefined parameter restores default value
      expect(obj.$attrs.caretColor).assertEqual(objDefault.$attrs.caretColor);

      console.info('TextSelectionPropertiesTest', 'textCaretColorUndefined_0100 END');
    });

    /**
     * @tc.name   textCaretColorEmptyString_0100
     * @tc.number SUB_ARKUI_TEXT_CARETCOLOR_EMPTYSTRING_PARAM_001
     * @tc.desc   Test Text caretColor('') property with empty string should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textCaretColorEmptyString_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textCaretColorEmptyString_0100 START');

      // Get default caretColor for comparison
      let strJsonDefault: string = getInspectorByKey('text_caretcolor_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get caretColor with empty string parameter
      let strJson: string = getInspectorByKey('text_caretcolor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify caretColor exists and is not undefined
      expect(obj.$attrs.caretColor).not().assertUndefined();
      console.info('textCaretColorEmptyString_0100 objDefault: ' + objDefault.$attrs.caretColor);
      console.info('textCaretColorEmptyString_0100 obj:' + obj.$attrs.caretColor);
      // Verify empty string parameter restores default value
      expect(obj.$attrs.caretColor).assertEqual(objDefault.$attrs.caretColor);

      console.info('TextSelectionPropertiesTest', 'textCaretColorEmptyString_0100 END');
    });

    // ==================== selectedBackgroundColor 属性测试 ====================

    /**
     * @tc.name   textSelectedBackgroundColorNull_0100
     * @tc.number SUB_ARKUI_TEXT_SELECTEDBACKGROUNDCOLOR_NULL_PARAM_001
     * @tc.desc   Test Text selectedBackgroundColor(null) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textSelectedBackgroundColorNull_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textSelectedBackgroundColorNull_0100 START');

      // Get default selectedBackgroundColor for comparison
      let strJsonDefault: string = getInspectorByKey('text_selectedbackgroundcolor_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get selectedBackgroundColor with null parameter
      let strJson: string = getInspectorByKey('text_selectedbackgroundcolor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify selectedBackgroundColor exists and is not undefined
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
      console.info('textSelectedBackgroundColorNull_0100 objDefault: ' + objDefault.$attrs.selectedBackgroundColor);
      console.info('textSelectedBackgroundColorNull_0100 obj:' + obj.$attrs.selectedBackgroundColor);
      // Verify null parameter restores default value (#007DFF)
      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objDefault.$attrs.selectedBackgroundColor);

      console.info('TextSelectionPropertiesTest', 'textSelectedBackgroundColorNull_0100 END');
    });

    /**
     * @tc.name   textSelectedBackgroundColorUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_SELECTEDBACKGROUNDCOLOR_UNDEFINED_PARAM_001
     * @tc.desc   Test Text selectedBackgroundColor(undefined) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textSelectedBackgroundColorUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textSelectedBackgroundColorUndefined_0100 START');

      // Get default selectedBackgroundColor for comparison
      let strJsonDefault: string = getInspectorByKey('text_selectedbackgroundcolor_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get selectedBackgroundColor with undefined parameter
      let strJson: string = getInspectorByKey('text_selectedbackgroundcolor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify selectedBackgroundColor exists and is not undefined
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
      console.info('textSelectedBackgroundColorUndefined_0100 objDefault: ' +
        objDefault.$attrs.selectedBackgroundColor);
      console.info('textSelectedBackgroundColorUndefined_0100 obj:' + obj.$attrs.selectedBackgroundColor);
      // Verify undefined parameter restores default value (#007DFF)
      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objDefault.$attrs.selectedBackgroundColor);

      console.info('TextSelectionPropertiesTest', 'textSelectedBackgroundColorUndefined_0100 END');
    });

    /**
     * @tc.name   textSelectedBackgroundColorEmptyString_0100
     * @tc.number SUB_ARKUI_TEXT_SELECTEDBACKGROUNDCOLOR_EMPTYSTRING_PARAM_001
     * @tc.desc   Test Text selectedBackgroundColor('') property with empty string should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textSelectedBackgroundColorEmptyString_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textSelectedBackgroundColorEmptyString_0100 START');

      // Get default selectedBackgroundColor for comparison
      let strJsonDefault: string = getInspectorByKey('text_selectedbackgroundcolor_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get selectedBackgroundColor with empty string parameter
      let strJson: string = getInspectorByKey('text_selectedbackgroundcolor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify selectedBackgroundColor exists and is not undefined
      expect(obj.$attrs.selectedBackgroundColor).not().assertUndefined();
      console.info('textSelectedBackgroundColorEmptyString_0100 objDefault: ' +
        objDefault.$attrs.selectedBackgroundColor);
      console.info('textSelectedBackgroundColorEmptyString_0100 obj:' + obj.$attrs.selectedBackgroundColor);
      // Verify empty string parameter restores default value (#007DFF)
      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objDefault.$attrs.selectedBackgroundColor);

      console.info('TextSelectionPropertiesTest', 'textSelectedBackgroundColorEmptyString_0100 END');
    });

    // ==================== shaderStyle 属性测试 ====================

    /**
     * @tc.name   textShaderStyleNull_0100
     * @tc.number SUB_ARKUI_TEXT_SHADERSTYLE_NULL_PARAM_001
     * @tc.desc   Test Text shaderStyle(null) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textShaderStyleNull_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textShaderStyleNull_0100 START');

      // Get default shaderStyle for comparison
      let strJsonDefault: string = getInspectorByKey('text_shaderstyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get shaderStyle with null parameter
      let strJson: string = getInspectorByKey('text_shaderstyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify shaderStyle exists and is not undefined
      expect(obj.$attrs.shaderStyle).not().assertUndefined();
      console.info('textShaderStyleNull_0100 objDefault: ' + JSON.stringify(objDefault.$attrs.shaderStyle));
      console.info('textShaderStyleNull_0100 obj:' + JSON.stringify(obj.$attrs.shaderStyle));
      // Verify null parameter restores default value
      expect(obj.$attrs.shaderStyle.LinearGradientStyle).assertEqual(
        objDefault.$attrs.shaderStyle.LinearGradientStyle);

      console.info('TextSelectionPropertiesTest', 'textShaderStyleNull_0100 END');
    });

    /**
     * @tc.name   textShaderStyleUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_SHADERSTYLE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text shaderStyle(undefined) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textShaderStyleUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textShaderStyleUndefined_0100 START');

      // Get default shaderStyle for comparison
      let strJsonDefault: string = getInspectorByKey('text_shaderstyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get shaderStyle with undefined parameter
      let strJson: string = getInspectorByKey('text_shaderstyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify shaderStyle exists and is not undefined
      expect(obj.$attrs.shaderStyle).not().assertUndefined();
      console.info('textShaderStyleUndefined_0100 objDefault: ' + objDefault.$attrs.shaderStyle);
      console.info('textShaderStyleUndefined_0100 obj:' + obj.$attrs.shaderStyle);
      // Verify undefined parameter restores default value
      expect(obj.$attrs.shaderStyle.LinearGradientStyle).assertEqual(
        objDefault.$attrs.shaderStyle.LinearGradientStyle);

      console.info('TextSelectionPropertiesTest', 'textShaderStyleUndefined_0100 END');
    });

    // ==================== ellipsisMode 属性测试 ====================

    /**
     * @tc.name   textEllipsisModeNull_0100
     * @tc.number SUB_ARKUI_TEXT_ELLIPSISMODE_NULL_PARAM_001
     * @tc.desc   Test Text ellipsisMode(null) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textEllipsisModeNull_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textEllipsisModeNull_0100 START');

      // Get default ellipsisMode for comparison
      let strJsonDefault: string = getInspectorByKey('text_ellipsismode_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get ellipsisMode with null parameter
      let strJson: string = getInspectorByKey('text_ellipsismode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify ellipsisMode exists and is not undefined
      expect(obj.$attrs.ellipsisMode).not().assertUndefined();
      console.info('textEllipsisModeNull_0100 objDefault: ' + objDefault.$attrs.ellipsisMode);
      console.info('textEllipsisModeNull_0100 obj:' + obj.$attrs.ellipsisMode);
      // Verify null parameter restores default value
      expect(obj.$attrs.ellipsisMode).assertEqual(objDefault.$attrs.ellipsisMode);

      console.info('TextSelectionPropertiesTest', 'textEllipsisModeNull_0100 END');
    });

    /**
     * @tc.name   textEllipsisModeUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_ELLIPSISMODE_UNDEFINED_PARAM_001
     * @tc.desc   Test Text ellipsisMode(undefined) property should restore default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textEllipsisModeUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textEllipsisModeUndefined_0100 START');

      // Get default ellipsisMode for comparison
      let strJsonDefault: string = getInspectorByKey('text_ellipsismode_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get ellipsisMode with undefined parameter
      let strJson: string = getInspectorByKey('text_ellipsismode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify ellipsisMode exists and is not undefined
      expect(obj.$attrs.ellipsisMode).not().assertUndefined();
      console.info('textEllipsisModeUndefined_0100 objDefault: ' + objDefault.$attrs.ellipsisMode);
      console.info('textEllipsisModeUndefined_0100 obj:' + obj.$attrs.ellipsisMode);
      // Verify undefined parameter restores default value
      expect(obj.$attrs.ellipsisMode).assertEqual(objDefault.$attrs.ellipsisMode);

      console.info('TextSelectionPropertiesTest', 'textEllipsisModeUndefined_0100 END');
    });

    // ==================== enableDataDetector 属性测试 ====================

    /**
     * @tc.name   textEnableDataDetectorNull_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLEDATADETECTOR_NULL_PARAM_001
     * @tc.desc   Test Text enableDataDetector(null) property should restore default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textEnableDataDetectorNull_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textEnableDataDetectorNull_0100 START');

      // Get default enableDataDetector for comparison
      let strJsonDefault: string = getInspectorByKey('text_enabledatadetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get enableDataDetector with null parameter
      let strJson: string = getInspectorByKey('text_enabledatadetector_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify enableDataDetector exists and is not undefined
      expect(obj.$attrs.enableDataDetector).not().assertUndefined();
      console.info('textEnableDataDetectorNull_0100 objDefault: ' + objDefault.$attrs.enableDataDetector);
      console.info('textEnableDataDetectorNull_0100 obj:' + obj.$attrs.enableDataDetector);
      // Verify null parameter restores default value (false)
      expect(obj.$attrs.enableDataDetector).assertEqual(objDefault.$attrs.enableDataDetector);

      console.info('TextSelectionPropertiesTest', 'textEnableDataDetectorNull_0100 END');
    });

    /**
     * @tc.name   textEnableDataDetectorUndefined_0100
     * @tc.number SUB_ARKUI_TEXT_ENABLEDATADETECTOR_UNDEFINED_PARAM_001
     * @tc.desc   Test Text enableDataDetector(undefined) property should restore default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textEnableDataDetectorUndefined_0100', Level.LEVEL2, async () => {
      console.info('TextSelectionPropertiesTest', 'textEnableDataDetectorUndefined_0100 START');

      // Get default enableDataDetector for comparison
      let strJsonDefault: string = getInspectorByKey('text_enabledatadetector_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      // Get enableDataDetector with undefined parameter
      let strJson: string = getInspectorByKey('text_enabledatadetector_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      // Verify enableDataDetector exists and is not undefined
      expect(obj.$attrs.enableDataDetector).not().assertUndefined();
      console.info('textEnableDataDetectorUndefined_0100 objDefault: ' + objDefault.$attrs.enableDataDetector);
      console.info('textEnableDataDetectorUndefined_0100 obj:' + obj.$attrs.enableDataDetector);
      // Verify undefined parameter restores default value (false)
      expect(obj.$attrs.enableDataDetector).assertEqual(objDefault.$attrs.enableDataDetector);

      console.info('TextSelectionPropertiesTest', 'textEnableDataDetectorUndefined_0100 END');
    });
  });
}
