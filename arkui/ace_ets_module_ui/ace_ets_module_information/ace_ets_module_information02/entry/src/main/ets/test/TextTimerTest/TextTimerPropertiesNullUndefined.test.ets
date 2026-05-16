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

export default function TextTimerPropertiesNullUndefinedTest() {
  describe('TextTimerPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info('TextTimerPropertiesNullUndefinedTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextTimer/TextTimerPropertiesNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TextTimerPropertiesNullUndefinedTest state pages: ' + JSON.stringify(pages));
        if (!('TextTimerPropertiesNullUndefined' == pages.name)) {
          console.info('get TextTimerPropertiesNullUndefinedTest pages.name: ' + JSON.stringify(pages.name));
          await router.push(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push TextTimerPropertiesNullUndefinedTest page error: ' + err);
      }

      await CommonFunc.sleep(1000)
      console.info('TextTimerPropertiesNullUndefinedTest beforeEach end');
      done()
    });

    /**
     * @tc.name   textTimerFormat_null_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FORMAT_NULL_0100
     * @tc.desc   Test TextTimer format property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFormat_null_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFormat_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_format_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_format_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFormat_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFormat_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFormat_null_0100] default format is: " + objCompare.$attrs.format);
      console.info("[textTimerFormat_null_0100] null format is: " + obj.$attrs.format);

      // null 应该恢复为默认值
      expect(obj.$attrs.format).assertEqual(objCompare.$attrs.format);
      console.info('[textTimerFormat_null_0100] END');
    })

    /**
     * @tc.name   textTimerFormat_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FORMAT_UNDEFINED_0100
     * @tc.desc   Test TextTimer format property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFormat_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFormat_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_format_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_format_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFormat_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFormat_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFormat_undefined_0100] default format is: " + objCompare.$attrs.format);
      console.info("[textTimerFormat_undefined_0100] undefined format is: " + obj.$attrs.format);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.format).assertEqual(objCompare.$attrs.format);
      console.info('[textTimerFormat_undefined_0100] END');
    })

    /**
     * @tc.name   textTimerFormat_empty_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FORMAT_EMPTY_0100
     * @tc.desc   Test TextTimer format property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFormat_empty_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFormat_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_format_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_format_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFormat_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFormat_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFormat_empty_0100] default format is: " + objCompare.$attrs.format);
      console.info("[textTimerFormat_empty_0100] empty format is: " + obj.$attrs.format);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.format).assertEqual('');
      console.info('[textTimerFormat_empty_0100] END');
    })

    /**
     * @tc.name   textTimerFontColor_null_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTCOLOR_NULL_0100
     * @tc.desc   Test TextTimer fontColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontColor_null_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[textTimerFontColor_null_0100] null fontColor is: " + obj.$attrs.fontColor);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[textTimerFontColor_null_0100] END');
    })

    /**
     * @tc.name   textTimerFontColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTCOLOR_UNDEFINED_0100
     * @tc.desc   Test TextTimer fontColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontColor_undefined_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[textTimerFontColor_undefined_0100] undefined fontColor is: " + obj.$attrs.fontColor);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[textTimerFontColor_undefined_0100] END');
    })

    /**
     * @tc.name   textTimerFontColor_empty_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTCOLOR_EMPTY_0100
     * @tc.desc   Test TextTimer fontColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontColor_empty_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontColor_empty_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[textTimerFontColor_empty_0100] empty fontColor is: " + obj.$attrs.fontColor);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[textTimerFontColor_empty_0100] END');
    })

    /**
     * @tc.name   textTimerFontSize_null_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTSIZE_NULL_0100
     * @tc.desc   Test TextTimer fontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontSize_null_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontSize_null_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[textTimerFontSize_null_0100] null fontSize is: " + obj.$attrs.fontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[textTimerFontSize_null_0100] END');
    })

    /**
     * @tc.name   textTimerFontSize_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTSIZE_UNDEFINED_0100
     * @tc.desc   Test TextTimer fontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontSize_undefined_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[textTimerFontSize_undefined_0100] undefined fontSize is: " + obj.$attrs.fontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[textTimerFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   textTimerFontSize_empty_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTSIZE_EMPTY_0100
     * @tc.desc   Test TextTimer fontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontSize_empty_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontSize_empty_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[textTimerFontSize_empty_0100] empty fontSize is: " + obj.$attrs.fontSize);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontSize).assertContain('0.00');
      console.info('[textTimerFontSize_empty_0100] END');
    })

    /**
     * @tc.name   textTimerFontStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTSTYLE_NULL_0100
     * @tc.desc   Test TextTimer fontStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontStyle_null_0100] default fontStyle is: " + objCompare.$attrs.fontStyle);
      console.info("[textTimerFontStyle_null_0100] null fontStyle is: " + obj.$attrs.fontStyle);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[textTimerFontStyle_null_0100] END');
    })

    /**
     * @tc.name   textTimerFontStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTSTYLE_UNDEFINED_0100
     * @tc.desc   Test TextTimer fontStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontStyle_undefined_0100] default fontStyle is: " + objCompare.$attrs.fontStyle);
      console.info("[textTimerFontStyle_undefined_0100] undefined fontStyle is: " + obj.$attrs.fontStyle);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[textTimerFontStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textTimerFontWeight_null_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTWEIGHT_NULL_0100
     * @tc.desc   Test TextTimer fontWeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontWeight_null_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontWeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontWeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontWeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontWeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontWeight_null_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textTimerFontWeight_null_0100] null fontWeight is: " + obj.$attrs.fontWeight);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[textTimerFontWeight_null_0100] END');
    })

    /**
     * @tc.name   textTimerFontWeight_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTWEIGHT_UNDEFINED_0100
     * @tc.desc   Test TextTimer fontWeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontWeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontWeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontWeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontWeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontWeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontWeight_undefined_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textTimerFontWeight_undefined_0100] undefined fontWeight is: " + obj.$attrs.fontWeight);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[textTimerFontWeight_undefined_0100] END');
    })

    /**
     * @tc.name   textTimerFontWeight_empty_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTWEIGHT_EMPTY_0100
     * @tc.desc   Test TextTimer fontWeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontWeight_empty_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontWeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontWeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontWeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontWeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontWeight_empty_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[textTimerFontWeight_empty_0100] empty fontWeight is: " + obj.$attrs.fontWeight);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[textTimerFontWeight_empty_0100] END');
    })

    /**
     * @tc.name   textTimerFontWeight_number_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTWEIGHT_NUMBER_0100
     * @tc.desc   Test TextTimer fontWeight property with number 400, should restore to 400
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontWeight_number_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontWeight_number_0100] START');

      let strJson: string = getInspectorByKey('TextTimer_fontWeight_number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontWeight_number_0100] number obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontWeight_number_0100] number fontWeight is: " + obj.$attrs.fontWeight);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual('400');
      console.info('[textTimerFontWeight_number_0100] END');
    })

    /**
     * @tc.name   textTimerFontFamily_null_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTFAMILY_NULL_0100
     * @tc.desc   Test TextTimer fontFamily property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontFamily_null_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontFamily_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontFamily_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontFamily_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontFamily_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontFamily_null_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textTimerFontFamily_null_0100] null fontFamily is: " + obj.$attrs.fontFamily);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[textTimerFontFamily_null_0100] END');
    })

    /**
     * @tc.name   textTimerFontFamily_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTFAMILY_UNDEFINED_0100
     * @tc.desc   Test TextTimer fontFamily property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontFamily_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontFamily_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontFamily_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontFamily_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontFamily_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontFamily_undefined_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textTimerFontFamily_undefined_0100] undefined fontFamily is: " + obj.$attrs.fontFamily);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[textTimerFontFamily_undefined_0100] END');
    })

    /**
     * @tc.name   textTimerFontFamily_empty_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_FONTFAMILY_EMPTY_0100
     * @tc.desc   Test TextTimer fontFamily property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerFontFamily_empty_0100', Level.LEVEL2, async () => {
      console.info('[textTimerFontFamily_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_fontFamily_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerFontFamily_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerFontFamily_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerFontFamily_empty_0100] default fontFamily is: " + objCompare.$attrs.fontFamily);
      console.info("[textTimerFontFamily_empty_0100] empty fontFamily is: " + obj.$attrs.fontFamily);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[textTimerFontFamily_empty_0100] END');
    })

    /**
     * @tc.name   textTimerTextShadow_null_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_TEXTSHADOW_NULL_0100
     * @tc.desc   Test TextTimer textShadow property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerTextShadow_null_0100', Level.LEVEL2, async () => {
      console.info('[textTimerTextShadow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_textShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_textShadow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerTextShadow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerTextShadow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerTextShadow_null_0100] default textShadow is: " + JSON.stringify(objCompare.$attrs.textShadow));
      console.info("[textTimerTextShadow_null_0100] null textShadow is: " + JSON.stringify(obj.$attrs.textShadow));

      // null 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.textShadow)).assertEqual(JSON.stringify(objCompare.$attrs.textShadow));
      console.info('[textTimerTextShadow_null_0100] END');
    })

    /**
     * @tc.name   textTimerTextShadow_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_TEXTSHADOW_UNDEFINED_0100
     * @tc.desc   Test TextTimer textShadow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerTextShadow_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textTimerTextShadow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_textShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_textShadow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerTextShadow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerTextShadow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerTextShadow_undefined_0100] default textShadow is: " + JSON.stringify(objCompare.$attrs.textShadow));
      console.info("[textTimerTextShadow_undefined_0100] undefined textShadow is: " + JSON.stringify(obj.$attrs.textShadow));

      // undefined 应该恢复为默认值
      expect(JSON.stringify(obj.$attrs.textShadow)).assertEqual(JSON.stringify(objCompare.$attrs.textShadow));
      console.info('[textTimerTextShadow_undefined_0100] END');
    })

    /**
     * @tc.name   textTimerContentModifier_null_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_CONTENTMODIFIER_NULL_0100
     * @tc.desc   Test TextTimer contentModifier property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerContentModifier_null_0100', Level.LEVEL2, async () => {
      console.info('[textTimerContentModifier_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_contentModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerContentModifier_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerContentModifier_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerContentModifier_null_0100] default count is: " + objCompare.$attrs.count);
      console.info("[textTimerContentModifier_null_0100] null count is: " + obj.$attrs.count);

      // null 应该恢复为默认值
      expect(obj.$attrs.count).assertEqual(objCompare.$attrs.count);
      expect(obj.$attrs.isCountDown).assertEqual(objCompare.$attrs.isCountDown);
      console.info('[textTimerContentModifier_null_0100] END');
    })

    /**
     * @tc.name   textTimerContentModifier_undefined_0100
     * @tc.number SUB_ARKUI_TEXTTIMER_CONTENTMODIFIER_UNDEFINED_0100
     * @tc.desc   Test TextTimer contentModifier property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textTimerContentModifier_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textTimerContentModifier_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextTimer_contentModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextTimer_contentModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textTimerContentModifier_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textTimerContentModifier_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textTimerContentModifier_undefined_0100] default isCountDown is: " + objCompare.$attrs.isCountDown);
      console.info("[textTimerContentModifier_undefined_0100] undefined isCountDown is: " + obj.$attrs.isCountDown);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.count).assertEqual(objCompare.$attrs.count);
      expect(obj.$attrs.isCountDown).assertEqual(objCompare.$attrs.isCountDown);
      console.info('[textTimerContentModifier_undefined_0100] END');
    })
  })
}
