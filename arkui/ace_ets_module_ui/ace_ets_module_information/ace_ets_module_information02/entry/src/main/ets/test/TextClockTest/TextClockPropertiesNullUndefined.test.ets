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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextClockPropertiesNullUndefinedTest() {
  describe('TextClockPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextClockPropertiesNullUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextClock/TextClockPropertiesNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextClockPropertiesNullUndefinedTest state pages: ' + JSON.stringify(pages));
        if (!('TextClockPropertiesNullUndefined' == pages.name)) {
          console.info('get TextClockPropertiesNullUndefinedTest pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TextClockPropertiesNullUndefinedTest page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('TextClockPropertiesNullUndefinedTest beforeEach end');
      done()
    });

    /**
     * @tc.name   textClockFontColor_null_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTCOLOR_NULL_0100
     * @tc.desc   Test TextClock fontColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontColor_null_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[textClockFontColor_null_0100] null fontColor is: " + obj.$attrs.fontColor);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[textClockFontColor_null_0100] END');
    })

    /**
     * @tc.name   textClockFontColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTCOLOR_UNDEFINED_0100
     * @tc.desc   Test TextClock fontColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontColor_undefined_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[textClockFontColor_undefined_0100] undefined fontColor is: " + obj.$attrs.fontColor);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[textClockFontColor_undefined_0100] END');
    })

    /**
     * @tc.name   textClockFontColor_empty_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTCOLOR_EMPTY_0100
     * @tc.desc   Test TextClock fontColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontColor_empty_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontColor_empty_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[textClockFontColor_empty_0100] empty fontColor is: " + obj.$attrs.fontColor);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[textClockFontColor_empty_0100] END');
    })

    /**
     * @tc.name   textClockFontSize_null_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTSIZE_NULL_0100
     * @tc.desc   Test TextClock fontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontSize_null_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontSize_null_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[textClockFontSize_null_0100] null fontSize is: " + obj.$attrs.fontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[textClockFontSize_null_0100] END');
    })

    /**
     * @tc.name   textClockFontSize_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTSIZE_UNDEFINED_0100
     * @tc.desc   Test TextClock fontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontSize_undefined_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[textClockFontSize_undefined_0100] undefined fontSize is: " + obj.$attrs.fontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[textClockFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   textClockFontSize_empty_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTSIZE_EMPTY_0100
     * @tc.desc   Test TextClock fontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontSize_empty_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontSize_empty_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[textClockFontSize_empty_0100] empty fontSize is: " + obj.$attrs.fontSize);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[textClockFontSize_empty_0100] END');
    })

    /**
     * @tc.name   textClockFontStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTSTYLE_NULL_0100
     * @tc.desc   Test TextClock fontStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontStyle_null_0100] default fontStyle is: " + objCompare.$attrs.fontStyle);
      console.info("[textClockFontStyle_null_0100] null fontStyle is: " + obj.$attrs.fontStyle);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[textClockFontStyle_null_0100] END');
    })

    /**
     * @tc.name   textClockFontStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTSTYLE_UNDEFINED_0100
     * @tc.desc   Test TextClock fontStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontStyle_undefined_0100] default fontStyle is: " + objCompare.$attrs.fontStyle);
      console.info("[textClockFontStyle_undefined_0100] undefined fontStyle is: " + obj.$attrs.fontStyle);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[textClockFontStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textClockFontWeight_null_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTWEIGHT_NULL_0100
     * @tc.desc   Test TextClock fontWeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontWeight_null_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontWeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontWeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontWeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontWeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontWeight_null_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textClockFontWeight_null_0100] null fontWeight is: " + obj.$attrs.fontWeight);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[textClockFontWeight_null_0100] END');
    })

    /**
     * @tc.name   textClockFontWeight_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTWEIGHT_UNDEFINED_0100
     * @tc.desc   Test TextClock fontWeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontWeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontWeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontWeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontWeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontWeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontWeight_undefined_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textClockFontWeight_undefined_0100] undefined fontWeight is: " + obj.$attrs.fontWeight);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[textClockFontWeight_undefined_0100] END');
    })

    /**
     * @tc.name   textClockFontWeight_empty_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTWEIGHT_EMPTY_0100
     * @tc.desc   Test TextClock fontWeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontWeight_empty_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontWeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontWeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontWeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontWeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontWeight_empty_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textClockFontWeight_empty_0100] empty fontWeight is: " + obj.$attrs.fontWeight);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[textClockFontWeight_empty_0100] END');
    })

    /**
     * @tc.name   textClockFontFamily_null_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTFAMILY_NULL_0100
     * @tc.desc   Test TextClock fontFamily property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontFamily_null_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontFamily_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontFamily_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontFamily_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontFamily_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontFamily_null_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textClockFontFamily_null_0100] null fontFamily is: " + obj.$attrs.fontFamily);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[textClockFontFamily_null_0100] END');
    })

    /**
     * @tc.name   textClockFontFamily_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTFAMILY_UNDEFINED_0100
     * @tc.desc   Test TextClock fontFamily property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontFamily_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontFamily_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontFamily_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontFamily_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontFamily_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontFamily_undefined_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textClockFontFamily_undefined_0100] undefined fontFamily is: " + obj.$attrs.fontFamily);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[textClockFontFamily_undefined_0100] END');
    })

    /**
     * @tc.name   textClockFontFamily_empty_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTFAMILY_EMPTY_0100
     * @tc.desc   Test TextClock fontFamily property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontFamily_empty_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontFamily_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontFamily_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontFamily_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontFamily_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontFamily_empty_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textClockFontFamily_empty_0100] empty fontFamily is: " + obj.$attrs.fontFamily);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[textClockFontFamily_empty_0100] END');
    })

    /**
     * @tc.name   textClockTextShadow_null_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_TEXTSHADOW_NULL_0100
     * @tc.desc   Test TextClock textShadow property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockTextShadow_null_0100', Level.LEVEL2, async () => {
      console.info('[textClockTextShadow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_textShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_textShadow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockTextShadow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockTextShadow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockTextShadow_null_0100] default textShadow is: " + JSON.stringify(objCompare.$attrs.textShadow));
      console.info("[textClockTextShadow_null_0100] null textShadow is: " + JSON.stringify(obj.$attrs.textShadow));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.textShadow)).assertEqual(JSON.stringify(objCompare.$attrs.textShadow));
      console.info('[textClockTextShadow_null_0100] END');
    })

    /**
     * @tc.name   textClockTextShadow_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_TEXTSHADOW_UNDEFINED_0100
     * @tc.desc   Test TextClock textShadow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockTextShadow_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textClockTextShadow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_textShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_textShadow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockTextShadow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockTextShadow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockTextShadow_undefined_0100] default textShadow is: " + JSON.stringify(objCompare.$attrs.textShadow));
      console.info("[textClockTextShadow_undefined_0100] undefined textShadow is: " + JSON.stringify(obj.$attrs.textShadow));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.textShadow)).assertEqual(JSON.stringify(objCompare.$attrs.textShadow));
      console.info('[textClockTextShadow_undefined_0100] END');
    })

    /**
     * @tc.name   textClockContentModifier_null_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_CONTENTMODIFIER_NULL_0100
     * @tc.desc   Test TextClock contentModifier property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockContentModifier_null_0100', Level.LEVEL2, async () => {
      console.info('[textClockContentModifier_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_contentModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockContentModifier_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockContentModifier_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockContentModifier_null_0100] default timeZoneOffset is: " + JSON.stringify(objCompare.$attrs.timeZoneOffset));
      console.info("[textClockContentModifier_null_0100] null timeZoneOffset is: " + JSON.stringify(obj.$attrs.timeZoneOffset));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.timeZoneOffset)).assertEqual(JSON.stringify(objCompare.$attrs.timeZoneOffset));
      console.info('[textClockContentModifier_null_0100] END');
    })

    /**
     * @tc.name   textClockContentModifier_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_CONTENTMODIFIER_UNDEFINED_0100
     * @tc.desc   Test TextClock contentModifier property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockContentModifier_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textClockContentModifier_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_contentModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockContentModifier_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockContentModifier_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockContentModifier_undefined_0100] default timeZoneOffset is: " + JSON.stringify(objCompare.$attrs.timeZoneOffset));
      console.info("[textClockContentModifier_undefined_0100] undefined timeZoneOffset is: " + JSON.stringify(obj.$attrs.timeZoneOffset));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.timeZoneOffset)).assertEqual(JSON.stringify(objCompare.$attrs.timeZoneOffset));
      console.info('[textClockContentModifier_undefined_0100] END');
    })

    /**
     * @tc.name   textClockFontFeature_null_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTFEATURE_NULL_0100
     * @tc.desc   Test TextClock fontFeature property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontFeature_null_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontFeature_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontFeature_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontFeature_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontFeature_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontFeature_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontFeature_null_0100] default fontFeature is: " + objCompare.$attrs.fontFeature);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontFeature).assertEqual(objCompare.$attrs.fontFeature);
      console.info('[textClockFontFeature_null_0100] END');
    })

    /**
     * @tc.name   textClockFontFeature_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTFEATURE_UNDEFINED_0100
     * @tc.desc   Test TextClock fontFeature property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontFeature_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontFeature_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontFeature_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontFeature_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontFeature_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontFeature_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontFeature_undefined_0100] default fontFeature is: " + objCompare.$attrs.fontFeature);
      console.info("[textClockFontFeature_undefined_0100] undefined fontFeature is: " + obj.$attrs.fontFeature);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontFeature).assertEqual(objCompare.$attrs.fontFeature);
      console.info('[textClockFontFeature_undefined_0100] END');
    })

    /**
     * @tc.name   textClockFontFeature_empty_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_FONTFEATURE_EMPTY_0100
     * @tc.desc   Test TextClock fontFeature property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockFontFeature_empty_0100', Level.LEVEL2, async () => {
      console.info('[textClockFontFeature_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_fontFeature_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_fontFeature_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockFontFeature_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockFontFeature_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockFontFeature_empty_0100] default fontFeature is: " + objCompare.$attrs.fontFeature);
      console.info("[textClockFontFeature_empty_0100] empty fontFeature is: " + obj.$attrs.fontFeature);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontFeature).assertEqual(objCompare.$attrs.fontFeature);
      console.info('[textClockFontFeature_empty_0100] END');
    })

    /**
     * @tc.name   textClockDateTimeOptions_null_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_DATETIMEOPTIONS_NULL_0100
     * @tc.desc   Test TextClock dateTimeOptions property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockDateTimeOptions_null_0100', Level.LEVEL2, async () => {
      console.info('[textClockDateTimeOptions_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_dateTimeOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_dateTimeOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockDateTimeOptions_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockDateTimeOptions_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockDateTimeOptions_null_0100] default dateTimeOptions is: " + JSON.stringify(objCompare.$attrs.dateTimeOptions));
      console.info("[textClockDateTimeOptions_null_0100] null dateTimeOptions is: " + obj.$attrs.dateTimeOptions);

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.dateTimeOptions)).assertEqual(JSON.stringify(objCompare.$attrs.dateTimeOptions));
      console.info('[textClockDateTimeOptions_null_0100] END');
    })

    /**
     * @tc.name   textClockDateTimeOptions_undefined_0100
     * @tc.number SUB_ARKUI_TEXTCLOCK_DATETIMEOPTIONS_UNDEFINED_0100
     * @tc.desc   Test TextClock dateTimeOptions property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textClockDateTimeOptions_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textClockDateTimeOptions_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextClock_dateTimeOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextClock_dateTimeOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textClockDateTimeOptions_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textClockDateTimeOptions_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textClockDateTimeOptions_undefined_0100] default dateTimeOptions is: " + JSON.stringify(objCompare.$attrs.dateTimeOptions));
      console.info("[textClockDateTimeOptions_undefined_0100] undefined dateTimeOptions is: " + JSON.stringify(obj.$attrs.dateTimeOptions));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.dateTimeOptions)).assertEqual(JSON.stringify(objCompare.$attrs.dateTimeOptions));
      console.info('[textClockDateTimeOptions_undefined_0100] END');
    })
  })
}
