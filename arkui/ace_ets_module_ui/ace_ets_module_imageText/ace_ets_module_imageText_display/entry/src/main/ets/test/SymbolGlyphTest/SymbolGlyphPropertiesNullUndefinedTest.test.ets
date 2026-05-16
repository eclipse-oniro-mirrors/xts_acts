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
import { Driver, ON} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function SymbolGlyphPropertiesNullUndefinedTest() {
  describe('SymbolGlyphPropertiesNullUndefinedTest', () => {
    beforeAll(async () => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SymbolGlyphPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolGlyphPropertiesNullUndefinedTest state success " + JSON.stringify(pages));
        if (!("SymbolGlyphPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get SymbolGlyphPropertiesNullUndefinedTest state success " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push SymbolGlyphPropertiesNullUndefinedTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolGlyphPropertiesNullUndefinedTest page error: " + err);
      }
    });

    /**
     * @tc.name   symbolGlyphFontSize_null_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTSIZE_NULL_0100
     * @tc.desc   Test SymbolGlyph fontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontSize_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_fontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontSize_null_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[symbolGlyphFontSize_null_0100] null fontSize is: " + obj.$attrs.fontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[symbolGlyphFontSize_null_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontSize_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTSIZE_UNDEFINED_0100
     * @tc.desc   Test SymbolGlyph fontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontSize_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_fontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontSize_undefined_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[symbolGlyphFontSize_undefined_0100] undefined fontSize is: " + obj.$attrs.fontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[symbolGlyphFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontSize_empty_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTSIZE_EMPTY_0100
     * @tc.desc   Test SymbolGlyph fontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontSize_empty_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_fontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontSize_empty_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[symbolGlyphFontSize_empty_0100] empty fontSize is: " + obj.$attrs.fontSize);

      // 空字符串 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[symbolGlyphFontSize_empty_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontColor_null_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_NULL_0100
     * @tc.desc   Test SymbolGlyph fontColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphFontColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_null_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[symbolGlyphFontColor_null_0100] null fontColor is: " + obj.$attrs.fontColor);

      // null 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.fontColor as string;
      let nullColor: string = obj.$attrs.fontColor as string;
      expect(nullColor).assertEqual(defaultColor);
      console.info('[symbolGlyphFontColor_null_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontColor_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_UNDEFINED_0100
     * @tc.desc   Test SymbolGlyph fontColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphFontColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_undefined_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[symbolGlyphFontColor_undefined_0100] undefined fontColor is: " + obj.$attrs.fontColor);

      // undefined 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.fontColor as string;
      let undefinedColor: string = obj.$attrs.fontColor as string;
      expect(undefinedColor).assertEqual(defaultColor);
      console.info('[symbolGlyphFontColor_undefined_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontColor_empty_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTCOLOR_EMPTY_0100
     * @tc.desc   Test SymbolGlyph fontColor property with empty array, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontColor_empty_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_fontColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphFontColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontColor_empty_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[symbolGlyphFontColor_empty_0100] empty fontColor is: " + obj.$attrs.fontColor);

      // 空字符串 应该恢复为默认值
      let defaultColor: string = objCompare.$attrs.fontColor as string;
      let emptyColor: string = obj.$attrs.fontColor as string;
      expect(emptyColor).assertEqual(defaultColor);
      console.info('[symbolGlyphFontColor_empty_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_null_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_NULL_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontWeight_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontWeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_fontWeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphFontWeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_null_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_null_0100] null fontWeight is: " + obj.$attrs.fontWeight);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[symbolGlyphFontWeight_null_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_UNDEFINED_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontWeight_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontWeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_fontWeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphFontWeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_undefined_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_undefined_0100] undefined fontWeight is: " + obj.$attrs.fontWeight);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[symbolGlyphFontWeight_undefined_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_empty_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_EMPTY_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphFontWeight_empty_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphFontWeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_fontWeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphFontWeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_empty_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_empty_0100] empty fontWeight is: " + obj.$attrs.fontWeight);

      // 空字符串 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[symbolGlyphFontWeight_empty_0100] END');
    })

    /**
     * @tc.name   symbolGlyphMinFontScale_null_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_MINFONTSCALE_NULL_0100
     * @tc.desc   Test SymbolGlyph minFontScale property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphMinFontScale_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphMinFontScale_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_minFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_minFontScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphMinFontScale_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphMinFontScale_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphMinFontScale_null_0100] default minFontScale is: " + objCompare.$attrs.minFontScale);
      console.info("[symbolGlyphMinFontScale_null_0100] null minFontScale is: " + obj.$attrs.minFontScale);

      // null 应该恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      console.info('[symbolGlyphMinFontScale_null_0100] END');
    })

    /**
     * @tc.name   symbolGlyphMinFontScale_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_MINFONTSCALE_UNDEFINED_0100
     * @tc.desc   Test SymbolGlyph minFontScale property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphMinFontScale_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphMinFontScale_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_minFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_minFontScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphMinFontScale_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphMinFontScale_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphMinFontScale_undefined_0100] default minFontScale is: " + objCompare.$attrs.minFontScale);
      console.info("[symbolGlyphMinFontScale_undefined_0100] undefined minFontScale is: " + obj.$attrs.minFontScale);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.minFontScale).assertEqual(objCompare.$attrs.minFontScale);
      console.info('[symbolGlyphMinFontScale_undefined_0100] END');
    })

    /**
     * @tc.name   symbolGlyphMaxFontScale_null_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_MAXFONTSCALE_NULL_0100
     * @tc.desc   Test SymbolGlyph maxFontScale property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphMaxFontScale_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphMaxFontScale_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_maxFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_maxFontScale_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphMaxFontScale_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphMaxFontScale_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphMaxFontScale_null_0100] default maxFontScale is: " + objCompare.$attrs.maxFontScale);
      console.info("[symbolGlyphMaxFontScale_null_0100] null maxFontScale is: " + obj.$attrs.maxFontScale);

      // null 应该恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      console.info('[symbolGlyphMaxFontScale_null_0100] END');
    })

    /**
     * @tc.name   symbolGlyphMaxFontScale_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_MAXFONTSCALE_UNDEFINED_0100
     * @tc.desc   Test SymbolGlyph maxFontScale property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphMaxFontScale_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphMaxFontScale_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_maxFontScale_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_maxFontScale_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphMaxFontScale_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphMaxFontScale_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphMaxFontScale_undefined_0100] default maxFontScale is: " + objCompare.$attrs.maxFontScale);
      console.info("[symbolGlyphMaxFontScale_undefined_0100] undefined maxFontScale is: " + obj.$attrs.maxFontScale);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.maxFontScale).assertEqual(objCompare.$attrs.maxFontScale);
      console.info('[symbolGlyphMaxFontScale_undefined_0100] END');
    })

    /**
     * @tc.name   symbolGlyphSymbolShadow_null_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLSHADOW_NULL_0100
     * @tc.desc   Test SymbolGlyph symbolShadow property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphSymbolShadow_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphSymbolShadow_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_symbolShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_symbolShadow_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphSymbolShadow_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphSymbolShadow_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphSymbolShadow_null_0100] default symbolShadow is: " + JSON.stringify(objCompare.$attrs.symbolShadow));
      console.info("[symbolGlyphSymbolShadow_null_0100] null symbolShadow is: " + JSON.stringify(obj.$attrs.symbolShadow));

      // null 应该恢复为默认值
      expect(obj.$attrs.symbolShadow.offset).assertEqual('[0.000000, 0.000000]');
      expect(obj.$attrs.symbolShadow.radius).assertEqual('0.000000');
      console.info('[symbolGlyphSymbolShadow_null_0100] END');
    })

    /**
     * @tc.name   symbolGlyphSymbolShadow_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLSHADOW_UNDEFINED_0100
     * @tc.desc   Test SymbolGlyph symbolShadow property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolGlyphSymbolShadow_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolGlyphSymbolShadow_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolGlyph_symbolShadow_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolGlyph_symbolShadow_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphSymbolShadow_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolGlyphSymbolShadow_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphSymbolShadow_null_0100] default symbolShadow is: " + JSON.stringify(objCompare.$attrs.symbolShadow));
      console.info("[symbolGlyphSymbolShadow_null_0100] null symbolShadow is: " + JSON.stringify(obj.$attrs.symbolShadow));

      // undefined 应该恢复为默认值
      expect(obj.$attrs.symbolShadow.offset).assertEqual('[0.000000, 0.000000]');
      expect(obj.$attrs.symbolShadow.radius).assertEqual('0.000000');
      console.info('[symbolGlyphSymbolShadow_undefined_0100] END');
    })
  })
}
