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

export default function SymbolGlyphFontWeightTest26() {
  describe('SymbolGlyphFontWeightTest26', () => {
    beforeEach(async (done: Function) => {
      console.info("SymbolGlyphFontWeightTest26 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SymbolGlyphFontWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolGlyphFontWeightTest26 state pages:" + JSON.stringify(pages));
        if (!("SymbolGlyphFontWeight" == pages.name)) {
          console.info("get SymbolGlyphFontWeightTest26 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SymbolGlyphFontWeightTest26 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolGlyphFontWeightTest26 page error:" + err);
        expect().assertFail();
      }
      console.info("SymbolGlyphFontWeightTest26 beforeEach end");
      done();
    });

    /**
     * @tc.name   symbolGlyphFontWeight_number_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_PARAM_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with number 100
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_number_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_number_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_100');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_number_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_number_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('100');
      console.info('[symbolGlyphFontWeight_number_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_number_0200
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_PARAM_0200
     * @tc.desc   Test SymbolGlyph fontWeight property with number 400
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_number_0200', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_number_0200] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_400');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_number_0200] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_number_0200] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('400');
      console.info('[symbolGlyphFontWeight_number_0200] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_number_0300
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_PARAM_0300
     * @tc.desc   Test SymbolGlyph fontWeight property with number 900
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_number_0300', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_number_0300] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_900');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_number_0300] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_number_0300] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('900');
      console.info('[symbolGlyphFontWeight_number_0300] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_number_0400
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_PARAM_0400
     * @tc.desc   Test SymbolGlyph fontWeight property with number 700
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_number_0400', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_number_0400] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_700');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_number_0400] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_number_0400] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('700');
      console.info('[symbolGlyphFontWeight_number_0400] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_enum_Lighter_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_ENUM_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with FontWeight.Lighter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_enum_Lighter_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_enum_Lighter_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_Lighter');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_enum_Lighter_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_enum_Lighter_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
      console.info('[symbolGlyphFontWeight_enum_Lighter_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_enum_Normal_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_ENUM_0200
     * @tc.desc   Test SymbolGlyph fontWeight property with FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_enum_Normal_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_enum_Normal_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_Normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_enum_Normal_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_enum_Normal_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[symbolGlyphFontWeight_enum_Normal_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_enum_Regular_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_ENUM_0300
     * @tc.desc   Test SymbolGlyph fontWeight property with FontWeight.Regular
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_enum_Regular_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_enum_Regular_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_Regular');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_enum_Regular_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_enum_Regular_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Regular');
      console.info('[symbolGlyphFontWeight_enum_Regular_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_enum_Medium_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_ENUM_0400
     * @tc.desc   Test SymbolGlyph fontWeight property with FontWeight.Medium
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_enum_Medium_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_enum_Medium_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_Medium');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_enum_Medium_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_enum_Medium_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Medium');
      console.info('[symbolGlyphFontWeight_enum_Medium_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_enum_Bold_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_ENUM_0500
     * @tc.desc   Test SymbolGlyph fontWeight property with FontWeight.Bold
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_enum_Bold_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_enum_Bold_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_Bold');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_enum_Bold_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_enum_Bold_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
      console.info('[symbolGlyphFontWeight_enum_Bold_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_enum_Bolder_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_ENUM_0600
     * @tc.desc   Test SymbolGlyph fontWeight property with FontWeight.Bolder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_enum_Bolder_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_enum_Bolder_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_Bolder');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_enum_Bolder_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_enum_Bolder_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
      console.info('[symbolGlyphFontWeight_enum_Bolder_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_string_number_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_STRING_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with string '400'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_string_number_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_string_number_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_string_400');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_string_number_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_string_number_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('400');
      console.info('[symbolGlyphFontWeight_string_number_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_string_bold_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_STRING_0200
     * @tc.desc   Test SymbolGlyph fontWeight property with string 'bold'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_string_bold_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_string_bold_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_string_bold');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_string_bold_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_string_bold_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
      console.info('[symbolGlyphFontWeight_string_bold_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_string_bolder_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_STRING_0300
     * @tc.desc   Test SymbolGlyph fontWeight property with string 'bolder'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_string_bolder_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_string_bolder_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_string_bolder');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_string_bolder_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_string_bolder_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
      console.info('[symbolGlyphFontWeight_string_bolder_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_string_lighter_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_STRING_0400
     * @tc.desc   Test SymbolGlyph fontWeight property with string 'lighter'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_string_lighter_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_string_lighter_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_string_lighter');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_string_lighter_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_string_lighter_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
      console.info('[symbolGlyphFontWeight_string_lighter_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_string_regular_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_STRING_0500
     * @tc.desc   Test SymbolGlyph fontWeight property with string 'regular'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_string_regular_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_string_regular_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_string_regular');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_string_regular_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_string_regular_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Regular');
      console.info('[symbolGlyphFontWeight_string_regular_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_string_medium_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_STRING_0600
     * @tc.desc   Test SymbolGlyph fontWeight property with string 'medium'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_string_medium_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_string_medium_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_string_medium');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_string_medium_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_string_medium_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Medium');
      console.info('[symbolGlyphFontWeight_string_medium_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_string_empty_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_STRING_0700
     * @tc.desc   Test SymbolGlyph fontWeight property with empty string ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_string_empty_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_string_empty_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_empty_string');
      let strJsonDefault: string = getInspectorByKey('symbolGlyph_fontWeight_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[symbolGlyphFontWeight_string_empty_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_string_empty_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_string_empty_0100] default fontWeight is: " + objDefault.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      console.info('[symbolGlyphFontWeight_string_empty_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_variable_220_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_VARIABLE_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with enableVariableFontWeight true and value 220
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_variable_220_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_variable_220_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_variable_220');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_variable_220_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_variable_220_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_variable_220_0100] fontWeightConfigs is: " + obj.$attrs.fontWeightConfigs);
      console.info("[symbolGlyphFontWeight_variable_220_0100] enableVariableFontWeight is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight);
      console.info("[symbolGlyphFontWeight_variable_220_0100] variableFontWeight is: " + obj.$attrs.variableFontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight).assertEqual('true');
      expect(obj.$attrs.variableFontWeight).assertEqual('220');
      console.info('[symbolGlyphFontWeight_variable_220_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_variable_660_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_VARIABLE_0200
     * @tc.desc   Test SymbolGlyph fontWeight property with enableVariableFontWeight true and value 660
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_variable_660_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_variable_660_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_variable_660');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_variable_660_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_variable_660_0100] fontWeightConfigs is: " + obj.$attrs.fontWeightConfigs);
      console.info("[symbolGlyphFontWeight_variable_660_0100] enableVariableFontWeight is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight);
      console.info("[symbolGlyphFontWeight_variable_660_0100] variableFontWeight is: " + obj.$attrs.variableFontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight).assertEqual('true');
      expect(obj.$attrs.variableFontWeight).assertEqual('660');
      console.info('[symbolGlyphFontWeight_variable_660_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_variable_false_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_VARIABLE_0300
     * @tc.desc   Test SymbolGlyph fontWeight property with enableVariableFontWeight false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_variable_false_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_variable_false_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_variable_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_variable_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_variable_false_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_variable_false_0100] enableVariableFontWeight is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('400');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight).assertEqual('false');
      console.info('[symbolGlyphFontWeight_variable_false_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_device_true_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_DEVICE_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with enableDeviceFontWeightCategory true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_device_true_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_device_true_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_device_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_device_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_device_true_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_device_true_0100] enableDeviceFontWeightCategory is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory).assertEqual('true');
      console.info('[symbolGlyphFontWeight_device_true_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_device_false_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_DEVICE_0200
     * @tc.desc   Test SymbolGlyph fontWeight property with enableDeviceFontWeightCategory false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_device_false_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_device_false_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_device_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_device_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_device_false_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_device_false_0100] enableDeviceFontWeightCategory is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory).assertEqual('false');
      console.info('[symbolGlyphFontWeight_device_false_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_configs_both_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_CONFIGS_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with both configs enabled
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_configs_both_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_configs_both_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_configs_both');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_configs_both_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_configs_both_0100] enableVariableFontWeight is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight);
      console.info("[symbolGlyphFontWeight_configs_both_0100] enableDeviceFontWeightCategory is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory);
      console.info("[symbolGlyphFontWeight_configs_both_0100] variableFontWeight is: " + obj.$attrs.variableFontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.variableFontWeight).assertEqual('500');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight).assertEqual('true');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory).assertEqual('true');
      console.info('[symbolGlyphFontWeight_configs_both_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_configs_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_CONFIGS_0200
     * @tc.desc   Test SymbolGlyph fontWeight property with undefined fontWeightConfigs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_configs_undefined_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_configs_undefined_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_configs_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_configs_undefined_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_configs_undefined_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('300');
      console.info('[symbolGlyphFontWeight_configs_undefined_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_configs_default_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_CONFIGS_0300
     * @tc.desc   Test SymbolGlyph fontWeight property without fontWeightConfigs parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_configs_default_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_configs_default_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_configs_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolGlyphFontWeight_configs_default_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_configs_default_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual('500');
      console.info('[symbolGlyphFontWeight_configs_default_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_out_range_low_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_RANGE_0100
     * @tc.desc   Test SymbolGlyph fontWeight property with out of range low value (50)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_out_range_low_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_out_range_low_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_out_range_low');
      let strJsonDefault: string = getInspectorByKey('symbolGlyph_fontWeight_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[symbolGlyphFontWeight_out_range_low_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_out_range_low_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_out_range_low_0100] default fontWeight is: " + objDefault.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      console.info('[symbolGlyphFontWeight_out_range_low_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_out_range_high_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_RANGE_0200
     * @tc.desc   Test SymbolGlyph fontWeight property with out of range high value (1000)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_out_range_high_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_out_range_high_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_out_range_high');
      let strJsonDefault: string = getInspectorByKey('symbolGlyph_fontWeight_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[symbolGlyphFontWeight_out_range_high_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_out_range_high_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_out_range_high_0100] default fontWeight is: " + objDefault.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      console.info('[symbolGlyphFontWeight_out_range_high_0100] END');
    })

    /**
     * @tc.name   symbolGlyphFontWeight_negative_0100
     * @tc.number SUB_ARKUI_SYMBOLGLYPH_FONTWEIGHT_RANGE_0300
     * @tc.desc   Test SymbolGlyph fontWeight property with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolGlyphFontWeight_negative_0100', Level.LEVEL2, async () => {
      console.info('[symbolGlyphFontWeight_negative_0100] START');

      let strJson: string = getInspectorByKey('symbolGlyph_fontWeight_negative');
      let strJsonDefault: string = getInspectorByKey('symbolGlyph_fontWeight_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[symbolGlyphFontWeight_negative_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolGlyphFontWeight_negative_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolGlyphFontWeight_negative_0100] default fontWeight is: " + objDefault.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolGlyph');
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      console.info('[symbolGlyphFontWeight_negative_0100] END');
    })

  })
}