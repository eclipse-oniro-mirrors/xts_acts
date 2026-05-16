'use static';
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';

export default function SymbolGlyphSymbolColorTest() {
  describe('SymbolGlyphSymbolColorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("SymbolGlyphSymbolColorTest beforeAll start");
      await UtilsTest.msSleep(2000);
      await UtilsTest.startAbility("com.arkui.ace.symbolGlyph.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      console.info("SymbolGlyphSymbolColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SymbolGlyph/SymbolGlyphSymbolColor',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("SymbolGlyphSymbolColorTest state pages: " + JSON.stringify(pages));
        if (pages.name !== "SymbolGlyphSymbolColor") {
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("SymbolGlyphSymbolColorTest pushUrl error: " + err);
        expect().assertFail();
      }
    });

    /**
 	  * @tc.name   symbolGlyphSymbolColor_colorEnum_0100
 	  * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_COLORENUM_0100
 	  * @tc.desc   Test SymbolGlyph symbolColor property with Color enum parameter
 	  * @tc.type   FUNCTION
 	  * @tc.size   SMALLTEST
 	  * @tc.level  LEVEL2
 	  */
    it('symbolGlyphSymbolColor_colorEnum_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('symbolGlyphSymbolColor_colorEnum_0100 START');
      let strJson = inspector.getInspectorByKey('symbolGlyph_symbolColor_colorEnum');
      console.info('[symbolColor] =' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'))
        .assertEqual('#FFFF0000');
      console.info('symbolGlyphSymbolColor_colorEnum_0100 END');
      done();
    });

    /**
 	  * @tc.name   symbolGlyphSymbolColor_string_0100
 	  * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_STRING_0100
 	  * @tc.desc   Test SymbolGlyph symbolColor property with string parameter
 	  * @tc.type   FUNCTION
 	  * @tc.size   SMALLTEST
 	  * @tc.level  LEVEL2
 	  */
 	it('symbolGlyphSymbolColor_string_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[symbolGlyphSymbolColor_string_0100] START');
 	  let strJson = inspector.getInspectorByKey('symbolGlyph_symbolColor_string');
      console.info('[symbolColor] =' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'))
        .assertEqual('#FFFF0000');
 	  console.info('[symbolGlyphSymbolColor_string_0100] END');
      done();
 	 })

    /**
 	  * @tc.name   symbolGlyphSymbolColor_emptyString_0100
 	  * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_EMPTYSTRING_0100
 	  * @tc.desc   Test SymbolGlyph symbolColor property with empty string parameter
 	  * @tc.type   FUNCTION
 	  * @tc.size   SMALLTEST
 	  * @tc.level  LEVEL2
 	  */
 	it('symbolGlyphSymbolColor_emptyString_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[symbolGlyphSymbolColor_emptyString_0100] START');
 	  let strJson1 = inspector.getInspectorByKey('symbolGlyph_symbolColor_emptyString');
 	  console.info('[symbolColor1] =' + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'));
      let strJson2 = inspector.getInspectorByKey('symbolGlyph_symbolColor_default');
 	  console.info('[symbolColor2] =' + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
        .assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('fontColor'));
 	  console.info('[symbolGlyphSymbolColor_emptyString_0100] END');
      done();
 	})
 	
 	/**
 	  * @tc.name   symbolGlyphSymbolColor_number_0100
 	  * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_NUMBER_0100
 	  * @tc.desc   Test SymbolGlyph symbolColor property with number parameter
 	  * @tc.type   FUNCTION
 	  * @tc.size   SMALLTEST
 	  * @tc.level  LEVEL2
 	  */
 	it('symbolGlyphSymbolColor_number_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[symbolGlyphSymbolColor_number_0100] START');
 	  let strJson = inspector.getInspectorByKey('symbolGlyph_symbolColor_number');
      console.info('[symbolColor] =' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertEqual('#FFFF0000');
 	  console.info('[symbolGlyphSymbolColor_number_0100] END');
      done();
 	})
 	
 	/**
 	  * @tc.name   symbolGlyphSymbolColor_colorMetricsResource_0100
 	  * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_COLORMETRICSRESOURCE_0100
 	  * @tc.desc   Test SymbolGlyph symbolColor property with ColorMetrics.resourceColor parameter
 	  * @tc.type   FUNCTION
 	  * @tc.size   SMALLTEST
 	  * @tc.level  LEVEL2
 	  */
 	it('symbolGlyphSymbolColor_colorMetricsResource_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[symbolGlyphSymbolColor_colorMetricsResource_0100] START');
 	  let strJson = inspector.getInspectorByKey('symbolGlyph_symbolColor_colorMetricsResource');
      console.info('[symbolColor] =' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
 	  expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertContain('#FF0000FF');
 	  console.info('[symbolGlyphSymbolColor_colorMetricsResource_0100] END');
      done();
 	})
 	
 	/**
 	 * @tc.name   symbolGlyphSymbolColor_colorMetricsNumeric_0100
 	 * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_COLORMETRICSNUMERIC_0100
 	 * @tc.desc   Test SymbolGlyph symbolColor property with ColorMetrics.numeric parameter
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('symbolGlyphSymbolColor_colorMetricsNumeric_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[symbolGlyphSymbolColor_colorMetricsNumeric_0100] START');
      let strJson = inspector.getInspectorByKey('symbolGlyph_symbolColor_colorMetricsNumeric');
      console.info('[symbolColor] =' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
 	  expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertContain('#FF00FF00');
 	  console.info('[symbolGlyphSymbolColor_colorMetricsNumeric_0100] END');
      done();
 	})
 	 
 	/**
 	 * @tc.name   symbolGlyphSymbolColor_colorMetricsRgba_0100
 	 * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_COLORMETRICSRGBA_0100
 	 * @tc.desc   Test SymbolGlyph symbolColor property with ColorMetrics.rgba parameter
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('symbolGlyphSymbolColor_colorMetricsRgba_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[symbolGlyphSymbolColor_colorMetricsRgba_0100] START');
 	  let strJson = inspector.getInspectorByKey('symbolGlyph_symbolColor_colorMetricsRgba');
      console.info('[symbolColor] =' + JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor'));
 	  expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor')).assertContain('#FF000000');
 	  console.info('[symbolGlyphSymbolColor_colorMetricsRgba_0100] END');
      done();
 	 })

    /**
 	 * @tc.name   symbolGlyphSymbolColor_undefined_0100
 	 * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_UNDEFINED_0100
 	 * @tc.desc   Test SymbolGlyph symbolColor property with undefined
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('symbolGlyphSymbolColor_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[symbolGlyphSymbolColor_undefined_0100] START');
 	  let strJson1 = inspector.getInspectorByKey('symbolGlyph_symbolColor_undefined');
 	  console.info('[symbolColor1] =' + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'));
      let strJson2 = inspector.getInspectorByKey('symbolGlyph_symbolColor_default');
 	  console.info('[symbolColor2] =' + JSON.parseJsonElement(strJson2).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
        .assertEqual(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('fontColor'));
 	  console.info('[symbolGlyphSymbolColor_undefined_0100] END');
      done();
 	})


    /**
 	 * @tc.name   symbolGlyphSymbolColor_rgbColor_0100
 	 * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_RBGCOLOR_0100
 	 * @tc.desc   Test SymbolGlyph symbolColor property with rgbColor
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('symbolGlyphSymbolColor_rgbColor_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[symbolGlyphSymbolColor_rgbColor_0100] START');
 	  let strJson1 = inspector.getInspectorByKey('symbolGlyph_symbolColor_rgbColor');
 	  console.info('[symbolColor1] =' + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
        .assertContain('#FFFF0000');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
        .assertContain('#FF00FF00');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
        .assertContain('#FF0000FF');
 	  console.info('[symbolGlyphSymbolColor_rgbColor_0100] END');
      done();
 	})


    /**
 	 * @tc.name   symbolGlyphSymbolColor_displayP3Color_0100
 	 * @tc.number SUB_ARKUI_SYMBOLGLYPH_SYMBOLCOLOR_DISPLAY_P3_0100
 	 * @tc.desc   Test SymbolGlyph symbolColor property with p3Color
 	 * @tc.type   FUNCTION
 	 * @tc.size   SMALLTEST
 	 * @tc.level  LEVEL2
 	 */
 	it('symbolGlyphSymbolColor_displayP3Color_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
 	  console.info('[symbolGlyphSymbolColor_displayP3Color_0100] START');
 	  let strJson1 = inspector.getInspectorByKey('symbolGlyph_symbolColor_p3Color');
 	  console.info('[symbolColor1] =' + JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
        .assertContain('#FFFF0000');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
        .assertContain('#FF00FF00');
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('fontColor'))
        .assertContain('#FF0000FF');
 	  console.info('[symbolGlyphSymbolColor_displayP3Color_0100] END');
      done();
 	})

  });
}
