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

export default function TextAreaPropertiesNullUndefinedTest() {
  describe('TextAreaPropertiesNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextArea/TextAreaPropertiesNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaPropertiesNullUndefinedTest state success " + JSON.stringify(pages));
        if (!("TextAreaPropertiesNullUndefined" == pages.name)) {
          console.info("get TextAreaPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextAreaPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaPropertiesNullUndefinedTest page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(500);
      console.info("TextAreaPropertiesNullUndefinedTest after each called");
    });
    /**
     * @tc.name   textAreaPlaceholderColor_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_PLACEHOLDERCOLOR_NULL_0100
     * @tc.desc   Test TextArea placeholderColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaPlaceholderColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaPlaceholderColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_placeholderColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_placeholderColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaPlaceholderColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaPlaceholderColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaPlaceholderColor_null_0100] default placeholderColor is: " + objCompare.$attrs.placeholderColor);
      console.info("[textAreaPlaceholderColor_null_0100] null placeholderColor is: " + obj.$attrs.placeholderColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.placeholderColor as string;
      let nullColor: string = obj.$attrs.placeholderColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[textAreaPlaceholderColor_null_0100] END');
    })

    /**
     * @tc.name   textAreaPlaceholderColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_PLACEHOLDERCOLOR_UNDEFINED_0100
     * @tc.desc   Test TextArea placeholderColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaPlaceholderColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaPlaceholderColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_placeholderColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_placeholderColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaPlaceholderColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaPlaceholderColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaPlaceholderColor_undefined_0100] default placeholderColor is: " + objCompare.$attrs.placeholderColor);
      console.info("[textAreaPlaceholderColor_undefined_0100] undefined placeholderColor is: " + obj.$attrs.placeholderColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.placeholderColor as string;
      let undefinedColor: string = obj.$attrs.placeholderColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[textAreaPlaceholderColor_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaPlaceholderFont_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_PLACEHOLDERFONT_NULL_0100
     * @tc.desc   Test TextArea placeholderFont property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaPlaceholderFont_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaPlaceholderFont_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_placeholderFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_placeholderFont_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaPlaceholderFont_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaPlaceholderFont_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaPlaceholderFont_null_0100] default placeholderFont is: " + objCompare.$attrs.placeholderFont);
      console.info("[textAreaPlaceholderFont_null_0100] null placeholderFont is: " + obj.$attrs.placeholderFont);

      // null 应该恢复为默认值
      expect(obj.$attrs.placeholderFont).assertEqual(objCompare.$attrs.placeholderFont);
      console.info('[textAreaPlaceholderFont_null_0100] END');
    })

    /**
     * @tc.name   textAreaPlaceholderFont_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_PLACEHOLDERFONT_UNDEFINED_0100
     * @tc.desc   Test TextArea placeholderFont property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaPlaceholderFont_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaPlaceholderFont_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_placeholderFont_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_placeholderFont_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaPlaceholderFont_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaPlaceholderFont_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaPlaceholderFont_undefined_0100] default placeholderFont is: " + objCompare.$attrs.placeholderFont);
      console.info("[textAreaPlaceholderFont_undefined_0100] undefined placeholderFont is: " + obj.$attrs.placeholderFont);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.placeholderFont).assertEqual(objCompare.$attrs.placeholderFont);
      console.info('[textAreaPlaceholderFont_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaEnterKeyType_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENTERKEYTYPE_NULL_0100
     * @tc.desc   Test TextArea enterKeyType property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnterKeyType_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnterKeyType_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enterKeyType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enterKeyType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnterKeyType_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnterKeyType_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnterKeyType_null_0100] default enterKeyType is: " + objCompare.$attrs.enterKeyType);
      console.info("[textAreaEnterKeyType_null_0100] null enterKeyType is: " + obj.$attrs.enterKeyType);

      // null 应该恢复为默认值
      expect(obj.$attrs.enterKeyType).assertEqual(objCompare.$attrs.enterKeyType);
      console.info('[textAreaEnterKeyType_null_0100] END');
    })

    /**
     * @tc.name   textAreaEnterKeyType_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENTERKEYTYPE_UNDEFINED_0100
     * @tc.desc   Test TextArea enterKeyType property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnterKeyType_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnterKeyType_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enterKeyType_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enterKeyType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnterKeyType_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnterKeyType_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnterKeyType_undefined_0100] default enterKeyType is: " + objCompare.$attrs.enterKeyType);
      console.info("[textAreaEnterKeyType_undefined_0100] undefined enterKeyType is: " + obj.$attrs.enterKeyType);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enterKeyType).assertEqual(objCompare.$attrs.enterKeyType);
      console.info('[textAreaEnterKeyType_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaTextAlign_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_TEXTALIGN_NULL_0100
     * @tc.desc   Test TextArea textAlign property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaTextAlign_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaTextAlign_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_textAlign_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_textAlign_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaTextAlign_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaTextAlign_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaTextAlign_null_0100] default textAlign is: " + objCompare.$attrs.textAlign);
      console.info("[textAreaTextAlign_null_0100] null textAlign is: " + obj.$attrs.textAlign);

      // null 应该恢复为默认值
      expect(obj.$attrs.textAlign).assertEqual(objCompare.$attrs.textAlign);
      console.info('[textAreaTextAlign_null_0100] END');
    })

    /**
     * @tc.name   textAreaTextAlign_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_TEXTALIGN_UNDEFINED_0100
     * @tc.desc   Test TextArea textAlign property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaTextAlign_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaTextAlign_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_textAlign_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_textAlign_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaTextAlign_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaTextAlign_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaTextAlign_undefined_0100] default textAlign is: " + objCompare.$attrs.textAlign);
      console.info("[textAreaTextAlign_undefined_0100] undefined textAlign is: " + obj.$attrs.textAlign);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textAlign).assertEqual(objCompare.$attrs.textAlign);
      console.info('[textAreaTextAlign_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaCaretColor_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CARETCOLOR_NULL_0100
     * @tc.desc   Test TextArea caretColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaCaretColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaCaretColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_caretColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_caretColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaCaretColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaCaretColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaCaretColor_null_0100] default caretColor is: " + objCompare.$attrs.caretColor);
      console.info("[textAreaCaretColor_null_0100] null caretColor is: " + obj.$attrs.caretColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.caretColor as string;
      let nullColor: string = obj.$attrs.caretColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[textAreaCaretColor_null_0100] END');
    })

    /**
     * @tc.name   textAreaCaretColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CARETCOLOR_UNDEFINED_0100
     * @tc.desc   Test TextArea caretColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaCaretColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaCaretColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_caretColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_caretColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaCaretColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaCaretColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaCaretColor_undefined_0100] default caretColor is: " + objCompare.$attrs.caretColor);
      console.info("[textAreaCaretColor_undefined_0100] undefined caretColor is: " + obj.$attrs.caretColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.caretColor as string;
      let undefinedColor: string = obj.$attrs.caretColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[textAreaCaretColor_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaFontStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_FONTSTYLE_NULL_0100
     * @tc.desc   Test TextArea fontStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaFontStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaFontStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_fontStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaFontStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaFontStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaFontStyle_null_0100] default fontStyle is: " + objCompare.$attrs.fontStyle);
      console.info("[textAreaFontStyle_null_0100] null fontStyle is: " + obj.$attrs.fontStyle);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[textAreaFontStyle_null_0100] END');
    })

    /**
     * @tc.name   textAreaFontStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_FONTSTYLE_UNDEFINED_0100
     * @tc.desc   Test TextArea fontStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaFontStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaFontStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_fontStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaFontStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaFontStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaFontStyle_undefined_0100] default fontStyle is: " + objCompare.$attrs.fontStyle);
      console.info("[textAreaFontStyle_undefined_0100] undefined fontStyle is: " + obj.$attrs.fontStyle);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[textAreaFontStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaFontFamily_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_FONTFAMILY_NULL_0100
     * @tc.desc   Test TextArea fontFamily property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaFontFamily_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaFontFamily_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_fontFamily_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaFontFamily_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaFontFamily_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaFontFamily_null_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textAreaFontFamily_null_0100] null fontFamily is: " + obj.$attrs.fontFamily);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[textAreaFontFamily_null_0100] END');
    })

    /**
     * @tc.name   textAreaFontFamily_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_FONTFAMILY_UNDEFINED_0100
     * @tc.desc   Test TextArea fontFamily property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaFontFamily_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaFontFamily_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_fontFamily_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaFontFamily_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaFontFamily_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaFontFamily_undefined_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textAreaFontFamily_undefined_0100] undefined fontFamily is: " + obj.$attrs.fontFamily);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[textAreaFontFamily_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaTextOverflow_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_TEXTOVERFLOW_NULL_0100
     * @tc.desc   Test TextArea textOverflow property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaTextOverflow_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaTextOverflow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_textOverflow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_textOverflow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaTextOverflow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaTextOverflow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaTextOverflow_null_0100] default textOverflow is: " + objCompare.$attrs.textOverflow);
      console.info("[textAreaTextOverflow_null_0100] null textOverflow is: " + obj.$attrs.textOverflow);

      // null 应该恢复为默认值
      expect(obj.$attrs.textOverflow).assertEqual(objCompare.$attrs.textOverflow);
      console.info('[textAreaTextOverflow_null_0100] END');
    })

    /**
     * @tc.name   textAreaTextOverflow_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_TEXTOVERFLOW_UNDEFINED_0100
     * @tc.desc   Test TextArea textOverflow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaTextOverflow_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaTextOverflow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_textOverflow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_textOverflow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaTextOverflow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaTextOverflow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaTextOverflow_undefined_0100] default textOverflow is: " + objCompare.$attrs.textOverflow);
      console.info("[textAreaTextOverflow_undefined_0100] undefined textOverflow is: " + obj.$attrs.textOverflow);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textOverflow).assertEqual(objCompare.$attrs.textOverflow);
      console.info('[textAreaTextOverflow_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaTextIndent_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_TEXTINDENT_NULL_0100
     * @tc.desc   Test TextArea textIndent property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaTextIndent_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaTextIndent_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_textIndent_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_textIndent_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaTextIndent_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaTextIndent_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaTextIndent_null_0100] default textIndent is: " + objCompare.$attrs.textIndent);
      console.info("[textAreaTextIndent_null_0100] null textIndent is: " + obj.$attrs.textIndent);

      // null 应该恢复为默认值
      expect(obj.$attrs.textIndent).assertContain('0.00');
      console.info('[textAreaTextIndent_null_0100] END');
    })

    /**
     * @tc.name   textAreaTextIndent_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_TEXTINDENT_UNDEFINED_0100
     * @tc.desc   Test TextArea textIndent property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaTextIndent_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaTextIndent_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_textIndent_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_textIndent_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaTextIndent_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaTextIndent_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaTextIndent_undefined_0100] default textIndent is: " + objCompare.$attrs.textIndent);
      console.info("[textAreaTextIndent_undefined_0100] undefined textIndent is: " + obj.$attrs.textIndent);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.textIndent).assertContain('0.00');
      console.info('[textAreaTextIndent_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaInputFilter_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_INPUTFILTER_NULL_0100
     * @tc.desc   Test TextArea inputFilter property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaInputFilter_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaInputFilter_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_inputFilter_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_inputFilter_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaInputFilter_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaInputFilter_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaInputFilter_null_0100] default inputFilter is: " + objCompare.$attrs.inputFilter);
      console.info("[textAreaInputFilter_null_0100] null inputFilter is: " + obj.$attrs.inputFilter);

      // null 应该恢复为默认值
      expect(obj.$attrs.inputFilter).assertEqual(objCompare.$attrs.inputFilter);
      console.info('[textAreaInputFilter_null_0100] END');
    })

    /**
     * @tc.name   textAreaInputFilter_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_INPUTFILTER_UNDEFINED_0100
     * @tc.desc   Test TextArea inputFilter property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaInputFilter_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaInputFilter_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_inputFilter_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_inputFilter_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaInputFilter_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaInputFilter_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaInputFilter_undefined_0100] default inputFilter is: " + objCompare.$attrs.inputFilter);
      console.info("[textAreaInputFilter_undefined_0100] undefined inputFilter is: " + obj.$attrs.inputFilter);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.inputFilter).assertEqual(objCompare.$attrs.inputFilter);
      console.info('[textAreaInputFilter_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaCaretStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CARETSTYLE_NULL_0100
     * @tc.desc   Test TextArea caretStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaCaretStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaCaretStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_caretStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_caretStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaCaretStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaCaretStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaCaretStyle_null_0100] default caretStyle is: " + objCompare.$attrs.caretStyle);
      console.info("[textAreaCaretStyle_null_0100] null caretStyle is: " + obj.$attrs.caretStyle);

      // null 应该恢复为默认值
      expect(obj.$attrs.caretStyle).assertEqual(objCompare.$attrs.caretStyle);
      console.info('[textAreaCaretStyle_null_0100] END');
    })

    /**
     * @tc.name   textAreaCaretStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_CARETSTYLE_UNDEFINED_0100
     * @tc.desc   Test TextArea caretStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaCaretStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaCaretStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_caretStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_caretStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaCaretStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaCaretStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaCaretStyle_undefined_0100] default caretStyle is: " + objCompare.$attrs.caretStyle);
      console.info("[textAreaCaretStyle_undefined_0100] undefined caretStyle is: " + obj.$attrs.caretStyle);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.caretStyle).assertEqual(objCompare.$attrs.caretStyle);
      console.info('[textAreaCaretStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaSelectedBackgroundColor_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SELECTEDBACKGROUNDCOLOR_NULL_0100
     * @tc.desc   Test TextArea selectedBackgroundColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaSelectedBackgroundColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaSelectedBackgroundColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_selectedBackgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_selectedBackgroundColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaSelectedBackgroundColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaSelectedBackgroundColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaSelectedBackgroundColor_null_0100] default selectedBackgroundColor is: " + objCompare.$attrs.selectedBackgroundColor);
      console.info("[textAreaSelectedBackgroundColor_null_0100] null selectedBackgroundColor is: " + obj.$attrs.selectedBackgroundColor);

      // null 应该恢复为默认值
      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objCompare.$attrs.selectedBackgroundColor);
      console.info('[textAreaSelectedBackgroundColor_null_0100] END');
    })

    /**
     * @tc.name   textAreaSelectedBackgroundColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SELECTEDBACKGROUNDCOLOR_UNDEFINED_0100
     * @tc.desc   Test TextArea selectedBackgroundColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaSelectedBackgroundColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaSelectedBackgroundColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_selectedBackgroundColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_selectedBackgroundColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaSelectedBackgroundColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaSelectedBackgroundColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaSelectedBackgroundColor_undefined_0100] default selectedBackgroundColor is: " + objCompare.$attrs.selectedBackgroundColor);
      console.info("[textAreaSelectedBackgroundColor_undefined_0100] undefined selectedBackgroundColor is: " + obj.$attrs.selectedBackgroundColor);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.selectedBackgroundColor).assertEqual(objCompare.$attrs.selectedBackgroundColor);
      console.info('[textAreaSelectedBackgroundColor_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaCopyOption_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_COPYOPTION_NULL_0100
     * @tc.desc   Test TextArea copyOption property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaCopyOption_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaCopyOption_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_copyOption_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_copyOption_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaCopyOption_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaCopyOption_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaCopyOption_null_0100] default copyOption is: " + objCompare.$attrs.copyOption);
      console.info("[textAreaCopyOption_null_0100] null copyOption is: " + obj.$attrs.copyOption);

      // null 应该恢复为默认值
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);
      console.info('[textAreaCopyOption_null_0100] END');
    })

    /**
     * @tc.name   textAreaCopyOption_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_COPYOPTION_UNDEFINED_0100
     * @tc.desc   Test TextArea copyOption property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaCopyOption_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaCopyOption_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_copyOption_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_copyOption_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaCopyOption_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaCopyOption_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaCopyOption_undefined_0100] default copyOption is: " + objCompare.$attrs.copyOption);
      console.info("[textAreaCopyOption_undefined_0100] undefined copyOption is: " + obj.$attrs.copyOption);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.copyOption).assertEqual(objCompare.$attrs.copyOption);
      console.info('[textAreaCopyOption_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaMaxLength_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MAXLENGTH_NULL_0100
     * @tc.desc   Test TextArea maxLength property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMaxLength_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMaxLength_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_maxLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_maxLength_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMaxLength_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMaxLength_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMaxLength_null_0100] default maxLength is: " + objCompare.$attrs.maxLength);
      console.info("[textAreaMaxLength_null_0100] null maxLength is: " + obj.$attrs.maxLength);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxLength).assertEqual(objCompare.$attrs.maxLength);
      console.info('[textAreaMaxLength_null_0100] END');
    })

    /**
     * @tc.name   textAreaMaxLength_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MAXLENGTH_UNDEFINED_0100
     * @tc.desc   Test TextArea maxLength property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMaxLength_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMaxLength_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_maxLength_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_maxLength_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMaxLength_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMaxLength_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMaxLength_undefined_0100] default maxLength is: " + objCompare.$attrs.maxLength);
      console.info("[textAreaMaxLength_undefined_0100] undefined maxLength is: " + obj.$attrs.maxLength);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxLength).assertEqual(objCompare.$attrs.maxLength);
      console.info('[textAreaMaxLength_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaMinFontScale_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MINFONTSCALE_NULL_0100
     * @tc.desc   Test TextArea minFontScale property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMinFontScale_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMinFontScale_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_minFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_minFontScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMinFontScale_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMinFontScale_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMinFontScale_null_0100] default minFontScale is: " + objCompare.$attrs.minFontScale);
      console.info("[textAreaMinFontScale_null_0100] null minFontScale is: " + obj.$attrs.minFontScale);

      // null 应该恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      console.info('[textAreaMinFontScale_null_0100] END');
    })

    /**
     * @tc.name   textAreaMinFontScale_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MINFONTSCALE_UNDEFINED_0100
     * @tc.desc   Test TextArea minFontScale property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMinFontScale_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMinFontScale_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_minFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_minFontScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMinFontScale_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMinFontScale_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMinFontScale_undefined_0100] default minFontScale is: " + objCompare.$attrs.minFontScale);
      console.info("[textAreaMinFontScale_undefined_0100] undefined minFontScale is: " + obj.$attrs.minFontScale);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      console.info('[textAreaMinFontScale_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaMaxFontScale_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MAXFONTSCALE_NULL_0100
     * @tc.desc   Test TextArea maxFontScale property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMaxFontScale_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMaxFontScale_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_maxFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_maxFontScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMaxFontScale_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMaxFontScale_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMaxFontScale_null_0100] default maxFontScale is: " + objCompare.$attrs.maxFontScale);
      console.info("[textAreaMaxFontScale_null_0100] null maxFontScale is: " + obj.$attrs.maxFontScale);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      console.info('[textAreaMaxFontScale_null_0100] END');
    })

    /**
     * @tc.name   textAreaMaxFontScale_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MAXFONTSCALE_UNDEFINED_0100
     * @tc.desc   Test TextArea maxFontScale property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMaxFontScale_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMaxFontScale_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_maxFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_maxFontScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMaxFontScale_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMaxFontScale_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMaxFontScale_undefined_0100] default maxFontScale is: " + objCompare.$attrs.maxFontScale);
      console.info("[textAreaMaxFontScale_undefined_0100] undefined maxFontScale is: " + obj.$attrs.maxFontScale);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      console.info('[textAreaMaxFontScale_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaHeightAdaptivePolicy_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_HEIGHTADAPTIVEPOLICY_NULL_0100
     * @tc.desc   Test TextArea heightAdaptivePolicy property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaHeightAdaptivePolicy_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaHeightAdaptivePolicy_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_heightAdaptivePolicy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_heightAdaptivePolicy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaHeightAdaptivePolicy_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaHeightAdaptivePolicy_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaHeightAdaptivePolicy_null_0100] default heightAdaptivePolicy is: " + objCompare.$attrs.heightAdaptivePolicy);
      console.info("[textAreaHeightAdaptivePolicy_null_0100] null heightAdaptivePolicy is: " + obj.$attrs.heightAdaptivePolicy);

      // null 应该恢复为默认值
      expect(obj.$attrs.heightAdaptivePolicy).assertEqual(objCompare.$attrs.heightAdaptivePolicy);
      console.info('[textAreaHeightAdaptivePolicy_null_0100] END');
    })

    /**
     * @tc.name   textAreaHeightAdaptivePolicy_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_HEIGHTADAPTIVEPOLICY_UNDEFINED_0100
     * @tc.desc   Test TextArea heightAdaptivePolicy property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaHeightAdaptivePolicy_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaHeightAdaptivePolicy_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_heightAdaptivePolicy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_heightAdaptivePolicy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaHeightAdaptivePolicy_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaHeightAdaptivePolicy_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaHeightAdaptivePolicy_undefined_0100] default heightAdaptivePolicy is: " + objCompare.$attrs.heightAdaptivePolicy);
      console.info("[textAreaHeightAdaptivePolicy_undefined_0100] undefined heightAdaptivePolicy is: " + obj.$attrs.heightAdaptivePolicy);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.heightAdaptivePolicy).assertEqual(objCompare.$attrs.heightAdaptivePolicy);
      console.info('[textAreaHeightAdaptivePolicy_undefined_0100] END');
    })
  })
}
