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

export default function TextInputPropertiesNullUndefined02Test() {
  describe('TextInputPropertiesNullUndefined02Test', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextInput/TextInputPropertiesNullUndefined02',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextInputPropertiesNullUndefined02Test state success " + JSON.stringify(pages));
        if (!("TextInputPropertiesNullUndefined02" == pages.name)) {
          console.info("get TextInputPropertiesNullUndefined02Test state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextInputPropertiesNullUndefined02Test page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextInputPropertiesNullUndefined02Test page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(500);
      console.info("TextInputPropertiesNullUndefined02Test after each called");
    });

    /**
     * @tc.name   textInputFontWeight_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTWEIGHT_NULL_0100
     * @tc.desc   Test TextInput fontWeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontWeight_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontWeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontWeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontWeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontWeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontWeight_null_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textInputFontWeight_null_0100] null fontWeight is: " + obj.$attrs.fontWeight);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[textInputFontWeight_null_0100] END');
    })

    /**
     * @tc.name   textInputFontWeight_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTWEIGHT_UNDEFINED_0100
     * @tc.desc   Test TextInput fontWeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontWeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontWeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontWeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontWeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontWeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontWeight_undefined_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textInputFontWeight_undefined_0100] undefined fontWeight is: " + obj.$attrs.fontWeight);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[textInputFontWeight_undefined_0100] END');
    })

    /**
     * @tc.name   textInputFontWeight_empty_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTWEIGHT_EMPTY_0100
     * @tc.desc   Test TextInput fontWeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontWeight_empty_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontWeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontWeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontWeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontWeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontWeight_empty_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textInputFontWeight_empty_0100] empty fontWeight is: " + obj.$attrs.fontWeight);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[textInputFontWeight_empty_0100] END');
    })

    /**
     * @tc.name   textInputFontWeight_number_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTWEIGHT_NUMBER_0100
     * @tc.desc   Test TextInput fontWeight property with number 400, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontWeight_number_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontWeight_number_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontWeight_number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontWeight_number_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontWeight_number_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontWeight_number_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textInputFontWeight_number_0100] empty fontWeight is: " + obj.$attrs.fontWeight);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[textInputFontWeight_number_0100] END');
    })

    /**
     * @tc.name   textInputShowError_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWERROR_NULL_0100
     * @tc.desc   Test TextInput showError property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowError_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowError_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showError_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showError_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowError_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowError_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowError_null_0100] default showError is: " + objCompare.$attrs.showError);
      console.info("[textInputShowError_null_0100] null showError is: " + obj.$attrs.showError);

      // null 应该恢复为默认值
      expect(obj.$attrs.showError).assertEqual(objCompare.$attrs.showError);
      console.info('[textInputShowError_null_0100] END');
    })

    /**
     * @tc.name   textInputShowError_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWERROR_UNDEFINED_0100
     * @tc.desc   Test TextInput showError property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowError_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowError_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showError_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showError_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowError_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowError_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowError_undefined_0100] default showError is: " + objCompare.$attrs.showError);
      console.info("[textInputShowError_undefined_0100] undefined showError is: " + obj.$attrs.showError);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.showError).assertEqual(objCompare.$attrs.showError);
      console.info('[textInputShowError_undefined_0100] END');
    })

    /**
     * @tc.name   textInputShowError_empty_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_SHOWERROR_EMPTY_0100
     * @tc.desc   Test TextInput showError property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputShowError_empty_0100', Level.LEVEL2, async () => {
      console.info('[textInputShowError_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_showError_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_showError_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputShowError_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputShowError_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputShowError_empty_0100] default showError is: " + objCompare.$attrs.showError);
      console.info("[textInputShowError_empty_0100] empty showError is: " + obj.$attrs.showError);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.showError).assertEqual('');
      console.info('[textInputShowError_empty_0100] END');
    })

    /**
     * @tc.name   textInputUnderlineColor_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_UNDERLINECOLOR_NULL_0100
     * @tc.desc   Test TextInput underlineColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputUnderlineColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputUnderlineColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_underlineColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_underlineColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputUnderlineColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputUnderlineColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputUnderlineColor_null_0100] default underlineColor is: " + objCompare.$attrs.underlineColor);
      console.info("[textInputUnderlineColor_null_0100] null underlineColor is: " + obj.$attrs.underlineColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.underlineColor as string;
      let nullColor: string = obj.$attrs.underlineColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[textInputUnderlineColor_null_0100] END');
    })

    /**
     * @tc.name   textInputUnderlineColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_UNDERLINECOLOR_UNDEFINED_0100
     * @tc.desc   Test TextInput underlineColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputUnderlineColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputUnderlineColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_underlineColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_underlineColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputUnderlineColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputUnderlineColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputUnderlineColor_undefined_0100] default underlineColor is: " + objCompare.$attrs.underlineColor);
      console.info("[textInputUnderlineColor_undefined_0100] undefined underlineColor is: " + obj.$attrs.underlineColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.underlineColor as string;
      let undefinedColor: string = obj.$attrs.underlineColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[textInputUnderlineColor_undefined_0100] END');
    })

    /**
     * @tc.name   textInputMinFontSize_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MINFONTSIZE_NULL_0100
     * @tc.desc   Test TextInput minFontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMinFontSize_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputMinFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_minFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_minFontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMinFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMinFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMinFontSize_null_0100] default minFontSize is: " + objCompare.$attrs.minFontSize);
      console.info("[textInputMinFontSize_null_0100] null minFontSize is: " + obj.$attrs.minFontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.minFontSize).assertEqual(objCompare.$attrs.minFontSize);
      console.info('[textInputMinFontSize_null_0100] END');
    })

    /**
     * @tc.name   textInputMinFontSize_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MINFONTSIZE_UNDEFINED_0100
     * @tc.desc   Test TextInput minFontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMinFontSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputMinFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_minFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_minFontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMinFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMinFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMinFontSize_undefined_0100] default minFontSize is: " + objCompare.$attrs.minFontSize);
      console.info("[textInputMinFontSize_undefined_0100] undefined minFontSize is: " + obj.$attrs.minFontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.minFontSize).assertEqual(objCompare.$attrs.minFontSize);
      console.info('[textInputMinFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   textInputMinFontSize_empty_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MINFONTSIZE_EMPTY_0100
     * @tc.desc   Test TextInput minFontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMinFontSize_empty_0100', Level.LEVEL2, async () => {
      console.info('[textInputMinFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_minFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_minFontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMinFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMinFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMinFontSize_empty_0100] default minFontSize is: " + objCompare.$attrs.minFontSize);
      console.info("[textInputMinFontSize_empty_0100] empty minFontSize is: " + obj.$attrs.minFontSize);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.minFontSize).assertEqual(objCompare.$attrs.minFontSize);
      console.info('[textInputMinFontSize_empty_0100] END');
    })

    /**
     * @tc.name   textInputMaxFontSize_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MAXFONTSIZE_NULL_0100
     * @tc.desc   Test TextInput maxFontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMaxFontSize_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputMaxFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_maxFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_maxFontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMaxFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMaxFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMaxFontSize_null_0100] default maxFontSize is: " + objCompare.$attrs.maxFontSize);
      console.info("[textInputMaxFontSize_null_0100] null maxFontSize is: " + obj.$attrs.maxFontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxFontSize).assertEqual(objCompare.$attrs.maxFontSize);
      console.info('[textInputMaxFontSize_null_0100] END');
    })

    /**
     * @tc.name   textInputMaxFontSize_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MAXFONTSIZE_UNDEFINED_0100
     * @tc.desc   Test TextInput maxFontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMaxFontSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputMaxFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_maxFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_maxFontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMaxFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMaxFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMaxFontSize_undefined_0100] default maxFontSize is: " + objCompare.$attrs.maxFontSize);
      console.info("[textInputMaxFontSize_undefined_0100] undefined maxFontSize is: " + obj.$attrs.maxFontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxFontSize).assertEqual(objCompare.$attrs.maxFontSize);
      console.info('[textInputMaxFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   textInputMaxFontSize_empty_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_MAXFONTSIZE_EMPTY_0100
     * @tc.desc   Test TextInput maxFontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputMaxFontSize_empty_0100', Level.LEVEL2, async () => {
      console.info('[textInputMaxFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_maxFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_maxFontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputMaxFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputMaxFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputMaxFontSize_empty_0100] default maxFontSize is: " + objCompare.$attrs.maxFontSize);
      console.info("[textInputMaxFontSize_empty_0100] empty maxFontSize is: " + obj.$attrs.maxFontSize);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.maxFontSize).assertEqual(objCompare.$attrs.maxFontSize);
      console.info('[textInputMaxFontSize_empty_0100] END');
    })

    /**
     * @tc.name   textInputLetterSpacing_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_LETTERSPACING_NULL_0100
     * @tc.desc   Test TextInput letterSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputLetterSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputLetterSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_letterSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputLetterSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputLetterSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputLetterSpacing_null_0100] default letterSpacing is: " + objCompare.$attrs.letterSpacing);
      console.info("[textInputLetterSpacing_null_0100] null letterSpacing is: " + obj.$attrs.letterSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[textInputLetterSpacing_null_0100] END');
    })

    /**
     * @tc.name   textInputLetterSpacing_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_LETTERSPACING_UNDEFINED_0100
     * @tc.desc   Test TextInput letterSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputLetterSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputLetterSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_letterSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputLetterSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputLetterSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputLetterSpacing_undefined_0100] default letterSpacing is: " + objCompare.$attrs.letterSpacing);
      console.info("[textInputLetterSpacing_undefined_0100] undefined letterSpacing is: " + obj.$attrs.letterSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[textInputLetterSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   textInputLetterSpacing_empty_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_LETTERSPACING_EMPTY_0100
     * @tc.desc   Test TextInput letterSpacing property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputLetterSpacing_empty_0100', Level.LEVEL2, async () => {
      console.info('[textInputLetterSpacing_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_letterSpacing_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputLetterSpacing_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputLetterSpacing_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputLetterSpacing_empty_0100] default letterSpacing is: " + objCompare.$attrs.letterSpacing);
      console.info("[textInputLetterSpacing_empty_0100] empty letterSpacing is: " + obj.$attrs.letterSpacing);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[textInputLetterSpacing_empty_0100] END');
    })

    /**
     * @tc.name   textInputLineHeight_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_LINEHEIGHT_NULL_0100
     * @tc.desc   Test TextInput lineHeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputLineHeight_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputLineHeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_lineHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputLineHeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputLineHeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputLineHeight_null_0100] default lineHeight is: " + objCompare.$attrs.lineHeight);
      console.info("[textInputLineHeight_null_0100] null lineHeight is: " + obj.$attrs.lineHeight);

      // null 应该恢复为默认值
      expect(obj.$attrs.lineHeight).assertContain('0.00');
      console.info('[textInputLineHeight_null_0100] END');
    })

    /**
     * @tc.name   textInputLineHeight_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_LINEHEIGHT_UNDEFINED_0100
     * @tc.desc   Test TextInput lineHeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputLineHeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputLineHeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_lineHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputLineHeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputLineHeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputLineHeight_undefined_0100] default lineHeight is: " + objCompare.$attrs.lineHeight);
      console.info("[textInputLineHeight_undefined_0100] undefined lineHeight is: " + obj.$attrs.lineHeight);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.lineHeight).assertContain('0.00');
      console.info('[textInputLineHeight_undefined_0100] END');
    })

    /**
     * @tc.name   textInputLineHeight_empty_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_LINEHEIGHT_EMPTY_0100
     * @tc.desc   Test TextInput lineHeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputLineHeight_empty_0100', Level.LEVEL2, async () => {
      console.info('[textInputLineHeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_lineHeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputLineHeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputLineHeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputLineHeight_empty_0100] default lineHeight is: " + objCompare.$attrs.lineHeight);
      console.info("[textInputLineHeight_empty_0100] empty lineHeight is: " + obj.$attrs.lineHeight);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.lineHeight).assertContain('0.00');
      console.info('[textInputLineHeight_empty_0100] END');
    })

    /**
     * @tc.name   textInputPasswordRules_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PASSWORDRULES_NULL_0100
     * @tc.desc   Test TextInput passwordRules property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPasswordRules_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputPasswordRules_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_passwordRules_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_passwordRules_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputPasswordRules_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputPasswordRules_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputPasswordRules_null_0100] default passwordRules is: " + objCompare.$attrs.passwordRules);
      console.info("[textInputPasswordRules_null_0100] null passwordRules is: " + obj.$attrs.passwordRules);

      // null 应该恢复为默认值
      expect(obj.$attrs.passwordRules).assertEqual(objCompare.$attrs.passwordRules);
      console.info('[textInputPasswordRules_null_0100] END');
    })

    /**
     * @tc.name   textInputPasswordRules_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PASSWORDRULES_UNDEFINED_0100
     * @tc.desc   Test TextInput passwordRules property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPasswordRules_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputPasswordRules_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_passwordRules_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_passwordRules_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputPasswordRules_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputPasswordRules_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputPasswordRules_undefined_0100] default passwordRules is: " + objCompare.$attrs.passwordRules);
      console.info("[textInputPasswordRules_undefined_0100] undefined passwordRules is: " + obj.$attrs.passwordRules);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.passwordRules).assertEqual(objCompare.$attrs.passwordRules);
      console.info('[textInputPasswordRules_undefined_0100] END');
    })

    /**
     * @tc.name   textInputPasswordRules_empty_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_PASSWORDRULES_EMPTY_0100
     * @tc.desc   Test TextInput passwordRules property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputPasswordRules_empty_0100', Level.LEVEL2, async () => {
      console.info('[textInputPasswordRules_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_passwordRules_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_passwordRules_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputPasswordRules_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputPasswordRules_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputPasswordRules_empty_0100] default passwordRules is: " + objCompare.$attrs.passwordRules);
      console.info("[textInputPasswordRules_empty_0100] empty passwordRules is: " + obj.$attrs.passwordRules);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.passwordRules).assertEqual(objCompare.$attrs.passwordRules);
      console.info('[textInputPasswordRules_empty_0100] END');
    })

    /**
     * @tc.name   textInputFontFeature_null_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTFEATURE_NULL_0100
     * @tc.desc   Test TextInput fontFeature property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontFeature_null_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontFeature_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontFeature_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontFeature_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontFeature_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontFeature_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontFeature_null_0100] default fontFeature is: " + objCompare.$attrs.fontFeature);
      console.info("[textInputFontFeature_null_0100] null fontFeature is: " + obj.$attrs.fontFeature);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontFeature).assertEqual(objCompare.$attrs.fontFeature);
      console.info('[textInputFontFeature_null_0100] END');
    })

    /**
     * @tc.name   textInputFontFeature_undefined_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTFEATURE_UNDEFINED_0100
     * @tc.desc   Test TextInput fontFeature property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontFeature_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontFeature_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontFeature_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontFeature_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontFeature_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontFeature_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontFeature_undefined_0100] default fontFeature is: " + objCompare.$attrs.fontFeature);
      console.info("[textInputFontFeature_undefined_0100] undefined fontFeature is: " + obj.$attrs.fontFeature);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontFeature).assertEqual(objCompare.$attrs.fontFeature);
      console.info('[textInputFontFeature_undefined_0100] END');
    })

    /**
     * @tc.name   textInputFontFeature_empty_0100
     * @tc.number SUB_ARKUI_TEXTINPUT_FONTFEATURE_EMPTY_0100
     * @tc.desc   Test TextInput fontFeature property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textInputFontFeature_empty_0100', Level.LEVEL2, async () => {
      console.info('[textInputFontFeature_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextInput_fontFeature_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextInput_fontFeature_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textInputFontFeature_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textInputFontFeature_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textInputFontFeature_empty_0100] default fontFeature is: " + objCompare.$attrs.fontFeature);
      console.info("[textInputFontFeature_empty_0100] empty fontFeature is: " + obj.$attrs.fontFeature);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontFeature).assertEqual(objCompare.$attrs.fontFeature);
      console.info('[textInputFontFeature_empty_0100] END');
    })
  })
}
