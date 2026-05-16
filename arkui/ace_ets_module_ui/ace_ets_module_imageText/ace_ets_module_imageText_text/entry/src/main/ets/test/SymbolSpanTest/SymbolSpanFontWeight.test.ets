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
import CommonFunc from '../../MainAbility/common/Common';

export default function SymbolSpanFontWeightTest() {
  describe('SymbolSpanFontWeightTest', () => {
   beforeEach(async (done: Function) => {
      console.info("SymbolSpanFontWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolSpan/SymbolSpanFontWeight',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SymbolSpanFontWeightTest state pages: " + JSON.stringify(pages));
        if (!("SymbolSpanFontWeight" == pages.name)) {
          console.info("get SymbolSpanFontWeightTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SymbolSpanFontWeightTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SymbolSpanFontWeightTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   symbolSpanFontWeight_number_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_PARAM_0100
     * @tc.desc   Test SymbolSpan fontWeight property with number 100
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_number_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_number_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_100');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_number_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_number_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('100');
      console.info('[symbolSpanFontWeight_number_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_number_0200
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_PARAM_0200
     * @tc.desc   Test SymbolSpan fontWeight property with number 400
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_number_0200', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_number_0200] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_400');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_number_0200] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_number_0200] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('400');
      console.info('[symbolSpanFontWeight_number_0200] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_number_0300
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_PARAM_0300
     * @tc.desc   Test SymbolSpan fontWeight property with number 900
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_number_0300', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_number_0300] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_900');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_number_0300] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_number_0300] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('900');
      console.info('[symbolSpanFontWeight_number_0300] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_number_0400
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_PARAM_0400
     * @tc.desc   Test SymbolSpan fontWeight property with number 700
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_number_0400', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_number_0400] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_700');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_number_0400] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_number_0400] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('700');
      console.info('[symbolSpanFontWeight_number_0400] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Lighter_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0100
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Lighter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Lighter_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_enum_Lighter_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_Lighter');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_enum_Lighter_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_enum_Lighter_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
      console.info('[symbolSpanFontWeight_enum_Lighter_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Normal_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0200
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Normal_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_enum_Normal_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_Normal');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_enum_Normal_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_enum_Normal_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      console.info('[symbolSpanFontWeight_enum_Normal_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Regular_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0300
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Regular
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Regular_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_enum_Regular_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_Regular');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_enum_Regular_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_enum_Regular_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Regular');
      console.info('[symbolSpanFontWeight_enum_Regular_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Medium_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0400
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Medium
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Medium_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_enum_Medium_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_Medium');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_enum_Medium_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_enum_Medium_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Medium');
      console.info('[symbolSpanFontWeight_enum_Medium_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Bold_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0500
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Bold
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Bold_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_enum_Bold_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_Bold');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_enum_Bold_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_enum_Bold_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
      console.info('[symbolSpanFontWeight_enum_Bold_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Bolder_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0600
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Bolder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Bolder_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_enum_Bolder_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_Bolder');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_enum_Bolder_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_enum_Bolder_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
      console.info('[symbolSpanFontWeight_enum_Bolder_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_number_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0100
     * @tc.desc   Test SymbolSpan fontWeight property with string '400'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_number_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_string_number_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_string_400');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_string_number_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_string_number_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('400');
      console.info('[symbolSpanFontWeight_string_number_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_bold_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0200
     * @tc.desc   Test SymbolSpan fontWeight property with string 'bold'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_bold_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_string_bold_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_string_bold');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_string_bold_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_string_bold_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bold');
      console.info('[symbolSpanFontWeight_string_bold_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_bolder_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0300
     * @tc.desc   Test SymbolSpan fontWeight property with string 'bolder'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_bolder_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_string_bolder_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_string_bolder');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_string_bolder_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_string_bolder_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Bolder');
      console.info('[symbolSpanFontWeight_string_bolder_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_lighter_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0400
     * @tc.desc   Test SymbolSpan fontWeight property with string 'lighter'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_lighter_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_string_lighter_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_string_lighter');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_string_lighter_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_string_lighter_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Lighter');
      console.info('[symbolSpanFontWeight_string_lighter_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_regular_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0500
     * @tc.desc   Test SymbolSpan fontWeight property with string 'regular'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_regular_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_string_regular_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_string_regular');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_string_regular_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_string_regular_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Regular');
      console.info('[symbolSpanFontWeight_string_regular_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_medium_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0600
     * @tc.desc   Test SymbolSpan fontWeight property with string 'medium'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_medium_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_string_medium_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_string_medium');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_string_medium_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_string_medium_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Medium');
      console.info('[symbolSpanFontWeight_string_medium_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_empty_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0700
     * @tc.desc   Test SymbolSpan fontWeight property with empty string ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_empty_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_string_empty_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_empty_string');
      let strJsonDefault: string = getInspectorByKey('symbolSpan_fontWeight_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[symbolSpanFontWeight_string_empty_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_string_empty_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_string_empty_0100] default fontWeight is: " + objDefault.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      console.info('[symbolSpanFontWeight_string_empty_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_variable_220_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_VARIABLE_0100
     * @tc.desc   Test SymbolSpan fontWeight property with enableVariableFontWeight true and value 220
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_variable_220_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_variable_220_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_variable_220');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_variable_220_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_variable_220_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_variable_220_0100] fontWeightConfigs is: " + obj.$attrs.fontWeightConfigs);
      console.info("[symbolSpanFontWeight_variable_220_0100] enableVariableFontWeight is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight);
      console.info("[symbolSpanFontWeight_variable_220_0100] variableFontWeight is: " + obj.$attrs.variableFontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight).assertEqual('true');
      expect(obj.$attrs.variableFontWeight).assertEqual('220');
      console.info('[symbolSpanFontWeight_variable_220_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_variable_660_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_VARIABLE_0200
     * @tc.desc   Test SymbolSpan fontWeight property with enableVariableFontWeight true and value 660
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_variable_660_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_variable_660_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_variable_660');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_variable_660_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_variable_660_0100] fontWeightConfigs is: " + obj.$attrs.fontWeightConfigs);
      console.info("[symbolSpanFontWeight_variable_660_0100] enableVariableFontWeight is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight);
      console.info("[symbolSpanFontWeight_variable_660_0100] variableFontWeight is: " + obj.$attrs.variableFontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight).assertEqual('true');
      expect(obj.$attrs.variableFontWeight).assertEqual('660');
      console.info('[symbolSpanFontWeight_variable_660_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_variable_false_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_VARIABLE_0300
     * @tc.desc   Test SymbolSpan fontWeight property with enableVariableFontWeight false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_variable_false_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_variable_false_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_variable_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_variable_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_variable_false_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_variable_false_0100] enableVariableFontWeight is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('400');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight).assertEqual('false');
      console.info('[symbolSpanFontWeight_variable_false_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_device_true_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_DEVICE_0100
     * @tc.desc   Test SymbolSpan fontWeight property with enableDeviceFontWeightCategory true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_device_true_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_device_true_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_device_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_device_true_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_device_true_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_device_true_0100] enableDeviceFontWeightCategory is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory).assertEqual('true');
      console.info('[symbolSpanFontWeight_device_true_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_device_false_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_DEVICE_0200
     * @tc.desc   Test SymbolSpan fontWeight property with enableDeviceFontWeightCategory false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_device_false_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_device_false_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_device_false');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_device_false_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_device_false_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_device_false_0100] enableDeviceFontWeightCategory is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('FontWeight.Normal');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory).assertEqual('false');
      console.info('[symbolSpanFontWeight_device_false_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_configs_both_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_CONFIGS_0100
     * @tc.desc   Test SymbolSpan fontWeight property with both configs enabled
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_configs_both_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_configs_both_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_configs_both');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_configs_both_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_configs_both_0100] enableVariableFontWeight is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight);
      console.info("[symbolSpanFontWeight_configs_both_0100] enableDeviceFontWeightCategory is: " + JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory);
      console.info("[symbolSpanFontWeight_configs_both_0100] variableFontWeight is: " + obj.$attrs.variableFontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.variableFontWeight).assertEqual('500');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableVariableFontWeight).assertEqual('true');
      expect(JSON.parse(obj.$attrs.fontWeightConfigs).enableDeviceFontWeightCategory).assertEqual('true');
      console.info('[symbolSpanFontWeight_configs_both_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_configs_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_CONFIGS_0200
     * @tc.desc   Test SymbolSpan fontWeight property with undefined fontWeightConfigs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_configs_undefined_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_configs_undefined_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_configs_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_configs_undefined_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_configs_undefined_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('300');
      console.info('[symbolSpanFontWeight_configs_undefined_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_configs_default_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_CONFIGS_0300
     * @tc.desc   Test SymbolSpan fontWeight property without fontWeightConfigs parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_configs_default_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_configs_default_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_configs_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[symbolSpanFontWeight_configs_default_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_configs_default_0100] fontWeight is: " + obj.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual('500');
      console.info('[symbolSpanFontWeight_configs_default_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_out_range_low_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_RANGE_0100
     * @tc.desc   Test SymbolSpan fontWeight property with out of range low value (50)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_out_range_low_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_out_range_low_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_out_range_low');
      let strJsonDefault: string = getInspectorByKey('symbolSpan_fontWeight_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[symbolSpanFontWeight_out_range_low_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_out_range_low_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_out_range_low_0100] default fontWeight is: " + objDefault.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      console.info('[symbolSpanFontWeight_out_range_low_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_out_range_high_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_RANGE_0200
     * @tc.desc   Test SymbolSpan fontWeight property with out of range high value (1000)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_out_range_high_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_out_range_high_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_out_range_high');
      let strJsonDefault: string = getInspectorByKey('symbolSpan_fontWeight_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[symbolSpanFontWeight_out_range_high_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_out_range_high_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_out_range_high_0100] default fontWeight is: " + objDefault.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      console.info('[symbolSpanFontWeight_out_range_high_0100] END');
    })

    /**
     * @tc.name   symbolSpanFontWeight_negative_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_RANGE_0300
     * @tc.desc   Test SymbolSpan fontWeight property with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_negative_0100', Level.LEVEL2, async () => {
      console.info('[symbolSpanFontWeight_negative_0100] START');

      let strJson: string = getInspectorByKey('symbolSpan_fontWeight_negative');
      let strJsonDefault: string = getInspectorByKey('symbolSpan_fontWeight_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);

      console.info("[symbolSpanFontWeight_negative_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[symbolSpanFontWeight_negative_0100] fontWeight is: " + obj.$attrs.fontWeight);
      console.info("[symbolSpanFontWeight_negative_0100] default fontWeight is: " + objDefault.$attrs.fontWeight);

      expect(obj.$type).assertEqual('SymbolSpan');
      expect(obj.$attrs.fontWeight).assertEqual(objDefault.$attrs.fontWeight);
      console.info('[symbolSpanFontWeight_negative_0100] END');
    })

  })
}