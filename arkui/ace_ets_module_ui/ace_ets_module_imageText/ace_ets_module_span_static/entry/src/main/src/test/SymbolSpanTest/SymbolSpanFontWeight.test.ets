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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';


export default function SymbolSpanFontWeightTest() {
  describe('SymbolSpanFontWeightTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SymbolSpanFontWeightTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.span.static", "EntryAbility");
    });
   beforeEach(async (): Promise<void> => {
      console.info("SymbolSpanFontWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolSpan/SymbolSpanFontWeight',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SymbolSpanFontWeightTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "SymbolSpanFontWeight") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("push SymbolSpanFontWeightTest page error: " + err);
        expect().assertFail();
      }
    });

    /**
     * @tc.name   symbolSpanFontWeight_number_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_PARAM_0100
     * @tc.desc   Test SymbolSpan fontWeight property with number 100
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_number_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_number_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_100');
      console.info("[symbolSpanFontWeight_number_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('100');
      console.info('[symbolSpanFontWeight_number_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_number_0200
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_PARAM_0200
     * @tc.desc   Test SymbolSpan fontWeight property with number 400
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_number_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_number_0200] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_400');
    
      console.info("[symbolSpanFontWeight_number_0200] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('400');
      console.info('[symbolSpanFontWeight_number_0200] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_number_0300
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_PARAM_0300
     * @tc.desc   Test SymbolSpan fontWeight property with number 900
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_number_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_number_0300] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_900');
      
      console.info("[symbolSpanFontWeight_number_0300] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('900');
      console.info('[symbolSpanFontWeight_number_0300] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_number_0400
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_PARAM_0400
     * @tc.desc   Test SymbolSpan fontWeight property with number 700
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_number_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_number_0400] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_700');

      console.info("[symbolSpanFontWeight_number_0400] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('700');
      console.info('[symbolSpanFontWeight_number_0400] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Lighter_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0100
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Lighter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Lighter_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_enum_Lighter_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_Lighter');

      console.info("[symbolSpanFontWeight_enum_Lighter_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      console.info('[symbolSpanFontWeight_enum_Lighter_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Normal_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0200
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Normal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Normal_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_enum_Normal_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_Normal');

      console.info("[symbolSpanFontWeight_enum_Normal_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      console.info('[symbolSpanFontWeight_enum_Normal_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Regular_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0300
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Regular
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Regular_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_enum_Regular_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_Regular');

      console.info("[symbolSpanFontWeight_enum_Regular_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Regular');
      console.info('[symbolSpanFontWeight_enum_Regular_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Medium_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0400
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Medium
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Medium_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_enum_Medium_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_Medium');

      console.info("[symbolSpanFontWeight_enum_Medium_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
      console.info('[symbolSpanFontWeight_enum_Medium_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Bold_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0500
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Bold
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Bold_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_enum_Bold_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_Bold');

      console.info("[symbolSpanFontWeight_enum_Bold_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      console.info('[symbolSpanFontWeight_enum_Bold_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_enum_Bolder_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_ENUM_0600
     * @tc.desc   Test SymbolSpan fontWeight property with FontWeight.Bolder
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_enum_Bolder_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_enum_Bolder_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_Bolder');

      console.info("[symbolSpanFontWeight_enum_Bolder_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      console.info('[symbolSpanFontWeight_enum_Bolder_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_number_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0100
     * @tc.desc   Test SymbolSpan fontWeight property with string '400'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_number_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_string_number_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_string_400');

      console.info("[symbolSpanFontWeight_string_number_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('400');
      console.info('[symbolSpanFontWeight_string_number_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_bold_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0200
     * @tc.desc   Test SymbolSpan fontWeight property with string 'bold'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_bold_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_string_bold_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_string_bold');

      console.info("[symbolSpanFontWeight_string_bold_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bold');
      console.info('[symbolSpanFontWeight_string_bold_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_bolder_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0300
     * @tc.desc   Test SymbolSpan fontWeight property with string 'bolder'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_bolder_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_string_bolder_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_string_bolder');

      console.info("[symbolSpanFontWeight_string_bolder_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Bolder');
      console.info('[symbolSpanFontWeight_string_bolder_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_lighter_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0400
     * @tc.desc   Test SymbolSpan fontWeight property with string 'lighter'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_lighter_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_string_lighter_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_string_lighter');

      console.info("[symbolSpanFontWeight_string_lighter_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Lighter');
      console.info('[symbolSpanFontWeight_string_lighter_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_regular_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0500
     * @tc.desc   Test SymbolSpan fontWeight property with string 'regular'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_regular_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_string_regular_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_string_regular');

      console.info("[symbolSpanFontWeight_string_regular_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Regular');
      console.info('[symbolSpanFontWeight_string_regular_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_medium_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0600
     * @tc.desc   Test SymbolSpan fontWeight property with string 'medium'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_medium_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_string_medium_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_string_medium');

      console.info("[symbolSpanFontWeight_string_medium_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Medium');
      console.info('[symbolSpanFontWeight_string_medium_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_string_empty_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_STRING_0700
     * @tc.desc   Test SymbolSpan fontWeight property with empty string ''
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_string_empty_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_string_empty_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_empty_string');
      let strJsonDefault= inspector.getInspectorByKey('symbolSpan_fontWeight_default');
      

      console.info("[symbolSpanFontWeight_string_empty_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      console.info("[symbolSpanFontWeight_string_empty_0100] default fontWeight is: " + JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual(JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('fontWeight'));
      console.info('[symbolSpanFontWeight_string_empty_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_variable_220_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_VARIABLE_0100
     * @tc.desc   Test SymbolSpan fontWeight property with enableVariableFontWeight true and value 220
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_variable_220_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_variable_220_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_variable_220');
      
      console.info("[symbolSpanFontWeight_variable_220_0100] fontWeight is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      console.info("[symbolSpanFontWeight_variable_220_0100] enableVariableFontWeight is: " 
        + JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableVariableFontWeight'));
      console.info("[symbolSpanFontWeight_variable_220_0100] variableFontWeight is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('variableFontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableVariableFontWeight'))
        .assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('variableFontWeight')).assertEqual('220');
      console.info('[symbolSpanFontWeight_variable_220_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_variable_660_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_VARIABLE_0200
     * @tc.desc   Test SymbolSpan fontWeight property with enableVariableFontWeight true and value 660
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_variable_660_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_variable_660_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_variable_660');

      console.info("[symbolSpanFontWeight_variable_660_0100] enableVariableFontWeight is: " 
        + JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableVariableFontWeight'));
      console.info("[symbolSpanFontWeight_variable_660_0100] variableFontWeight is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('variableFontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableVariableFontWeight')).assertEqual('true');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('variableFontWeight')).assertEqual('660');
      console.info('[symbolSpanFontWeight_variable_660_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_variable_false_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_VARIABLE_0300
     * @tc.desc   Test SymbolSpan fontWeight property with enableVariableFontWeight false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_variable_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_variable_false_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_variable_false');

      console.info("[symbolSpanFontWeight_variable_false_0100] fontWeight is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      console.info("[symbolSpanFontWeight_variable_false_0100] enableVariableFontWeight is: " 
        + JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableVariableFontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('400');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableVariableFontWeight')).assertEqual('false');
      console.info('[symbolSpanFontWeight_variable_false_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_device_true_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_DEVICE_0100
     * @tc.desc   Test SymbolSpan fontWeight property with enableDeviceFontWeightCategory true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_device_true_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_device_true_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_device_true');

      console.info("[symbolSpanFontWeight_device_true_0100] fontWeight is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      console.info("[symbolSpanFontWeight_device_true_0100] enableDeviceFontWeightCategory is: " 
        + JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableDeviceFontWeightCategory'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableDeviceFontWeightCategory')).assertEqual('true');
      console.info('[symbolSpanFontWeight_device_true_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_device_false_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_DEVICE_0200
     * @tc.desc   Test SymbolSpan fontWeight property with enableDeviceFontWeightCategory false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_device_false_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_device_false_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_device_false');

      console.info("[symbolSpanFontWeight_device_false_0100] fontWeight is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      console.info("[symbolSpanFontWeight_device_false_0100] enableDeviceFontWeightCategory is: " 
        + JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableDeviceFontWeightCategory'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('FontWeight.Normal');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableDeviceFontWeightCategory'))
        .assertEqual('false');
      console.info('[symbolSpanFontWeight_device_false_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_configs_both_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_CONFIGS_0100
     * @tc.desc   Test SymbolSpan fontWeight property with both configs enabled
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_configs_both_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_configs_both_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_configs_both');
 
      console.info("[symbolSpanFontWeight_configs_both_0100] enableVariableFontWeight is: " 
        + JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableVariableFontWeight'));
      console.info("[symbolSpanFontWeight_configs_both_0100] enableDeviceFontWeightCategory is: " 
        + JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableDeviceFontWeightCategory'));
      console.info("[symbolSpanFontWeight_configs_both_0100] variableFontWeight is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('variableFontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('variableFontWeight')).assertEqual('500');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableVariableFontWeight')).assertEqual('true');
      expect(JSON.parseJsonElement(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeightConfigs')).getString('enableDeviceFontWeightCategory')).assertEqual('true');
      console.info('[symbolSpanFontWeight_configs_both_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_configs_undefined_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_CONFIGS_0200
     * @tc.desc   Test SymbolSpan fontWeight property with undefined fontWeightConfigs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_configs_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_configs_undefined_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_configs_undefined');

      console.info("[symbolSpanFontWeight_configs_undefined_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('300');
      console.info('[symbolSpanFontWeight_configs_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_configs_default_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_CONFIGS_0300
     * @tc.desc   Test SymbolSpan fontWeight property without fontWeightConfigs parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_configs_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_configs_default_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_configs_default');

      console.info("[symbolSpanFontWeight_configs_default_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight')).assertEqual('500');
      console.info('[symbolSpanFontWeight_configs_default_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_out_range_low_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_RANGE_0100
     * @tc.desc   Test SymbolSpan fontWeight property with out of range low value (50)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_out_range_low_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_out_range_low_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_out_range_low');
      let strJsonDefault= inspector.getInspectorByKey('symbolSpan_fontWeight_default');
      

      console.info("[symbolSpanFontWeight_out_range_low_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      console.info("[symbolSpanFontWeight_out_range_low_0100] default fontWeight is: " + JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'))
        .assertEqual(JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('fontWeight'));
      console.info('[symbolSpanFontWeight_out_range_low_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_out_range_high_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_RANGE_0200
     * @tc.desc   Test SymbolSpan fontWeight property with out of range high value (1000)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_out_range_high_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_out_range_high_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_out_range_high');
      let strJsonDefault= inspector.getInspectorByKey('symbolSpan_fontWeight_default');

      console.info("[symbolSpanFontWeight_out_range_high_0100] fontWeight is: " + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      console.info("[symbolSpanFontWeight_out_range_high_0100] default fontWeight is: " + JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'))
        .assertEqual(JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('fontWeight'));
      console.info('[symbolSpanFontWeight_out_range_high_0100] END');
      done();
    })

    /**
     * @tc.name   symbolSpanFontWeight_negative_0100
     * @tc.number SUB_ARKUI_SYMBOLSPAN_FONTWEIGHT_RANGE_0300
     * @tc.desc   Test SymbolSpan fontWeight property with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('symbolSpanFontWeight_negative_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[symbolSpanFontWeight_negative_0100] START');

      let strJson = inspector.getInspectorByKey('symbolSpan_fontWeight_negative');
      let strJsonDefault= inspector.getInspectorByKey('symbolSpan_fontWeight_default');

      console.info("[symbolSpanFontWeight_negative_0100] fontWeight is: " 
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'));
      console.info("[symbolSpanFontWeight_negative_0100] default fontWeight is: " 
        + JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('fontWeight'));

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('SymbolSpan');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontWeight'))
        .assertEqual(JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('fontWeight'));
      console.info('[symbolSpanFontWeight_negative_0100] END');
      done();
    })

  })
}