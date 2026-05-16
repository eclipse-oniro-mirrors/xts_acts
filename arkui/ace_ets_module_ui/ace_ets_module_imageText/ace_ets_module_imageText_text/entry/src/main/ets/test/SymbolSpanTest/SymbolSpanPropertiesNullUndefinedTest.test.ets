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

import { describe, beforeEach, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function SymbolSpanPropertiesNullUndefinedTest() {
  describe('SymbolSpanPropertiesNullUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolSpanPropertiesNullUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolSpan/SymbolSpanPropertiesNullUndefinedTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolSpanPropertiesNullUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("SymbolSpanPropertiesNullUndefinedTest" == pages.name)) {
          console.info("get SymbolSpanPropertiesNullUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SymbolSpanPropertiesNullUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolSpanPropertiesNullUndefinedTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   symbolSpanFontSize_null_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTSIZE_NULL_0100
     * @tc.desc   Test SymbolSpan fontSize property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontSize_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontSize_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_fontSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontSize_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanFontSize_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontSize_null_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[symbolSpanFontSize_null_0100] null fontSize is: " + obj.$attrs.fontSize);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[symbolSpanFontSize_null_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontSize_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTSIZE_UNDEFINED_0100
     * @tc.desc   Test SymbolSpan fontSize property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontSize_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontSize_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_fontSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontSize_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanFontSize_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontSize_undefined_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[symbolSpanFontSize_undefined_0100] undefined fontSize is: " + obj.$attrs.fontSize);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[symbolSpanFontSize_undefined_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontSize_empty_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTSIZE_EMPTY_0100
     * @tc.desc   Test SymbolSpan fontSize property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontSize_empty_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontSize_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_fontSize_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_fontSize_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontSize_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanFontSize_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontSize_empty_0100] default fontSize is: " + objCompare.$attrs.fontSize);
      console.info("[symbolSpanFontSize_empty_0100] empty fontSize is: " + obj.$attrs.fontSize);

      // 空字符串 应该恢复为默认值
      expect(obj.$attrs.fontSize).assertEqual(objCompare.$attrs.fontSize);
      console.info('[symbolSpanFontSize_empty_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontColor_null_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTCOLOR_NULL_0100
     * @tc.desc   Test SymbolSpan fontColor property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontColor_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanFontColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontColor_null_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[symbolSpanFontColor_null_0100] null fontColor is: " + obj.$attrs.fontColor);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[symbolSpanFontColor_null_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontColor_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTCOLOR_UNDEFINED_0100
     * @tc.desc   Test SymbolSpan fontColor property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontColor_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanFontColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontColor_undefined_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[symbolSpanFontColor_undefined_0100] undefined fontColor is: " + obj.$attrs.fontColor);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[symbolSpanFontColor_undefined_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontColor_empty_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTCOLOR_EMPTY_0100
     * @tc.desc   Test SymbolSpan fontColor property with empty array, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontColor_empty_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontColor_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_fontColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_fontColor_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontColor_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanFontColor_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontColor_empty_0100] default fontColor is: " + objCompare.$attrs.fontColor);
      console.info("[symbolSpanFontColor_empty_0100] empty fontColor is: " + obj.$attrs.fontColor);

      // 空字符串 应该恢复为默认值
      expect(obj.$attrs.fontColor).assertEqual(objCompare.$attrs.fontColor);
      console.info('[symbolSpanFontColor_empty_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_null_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_NULL_0100
     * @tc.desc   Test SymbolSpan fontWeight property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontWeight_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontWeight_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_fontWeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanFontWeight_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_null_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_null_0100] null fontWeight is: " + obj.$attrs.fontWeight);

      // null 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[symbolSpanFontWeight_null_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_UNDEFINED_0100
     * @tc.desc   Test SymbolSpan fontWeight property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontWeight_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontWeight_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_fontWeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanFontWeight_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_undefined_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_undefined_0100] undefined fontWeight is: " + obj.$attrs.fontWeight);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[symbolSpanFontWeight_undefined_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_empty_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_EMPTY_0100
     * @tc.desc   Test SymbolSpan fontWeight property with empty string, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontWeight_empty_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontWeight_empty_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_fontWeight_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_fontWeight_empty');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_empty_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanFontWeight_empty_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_empty_0100] default fontWeight is: " + objCompare.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_empty_0100] empty fontWeight is: " + obj.$attrs.fontWeight);

      // 空字符串 应该恢复为默认值
      expect(obj.$attrs.fontWeight).assertEqual(objCompare.$attrs.fontWeight);
      console.info('[symbolSpanFontWeight_empty_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_number_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_NUMBER_0100
     * @tc.desc   Test SymbolSpan fontWeight property with number type value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanFontWeight_number_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanFontWeight_number_0100] START');

      let strJson: string = getInspectorByKey('SymbolSpan_fontWeight_number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_number_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_number_0100] fontWeight is: " + obj.$attrs.fontWeight);

      // number 类型应该设置成功
      expect(obj.$attrs.fontWeight).assertEqual('700');
      console.info('[symbolSpanFontWeight_number_0100] END');
    })

    /**
     * @tc.name   symbolSpanEffectStrategy_null_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_EFFECTSTRATEGY_NULL_0100
     * @tc.desc   Test SymbolSpan effectStrategy property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanEffectStrategy_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanEffectStrategy_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_effectStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_effectStrategy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanEffectStrategy_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanEffectStrategy_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanEffectStrategy_null_0100] default effectStrategy is: " + objCompare.$attrs.effectStrategy);
      console.info("[symbolSpanEffectStrategy_null_0100] null effectStrategy is: " + obj.$attrs.effectStrategy);

      // null 应该恢复为默认值
      expect(obj.$attrs.effectStrategy).assertEqual(objCompare.$attrs.effectStrategy);
      console.info('[symbolSpanEffectStrategy_null_0100] END');
    })

    /**
     * @tc.name   symbolSpanEffectStrategy_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_EFFECTSTRATEGY_UNDEFINED_0100
     * @tc.desc   Test SymbolSpan effectStrategy property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanEffectStrategy_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanEffectStrategy_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_effectStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_effectStrategy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanEffectStrategy_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanEffectStrategy_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanEffectStrategy_undefined_0100] default effectStrategy is: " + objCompare.$attrs.effectStrategy);
      console.info("[symbolSpanEffectStrategy_undefined_0100] undefined effectStrategy is: " + obj.$attrs.effectStrategy);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.effectStrategy).assertEqual(objCompare.$attrs.effectStrategy);
      console.info('[symbolSpanEffectStrategy_undefined_0100] END');
    })

    /**
     * @tc.name   symbolSpanRenderingStrategy_null_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_RENDERINGSTRATEGY_NULL_0100
     * @tc.desc   Test SymbolSpan renderingStrategy property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanRenderingStrategy_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanRenderingStrategy_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_renderingStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_renderingStrategy_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanRenderingStrategy_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanRenderingStrategy_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanRenderingStrategy_null_0100] default renderingStrategy is: " + objCompare.$attrs.renderingStrategy);
      console.info("[symbolSpanRenderingStrategy_null_0100] null renderingStrategy is: " + obj.$attrs.renderingStrategy);

      // null 应该恢复为默认值
      expect(obj.$attrs.renderingStrategy).assertEqual(objCompare.$attrs.renderingStrategy);
      console.info('[symbolSpanRenderingStrategy_null_0100] END');
    })

    /**
     * @tc.name   symbolSpanRenderingStrategy_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_RENDERINGSTRATEGY_UNDEFINED_0100
     * @tc.desc   Test SymbolSpan renderingStrategy property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanRenderingStrategy_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanRenderingStrategy_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_renderingStrategy_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_renderingStrategy_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanRenderingStrategy_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanRenderingStrategy_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanRenderingStrategy_undefined_0100] default renderingStrategy is: " + objCompare.$attrs.renderingStrategy);
      console.info("[symbolSpanRenderingStrategy_undefined_0100] undefined renderingStrategy is: " + obj.$attrs.renderingStrategy);

      // undefined 应该恢复为默认值
      expect(obj.$attrs.renderingStrategy).assertEqual(objCompare.$attrs.renderingStrategy);
      console.info('[symbolSpanRenderingStrategy_undefined_0100] END');
    })

    /**
     * @tc.name   symbolSpanAttributeModifier_null_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_ATTRIBUTEMODIFIER_NULL_0100
     * @tc.desc   Test SymbolSpan attributeModifier property with null, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanAttributeModifier_null_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanAttributeModifier_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_attributeModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_attributeModifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanAttributeModifier_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanAttributeModifier_null_0100] null obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('SymbolSpan');
      console.info('[symbolSpanAttributeModifier_null_0100] END');
    })

    /**
     * @tc.name   symbolSpanAttributeModifier_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_ATTRIBUTEMODIFIER_UNDEFINED_0100
     * @tc.desc   Test SymbolSpan attributeModifier property with undefined, should restore to default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('symbolSpanAttributeModifier_undefined_0100', Level.LEVEL0, async () => {
      console.info('[symbolSpanAttributeModifier_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('SymbolSpan_attributeModifier_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('SymbolSpan_attributeModifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanAttributeModifier_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[symbolSpanAttributeModifier_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));

      expect(obj.$type).assertEqual('SymbolSpan');
      console.info('[symbolSpanAttributeModifier_undefined_0100] END');
    })
  })
}
