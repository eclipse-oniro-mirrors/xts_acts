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
import {
  TextStyle,
  StyledStringKey,
  SpanStyle,
  StyledString,
  FontVariation
} from '@kit.ArkUI';
export default function StyledStringFontVariationsTest() {
  describe('StyledStringFontVariationsTest', () => {
    /**
     * @tc.name   styledStringFontVariations_array_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_FONTVARIATIONS_PARAM_0100
     * @tc.desc   Test StyledString fontVariations property with Array<FontVariation> parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringFontVariations_array_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringFontVariations_array_0100] START');
      let textStyle = new TextStyle({
        fontVariations: [{ axis: 'weight', value: 900 }]
      });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[styledStringFontVariations_array_0100] styles is: " + JSON.stringify(styles));
      console.info("[styledStringFontVariations_array_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);
      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      if(textStyleResult.fontVariations != undefined){
      let textFontVariation :Array<FontVariation> = textStyleResult.fontVariations as Array<FontVariation>
      console.info("[styledStringFontVariations_array_0100] fontVariations is: " + JSON.stringify(textFontVariation));
      console.info("[styledStringFontVariations_array_0100] fontVariations[0].axis is: " + textFontVariation[0].axis);
      console.info("[styledStringFontVariations_array_0100] fontVariations[0].value is: " + textFontVariation[0].value);
      expect(textFontVariation.length).assertEqual(1);
      expect(textFontVariation[0].axis).assertEqual('weight');
      expect(textFontVariation[0].value).assertEqual(900);
      } else {
        console.log('[styledStringFontVariations_array_0100] fontVariations is undefined')
        expect().assertFail();
      }
      console.info('[styledStringFontVariations_array_0100] END');
      done();
    })

    /**
     * @tc.name   styledStringFontVariations_multi_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_FONTVARIATIONS_PARAM_0200
     * @tc.desc   Test StyledString fontVariations property with multiple FontVariation axes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringFontVariations_multi_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringFontVariations_multi_0100] START');
      let textStyle = new TextStyle({
        fontVariations: [{ axis: 'weight', value: 700 }, { axis: 'ital', value: 1 }]
      });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[styledStringFontVariations_multi_0100] styles is: " + JSON.stringify(styles));
      console.info("[styledStringFontVariations_multi_0100] styles length is: " + styles.length);

      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);

      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      if(textStyleResult.fontVariations != undefined){
        console.info("[styledStringFontVariations_multi_0100] fontVariations is: " + JSON.stringify(textStyleResult.fontVariations));
        let textFontVariation :Array<FontVariation> = textStyleResult.fontVariations as Array<FontVariation>
        expect(textFontVariation.length).assertEqual(2);
        console.info("[styledStringFontVariations_multi_0100] fontVariations[0].axis is: " + textFontVariation[0].axis);
        console.info("[styledStringFontVariations_multi_0100] fontVariations[0].value is: " + textFontVariation[0].value);
        expect(textFontVariation[0].axis).assertEqual('weight');
        expect(textFontVariation[0].value).assertEqual(700);
        console.info("[styledStringFontVariations_multi_0100] fontVariations[1].axis is: " + textFontVariation[1].axis);
        console.info("[styledStringFontVariations_multi_0100] fontVariations[1].value is: " + textFontVariation[1].value);
        expect(textFontVariation[1].axis ).assertEqual('ital');
        expect(textFontVariation[1].value).assertEqual(1);
      }else {
        console.log('[styledStringFontVariations_multi_0100] fontVariations is undefined')
        expect().assertFail();
      }
      console.info('[styledStringFontVariations_multi_0100] END');
      done();
    })
    /**
     * @tc.name   styledStringFontVariations_empty_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_FONTVARIATIONS_PARAM_0300
     * @tc.desc   Test StyledString fontVariations property with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringFontVariations_empty_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringFontVariations_empty_0100] START');
      let textStyle = new TextStyle({
        fontVariations: []
      });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[styledStringFontVariations_empty_0100] styles is: " + JSON.stringify(styles));
      console.info("[styledStringFontVariations_empty_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);
      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      if(textStyleResult.fontVariations != undefined){
        console.info("[styledStringFontVariations_empty_0100] fontVariations is: " + JSON.stringify(textStyleResult.fontVariations));
        expect(textStyleResult.fontVariations?.length).assertEqual(0);
      } else{
        console.log('[styledStringFontVariations_empty_0100] fontVariations is undefined')
        expect().assertFail();
      }
      console.info('[styledStringFontVariations_empty_0100] END');
      done();
    })
    /**
     * @tc.name   styledStringFontVariations_undefined_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_FONTVARIATIONS_PARAM_0500
     * @tc.desc   Test StyledString fontVariations property with undefined parameter, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringFontVariations_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringFontVariations_undefined_0100] START');
      let textStyle = new TextStyle({
        fontVariations: undefined
      });
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[styledStringFontVariations_undefined_0100] styles is: " + JSON.stringify(styles));
      console.info("[styledStringFontVariations_undefined_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);
      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      console.info("[styledStringFontVariations_undefined_0100] fontVariations is: " + JSON.stringify(textStyleResult.fontVariations));
      expect(textStyleResult.fontVariations).assertEqual(undefined);
      console.info('[styledStringFontVariations_undefined_0100] END');
      done();
    })
    /**
     * @tc.name   styledStringFontVariations_default_0100
     * @tc.number SUB_ARKUI_STYLEDSTRING_FONTVARIATIONS_PARAM_0600
     * @tc.desc   Test StyledString fontVariations property without setting, should be default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('styledStringFontVariations_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[styledStringFontVariations_default_0100] START');
      let textStyle = new TextStyle({});
      let styledString = new StyledString('Test', [{
        styledKey: StyledStringKey.FONT,
        styledValue: textStyle
      }]);
      let styles: Array<SpanStyle> = styledString.getStyles(0, styledString.length) as Array<SpanStyle>;
      console.info("[styledStringFontVariations_default_0100] styles is: " + JSON.stringify(styles));
      console.info("[styledStringFontVariations_default_0100] styles length is: " + styles.length);
      expect(styles.length).assertEqual(1);
      expect(styles[0].styledKey).assertEqual(StyledStringKey.FONT);
      let textStyleResult: TextStyle = styles[0].styledValue as TextStyle;
      console.info("[styledStringFontVariations_default_0100] fontVariations is: " + JSON.stringify(textStyleResult.fontVariations));
      expect(textStyleResult.fontVariations).assertEqual(undefined);
      console.info('[styledStringFontVariations_default_0100] END');
      done();
    })

  })
}