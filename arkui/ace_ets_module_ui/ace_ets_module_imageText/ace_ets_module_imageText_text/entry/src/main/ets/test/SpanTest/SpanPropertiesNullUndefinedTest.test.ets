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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import CommonFunc from '../../MainAbility/common/Common'

export default function SpanPropertiesNullUndefinedTest() {
  describe('SpanPropertiesNullUndefinedTest', () => {
     beforeEach(async (done: Function) => {
      console.info("SpanPropertiesNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Span/SpanPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SpanPropertiesNullUndefinedTest state success " + JSON.stringify(pages)); 
        if (!("SpanPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get SpanPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SpanPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SpanPropertiesNullUndefinedTest page error: " + err);
      }
      done();
    });
    /**
     * @tc.name   spanFontColor_null_0100
     * @tc.number SUB_ARKUI_SPAN_FONTCOLOR_NULL_0100
     * @tc.desc   Test Span fontColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontColor_null_0100', Level.LEVEL0, async () => {
      console.info('[spanFontColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[spanFontColor_null_0100] END');
    })

    /**
     * @tc.name   spanFontColor_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_FONTCOLOR_UNDEFINED_0100
     * @tc.desc   Test Span fontColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontColor_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanFontColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[spanFontColor_undefined_0100] END');
    })

    /**
     * @tc.name   spanFontColor_empty_0100
     * @tc.number SUB_ARKUI_SPAN_FONTCOLOR_EMPTY_0100
     * @tc.desc   Test Span fontColor property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontColor_empty_0100', Level.LEVEL0, async () => {
      console.info('[spanFontColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[spanFontColor_empty_0100] END');
    })

    /**
     * @tc.name   spanFontSize_null_0100
     * @tc.number SUB_ARKUI_SPAN_FONTSIZE_NULL_0100
     * @tc.desc   Test Span fontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontSize_null_0100', Level.LEVEL0, async () => {
      console.info('[spanFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontSize_null_0100] default fontSize is: " + JSON.stringify(objCompare.$attrs.fontSize));
      console.info("[spanFontSize_null_0100] null fontSize is: " + JSON.stringify(obj.$attrs.fontSize));

      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[spanFontSize_null_0100] END');
    })

    /**
     * @tc.name   spanFontSize_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_FONTSIZE_UNDEFINED_0100
     * @tc.desc   Test Span fontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontSize_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontSize_undefined_0100] default fontSize is: " + JSON.stringify(objCompare.$attrs.fontSize));
      console.info("[spanFontSize_undefined_0100] undefined fontSize is: " + JSON.stringify(obj.$attrs.fontSize));

      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[spanFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   spanFontSize_empty_0100
     * @tc.number SUB_ARKUI_SPAN_FONTSIZE_EMPTY_0100
     * @tc.desc   Test Span fontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontSize_empty_0100', Level.LEVEL0, async () => {
      console.info('[spanFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontSize_empty_0100] default fontSize is: " + JSON.stringify(objCompare.$attrs.fontSize));
      console.info("[spanFontSize_empty_0100] empty fontSize is: " + JSON.stringify(obj.$attrs.fontSize));

      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[spanFontSize_empty_0100] END');
    })

    /**
     * @tc.name   spanFontStyle_null_0100
     * @tc.number SUB_ARKUI_SPAN_FONTSTYLE_NULL_0100
     * @tc.desc   Test Span fontStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontStyle_null_0100', Level.LEVEL0, async () => {
      console.info('[spanFontStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontStyle_null_0100] default fontStyle is: " + JSON.stringify(objCompare.$attrs.fontStyle));
      console.info("[spanFontStyle_null_0100] null fontStyle is: " + JSON.stringify(obj.$attrs.fontStyle));

      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[spanFontStyle_null_0100] END');
    })

    /**
     * @tc.name   spanFontStyle_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_FONTSTYLE_UNDEFINED_0100
     * @tc.desc   Test Span fontStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontStyle_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanFontStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontStyle_undefined_0100] default fontStyle is: " + JSON.stringify(objCompare.$attrs.fontStyle));
      console.info("[spanFontStyle_undefined_0100] undefined fontStyle is: " + JSON.stringify(obj.$attrs.fontStyle));

      expect(obj.$attrs.fontStyle).assertEqual(objCompare.$attrs.fontStyle);
      console.info('[spanFontStyle_undefined_0100] END');
    })

    /**
     * @tc.name   spanFontWeight_null_0100
     * @tc.number SUB_ARKUI_SPAN_FONTWEIGHT_NULL_0100
     * @tc.desc   Test Span fontWeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontWeight_null_0100', Level.LEVEL0, async () => {
      console.info('[spanFontWeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontWeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontWeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontWeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontWeight_null_0100] default fontWeight is: " + JSON.stringify(objCompare.$attrs.fontWeight));
      console.info("[spanFontWeight_null_0100] null fontWeight is: " + JSON.stringify(obj.$attrs.fontWeight));

      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[spanFontWeight_null_0100] END');
    })

    /**
     * @tc.name   spanFontWeight_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_FONTWEIGHT_UNDEFINED_0100
     * @tc.desc   Test Span fontWeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontWeight_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanFontWeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontWeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontWeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontWeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontWeight_undefined_0100] default fontWeight is: " + JSON.stringify(objCompare.$attrs.fontWeight));
      console.info("[spanFontWeight_undefined_0100] undefined fontWeight is: " + JSON.stringify(obj.$attrs.fontWeight));

      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[spanFontWeight_undefined_0100] END');
    })

    /**
     * @tc.name   spanFontWeight_empty_0100
     * @tc.number SUB_ARKUI_SPAN_FONTWEIGHT_EMPTY_0100
     * @tc.desc   Test Span fontWeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontWeight_empty_0100', Level.LEVEL0, async () => {
      console.info('[spanFontWeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontWeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontWeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontWeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontWeight_empty_0100] default fontWeight is: " + JSON.stringify(objCompare.$attrs.fontWeight));
      console.info("[spanFontWeight_empty_0100] empty fontWeight is: " + JSON.stringify(obj.$attrs.fontWeight));

      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[spanFontWeight_empty_0100] END');
    })

    /**
     * @tc.name   spanFontFamily_null_0100
     * @tc.number SUB_ARKUI_SPAN_FONTFAMILY_NULL_0100
     * @tc.desc   Test Span fontFamily property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontFamily_null_0100', Level.LEVEL0, async () => {
      console.info('[spanFontFamily_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontFamily_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontFamily_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontFamily_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontFamily_null_0100] default fontFamily is: " + JSON.stringify(objCompare.$attrs.fontFamily));
      console.info("[spanFontFamily_null_0100] null fontFamily is: " + JSON.stringify(obj.$attrs.fontFamily));

      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[spanFontFamily_null_0100] END');
    })

    /**
     * @tc.name   spanFontFamily_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_FONTFAMILY_UNDEFINED_0100
     * @tc.desc   Test Span fontFamily property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontFamily_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanFontFamily_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontFamily_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontFamily_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontFamily_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontFamily_undefined_0100] default fontFamily is: " + JSON.stringify(objCompare.$attrs.fontFamily));
      console.info("[spanFontFamily_undefined_0100] undefined fontFamily is: " + JSON.stringify(obj.$attrs.fontFamily));

      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[spanFontFamily_undefined_0100] END');
    })

    /**
     * @tc.name   spanFontFamily_empty_0100
     * @tc.number SUB_ARKUI_SPAN_FONTFAMILY_EMPTY_0100
     * @tc.desc   Test Span fontFamily property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFontFamily_empty_0100', Level.LEVEL0, async () => {
      console.info('[spanFontFamily_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_fontFamily_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_fontFamily_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFontFamily_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFontFamily_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFontFamily_empty_0100] default fontFamily is: " + JSON.stringify(objCompare.$attrs.fontFamily));
      console.info("[spanFontFamily_empty_0100] empty fontFamily is: " + JSON.stringify(obj.$attrs.fontFamily));

      expect(obj.$attrs.fontFamily).assertEqual(objCompare.$attrs.fontFamily);
      console.info('[spanFontFamily_empty_0100] END');
    })

    /**
     * @tc.name   spanTextCase_null_0100
     * @tc.number SUB_ARKUI_SPAN_TEXTCASE_NULL_0100
     * @tc.desc   Test Span textCase property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanTextCase_null_0100', Level.LEVEL0, async () => {
      console.info('[spanTextCase_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_textCase_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_textCase_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanTextCase_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanTextCase_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanTextCase_null_0100] default textCase is: " + JSON.stringify(objCompare.$attrs.textCase));
      console.info("[spanTextCase_null_0100] null textCase is: " + JSON.stringify(obj.$attrs.textCase));

      expect(obj.$attrs.textCase).assertEqual(objCompare.$attrs.textCase);
      console.info('[spanTextCase_null_0100] END');
    })

    /**
     * @tc.name   spanTextCase_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_TEXTCASE_UNDEFINED_0100
     * @tc.desc   Test Span textCase property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanTextCase_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanTextCase_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_textCase_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_textCase_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanTextCase_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanTextCase_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanTextCase_undefined_0100] default textCase is: " + JSON.stringify(objCompare.$attrs.textCase));
      console.info("[spanTextCase_undefined_0100] undefined textCase is: " + JSON.stringify(obj.$attrs.textCase));

      expect(obj.$attrs.textCase).assertEqual(objCompare.$attrs.textCase);
      console.info('[spanTextCase_undefined_0100] END');
    })

    /**
     * @tc.name   spanLetterSpacing_null_0100
     * @tc.number SUB_ARKUI_SPAN_LETTERSPACING_NULL_0100
     * @tc.desc   Test Span letterSpacing property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanLetterSpacing_null_0100', Level.LEVEL0, async () => {
      console.info('[spanLetterSpacing_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_letterSpacing_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanLetterSpacing_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanLetterSpacing_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanLetterSpacing_null_0100] default letterSpacing is: " + JSON.stringify(objCompare.$attrs.letterSpacing));
      console.info("[spanLetterSpacing_null_0100] null letterSpacing is: " + JSON.stringify(obj.$attrs.letterSpacing));

      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[spanLetterSpacing_null_0100] END');
    })

    /**
     * @tc.name   spanLetterSpacing_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_LETTERSPACING_UNDEFINED_0100
     * @tc.desc   Test Span letterSpacing property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanLetterSpacing_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanLetterSpacing_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_letterSpacing_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanLetterSpacing_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanLetterSpacing_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanLetterSpacing_undefined_0100] default letterSpacing is: " + JSON.stringify(objCompare.$attrs.letterSpacing));
      console.info("[spanLetterSpacing_undefined_0100] undefined letterSpacing is: " + JSON.stringify(obj.$attrs.letterSpacing));

      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[spanLetterSpacing_undefined_0100] END');
    })

    /**
     * @tc.name   spanLetterSpacing_empty_0100
     * @tc.number SUB_ARKUI_SPAN_LETTERSPACING_EMPTY_0100
     * @tc.desc   Test Span letterSpacing property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanLetterSpacing_empty_0100', Level.LEVEL0, async () => {
      console.info('[spanLetterSpacing_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_letterSpacing_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_letterSpacing_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanLetterSpacing_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanLetterSpacing_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanLetterSpacing_empty_0100] default letterSpacing is: " + JSON.stringify(objCompare.$attrs.letterSpacing));
      console.info("[spanLetterSpacing_empty_0100] empty letterSpacing is: " + JSON.stringify(obj.$attrs.letterSpacing));

      expect(obj.$attrs.letterSpacing).assertEqual(objCompare.$attrs.letterSpacing);
      console.info('[spanLetterSpacing_empty_0100] END');
    })

    /**
     * @tc.name   spanDecoration_null_0100
     * @tc.number SUB_ARKUI_SPAN_DECORATION_NULL_0100
     * @tc.desc   Test Span decoration property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanDecoration_null_0100', Level.LEVEL0, async () => {
      console.info('[spanDecoration_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_decoration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_decoration_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanDecoration_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanDecoration_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanDecoration_null_0100] default decoration is: " + JSON.stringify(objCompare.$attrs.decoration));
      console.info("[spanDecoration_null_0100] empty decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(JSON.stringify(obj.$attrs.decoration)).assertEqual(JSON.stringify(objCompare.$attrs.decoration));
      console.info('[spanDecoration_null_0100] END');
    })

    /**
     * @tc.name   spanDecoration_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_DECORATION_UNDEFINED_0100
     * @tc.desc   Test Span decoration property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanDecoration_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanDecoration_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_decoration_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_decoration_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanDecoration_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanDecoration_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanDecoration_undefined_0100] default decoration is: " + JSON.stringify(objCompare.$attrs.decoration));
      console.info("[spanDecoration_undefined_0100] undefined decoration is: " + JSON.stringify(obj.$attrs.decoration));

      expect(JSON.stringify(obj.$attrs.decoration)).assertEqual(JSON.stringify(objCompare.$attrs.decoration));
      console.info('[spanDecoration_undefined_0100] END');
    })

    /**
     * @tc.name   spanLineHeight_null_0100
     * @tc.number SUB_ARKUI_SPAN_LINEHEIGHT_NULL_0100
     * @tc.desc   Test Span lineHeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanLineHeight_null_0100', Level.LEVEL0, async () => {
      console.info('[spanLineHeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_lineHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanLineHeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanLineHeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanLineHeight_null_0100] default lineHeight is: " + JSON.stringify(objCompare.$attrs.lineHeight));
      console.info("[spanLineHeight_null_0100] null lineHeight is: " + JSON.stringify(obj.$attrs.lineHeight));

      expect(obj.$attrs.lineHeight).assertEqual(objCompare.$attrs.lineHeight);
      console.info('[spanLineHeight_null_0100] END');
    })

    /**
     * @tc.name   spanLineHeight_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_LINEHEIGHT_UNDEFINED_0100
     * @tc.desc   Test Span lineHeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanLineHeight_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanLineHeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_lineHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanLineHeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanLineHeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanLineHeight_undefined_0100] default lineHeight is: " + JSON.stringify(objCompare.$attrs.lineHeight));
      console.info("[spanLineHeight_undefined_0100] undefined lineHeight is: " + JSON.stringify(obj.$attrs.lineHeight));

      expect(obj.$attrs.lineHeight).assertEqual(objCompare.$attrs.lineHeight);
      console.info('[spanLineHeight_undefined_0100] END');
    })

    /**
     * @tc.name   spanLineHeight_empty_0100
     * @tc.number SUB_ARKUI_SPAN_LINEHEIGHT_EMPTY_0100
     * @tc.desc   Test Span lineHeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanLineHeight_empty_0100', Level.LEVEL0, async () => {
      console.info('[spanLineHeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_lineHeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_lineHeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanLineHeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanLineHeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanLineHeight_empty_0100] default lineHeight is: " + JSON.stringify(objCompare.$attrs.lineHeight));
      console.info("[spanLineHeight_empty_0100] empty lineHeight is: " + JSON.stringify(obj.$attrs.lineHeight));

      expect(obj.$attrs.lineHeight).assertEqual(objCompare.$attrs.lineHeight);
      console.info('[spanLineHeight_empty_0100] END');
    })

    /**
     * @tc.name   spanFont_null_0100
     * @tc.number SUB_ARKUI_SPAN_FONT_NULL_0100
     * @tc.desc   Test Span font property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFont_null_0100', Level.LEVEL0, async () => {
      console.info('[spanFont_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_font_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_font_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFont_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFont_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFont_null_0100] default fontSize is: " + JSON.stringify(objCompare.$attrs.fontSize));
      console.info("[spanFont_null_0100] null fontSize is: " + JSON.stringify(obj.$attrs.fontSize));

      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[spanFont_null_0100] END');
    })

    /**
     * @tc.name   spanFont_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_FONT_UNDEFINED_0100
     * @tc.desc   Test Span font property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanFont_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanFont_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_font_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_font_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanFont_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanFont_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanFont_undefined_0100] default fontSize is: " + JSON.stringify(objCompare.$attrs.fontSize));
      console.info("[spanFont_undefined_0100] undefined fontSize is: " + JSON.stringify(obj.$attrs.fontSize));

      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[spanFont_undefined_0100] END');
    })

    /**
     * @tc.name   spanTextBackgroundStyle_null_0100
     * @tc.number SUB_ARKUI_SPAN_TEXTBACKGROUNDSTYLE_NULL_0100
     * @tc.desc   Test Span textBackgroundStyle property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanTextBackgroundStyle_null_0100', Level.LEVEL0, async () => {
      console.info('[spanTextBackgroundStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_textBackgroundStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_textBackgroundStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanTextBackgroundStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanTextBackgroundStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanTextBackgroundStyle_null_0100] default textBackgroundStyle is: " + JSON.stringify(objCompare.$attrs.textBackgroundStyle));
      console.info("[spanTextBackgroundStyle_null_0100] null textBackgroundStyle is: " + JSON.stringify(obj.$attrs.textBackgroundStyle));

      expect(JSON.stringify(obj.$attrs.textBackgroundStyle)).assertEqual(JSON.stringify(objCompare.$attrs.textBackgroundStyle));
      console.info('[spanTextBackgroundStyle_null_0100] END');
    })

    /**
     * @tc.name   spanTextBackgroundStyle_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_TEXTBACKGROUNDSTYLE_UNDEFINED_0100
     * @tc.desc   Test Span textBackgroundStyle property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanTextBackgroundStyle_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanTextBackgroundStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_textBackgroundStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_textBackgroundStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanTextBackgroundStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanTextBackgroundStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanTextBackgroundStyle_undefined_0100] default textBackgroundStyle is: " + JSON.stringify(objCompare.$attrs.textBackgroundStyle));
      console.info("[spanTextBackgroundStyle_undefined_0100] undefined textBackgroundStyle is: " + JSON.stringify(obj.$attrs.textBackgroundStyle));

      expect(JSON.stringify(obj.$attrs.textBackgroundStyle)).assertEqual(JSON.stringify(objCompare.$attrs.textBackgroundStyle));
      console.info('[spanTextBackgroundStyle_undefined_0100] END');
    })

    /**
     * @tc.name   spanBaselineOffset_null_0100
     * @tc.number SUB_ARKUI_SPAN_BASELINEOFFSET_NULL_0100
     * @tc.desc   Test Span baselineOffset property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanBaselineOffset_null_0100', Level.LEVEL0, async () => {
      console.info('[spanBaselineOffset_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_baselineOffset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_baselineOffset_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanBaselineOffset_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanBaselineOffset_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanBaselineOffset_null_0100] default baselineOffset is: " + JSON.stringify(objCompare.$attrs.baselineOffset));
      console.info("[spanBaselineOffset_null_0100] null baselineOffset is: " + JSON.stringify(obj.$attrs.baselineOffset));

      expect(obj.$attrs.baselineOffset).assertEqual(objCompare.$attrs.baselineOffset);
      console.info('[spanBaselineOffset_null_0100] END');
    })

    /**
     * @tc.name   spanBaselineOffset_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_BASELINEOFFSET_UNDEFINED_0100
     * @tc.desc   Test Span baselineOffset property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanBaselineOffset_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanBaselineOffset_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_baselineOffset_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_baselineOffset_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanBaselineOffset_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanBaselineOffset_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanBaselineOffset_undefined_0100] default baselineOffset is: " + JSON.stringify(objCompare.$attrs.baselineOffset));
      console.info("[spanBaselineOffset_undefined_0100] undefined baselineOffset is: " + JSON.stringify(obj.$attrs.baselineOffset));

      expect(obj.$attrs.baselineOffset).assertEqual(objCompare.$attrs.baselineOffset);
      console.info('[spanBaselineOffset_undefined_0100] END');
    })

    /**
     * @tc.name   spanTextShadow_null_0100
     * @tc.number SUB_ARKUI_SPAN_TEXTSHADOW_NULL_0100
     * @tc.desc   Test Span textShadow property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanTextShadow_null_0100', Level.LEVEL0, async () => {
      console.info('[spanTextShadow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_textShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_textShadow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanTextShadow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanTextShadow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanTextShadow_null_0100] default textShadow is: " + JSON.stringify(objCompare.$attrs.textShadow));
      console.info("[spanTextShadow_null_0100] null textShadow is: " + JSON.stringify(obj.$attrs.textShadow));

      expect(JSON.stringify(obj.$attrs.textShadow)).assertEqual('[]');
      console.info('[spanTextShadow_null_0100] END');
    })

    /**
     * @tc.name   spanTextShadow_undefined_0100
     * @tc.number SUB_ARKUI_SPAN_TEXTSHADOW_UNDEFINED_0100
     * @tc.desc   Test Span textShadow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('spanTextShadow_undefined_0100', Level.LEVEL0, async () => {
      console.info('[spanTextShadow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('Span_textShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('Span_textShadow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[spanTextShadow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[spanTextShadow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[spanTextShadow_undefined_0100] default textShadow is: " + JSON.stringify(objCompare.$attrs.textShadow));
      console.info("[spanTextShadow_undefined_0100] undefined textShadow is: " + JSON.stringify(obj.$attrs.textShadow));

      expect(JSON.stringify(obj.$attrs.textShadow)).assertEqual('[]');
      console.info('[spanTextShadow_undefined_0100] END');
    })
  })
}
