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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import router from '@ohos.router';

export default function TextInputPropertiesNullUndefinedTest() {
  describe('TextInputPropertiesNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputPropertiesNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputPropertiesNullUndefinedTest state success " + JSON.stringify(pages));
        if (!("TextInputPropertiesNullUndefined" == pages.name)) {
          console.info("get TextInputPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputPropertiesNullUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(500);
      console.info("TextInputPropertiesNullUndefinedTest after each called");
    });

    /**
     * @tc.name   textInputEnableSelectedDataDetector_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLESELECTEDDATADETECTOR_NULL_0100
     * @tc.desc   Test TextInput enableSelectedDataDetector property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableSelectedDataDetector_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableSelectedDataDetector_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableSelectedDataDetector_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableSelectedDataDetector_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableSelectedDataDetector_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableSelectedDataDetector_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableSelectedDataDetector_null_0100] default enableSelectedDataDetector is: " + objCompare.$attrs.enableSelectedDataDetector);
      console.info("[textInputEnableSelectedDataDetector_null_0100] null enableSelectedDataDetector is: " + obj.$attrs.enableSelectedDataDetector);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objCompare.$attrs.enableSelectedDataDetector);
      console.info('[textInputEnableSelectedDataDetector_null_0100] END');
    })

    /**
     * @tc.name   textInputEnableSelectedDataDetector_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLESELECTEDDATADETECTOR_UNDEFINED_0100
     * @tc.desc   Test TextInput enableSelectedDataDetector property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableSelectedDataDetector_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableSelectedDataDetector_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableSelectedDataDetector_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableSelectedDataDetector_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableSelectedDataDetector_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableSelectedDataDetector_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableSelectedDataDetector_undefined_0100] default enableSelectedDataDetector is: " + objCompare.$attrs.enableSelectedDataDetector);
      console.info("[textInputEnableSelectedDataDetector_undefined_0100] undefined enableSelectedDataDetector is: " + obj.$attrs.enableSelectedDataDetector);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableSelectedDataDetector).assertEqual(objCompare.$attrs.enableSelectedDataDetector);
      console.info('[textInputEnableSelectedDataDetector_undefined_0100] END');
    })

    /**
     * @tc.name   textInputPlaceholderColor_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PLACEHOLDERCOLOR_NULL_0100
     * @tc.desc   Test TextInput placeholderColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPlaceholderColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputPlaceholderColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_placeholderColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_placeholderColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputPlaceholderColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputPlaceholderColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputPlaceholderColor_null_0100] default placeholderColor is: " + objCompare.$attrs.placeholderColor);
      console.info("[textInputPlaceholderColor_null_0100] null placeholderColor is: " + obj.$attrs.placeholderColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.placeholderColor as string;
      let nullColor: string = obj.$attrs.placeholderColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[textInputPlaceholderColor_null_0100] END');
    })

    /**
     * @tc.name   textInputPlaceholderColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PLACEHOLDERCOLOR_UNDEFINED_0100
     * @tc.desc   Test TextInput placeholderColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPlaceholderColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputPlaceholderColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_placeholderColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_placeholderColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputPlaceholderColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputPlaceholderColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputPlaceholderColor_undefined_0100] default placeholderColor is: " + objCompare.$attrs.placeholderColor);
      console.info("[textInputPlaceholderColor_undefined_0100] undefined placeholderColor is: " + obj.$attrs.placeholderColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.placeholderColor as string;
      let undefinedColor: string = obj.$attrs.placeholderColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[textInputPlaceholderColor_undefined_0100] END');
    })

    /**
     * @tc.name   textInputTextOverflow_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_TEXTOVERFLOW_NULL_0100
     * @tc.desc   Test TextInput textOverflow property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTextOverflow_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputTextOverflow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_textOverflow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_textOverflow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTextOverflow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTextOverflow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputTextOverflow_null_0100] default textOverflow is: " + objCompare.$attrs.textOverflow);
      console.info("[textInputTextOverflow_null_0100] null textOverflow is: " + obj.$attrs.textOverflow);

      // null 应该恢复为默认值
      expect(obj.$attrs.textOverflow).assertEqual(objCompare.$attrs.textOverflow);
      console.info('[textInputTextOverflow_null_0100] END');
    })

    /**
     * @tc.name   textInputTextOverflow_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_TEXTOVERFLOW_UNDEFINED_0100
     * @tc.desc   Test TextInput textOverflow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTextOverflow_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputTextOverflow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_textOverflow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_textOverflow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTextOverflow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTextOverflow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputTextOverflow_undefined_0100] default textOverflow is: " + objCompare.$attrs.textOverflow);
      console.info("[textInputTextOverflow_undefined_0100] undefined textOverflow is: " + obj.$attrs.textOverflow);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textOverflow).assertEqual(objCompare.$attrs.textOverflow);
      console.info('[textInputTextOverflow_undefined_0100] END');
    })

    /**
     * @tc.name   textInputTextIndent_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_TEXTINDENT_NULL_0100
     * @tc.desc   Test TextInput textIndent property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTextIndent_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputTextIndent_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_textIndent_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_textIndent_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTextIndent_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTextIndent_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputTextIndent_null_0100] default textIndent is: " + objCompare.$attrs.textIndent);
      console.info("[textInputTextIndent_null_0100] null textIndent is: " + obj.$attrs.textIndent);

      // null 应该恢复为默认值
      expect(obj.$attrs.textIndent).assertContain('0.00');
      console.info('[textInputTextIndent_null_0100] END');
    })

    /**
     * @tc.name   textInputTextIndent_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_TEXTINDENT_UNDEFINED_0100
     * @tc.desc   Test TextInput textIndent property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTextIndent_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputTextIndent_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_textIndent_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_textIndent_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTextIndent_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTextIndent_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputTextIndent_undefined_0100] default textIndent is: " + objCompare.$attrs.textIndent);
      console.info("[textInputTextIndent_undefined_0100] undefined textIndent is: " + obj.$attrs.textIndent);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textIndent).assertContain('0.00');
      console.info('[textInputTextIndent_undefined_0100] END');
    })

    /**
     * @tc.name   textInputPlaceholderFont_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PLACEHOLDERFONT_NULL_0100
     * @tc.desc   Test TextInput placeholderFont property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPlaceholderFont_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputPlaceholderFont_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_placeholderFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_placeholderFont_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputPlaceholderFont_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputPlaceholderFont_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputPlaceholderFont_null_0100] default placeholderFont is: " + objCompare.$attrs.placeholderFont);
      console.info("[textInputPlaceholderFont_null_0100] null placeholderFont is: " + obj.$attrs.placeholderFont);

      // null 应该恢复为默认值
      expect(obj.$attrs.placeholderFont).assertEqual(objCompare.$attrs.placeholderFont);
      console.info('[textInputPlaceholderFont_null_0100] END');
    })

    /**
     * @tc.name   textInputPlaceholderFont_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PLACEHOLDERFONT_UNDEFINED_0100
     * @tc.desc   Test TextInput placeholderFont property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPlaceholderFont_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputPlaceholderFont_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_placeholderFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_placeholderFont_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputPlaceholderFont_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputPlaceholderFont_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputPlaceholderFont_undefined_0100] default placeholderFont is: " + objCompare.$attrs.placeholderFont);
      console.info("[textInputPlaceholderFont_undefined_0100] undefined placeholderFont is: " + obj.$attrs.placeholderFont);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.placeholderFont).assertEqual(objCompare.$attrs.placeholderFont);
      console.info('[textInputPlaceholderFont_undefined_0100] END');
    })

    /**
     * @tc.name   textInputCaretColor_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CARETCOLOR_NULL_0100
     * @tc.desc   Test TextInput caretColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCaretColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputCaretColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_caretColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_caretColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCaretColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCaretColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCaretColor_null_0100] default caretColor is: " + objCompare.$attrs.caretColor);
      console.info("[textInputCaretColor_null_0100] null caretColor is: " + obj.$attrs.caretColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.caretColor as string;
      let nullColor: string = obj.$attrs.caretColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[textInputCaretColor_null_0100] END');
    })

    /**
     * @tc.name   textInputCaretColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CARETCOLOR_UNDEFINED_0100
     * @tc.desc   Test TextInput caretColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCaretColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputCaretColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_caretColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_caretColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCaretColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCaretColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCaretColor_undefined_0100] default caretColor is: " + objCompare.$attrs.caretColor);
      console.info("[textInputCaretColor_undefined_0100] undefined caretColor is: " + obj.$attrs.caretColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.caretColor as string;
      let undefinedColor: string = obj.$attrs.caretColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[textInputCaretColor_undefined_0100] END');
    })

    /**
     * @tc.name   textInputMaxLength_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MAXLENGTH_NULL_0100
     * @tc.desc   Test TextInput maxLength property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMaxLength_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputMaxLength_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_maxLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_maxLength_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMaxLength_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMaxLength_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMaxLength_null_0100] default maxLength is: " + objCompare.$attrs.maxLength);
      console.info("[textInputMaxLength_null_0100] null maxLength is: " + obj.$attrs.maxLength);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxLength).assertEqual(objCompare.$attrs.maxLength);
      console.info('[textInputMaxLength_null_0100] END');
    })

    /**
     * @tc.name   textInputMaxLength_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MAXLENGTH_UNDEFINED_0100
     * @tc.desc   Test TextInput maxLength property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMaxLength_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputMaxLength_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_maxLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_maxLength_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMaxLength_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMaxLength_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMaxLength_undefined_0100] default maxLength is: " + objCompare.$attrs.maxLength);
      console.info("[textInputMaxLength_undefined_0100] undefined maxLength is: " + obj.$attrs.maxLength);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxLength).assertEqual(objCompare.$attrs.maxLength);
      console.info('[textInputMaxLength_undefined_0100] END');
    })

    /**
     * @tc.name   textInputFontColor_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTCOLOR_NULL_0100
     * @tc.desc   Test TextInput fontColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontColor_null_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[textInputFontColor_null_0100] null fontColor is: " + obj.$attrs.fontColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.fontColor as string;
      let nullColor: string = obj.$attrs.fontColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[textInputFontColor_null_0100] END');
    })

    /**
     * @tc.name   textInputFontColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTCOLOR_UNDEFINED_0100
     * @tc.desc   Test TextInput fontColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontColor_undefined_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[textInputFontColor_undefined_0100] undefined fontColor is: " + obj.$attrs.fontColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.fontColor as string;
      let undefinedColor: string = obj.$attrs.fontColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[textInputFontColor_undefined_0100] END');
    })

    /**
     * @tc.name   textInputFontSize_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTSIZE_NULL_0100
     * @tc.desc   Test TextInput fontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontSize_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontSize_null_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[textInputFontSize_null_0100] null fontSize is: " + obj.$attrs.fontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[textInputFontSize_null_0100] END');
    })

    /**
     * @tc.name   textInputFontSize_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTSIZE_UNDEFINED_0100
     * @tc.desc   Test TextInput fontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontSize_undefined_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[textInputFontSize_undefined_0100] undefined fontSize is: " + obj.$attrs.fontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[textInputFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   textInputFontStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTSTYLE_NULL_0100
     * @tc.desc   Test TextInput fontStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontStyle_null_0100] default fontStyle is: " + objCompare.$attrs.fontStyle);
      console.info("[textInputFontStyle_null_0100] null fontStyle is: " + obj.$attrs.fontStyle);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[textInputFontStyle_null_0100] END');
    })

    /**
     * @tc.name   textInputFontStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTSTYLE_UNDEFINED_0100
     * @tc.desc   Test TextInput fontStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontStyle_undefined_0100] default fontStyle is: " + objCompare.$attrs.fontStyle);
      console.info("[textInputFontStyle_undefined_0100] undefined fontStyle is: " + obj.$attrs.fontStyle);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[textInputFontStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textInputFontFamily_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTFAMILY_NULL_0100
     * @tc.desc   Test TextInput fontFamily property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontFamily_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontFamily_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontFamily_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontFamily_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontFamily_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontFamily_null_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textInputFontFamily_null_0100] null fontFamily is: " + obj.$attrs.fontFamily);

      // null 应该恢复为默认值
      let defaultFamily: string = objCompare.$attrs.fontFamily as string;
      let nullFamily: string = obj.$attrs.fontFamily as string;
      expect(nullFamily).assertEqual(defaultFamily);
      console.info('[textInputFontFamily_null_0100] END');
    })

    /**
     * @tc.name   textInputFontFamily_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTFAMILY_UNDEFINED_0100
     * @tc.desc   Test TextInput fontFamily property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontFamily_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontFamily_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontFamily_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontFamily_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontFamily_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontFamily_undefined_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textInputFontFamily_undefined_0100] undefined fontFamily is: " + obj.$attrs.fontFamily);

      // undefined 应该恢复为默认值
      let defaultFamily: string = objCompare.$attrs.fontFamily as string;
      let undefinedFamily: string = obj.$attrs.fontFamily as string;
      expect(undefinedFamily).assertEqual(defaultFamily);
      console.info('[textInputFontFamily_undefined_0100] END');
    })

    /**
     * @tc.name   textInputInputFilter_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_INPUTFILTER_NULL_0100
     * @tc.desc   Test TextInput inputFilter property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputInputFilter_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputInputFilter_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_inputFilter_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_inputFilter_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputInputFilter_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputInputFilter_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputInputFilter_null_0100] default inputFilter is: " + objCompare.$attrs.inputFilter);
      console.info("[textInputInputFilter_null_0100] null inputFilter is: " + obj.$attrs.inputFilter);

      // null 应该恢复为默认值
      expect(obj.$attrs.inputFilter).assertEqual(objCompare.$attrs.inputFilter);
      console.info('[textInputInputFilter_null_0100] END');
    })

    /**
     * @tc.name   textInputInputFilter_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_INPUTFILTER_UNDEFINED_0100
     * @tc.desc   Test TextInput inputFilter property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputInputFilter_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputInputFilter_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_inputFilter_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_inputFilter_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputInputFilter_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputInputFilter_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputInputFilter_undefined_0100] default inputFilter is: " + objCompare.$attrs.inputFilter);
      console.info("[textInputInputFilter_undefined_0100] undefined inputFilter is: " + obj.$attrs.inputFilter);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.inputFilter).assertEqual(objCompare.$attrs.inputFilter);
      console.info('[textInputInputFilter_undefined_0100] END');
    })

    /**
     * @tc.name   textInputCopyOption_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_COPYOPTION_NULL_0100
     * @tc.desc   Test TextInput copyOption property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCopyOption_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputCopyOption_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_copyOption_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_copyOption_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCopyOption_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCopyOption_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCopyOption_null_0100] default copyOption is: " + objCompare.$attrs.copyOption);
      console.info("[textInputCopyOption_null_0100] null copyOption is: " + obj.$attrs.copyOption);

      // null 应该恢复为默认值
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);
      console.info('[textInputCopyOption_null_0100] END');
    })

    /**
     * @tc.name   textInputCopyOption_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_COPYOPTION_UNDEFINED_0100
     * @tc.desc   Test TextInput copyOption property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCopyOption_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputCopyOption_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_copyOption_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_copyOption_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCopyOption_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCopyOption_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCopyOption_undefined_0100] default copyOption is: " + objCompare.$attrs.copyOption);
      console.info("[textInputCopyOption_undefined_0100] undefined copyOption is: " + obj.$attrs.copyOption);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);
      console.info('[textInputCopyOption_undefined_0100] END');
    })

    /**
     * @tc.name   textInputTextAlign_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_TEXTALIGN_NULL_0100
     * @tc.desc   Test TextInput textAlign property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTextAlign_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputTextAlign_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_textAlign_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_textAlign_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTextAlign_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTextAlign_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputTextAlign_null_0100] default textAlign is: " + objCompare.$attrs.textAlign);
      console.info("[textInputTextAlign_null_0100] null textAlign is: " + obj.$attrs.textAlign);

      // null 应该恢复为默认值
      expect(obj.$attrs.textAlign).assertEqual(objCompare.$attrs.textAlign);
      console.info('[textInputTextAlign_null_0100] END');
    })

    /**
     * @tc.name   textInputTextAlign_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_TEXTALIGN_UNDEFINED_0100
     * @tc.desc   Test TextInput textAlign property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTextAlign_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputTextAlign_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_textAlign_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_textAlign_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTextAlign_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTextAlign_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputTextAlign_undefined_0100] default textAlign is: " + objCompare.$attrs.textAlign);
      console.info("[textInputTextAlign_undefined_0100] undefined textAlign is: " + obj.$attrs.textAlign);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textAlign).assertEqual(objCompare.$attrs.textAlign);
      console.info('[textInputTextAlign_undefined_0100] END');
    })

    /**
     * @tc.name   textInputStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_STYLE_NULL_0100
     * @tc.desc   Test TextInput style property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_style_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_style_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputStyle_null_0100] default style is: " + objCompare.$attrs.style);
      console.info("[textInputStyle_null_0100] null style is: " + obj.$attrs.style);

      // null 应该恢复为默认值
      expect(obj.$attrs.style).assertEqual(objCompare.$attrs.style);
      console.info('[textInputStyle_null_0100] END');
    })

    /**
     * @tc.name   textInputStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_STYLE_UNDEFINED_0100
     * @tc.desc   Test TextInput style property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_style_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_style_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputStyle_undefined_0100] default style is: " + objCompare.$attrs.style);
      console.info("[textInputStyle_undefined_0100] undefined style is: " + obj.$attrs.style);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.style).assertEqual(objCompare.$attrs.style);
      console.info('[textInputStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textInputCaretStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CARETSTYLE_NULL_0100
     * @tc.desc   Test TextInput caretStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCaretStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputCaretStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_caretStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_caretStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCaretStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCaretStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCaretStyle_null_0100] default caretStyle is: " + objCompare.$attrs.caretStyle);
      console.info("[textInputCaretStyle_null_0100] null caretStyle is: " + obj.$attrs.caretStyle);

      // null 应该恢复为默认值
      expect(obj.$attrs.caretStyle).assertEqual(objCompare.$attrs.caretStyle);
      console.info('[textInputCaretStyle_null_0100] END');
    })

    /**
     * @tc.name   textInputCaretStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CARETSTYLE_UNDEFINED_0100
     * @tc.desc   Test TextInput caretStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCaretStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputCaretStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_caretStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_caretStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCaretStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCaretStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCaretStyle_undefined_0100] default caretStyle is: " + objCompare.$attrs.caretStyle);
      console.info("[textInputCaretStyle_undefined_0100] undefined caretStyle is: " + obj.$attrs.caretStyle);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.caretStyle).assertEqual(objCompare.$attrs.caretStyle);
      console.info('[textInputCaretStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textInputPasswordIcon_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PASSWORDICON_NULL_0100
     * @tc.desc   Test TextInput passwordIcon property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPasswordIcon_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputPasswordIcon_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_passwordIcon_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_passwordIcon_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputPasswordIcon_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputPasswordIcon_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputPasswordIcon_null_0100] default passwordIcon is: " + objCompare.$attrs.passwordIcon);
      console.info("[textInputPasswordIcon_null_0100] null passwordIcon is: " + obj.$attrs.passwordIcon);

      // null 应该恢复为默认值
      expect(obj.$attrs.passwordIcon).assertEqual(objCompare.$attrs.passwordIcon);
      console.info('[textInputPasswordIcon_null_0100] END');
    })

    /**
     * @tc.name   textInputPasswordIcon_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PASSWORDICON_UNDEFINED_0100
     * @tc.desc   Test TextInput passwordIcon property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPasswordIcon_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputPasswordIcon_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_passwordIcon_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_passwordIcon_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputPasswordIcon_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputPasswordIcon_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputPasswordIcon_undefined_0100] default passwordIcon is: " + objCompare.$attrs.passwordIcon);
      console.info("[textInputPasswordIcon_undefined_0100] undefined passwordIcon is: " + obj.$attrs.passwordIcon);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.passwordIcon).assertEqual(objCompare.$attrs.passwordIcon);
      console.info('[textInputPasswordIcon_undefined_0100] END');
    })

    /**
     * @tc.name   textInputShowUnit_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWUNIT_NULL_0100
     * @tc.desc   Test TextInput showUnit property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowUnit_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowUnit_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showUnit_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showUnit_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowUnit_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowUnit_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowUnit_null_0100] default showUnit is: " + objCompare.$attrs.showUnit);
      console.info("[textInputShowUnit_null_0100] null showUnit is: " + obj.$attrs.showUnit);

      // null 应该恢复为默认值
      expect(obj.$attrs.showUnit).assertEqual(objCompare.$attrs.showUnit);
      console.info('[textInputShowUnit_null_0100] END');
    })

    /**
     * @tc.name   textInputShowUnit_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWUNIT_UNDEFINED_0100
     * @tc.desc   Test TextInput showUnit property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowUnit_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowUnit_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showUnit_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showUnit_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowUnit_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowUnit_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowUnit_undefined_0100] default showUnit is: " + objCompare.$attrs.showUnit);
      console.info("[textInputShowUnit_undefined_0100] undefined showUnit is: " + obj.$attrs.showUnit);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.showUnit).assertEqual(objCompare.$attrs.showUnit);
      console.info('[textInputShowUnit_undefined_0100] END');
    })

    /**
     * @tc.name   textInputLineBreakStrategy_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_LINEBREAKSTRATEGY_NULL_0100
     * @tc.desc   Test TextInput lineBreakStrategy property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputLineBreakStrategy_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputLineBreakStrategy_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_lineBreakStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_lineBreakStrategy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputLineBreakStrategy_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputLineBreakStrategy_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputLineBreakStrategy_null_0100] default lineBreakStrategy is: " + objCompare.$attrs.lineBreakStrategy);
      console.info("[textInputLineBreakStrategy_null_0100] null lineBreakStrategy is: " + obj.$attrs.lineBreakStrategy);

      // null 应该恢复为默认值
      expect(obj.$attrs.lineBreakStrategy).assertEqual(objCompare.$attrs.lineBreakStrategy);
      console.info('[textInputLineBreakStrategy_null_0100] END');
    })

    /**
     * @tc.name   textInputLineBreakStrategy_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_LINEBREAKSTRATEGY_UNDEFINED_0100
     * @tc.desc   Test TextInput lineBreakStrategy property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputLineBreakStrategy_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputLineBreakStrategy_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_lineBreakStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_lineBreakStrategy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputLineBreakStrategy_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputLineBreakStrategy_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputLineBreakStrategy_undefined_0100] default lineBreakStrategy is: " + objCompare.$attrs.lineBreakStrategy);
      console.info("[textInputLineBreakStrategy_undefined_0100] undefined lineBreakStrategy is: " + obj.$attrs.lineBreakStrategy);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.lineBreakStrategy).assertEqual(objCompare.$attrs.lineBreakStrategy);
      console.info('[textInputLineBreakStrategy_undefined_0100] END');
    })

    /**
     * @tc.name   textInputCancelButton_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CANCELBUTTON_NULL_0100
     * @tc.desc   Test TextInput cancelButton property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCancelButton_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputCancelButton_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_cancelButton_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_cancelButton_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCancelButton_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCancelButton_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCancelButton_null_0100] default cancelButton is: " + objCompare.$attrs.cancelButton);
      console.info("[textInputCancelButton_null_0100] null cancelButton is: " + obj.$attrs.cancelButton);

      // null 应该恢复为默认值
      expect(obj.$attrs.cancelButton).assertEqual(objCompare.$attrs.cancelButton);
      console.info('[textInputCancelButton_null_0100] END');
    })

    /**
     * @tc.name   textInputCancelButton_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CANCELBUTTON_UNDEFINED_0100
     * @tc.desc   Test TextInput cancelButton property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCancelButton_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputCancelButton_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_cancelButton_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_cancelButton_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCancelButton_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCancelButton_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCancelButton_undefined_0100] default cancelButton is: " + objCompare.$attrs.cancelButton);
      console.info("[textInputCancelButton_undefined_0100] undefined cancelButton is: " + obj.$attrs.cancelButton);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.cancelButton).assertEqual(objCompare.$attrs.cancelButton);
      console.info('[textInputCancelButton_undefined_0100] END');
    })

    /**
     * @tc.name   textInputMinFontScale_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MINFONTSCALE_NULL_0100
     * @tc.desc   Test TextInput minFontScale property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMinFontScale_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputMinFontScale_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_minFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_minFontScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMinFontScale_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMinFontScale_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMinFontScale_null_0100] default minFontScale is: " + objCompare.$attrs.minFontScale);
      console.info("[textInputMinFontScale_null_0100] null minFontScale is: " + obj.$attrs.minFontScale);

      // null 应该恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      console.info('[textInputMinFontScale_null_0100] END');
    })

    /**
     * @tc.name   textInputMinFontScale_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MINFONTSCALE_UNDEFINED_0100
     * @tc.desc   Test TextInput minFontScale property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMinFontScale_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputMinFontScale_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_minFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_minFontScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMinFontScale_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMinFontScale_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMinFontScale_undefined_0100] default minFontScale is: " + objCompare.$attrs.minFontScale);
      console.info("[textInputMinFontScale_undefined_0100] undefined minFontScale is: " + obj.$attrs.minFontScale);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      console.info('[textInputMinFontScale_undefined_0100] END');
    })

    /**
     * @tc.name   textInputMaxFontScale_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MAXFONTSCALE_NULL_0100
     * @tc.desc   Test TextInput maxFontScale property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMaxFontScale_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputMaxFontScale_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_maxFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_maxFontScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMaxFontScale_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMaxFontScale_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMaxFontScale_null_0100] default maxFontScale is: " + objCompare.$attrs.maxFontScale);
      console.info("[textInputMaxFontScale_null_0100] null maxFontScale is: " + obj.$attrs.maxFontScale);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      console.info('[textInputMaxFontScale_null_0100] END');
    })

    /**
     * @tc.name   textInputMaxFontScale_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MAXFONTSCALE_UNDEFINED_0100
     * @tc.desc   Test TextInput maxFontScale property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMaxFontScale_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputMaxFontScale_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_maxFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_maxFontScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMaxFontScale_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMaxFontScale_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMaxFontScale_undefined_0100] default maxFontScale is: " + objCompare.$attrs.maxFontScale);
      console.info("[textInputMaxFontScale_undefined_0100] undefined maxFontScale is: " + obj.$attrs.maxFontScale);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      console.info('[textInputMaxFontScale_undefined_0100] END');
    })

    /**
     * @tc.name   textInputHeightAdaptivePolicy_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_HEIGHTADAPTIVEPOLICY_NULL_0100
     * @tc.desc   Test TextInput heightAdaptivePolicy property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputHeightAdaptivePolicy_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputHeightAdaptivePolicy_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_heightAdaptivePolicy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_heightAdaptivePolicy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputHeightAdaptivePolicy_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputHeightAdaptivePolicy_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputHeightAdaptivePolicy_null_0100] default heightAdaptivePolicy is: " + objCompare.$attrs.heightAdaptivePolicy);
      console.info("[textInputHeightAdaptivePolicy_null_0100] null heightAdaptivePolicy is: " + obj.$attrs.heightAdaptivePolicy);

      // null 应该恢复为默认值
      expect(obj.$attrs.heightAdaptivePolicy).assertEqual(objCompare.$attrs.heightAdaptivePolicy);
      console.info('[textInputHeightAdaptivePolicy_null_0100] END');
    })

    /**
     * @tc.name   textInputHeightAdaptivePolicy_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_HEIGHTADAPTIVEPOLICY_UNDEFINED_0100
     * @tc.desc   Test TextInput heightAdaptivePolicy property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputHeightAdaptivePolicy_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputHeightAdaptivePolicy_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_heightAdaptivePolicy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_heightAdaptivePolicy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputHeightAdaptivePolicy_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputHeightAdaptivePolicy_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputHeightAdaptivePolicy_undefined_0100] default heightAdaptivePolicy is: " + objCompare.$attrs.heightAdaptivePolicy);
      console.info("[textInputHeightAdaptivePolicy_undefined_0100] undefined heightAdaptivePolicy is: " + obj.$attrs.heightAdaptivePolicy);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.heightAdaptivePolicy).assertEqual(objCompare.$attrs.heightAdaptivePolicy);
      console.info('[textInputHeightAdaptivePolicy_undefined_0100] END');
    })

    /**
     * @tc.name   textInputDecoration_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_NULL_0100
     * @tc.desc   Test TextInput decoration property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputDecoration_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecoration_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_decoration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_decoration_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecoration_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputDecoration_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecoration_null_0100] default decoration is: " + objCompare.$attrs.decoration);
      console.info("[textInputDecoration_null_0100] null decoration is: " + obj.$attrs.decoration);

      // null 应该恢复为默认值
      expect(obj.$attrs.decoration).assertEqual(objCompare.$attrs.decoration);
      console.info('[textInputDecoration_null_0100] END');
    })

    /**
     * @tc.name   textInputDecoration_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_DECORATION_UNDEFINED_0100
     * @tc.desc   Test TextInput decoration property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputDecoration_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputDecoration_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_decoration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_decoration_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputDecoration_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputDecoration_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputDecoration_undefined_0100] default decoration is: " + objCompare.$attrs.decoration);
      console.info("[textInputDecoration_undefined_0100] undefined decoration is: " + obj.$attrs.decoration);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.decoration).assertEqual(objCompare.$attrs.decoration);
      console.info('[textInputDecoration_undefined_0100] END');
    })

    /**
     * @tc.name   textInputEditMenuOptions_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_EDITMENUOPTIONS_NULL_0100
     * @tc.desc   Test TextInput editMenuOptions property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEditMenuOptions_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputEditMenuOptions_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_editMenuOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_editMenuOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEditMenuOptions_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEditMenuOptions_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEditMenuOptions_null_0100] default editMenuOptions is: " + objCompare.$attrs.editMenuOptions);
      console.info("[textInputEditMenuOptions_null_0100] null editMenuOptions is: " + obj.$attrs.editMenuOptions);

      // null 应该恢复为默认值
      expect(obj.$attrs.editMenuOptions).assertEqual(objCompare.$attrs.editMenuOptions);
      console.info('[textInputEditMenuOptions_null_0100] END');
    })

    /**
     * @tc.name   textInputEditMenuOptions_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_EDITMENUOPTIONS_UNDEFINED_0100
     * @tc.desc   Test TextInput editMenuOptions property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEditMenuOptions_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputEditMenuOptions_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_editMenuOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_editMenuOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEditMenuOptions_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEditMenuOptions_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEditMenuOptions_undefined_0100] default editMenuOptions is: " + objCompare.$attrs.editMenuOptions);
      console.info("[textInputEditMenuOptions_undefined_0100] undefined editMenuOptions is: " + obj.$attrs.editMenuOptions);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.editMenuOptions).assertEqual(objCompare.$attrs.editMenuOptions);
      console.info('[textInputEditMenuOptions_undefined_0100] END');
    })

    /**
     * @tc.name   textInputAutoCapitalizationMode_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_AUTOCAPITALIZATIONMODE_NULL_0100
     * @tc.desc   Test TextInput autoCapitalizationMode property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputAutoCapitalizationMode_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputAutoCapitalizationMode_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_autoCapitalizationMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_autoCapitalizationMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputAutoCapitalizationMode_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputAutoCapitalizationMode_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputAutoCapitalizationMode_null_0100] default autoCapitalizationMode is: " + objCompare.$attrs.autoCapitalizationMode);
      console.info("[textInputAutoCapitalizationMode_null_0100] null autoCapitalizationMode is: " + obj.$attrs.autoCapitalizationMode);

      // null 应该恢复为默认值
      expect(obj.$attrs.autoCapitalizationMode).assertEqual(objCompare.$attrs.autoCapitalizationMode);
      console.info('[textInputAutoCapitalizationMode_null_0100] END');
    })

    /**
     * @tc.name   textInputAutoCapitalizationMode_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_AUTOCAPITALIZATIONMODE_UNDEFINED_0100
     * @tc.desc   Test TextInput autoCapitalizationMode property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputAutoCapitalizationMode_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputAutoCapitalizationMode_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_autoCapitalizationMode_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_autoCapitalizationMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputAutoCapitalizationMode_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputAutoCapitalizationMode_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputAutoCapitalizationMode_undefined_0100] default autoCapitalizationMode is: " + objCompare.$attrs.autoCapitalizationMode);
      console.info("[textInputAutoCapitalizationMode_undefined_0100] undefined autoCapitalizationMode is: " + obj.$attrs.autoCapitalizationMode);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.autoCapitalizationMode).assertEqual(objCompare.$attrs.autoCapitalizationMode);
      console.info('[textInputAutoCapitalizationMode_undefined_0100] END');
    })

    /**
     * @tc.name   textInputStopBackPress_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_STOPBACKPRESS_NULL_0100
     * @tc.desc   Test TextInput stopBackPress property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputStopBackPress_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputStopBackPress_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_stopBackPress_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_stopBackPress_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputStopBackPress_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputStopBackPress_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputStopBackPress_null_0100] default stopBackPress is: " + objCompare.$attrs.stopBackPress);
      console.info("[textInputStopBackPress_null_0100] null stopBackPress is: " + obj.$attrs.stopBackPress);

      // null 应该恢复为默认值
      expect(obj.$attrs.stopBackPress).assertEqual(objCompare.$attrs.stopBackPress);
      console.info('[textInputStopBackPress_null_0100] END');
    })

    /**
     * @tc.name   textInputStopBackPress_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_STOPBACKPRESS_UNDEFINED_0100
     * @tc.desc   Test TextInput stopBackPress property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputStopBackPress_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputStopBackPress_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_stopBackPress_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_stopBackPress_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputStopBackPress_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputStopBackPress_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputStopBackPress_undefined_0100] default stopBackPress is: " + objCompare.$attrs.stopBackPress);
      console.info("[textInputStopBackPress_undefined_0100] undefined stopBackPress is: " + obj.$attrs.stopBackPress);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.stopBackPress).assertEqual(objCompare.$attrs.stopBackPress);
      console.info('[textInputStopBackPress_undefined_0100] END');
    })

    /**
     * @tc.name   textInputKeyboardAppearance_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_KEYBOARDAPPEARANCE_NULL_0100
     * @tc.desc   Test TextInput keyboardAppearance property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputKeyboardAppearance_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputKeyboardAppearance_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_keyboardAppearance_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_keyboardAppearance_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputKeyboardAppearance_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputKeyboardAppearance_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputKeyboardAppearance_null_0100] default keyboardAppearance is: " + objCompare.$attrs.keyboardAppearance);
      console.info("[textInputKeyboardAppearance_null_0100] null keyboardAppearance is: " + obj.$attrs.keyboardAppearance);

      // null 应该恢复为默认值
      expect(obj.$attrs.keyboardAppearance).assertEqual(objCompare.$attrs.keyboardAppearance);
      console.info('[textInputKeyboardAppearance_null_0100] END');
    })

    /**
     * @tc.name   textInputKeyboardAppearance_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_KEYBOARDAPPEARANCE_UNDEFINED_0100
     * @tc.desc   Test TextInput keyboardAppearance property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputKeyboardAppearance_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputKeyboardAppearance_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_keyboardAppearance_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_keyboardAppearance_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputKeyboardAppearance_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputKeyboardAppearance_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputKeyboardAppearance_undefined_0100] default keyboardAppearance is: " + objCompare.$attrs.keyboardAppearance);
      console.info("[textInputKeyboardAppearance_undefined_0100] undefined keyboardAppearance is: " + obj.$attrs.keyboardAppearance);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.keyboardAppearance).assertEqual(objCompare.$attrs.keyboardAppearance);
      console.info('[textInputKeyboardAppearance_undefined_0100] END');
    })

    /**
     * @tc.name   textInputStrokeWidth_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_STROKEWIDTH_NULL_0100
     * @tc.desc   Test TextInput strokeWidth property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputStrokeWidth_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputStrokeWidth_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_strokeWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputStrokeWidth_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputStrokeWidth_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputStrokeWidth_null_0100] default strokeWidth is: " + objCompare.$attrs.strokeWidth);
      console.info("[textInputStrokeWidth_null_0100] null strokeWidth is: " + obj.$attrs.strokeWidth);

      // null 应该恢复为默认值
      expect(obj.$attrs.strokeWidth).assertEqual(objCompare.$attrs.strokeWidth);
      console.info('[textInputStrokeWidth_null_0100] END');
    })

    /**
     * @tc.name   textInputStrokeWidth_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_STROKEWIDTH_UNDEFINED_0100
     * @tc.desc   Test TextInput strokeWidth property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputStrokeWidth_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputStrokeWidth_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_strokeWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputStrokeWidth_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputStrokeWidth_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputStrokeWidth_undefined_0100] default strokeWidth is: " + objCompare.$attrs.strokeWidth);
      console.info("[textInputStrokeWidth_undefined_0100] undefined strokeWidth is: " + obj.$attrs.strokeWidth);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.strokeWidth).assertEqual(objCompare.$attrs.strokeWidth);
      console.info('[textInputStrokeWidth_undefined_0100] END');
    })

    /**
     * @tc.name   textInputStrokeColor_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_STROKECOLOR_NULL_0100
     * @tc.desc   Test TextInput strokeColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputStrokeColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputStrokeColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_strokeColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputStrokeColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputStrokeColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputStrokeColor_null_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[textInputStrokeColor_null_0100] null strokeColor is: " + obj.$attrs.strokeColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.strokeColor as string;
      let nullColor: string = obj.$attrs.strokeColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[textInputStrokeColor_null_0100] END');
    })

    /**
     * @tc.name   textInputStrokeColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_STROKECOLOR_UNDEFINED_0100
     * @tc.desc   Test TextInput strokeColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputStrokeColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputStrokeColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_strokeColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputStrokeColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputStrokeColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputStrokeColor_undefined_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[textInputStrokeColor_undefined_0100] undefined strokeColor is: " + obj.$attrs.strokeColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.strokeColor as string;
      let undefinedColor: string = obj.$attrs.strokeColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[textInputStrokeColor_undefined_0100] END');
    })

    /**
     * @tc.name   textInputEnableAutoFillAnimation_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEAUTOFILLANIMATION_NULL_0100
     * @tc.desc   Test TextInput enableAutoFillAnimation property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableAutoFillAnimation_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableAutoFillAnimation_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableAutoFillAnimation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableAutoFillAnimation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableAutoFillAnimation_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableAutoFillAnimation_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableAutoFillAnimation_null_0100] default enableAutoFillAnimation is: " + objCompare.$attrs.enableAutoFillAnimation);
      console.info("[textInputEnableAutoFillAnimation_null_0100] null enableAutoFillAnimation is: " + obj.$attrs.enableAutoFillAnimation);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableAutoFillAnimation).assertEqual(objCompare.$attrs.enableAutoFillAnimation);
      console.info('[textInputEnableAutoFillAnimation_null_0100] END');
    })

    /**
     * @tc.name   textInputEnableAutoFillAnimation_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEAUTOFILLANIMATION_UNDEFINED_0100
     * @tc.desc   Test TextInput enableAutoFillAnimation property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableAutoFillAnimation_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableAutoFillAnimation_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableAutoFillAnimation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableAutoFillAnimation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableAutoFillAnimation_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableAutoFillAnimation_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableAutoFillAnimation_undefined_0100] default enableAutoFillAnimation is: " + objCompare.$attrs.enableAutoFillAnimation);
      console.info("[textInputEnableAutoFillAnimation_undefined_0100] undefined enableAutoFillAnimation is: " + obj.$attrs.enableAutoFillAnimation);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableAutoFillAnimation).assertEqual(objCompare.$attrs.enableAutoFillAnimation);
      console.info('[textInputEnableAutoFillAnimation_undefined_0100] END');
    })

    /**
     * @tc.name   textInputEnableAutoSpacing_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEAUTOSPACING_NULL_0100
     * @tc.desc   Test TextInput enableAutoSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableAutoSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableAutoSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableAutoSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableAutoSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableAutoSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableAutoSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableAutoSpacing_null_0100] default enableAutoSpacing is: " + objCompare.$attrs.enableAutoSpacing);
      console.info("[textInputEnableAutoSpacing_null_0100] null enableAutoSpacing is: " + obj.$attrs.enableAutoSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableAutoSpacing).assertEqual(objCompare.$attrs.enableAutoSpacing);
      console.info('[textInputEnableAutoSpacing_null_0100] END');
    })

    /**
     * @tc.name   textInputEnableAutoSpacing_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_ENABLEAUTOSPACING_UNDEFINED_0100
     * @tc.desc   Test TextInput enableAutoSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputEnableAutoSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputEnableAutoSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_enableAutoSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_enableAutoSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputEnableAutoSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputEnableAutoSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputEnableAutoSpacing_undefined_0100] default enableAutoSpacing is: " + objCompare.$attrs.enableAutoSpacing);
      console.info("[textInputEnableAutoSpacing_undefined_0100] undefined enableAutoSpacing is: " + obj.$attrs.enableAutoSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableAutoSpacing).assertEqual(objCompare.$attrs.enableAutoSpacing);
      console.info('[textInputEnableAutoSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   textInputIncludeFontPadding_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_INCLUDEFONTPADDING_NULL_0100
     * @tc.desc   Test TextInput includeFontPadding property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputIncludeFontPadding_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputIncludeFontPadding_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_includeFontPadding_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_includeFontPadding_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputIncludeFontPadding_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputIncludeFontPadding_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputIncludeFontPadding_null_0100] default includeFontPadding is: " + objCompare.$attrs.includeFontPadding);
      console.info("[textInputIncludeFontPadding_null_0100] null includeFontPadding is: " + obj.$attrs.includeFontPadding);

      // null 应该恢复为默认值
      expect(obj.$attrs.includeFontPadding).assertEqual(objCompare.$attrs.includeFontPadding);
      console.info('[textInputIncludeFontPadding_null_0100] END');
    })

    /**
     * @tc.name   textInputIncludeFontPadding_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_INCLUDEFONTPADDING_UNDEFINED_0100
     * @tc.desc   Test TextInput includeFontPadding property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputIncludeFontPadding_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputIncludeFontPadding_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_includeFontPadding_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_includeFontPadding_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputIncludeFontPadding_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputIncludeFontPadding_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputIncludeFontPadding_undefined_0100] default includeFontPadding is: " + objCompare.$attrs.includeFontPadding);
      console.info("[textInputIncludeFontPadding_undefined_0100] undefined includeFontPadding is: " + obj.$attrs.includeFontPadding);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.includeFontPadding).assertEqual(objCompare.$attrs.includeFontPadding);
      console.info('[textInputIncludeFontPadding_undefined_0100] END');
    })

    /**
     * @tc.name   textInputFallbackLineSpacing_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FALLBACKLINESPACING_NULL_0100
     * @tc.desc   Test TextInput fallbackLineSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFallbackLineSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputFallbackLineSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fallbackLineSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fallbackLineSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFallbackLineSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFallbackLineSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFallbackLineSpacing_null_0100] default fallbackLineSpacing is: " + objCompare.$attrs.fallbackLineSpacing);
      console.info("[textInputFallbackLineSpacing_null_0100] null fallbackLineSpacing is: " + obj.$attrs.fallbackLineSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.fallbackLineSpacing).assertEqual(objCompare.$attrs.fallbackLineSpacing);
      console.info('[textInputFallbackLineSpacing_null_0100] END');
    })

    /**
     * @tc.name   textInputFallbackLineSpacing_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FALLBACKLINESPACING_UNDEFINED_0100
     * @tc.desc   Test TextInput fallbackLineSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFallbackLineSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputFallbackLineSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fallbackLineSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fallbackLineSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFallbackLineSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFallbackLineSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFallbackLineSpacing_undefined_0100] default fallbackLineSpacing is: " + objCompare.$attrs.fallbackLineSpacing);
      console.info("[textInputFallbackLineSpacing_undefined_0100] undefined fallbackLineSpacing is: " + obj.$attrs.fallbackLineSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fallbackLineSpacing).assertEqual(objCompare.$attrs.fallbackLineSpacing);
      console.info('[textInputFallbackLineSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   textInputCompressLeadingPunctuation_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_COMPRESSLEADINGPUNCTUATION_NULL_0100
     * @tc.desc   Test TextInput compressLeadingPunctuation property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCompressLeadingPunctuation_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputCompressLeadingPunctuation_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_compressLeadingPunctuation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_compressLeadingPunctuation_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCompressLeadingPunctuation_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCompressLeadingPunctuation_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCompressLeadingPunctuation_null_0100] default compressLeadingPunctuation is: " + objCompare.$attrs.compressLeadingPunctuation);
      console.info("[textInputCompressLeadingPunctuation_null_0100] null compressLeadingPunctuation is: " + obj.$attrs.compressLeadingPunctuation);

      // null 应该恢复为默认值
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objCompare.$attrs.compressLeadingPunctuation);
      console.info('[textInputCompressLeadingPunctuation_null_0100] END');
    })

    /**
     * @tc.name   textInputCompressLeadingPunctuation_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_COMPRESSLEADINGPUNCTUATION_UNDEFINED_0100
     * @tc.desc   Test TextInput compressLeadingPunctuation property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCompressLeadingPunctuation_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputCompressLeadingPunctuation_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_compressLeadingPunctuation_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_compressLeadingPunctuation_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCompressLeadingPunctuation_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCompressLeadingPunctuation_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCompressLeadingPunctuation_undefined_0100] default compressLeadingPunctuation is: " + objCompare.$attrs.compressLeadingPunctuation);
      console.info("[textInputCompressLeadingPunctuation_undefined_0100] undefined compressLeadingPunctuation is: " + obj.$attrs.compressLeadingPunctuation);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.compressLeadingPunctuation).assertEqual(objCompare.$attrs.compressLeadingPunctuation);
      console.info('[textInputCompressLeadingPunctuation_undefined_0100] END');
    })

    /**
     * @tc.name   textInputSelectedDragPreviewStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTEDDRAGPREVIEWSTYLE_NULL_0100
     * @tc.desc   Test TextInput selectedDragPreviewStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectedDragPreviewStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputSelectedDragPreviewStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_selectedDragPreviewStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_selectedDragPreviewStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectedDragPreviewStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputSelectedDragPreviewStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputSelectedDragPreviewStyle_null_0100] default selectedDragPreviewStyle is: " + objCompare.$attrs.selectedDragPreviewStyle);
      console.info("[textInputSelectedDragPreviewStyle_null_0100] null selectedDragPreviewStyle is: " + obj.$attrs.selectedDragPreviewStyle);

      // null 应该恢复为默认值
      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual(objCompare.$attrs.selectedDragPreviewStyle);
      console.info('[textInputSelectedDragPreviewStyle_null_0100] END');
    })

    /**
     * @tc.name   textInputSelectedDragPreviewStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SELECTEDDRAGPREVIEWSTYLE_UNDEFINED_0100
     * @tc.desc   Test TextInput selectedDragPreviewStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputSelectedDragPreviewStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputSelectedDragPreviewStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_selectedDragPreviewStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_selectedDragPreviewStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputSelectedDragPreviewStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputSelectedDragPreviewStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputSelectedDragPreviewStyle_undefined_0100] default selectedDragPreviewStyle is: " + objCompare.$attrs.selectedDragPreviewStyle);
      console.info("[textInputSelectedDragPreviewStyle_undefined_0100] undefined selectedDragPreviewStyle is: " + obj.$attrs.selectedDragPreviewStyle);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual(objCompare.$attrs.selectedDragPreviewStyle);
      console.info('[textInputSelectedDragPreviewStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textInputTextDirection_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_TEXTDIRECTION_NULL_0100
     * @tc.desc   Test TextInput textDirection property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTextDirection_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputTextDirection_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_textDirection_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_textDirection_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTextDirection_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTextDirection_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputTextDirection_null_0100] default textDirection is: " + objCompare.$attrs.textDirection);
      console.info("[textInputTextDirection_null_0100] null textDirection is: " + obj.$attrs.textDirection);

      // null 应该恢复为默认值
      expect(obj.$attrs.textDirection).assertEqual(objCompare.$attrs.textDirection);
      console.info('[textInputTextDirection_null_0100] END');
    })

    /**
     * @tc.name   textInputTextDirection_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_TEXTDIRECTION_UNDEFINED_0100
     * @tc.desc   Test TextInput textDirection property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputTextDirection_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputTextDirection_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_textDirection_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_textDirection_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputTextDirection_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputTextDirection_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputTextDirection_undefined_0100] default textDirection is: " + objCompare.$attrs.textDirection);
      console.info("[textInputTextDirection_undefined_0100] undefined textDirection is: " + obj.$attrs.textDirection);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textDirection).assertEqual(objCompare.$attrs.textDirection);
      console.info('[textInputTextDirection_undefined_0100] END');
    })

    /**
     * @tc.name   textInputCaretPosition_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CARETPOSITION_NULL_0100
     * @tc.desc   Test TextInput caretPosition property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCaretPosition_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputCaretPosition_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_caretPosition_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_caretPosition_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCaretPosition_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCaretPosition_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCaretPosition_null_0100] default caretPosition is: " + objCompare.$attrs.caretPosition);
      console.info("[textInputCaretPosition_null_0100] null caretPosition is: " + obj.$attrs.caretPosition);

      // null 应该恢复为默认值
      expect(obj.$attrs.caretPosition).assertEqual('0');
      console.info('[textInputCaretPosition_null_0100] END');
    })

    /**
     * @tc.name   textInputCaretPosition_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_CARETPOSITION_UNDEFINED_0100
     * @tc.desc   Test TextInput caretPosition property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputCaretPosition_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputCaretPosition_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_caretPosition_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_caretPosition_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputCaretPosition_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputCaretPosition_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputCaretPosition_undefined_0100] default caretPosition is: " + objCompare.$attrs.caretPosition);
      console.info("[textInputCaretPosition_undefined_0100] undefined caretPosition is: " + obj.$attrs.caretPosition);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.caretPosition).assertEqual('0');
      console.info('[textInputCaretPosition_undefined_0100] END');
    })
  })
}
