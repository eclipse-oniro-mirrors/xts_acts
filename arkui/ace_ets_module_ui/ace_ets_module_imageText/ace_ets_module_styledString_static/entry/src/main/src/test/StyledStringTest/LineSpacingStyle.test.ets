'use static';
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

import { describe, it, expect, beforeAll, afterEach, afterAll, Level, beforeEach } from '../../../../hypium/index';
import { LengthMetrics,
LineSpacingStyle,
StyledStringKey,
SpanStyle,
StyledString,
LineSpacingOptions,
TextStyle,
Color } from '@kit.ArkUI';

export default function LineSpacingStyleTest() {
  describe('LineSpacingStyleTest', () => {

    /**
     * @tc.name   lineSpacingStyle_number_0100
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_PARAM_0100
     * @tc.desc   Test LineSpacingStyle with positive number value (10 vp)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_number_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_number_0100] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(10));
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_number_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_number_0100] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_SPACING);
      
      let lineSpacingStyleResult: LineSpacingStyle = styles[0].styledValue as LineSpacingStyle;
      console.info("[lineSpacingStyle_number_0100] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
      console.info("[lineSpacingStyle_number_0100] options is: " + JSON.stringify(lineSpacingStyleResult.options));
      
      expect(lineSpacingStyleResult.lineSpacing).assertEqual(10);
      expect(lineSpacingStyleResult.options).assertEqual(undefined);
      
      console.info('[lineSpacingStyle_number_0100] END');
      done();
    })

    /**
     * @tc.name   lineSpacingStyle_number_0200
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_PARAM_0200
     * @tc.desc   Test LineSpacingStyle with positive number value (20 vp)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_number_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_number_0200] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(20));
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_number_0200] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_number_0200] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_SPACING);
      
      let lineSpacingStyleResult: LineSpacingStyle = styles[0].styledValue as LineSpacingStyle;
      console.info("[lineSpacingStyle_number_0200] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
      console.info("[lineSpacingStyle_number_0200] options is: " + JSON.stringify(lineSpacingStyleResult.options));
      
      expect(lineSpacingStyleResult.lineSpacing).assertEqual(20);
      expect(lineSpacingStyleResult.options).assertEqual(undefined);
      
      console.info('[lineSpacingStyle_number_0200] END');
      done();
    })

    /**
     * @tc.name   lineSpacingStyle_zero_0100
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_PARAM_0300
     * @tc.desc   Test LineSpacingStyle with zero value (0 vp)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_zero_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_zero_0100] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(0));
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_zero_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_zero_0100] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_SPACING);
      
      let lineSpacingStyleResult: LineSpacingStyle = styles[0].styledValue as LineSpacingStyle;
      console.info("[lineSpacingStyle_zero_0100] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
      console.info("[lineSpacingStyle_zero_0100] options is: " + JSON.stringify(lineSpacingStyleResult.options));
      
      expect(lineSpacingStyleResult.lineSpacing).assertEqual(0);
      expect(lineSpacingStyleResult.options).assertEqual(undefined);
      
      console.info('[lineSpacingStyle_zero_0100] END');
      done();
    })

    /**
     * @tc.name   lineSpacingStyle_decimal_0100
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_PARAM_0400
     * @tc.desc   Test LineSpacingStyle with decimal value (10.5 vp)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_decimal_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_decimal_0100] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(10.5));
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_decimal_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_decimal_0100] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_SPACING);
      
      let lineSpacingStyleResult: LineSpacingStyle = styles[0].styledValue as LineSpacingStyle;
      console.info("[lineSpacingStyle_decimal_0100] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
      console.info("[lineSpacingStyle_decimal_0100] options is: " + JSON.stringify(lineSpacingStyleResult.options));
      
      expect(lineSpacingStyleResult.lineSpacing).assertEqual(10.5);
      expect(lineSpacingStyleResult.options).assertEqual(undefined);
      
      console.info('[lineSpacingStyle_decimal_0100] END');
      done();
    })

    /**
     * @tc.name   lineSpacingStyle_options_true_0100
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_OPTIONS_0100
     * @tc.desc   Test LineSpacingStyle with options onlyBetweenLines set to true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_options_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_options_true_0100] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(15), { onlyBetweenLines: true });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_options_true_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_options_true_0100] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_SPACING);
      
      let lineSpacingStyleResult: LineSpacingStyle = styles[0].styledValue as LineSpacingStyle;
      console.info("[lineSpacingStyle_options_true_0100] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
      console.info("[lineSpacingStyle_options_true_0100] options is: " + JSON.stringify(lineSpacingStyleResult.options));
      
      expect(lineSpacingStyleResult.lineSpacing).assertEqual(15);
      expect(lineSpacingStyleResult.options != null).assertEqual(true);
      
      if (lineSpacingStyleResult.options != undefined && lineSpacingStyleResult.options != null) {
        let resultLineSpacingOptions :LineSpacingOptions = lineSpacingStyleResult.options as LineSpacingOptions
        console.info("[lineSpacingStyle_options_true_0100] onlyBetweenLines is: " + resultLineSpacingOptions.onlyBetweenLines);
        expect(resultLineSpacingOptions.onlyBetweenLines).assertEqual(true);
      } else {
        console.log('[lineSpacingStyle_options_true_0100] options is null or undefined');
        expect().assertFail();
      }
      
      console.info('[lineSpacingStyle_options_true_0100] END');
      done();
    })

    /**
     * @tc.name   lineSpacingStyle_options_false_0100
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_OPTIONS_0200
     * @tc.desc   Test LineSpacingStyle with options onlyBetweenLines set to false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_options_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_options_false_0100] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(15), { onlyBetweenLines: false });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_options_false_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_options_false_0100] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_SPACING);
      
      let lineSpacingStyleResult: LineSpacingStyle = styles[0].styledValue as LineSpacingStyle;
      console.info("[lineSpacingStyle_options_false_0100] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
      console.info("[lineSpacingStyle_options_false_0100] options is: " + JSON.stringify(lineSpacingStyleResult.options));
      
      expect(lineSpacingStyleResult.lineSpacing).assertEqual(15);
      expect(lineSpacingStyleResult.options != null).assertEqual(true);
      
      if (lineSpacingStyleResult.options != undefined && lineSpacingStyleResult.options != null) {
        let resultLineSpacingOptions :LineSpacingOptions = lineSpacingStyleResult.options as LineSpacingOptions
        console.info("[lineSpacingStyle_options_false_0100] onlyBetweenLines is: " + resultLineSpacingOptions.onlyBetweenLines);
        expect(resultLineSpacingOptions.onlyBetweenLines).assertEqual(false);
      } else {
        console.log('[lineSpacingStyle_options_false_0100] options is null or undefined');
        expect().assertFail();
      }
      
      console.info('[lineSpacingStyle_options_false_0100] END');
      done();
    })

    /**
     * @tc.name   lineSpacingStyle_options_undefined_0100
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_OPTIONS_0300
     * @tc.desc   Test LineSpacingStyle with options set to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_options_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_options_undefined_0100] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(15), undefined);
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_options_undefined_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_options_undefined_0100] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_SPACING);
      
      let lineSpacingStyleResult: LineSpacingStyle = styles[0].styledValue as LineSpacingStyle;
      console.info("[lineSpacingStyle_options_undefined_0100] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
      console.info("[lineSpacingStyle_options_undefined_0100] options is: " + JSON.stringify(lineSpacingStyleResult.options));
      
      expect(lineSpacingStyleResult.lineSpacing).assertEqual(15);
      
      if (lineSpacingStyleResult.options != undefined && lineSpacingStyleResult.options != null) {
        expect().assertFail();
      } else {
        console.log('[lineSpacingStyle_options_undefined_0100] options is null or undefined, should use default value');
        expect(lineSpacingStyleResult.options).assertEqual(undefined);
      }
      
      console.info('[lineSpacingStyle_options_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   lineSpacingStyle_options_default_0100
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_OPTIONS_0400
     * @tc.desc   Test LineSpacingStyle without setting options parameter (should use default)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_options_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_options_default_0100] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(15));
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_options_default_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_options_default_0100] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_SPACING);
      
      let lineSpacingStyleResult: LineSpacingStyle = styles[0].styledValue as LineSpacingStyle;
      console.info("[lineSpacingStyle_options_default_0100] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
      console.info("[lineSpacingStyle_options_default_0100] options is: " + JSON.stringify(lineSpacingStyleResult.options));
      
      expect(lineSpacingStyleResult.lineSpacing).assertEqual(15);
      
      if (lineSpacingStyleResult.options != undefined && lineSpacingStyleResult.options != null) {
        expect().assertFail();
      } else {
        console.log('[lineSpacingStyle_options_default_0100] options is null or undefined, should use default value');
        expect(lineSpacingStyleResult.options).assertEqual(undefined);
      }
      
      console.info('[lineSpacingStyle_options_default_0100] END');
      done();
    })

    /**
     * @tc.name   lineSpacingStyle_negative_0100
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_PARAM_0500
     * @tc.desc   Test LineSpacingStyle with negative value (should use default 0.0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_negative_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_negative_0100] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(-5));
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_negative_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_negative_0100] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.LINE_SPACING);
      
      let lineSpacingStyleResult: LineSpacingStyle = styles[0].styledValue as LineSpacingStyle;
      console.info("[lineSpacingStyle_negative_0100] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
      console.info("[lineSpacingStyle_negative_0100] options is: " + JSON.stringify(lineSpacingStyleResult.options));
      
      expect(lineSpacingStyleResult.lineSpacing).assertEqual(0);
      expect(lineSpacingStyleResult.options).assertEqual(undefined);
      
      console.info('[lineSpacingStyle_negative_0100] END');
      done();
    })

    /**
     * @tc.name   lineSpacingStyle_mixed_0100
     * @tc.number SUB_ARKUI_LINESPACINGSTYLE_MIXED_0100
     * @tc.desc   Test LineSpacingStyle mixed with other styles (FONT)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('lineSpacingStyle_mixed_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[lineSpacingStyle_mixed_0100] START');
      let lineSpacingStyle = new LineSpacingStyle(LengthMetrics.vp(12), { onlyBetweenLines: true } as LineSpacingOptions);
      let textStyle = new TextStyle({ fontColor: Color.Blue });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.LINE_SPACING,
        styledValue: lineSpacingStyle
      }, {
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[lineSpacingStyle_mixed_0100] styles is: " + JSON.stringify(styles));
      console.info("[lineSpacingStyle_mixed_0100] styles length is: " + styles.length);
      
      expect(styles.length).assertEqual(2);
      
      let lineSpacingStyleFound = false;
      let textStyleFound = false;
      
      for (let style of styles) {
        if (style.styledKey === StyledStringKey.LINE_SPACING) {
          lineSpacingStyleFound = true;
          let lineSpacingStyleResult: LineSpacingStyle = style.styledValue as LineSpacingStyle;
          console.info("[lineSpacingStyle_mixed_0100] lineSpacing is: " + lineSpacingStyleResult.lineSpacing);
          console.info("[lineSpacingStyle_mixed_0100] options is: " + JSON.stringify(lineSpacingStyleResult.options));
          
          expect(lineSpacingStyleResult.lineSpacing).assertEqual(12);
          if (lineSpacingStyleResult.options != undefined && lineSpacingStyleResult.options != null) {
          	let resultLineSpacingOptions :LineSpacingOptions = lineSpacingStyleResult.options as LineSpacingOptions
            expect(resultLineSpacingOptions.onlyBetweenLines).assertEqual(true);
          }
        } else if (style.styledKey === StyledStringKey.FONT) {
          textStyleFound = true;
        }
      }
      
      expect(lineSpacingStyleFound).assertEqual(true);
      expect(textStyleFound).assertEqual(true);
      
      console.info('[lineSpacingStyle_mixed_0100] END');
      done();
    })

  })
}