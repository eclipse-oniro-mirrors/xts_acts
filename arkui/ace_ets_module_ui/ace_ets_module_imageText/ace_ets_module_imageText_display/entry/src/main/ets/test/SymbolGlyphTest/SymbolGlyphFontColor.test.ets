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
import router from '@ohos.router';
import CommonFunc from "../../MainAbility/common/Common";

export default function SymbolGlyphFontColorTest() {
  describe('SymbolGlyphFontColorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolGlyphFontColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SymbolGlyphFontColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolGlyphFontColorTest state pages:" + JSON.stringify(pages));
        if (!("SymbolGlyphFontColor" == pages.name)) {
          console.info("get SymbolGlyphFontColor pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SymbolGlyphFontColor page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolGlyphFontColor page error:" + err);
        expect().assertFail();
      }
      console.info("SymbolGlyphFontColor beforeEach end");
      done();
    });

    /**
     * @tc.name   symbolGlyphFontColor_colorEnum_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_COLORENUM_0100
     * @tc.desc   Test SymbolGlyph fontColor property with Color enum parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_colorEnum_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_colorEnum_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontColor_colorEnum');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_colorEnum_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_colorEnum_0100] fontColor is: " + obj.$attrs.fontColor);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontColor).assertContain('#FFFF0000');
      console.info('[symbolGlyphFontColor_colorEnum_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontColor_string_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_STRING_0100
     * @tc.desc   Test SymbolGlyph fontColor property with string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_string_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_string_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontColor_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_string_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_string_0100] fontColor is: " + obj.$attrs.fontColor);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontColor).assertContain('#FFFF0000');
      console.info('[symbolGlyphFontColor_string_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontColor_emptyString_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_EMPTYSTRING_0100
     * @tc.desc   Test SymbolGlyph fontColor property with empty string parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_emptyString_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_emptyString_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontColor_emptyString');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_emptyString_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_emptyString_0100] fontColor is: " + obj.$attrs.fontColor);

      expect(obj.$type).assertEqual('SymbolGlyph');
      console.info('[symbolGlyphFontColor_emptyString_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontColor_number_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_NUMBER_0100
     * @tc.desc   Test SymbolGlyph fontColor property with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_number_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_number_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontColor_number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_number_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_number_0100] fontColor is: " + obj.$attrs.fontColor);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontColor).assertContain('#FFFF0000');
      console.info('[symbolGlyphFontColor_number_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontColor_colorMetricsResource_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_COLORMETRICSRESOURCE_0100
     * @tc.desc   Test SymbolGlyph fontColor property with ColorMetrics.resourceColor parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_colorMetricsResource_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_colorMetricsResource_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontColor_colorMetricsResource');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_colorMetricsResource_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_colorMetricsResource_0100] fontColor is: " + obj.$attrs.fontColor);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontColor).assertContain('#FF0000FF');
      console.info('[symbolGlyphFontColor_colorMetricsResource_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontColor_colorMetricsNumeric_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_COLORMETRICSNUMERIC_0100
     * @tc.desc   Test SymbolGlyph fontColor property with ColorMetrics.numeric parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_colorMetricsNumeric_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_colorMetricsNumeric_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontColor_colorMetricsNumeric');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_colorMetricsNumeric_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_colorMetricsNumeric_0100] fontColor is: " + obj.$attrs.fontColor);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontColor).assertContain('#FF00FF00');
      console.info('[symbolGlyphFontColor_colorMetricsNumeric_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontColor_colorMetricsRgba_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_COLORMETRICSRGBA_0100
     * @tc.desc   Test SymbolGlyph fontColor property with ColorMetrics.rgba parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_colorMetricsRgba_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_colorMetricsRgba_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontColor_colorMetricsRgba');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_colorMetricsRgba_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_colorMetricsRgba_0100] fontColor is: " + obj.$attrs.fontColor);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontColor).assertContain('#FF000000');
      console.info('[symbolGlyphFontColor_colorMetricsRgba_0100] END');
    })
  })
}