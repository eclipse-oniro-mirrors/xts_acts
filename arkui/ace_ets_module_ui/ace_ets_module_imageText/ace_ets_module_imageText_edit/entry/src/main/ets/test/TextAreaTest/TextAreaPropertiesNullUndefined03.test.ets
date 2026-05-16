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

export default function TextAreaPropertiesNullUndefined03Test() {
  describe('TextAreaPropertiesNullUndefined03Test', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions  = {
        url: 'MainAbility/pages/TextArea/TextAreaPropertiesNullUndefined03',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaPropertiesNullUndefined03Test state success " + JSON.stringify(pages));
        if (!("TextAreaPropertiesNullUndefined03" == pages.name)) {
          console.info("get TextAreaPropertiesNullUndefined03Test state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await Utils.sleep(2000);
          console.info("push TextAreaPropertiesNullUndefined03Test page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaPropertiesNullUndefined03Test page error: " + err);
      }
    });

    afterEach(async () => {
      await Utils.sleep(500);
      console.info("TextAreaPropertiesNullUndefined03Test after each called");
    });

    /**
     * @tc.name   textAreaScrollBarColor_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SCROLLBARCOLOR_NULL_0100
     * @tc.desc   Test TextArea scrollBarColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaScrollBarColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaScrollBarColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_scrollBarColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaScrollBarColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaScrollBarColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaScrollBarColor_null_0100] default scrollBarColor is: " + objCompare.$attrs.scrollBarColor);
      console.info("[textAreaScrollBarColor_null_0100] null scrollBarColor is: " + obj.$attrs.scrollBarColor);

      // null 应该恢复为默认值
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[textAreaScrollBarColor_null_0100] END');
    })

    /**
     * @tc.name   textAreaScrollBarColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SCROLLBARCOLOR_UNDEFINED_0100
     * @tc.desc   Test TextArea scrollBarColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaScrollBarColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaScrollBarColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_scrollBarColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_scrollBarColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaScrollBarColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaScrollBarColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaScrollBarColor_undefined_0100] default scrollBarColor is: " + objCompare.$attrs.scrollBarColor);
      console.info("[textAreaScrollBarColor_undefined_0100] undefined scrollBarColor is: " + obj.$attrs.scrollBarColor);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.scrollBarColor).assertEqual(objCompare.$attrs.scrollBarColor);
      console.info('[textAreaScrollBarColor_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaMinFontSize_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MINFONTSIZE_NULL_0100
     * @tc.desc   Test TextArea minFontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMinFontSize_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMinFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_minFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_minFontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMinFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMinFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMinFontSize_null_0100] default minFontSize is: " + objCompare.$attrs.minFontSize);
      console.info("[textAreaMinFontSize_null_0100] null minFontSize is: " + obj.$attrs.minFontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.minFontSize).assertEqual(objCompare.$attrs.minFontSize);
      console.info('[textAreaMinFontSize_null_0100] END');
    })

    /**
     * @tc.name   textAreaMinFontSize_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MINFONTSIZE_UNDEFINED_0100
     * @tc.desc   Test TextArea minFontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMinFontSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMinFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_minFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_minFontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMinFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMinFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMinFontSize_undefined_0100] default minFontSize is: " + objCompare.$attrs.minFontSize);
      console.info("[textAreaMinFontSize_undefined_0100] undefined minFontSize is: " + obj.$attrs.minFontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.minFontSize).assertEqual(objCompare.$attrs.minFontSize);
      console.info('[textAreaMinFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaMinFontSize_empty_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MINFONTSIZE_EMPTY_0100
     * @tc.desc   Test TextArea minFontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMinFontSize_empty_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMinFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_minFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_minFontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMinFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMinFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMinFontSize_empty_0100] default minFontSize is: " + objCompare.$attrs.minFontSize);
      console.info("[textAreaMinFontSize_empty_0100] empty minFontSize is: " + obj.$attrs.minFontSize);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.minFontSize).assertEqual(objCompare.$attrs.minFontSize);
      console.info('[textAreaMinFontSize_empty_0100] END');
    })

    /**
     * @tc.name   textAreaMaxFontSize_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MAXFONTSIZE_NULL_0100
     * @tc.desc   Test TextArea maxFontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMaxFontSize_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMaxFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_maxFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_maxFontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMaxFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMaxFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMaxFontSize_null_0100] default maxFontSize is: " + objCompare.$attrs.maxFontSize);
      console.info("[textAreaMaxFontSize_null_0100] null maxFontSize is: " + obj.$attrs.maxFontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxFontSize).assertEqual(objCompare.$attrs.maxFontSize);
      console.info('[textAreaMaxFontSize_null_0100] END');
    })

    /**
     * @tc.name   textAreaMaxFontSize_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MAXFONTSIZE_UNDEFINED_0100
     * @tc.desc   Test TextArea maxFontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMaxFontSize_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMaxFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_maxFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_maxFontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMaxFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMaxFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMaxFontSize_undefined_0100] default maxFontSize is: " + objCompare.$attrs.maxFontSize);
      console.info("[textAreaMaxFontSize_undefined_0100] undefined maxFontSize is: " + obj.$attrs.maxFontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxFontSize).assertEqual(objCompare.$attrs.maxFontSize);
      console.info('[textAreaMaxFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaMaxFontSize_empty_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MAXFONTSIZE_EMPTY_0100
     * @tc.desc   Test TextArea maxFontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMaxFontSize_empty_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMaxFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_maxFontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_maxFontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMaxFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMaxFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMaxFontSize_empty_0100] default maxFontSize is: " + objCompare.$attrs.maxFontSize);
      console.info("[textAreaMaxFontSize_empty_0100] empty maxFontSize is: " + obj.$attrs.maxFontSize);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.maxFontSize).assertEqual(objCompare.$attrs.maxFontSize);
      console.info('[textAreaMaxFontSize_empty_0100] END');
    })

    /**
     * @tc.name   textAreaMaxLines_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MAXLINES_NULL_0100
     * @tc.desc   Test TextArea maxLines property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMaxLines_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMaxLines_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_maxLines_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_maxLines_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMaxLines_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMaxLines_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMaxLines_null_0100] default maxLines is: " + objCompare.$attrs.maxLines);
      console.info("[textAreaMaxLines_null_0100] null maxLines is: " + obj.$attrs.maxLines);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxLines).assertEqual(objCompare.$attrs.maxLines);
      console.info('[textAreaMaxLines_null_0100] END');
    })

    /**
     * @tc.name   textAreaMaxLines_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_MAXLINES_UNDEFINED_0100
     * @tc.desc   Test TextArea maxLines property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaMaxLines_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaMaxLines_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_maxLines_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_maxLines_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaMaxLines_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaMaxLines_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaMaxLines_undefined_0100] default maxLines is: " + objCompare.$attrs.maxLines);
      console.info("[textAreaMaxLines_undefined_0100] undefined maxLines is: " + obj.$attrs.maxLines);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxLines).assertEqual(objCompare.$attrs.maxLines);
      console.info('[textAreaMaxLines_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaLetterSpacing_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LETTERSPACING_NULL_0100
     * @tc.desc   Test TextArea letterSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLetterSpacing_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLetterSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_letterSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLetterSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLetterSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLetterSpacing_null_0100] default letterSpacing is: " + objCompare.$attrs.letterSpacing);
      console.info("[textAreaLetterSpacing_null_0100] null letterSpacing is: " + obj.$attrs.letterSpacing);

      // null 应该恢复为默认值
      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[textAreaLetterSpacing_null_0100] END');
    })

    /**
     * @tc.name   textAreaLetterSpacing_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LETTERSPACING_UNDEFINED_0100
     * @tc.desc   Test TextArea letterSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLetterSpacing_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLetterSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_letterSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLetterSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLetterSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLetterSpacing_undefined_0100] default letterSpacing is: " + objCompare.$attrs.letterSpacing);
      console.info("[textAreaLetterSpacing_undefined_0100] undefined letterSpacing is: " + obj.$attrs.letterSpacing);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[textAreaLetterSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaLetterSpacing_empty_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LETTERSPACING_EMPTY_0100
     * @tc.desc   Test TextArea letterSpacing property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLetterSpacing_empty_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLetterSpacing_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_letterSpacing_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLetterSpacing_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLetterSpacing_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLetterSpacing_empty_0100] default letterSpacing is: " + objCompare.$attrs.letterSpacing);
      console.info("[textAreaLetterSpacing_empty_0100] empty letterSpacing is: " + obj.$attrs.letterSpacing);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[textAreaLetterSpacing_empty_0100] END');
    })

    /**
     * @tc.name   textAreaLineHeight_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LINEHEIGHT_NULL_0100
     * @tc.desc   Test TextArea lineHeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLineHeight_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLineHeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_lineHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLineHeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLineHeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLineHeight_null_0100] default lineHeight is: " + objCompare.$attrs.lineHeight);
      console.info("[textAreaLineHeight_null_0100] null lineHeight is: " + obj.$attrs.lineHeight);

      // null 应该恢复为默认值
      expect(obj.$attrs.lineHeight).assertContain('0.00');
      console.info('[textAreaLineHeight_null_0100] END');
    })

    /**
     * @tc.name   textAreaLineHeight_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LINEHEIGHT_UNDEFINED_0100
     * @tc.desc   Test TextArea lineHeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLineHeight_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLineHeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_lineHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLineHeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLineHeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLineHeight_undefined_0100] default lineHeight is: " + objCompare.$attrs.lineHeight);
      console.info("[textAreaLineHeight_undefined_0100] undefined lineHeight is: " + obj.$attrs.lineHeight);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.lineHeight).assertContain('0.00');
      console.info('[textAreaLineHeight_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaLineHeight_empty_0100
     * @tc.number SUB_ARKUI_TEXTAREA_LINEHEIGHT_EMPTY_0100
     * @tc.desc   Test TextArea lineHeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaLineHeight_empty_0100', Level.LEVEL2, async () => {
      console.info('[textAreaLineHeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_lineHeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaLineHeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaLineHeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaLineHeight_empty_0100] default lineHeight is: " + objCompare.$attrs.lineHeight);
      console.info("[textAreaLineHeight_empty_0100] empty lineHeight is: " + obj.$attrs.lineHeight);

      // 空字符串应该恢复为默认值
      expect(obj.$attrs.lineHeight).assertContain('0.00');
      console.info('[textAreaLineHeight_empty_0100] END');
    })

    /**
     * @tc.name   textAreaSelectedDragPreviewStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SELECTEDDRAGPREVIEWSTYLE_NULL_0100
     * @tc.desc   Test TextArea selectedDragPreviewStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaSelectedDragPreviewStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaSelectedDragPreviewStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_selectedDragPreviewStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_selectedDragPreviewStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaSelectedDragPreviewStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaSelectedDragPreviewStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaSelectedDragPreviewStyle_null_0100] default selectedDragPreviewStyle is: " + objCompare.$attrs.selectedDragPreviewStyle);
      console.info("[textAreaSelectedDragPreviewStyle_null_0100] null selectedDragPreviewStyle is: " + obj.$attrs.selectedDragPreviewStyle);

      // null 应该恢复为默认值
      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual(objCompare.$attrs.selectedDragPreviewStyle);
      console.info('[textAreaSelectedDragPreviewStyle_null_0100] END');
    })

    /**
     * @tc.name   textAreaSelectedDragPreviewStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_SELECTEDDRAGPREVIEWSTYLE_UNDEFINED_0100
     * @tc.desc   Test TextArea selectedDragPreviewStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaSelectedDragPreviewStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaSelectedDragPreviewStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_selectedDragPreviewStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_selectedDragPreviewStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaSelectedDragPreviewStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaSelectedDragPreviewStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaSelectedDragPreviewStyle_undefined_0100] default selectedDragPreviewStyle is: " + objCompare.$attrs.selectedDragPreviewStyle);
      console.info("[textAreaSelectedDragPreviewStyle_undefined_0100] undefined selectedDragPreviewStyle is: " + obj.$attrs.selectedDragPreviewStyle);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.selectedDragPreviewStyle).assertEqual(objCompare.$attrs.selectedDragPreviewStyle);
      console.info('[textAreaSelectedDragPreviewStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaEnableAutoFill_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEAUTOFILL_NULL_0100
     * @tc.desc   Test TextArea enableAutoFill property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableAutoFill_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableAutoFill_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enableAutoFill_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enableAutoFill_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableAutoFill_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnableAutoFill_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableAutoFill_null_0100] default enableAutoFill is: " + objCompare.$attrs.enableAutoFill);
      console.info("[textAreaEnableAutoFill_null_0100] null enableAutoFill is: " + obj.$attrs.enableAutoFill);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableAutoFill).assertEqual(objCompare.$attrs.enableAutoFill);
      console.info('[textAreaEnableAutoFill_null_0100] END');
    })

    /**
     * @tc.name   textAreaEnableAutoFill_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEAUTOFILL_UNDEFINED_0100
     * @tc.desc   Test TextArea enableAutoFill property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableAutoFill_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableAutoFill_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enableAutoFill_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enableAutoFill_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableAutoFill_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnableAutoFill_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableAutoFill_undefined_0100] default enableAutoFill is: " + objCompare.$attrs.enableAutoFill);
      console.info("[textAreaEnableAutoFill_undefined_0100] undefined enableAutoFill is: " + obj.$attrs.enableAutoFill);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableAutoFill).assertEqual(objCompare.$attrs.enableAutoFill);
      console.info('[textAreaEnableAutoFill_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaEnableAutoFill_true_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEAUTOFILL_TRUE_0100
     * @tc.desc   Test TextArea enableAutoFill property with true, should set to true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableAutoFill_true_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableAutoFill_true_0100] START');

      let strJson: string = getInspectorByKey('TextArea_enableAutoFill_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableAutoFill_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableAutoFill_true_0100] enableAutoFill is: " + obj.$attrs.enableAutoFill);

      // true 应该设置为 true
      expect(obj.$attrs.enableAutoFill).assertEqual(true);
      console.info('[textAreaEnableAutoFill_true_0100] END');
    })

    /**
     * @tc.name   textAreaEnableAutoFill_false_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEAUTOFILL_FALSE_0100
     * @tc.desc   Test TextArea enableAutoFill property with false, should set to false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableAutoFill_false_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableAutoFill_false_0100] START');

      let strJson: string = getInspectorByKey('TextArea_enableAutoFill_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableAutoFill_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableAutoFill_false_0100] enableAutoFill is: " + obj.$attrs.enableAutoFill);

      // false 应该设置为 false
      expect(obj.$attrs.enableAutoFill).assertEqual(false);
      console.info('[textAreaEnableAutoFill_false_0100] END');
    })

    /**
     * @tc.name   textAreaEnableHapticFeedback_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEHAPTICFEEDBACK_NULL_0100
     * @tc.desc   Test TextArea enableHapticFeedback property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableHapticFeedback_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableHapticFeedback_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enableHapticFeedback_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enableHapticFeedback_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableHapticFeedback_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnableHapticFeedback_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableHapticFeedback_null_0100] default enableHapticFeedback is: " + objCompare.$attrs.enableHapticFeedback);
      console.info("[textAreaEnableHapticFeedback_null_0100] null enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // null 应该恢复为默认值
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[textAreaEnableHapticFeedback_null_0100] END');
    })

    /**
     * @tc.name   textAreaEnableHapticFeedback_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEHAPTICFEEDBACK_UNDEFINED_0100
     * @tc.desc   Test TextArea enableHapticFeedback property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableHapticFeedback_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableHapticFeedback_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('TextArea_enableHapticFeedback_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('TextArea_enableHapticFeedback_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableHapticFeedback_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textAreaEnableHapticFeedback_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableHapticFeedback_undefined_0100] default enableHapticFeedback is: " + objCompare.$attrs.enableHapticFeedback);
      console.info("[textAreaEnableHapticFeedback_undefined_0100] undefined enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.enableHapticFeedback).assertEqual(objCompare.$attrs.enableHapticFeedback);
      console.info('[textAreaEnableHapticFeedback_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaEnableHapticFeedback_true_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEHAPTICFEEDBACK_TRUE_0100
     * @tc.desc   Test TextArea enableHapticFeedback property with true, should set to true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableHapticFeedback_true_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableHapticFeedback_true_0100] START');

      let strJson: string = getInspectorByKey('TextArea_enableHapticFeedback_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableHapticFeedback_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableHapticFeedback_true_0100] enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // true 应该设置为 true
      expect(obj.$attrs.enableHapticFeedback).assertEqual('true');
      console.info('[textAreaEnableHapticFeedback_true_0100] END');
    })

    /**
     * @tc.name   textAreaEnableHapticFeedback_false_0100
     * @tc.number SUB_ARKUI_TEXTAREA_ENABLEHAPTICFEEDBACK_FALSE_0100
     * @tc.desc   Test TextArea enableHapticFeedback property with false, should set to false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaEnableHapticFeedback_false_0100', Level.LEVEL2, async () => {
      console.info('[textAreaEnableHapticFeedback_false_0100] START');

      let strJson: string = getInspectorByKey('TextArea_enableHapticFeedback_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textAreaEnableHapticFeedback_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textAreaEnableHapticFeedback_false_0100] enableHapticFeedback is: " + obj.$attrs.enableHapticFeedback);

      // false 应该设置为 false
      expect(obj.$attrs.enableHapticFeedback).assertEqual('false');
      console.info('[textAreaEnableHapticFeedback_false_0100] END');
    })
  })
}
