/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Utils from '../../MainAbility/common/Utils'
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function selectAttributeNullTest() {
  describe('selectAttributeNullTest', () => {
    

    beforeEach(async (done: Function) => {
      console.info("selectAttributeNullTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/selectNull/SelectAttributeNullTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get slider state success " + JSON.stringify(pages));
        if (!("SelectAttributeNullTest" == pages.name)) {
          console.info("get slider state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await Utils.sleep(2000);
          console.info("push selectAttributeNullTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push selectAttributeNullTest page error: " + err);
      }
      done()
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("selectAttributeNullTest after each called");
    });

    
    /**
     * @tc.name   selectFont_Null_001
     * @tc.number SUB_ARKUI_SELECT_FONT_PARAM_001
     * @tc.desc   Test Select selectFont
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectFont_Null_001', Level.LEVEL0, async (done: Function) => {
      console.info('selectFont_Null_001 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_font_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(obj.$attrs+"===============")
      expect(obj.$attrs.font).assertContain("FontWeight.Medium");
      console.info('selectFont_Null_001 END');
      done();
    });

    /**
     * @tc.name   selectFont_Undefined_002
     * @tc.number SUB_ARKUI_SELECT_FONT_PARAM_002
     * @tc.desc   Test Select selectFont
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectFont_Undefined_002', Level.LEVEL0, async (done: Function) => {
      console.info('selectFont_Undefined_002 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_font_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(JSON.stringify(obj)+"======obj==========")
      expect(obj.$attrs.font).assertContain("FontWeight.Medium");
      console.info('selectFont_Undefined_002 END');
      done();
    });

    /**
     * @tc.name   selectFontColor_Null_003
     * @tc.number SUB_ARKUI_SELECT_FONTCOLOR_PARAM_003
     * @tc.desc   Test Select selectFontColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectFontColor_Null_003', Level.LEVEL0, async (done: Function) => {
      console.info('selectFontColor_Null_003 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_fontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectFontColor_Null_003 END');
      done();
    });

    /**
     * @tc.name   selectFontColor_Undefined_004
     * @tc.number SUB_ARKUI_SELECT_FONTCOLOR_PARAM_004
     * @tc.desc   Test Select selectFontColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectFontColor_Undefined_004', Level.LEVEL0, async (done: Function) => {
      console.info('selectFontColor_Undefined_004 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_fontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectFontColor_Undefined_004 END');
      done();
    });

    /**
     * @tc.name   selectSelectedOptionBgColor_Null_005
     * @tc.number SUB_ARKUI_SELECT_BGCOLOR_PARAM_005
     * @tc.desc   Test Select selectSelectedOptionBgColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSelectedOptionBgColor_Null_005', Level.LEVEL0, async (done: Function) => {
      console.info('selectSelectedOptionBgColor_Null_005 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_selectedOptionBgColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(obj.$attrs+"===============")
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectSelectedOptionBgColor_Null_005 END');
      done();
    });


    /**
     * @tc.name   selectSelectedOptionBgColor_Undefined_006
     * @tc.number SUB_ARKUI_SELECT_BGCOLOR_PARAM_006
     * @tc.desc   Test Select selectSelectedOptionBgColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSelectedOptionBgColor_Undefined_006', Level.LEVEL0, async (done: Function) => {
      console.info('selectSelectedOptionBgColor_Undefined_006 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_selectedOptionBgColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectSelectedOptionBgColor_Undefined_006 END');
      done();
    });

    /**
     * @tc.name   selectSelectedOptionFont_Null_007
     * @tc.number SUB_ARKUI_SELECT_FONT_PARAM_007
     * @tc.desc   Test Select selectSelectedOptionFont
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSelectedOptionFont_Null_007', Level.LEVEL0, async (done: Function) => {
      console.info('selectSelectedOptionFont_Null_007 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_selectedOptionFont_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(JSON.stringify(obj)+"======obj==========")
      console.info(obj.$attrs+"===============")
      expect(obj.$attrs.selectedOptionFont).assertContain("FontWeight.Regular");
      console.info('selectSelectedOptionFont_Null_007 END');
      done();
    });

    /**
     * @tc.name   selectSelectedOptionFont_Undefined_008
     * @tc.number SUB_ARKUI_SELECT_FONT_PARAM_008
     * @tc.desc   Test Select selectSelectedOptionFont
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSelectedOptionFont_Undefined_008', Level.LEVEL0, async (done: Function) => {
      console.info('selectSelectedOptionFont_Undefined_008 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_selectedOptionFont_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(JSON.stringify(obj)+"======obj==========")
      console.info(obj.$attrs+"===============")
      expect(obj.$attrs.selectedOptionFont).assertContain("FontWeight.Regular");
      console.info('selectSelectedOptionFont_Undefined_008 END');
      done();
    });

    /**
     * @tc.name   selectSelectedOptionFontColor_Null_009
     * @tc.number SUB_ARKUI_SELECT_FONTCOLOR_PARAM_009
     * @tc.desc   Test Select selectSelectedOptionFontColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSelectedOptionFontColor_Null_009', Level.LEVEL0, async (done: Function) => {
      console.info('selectSelectedOptionFontColor_Null_009 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_selectedOptionFontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectSelectedOptionFontColor_Null_009 END');
      done();
    });

    /**
     * @tc.name   selectSelectedOptionFontColor_Undefined_010
     * @tc.number SUB_ARKUI_SELECT_FONTCOLOR_PARAM_010
     * @tc.desc   Test Select selectSelectedOptionFontColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSelectedOptionFontColor_Undefined_010', Level.LEVEL0, async (done: Function) => {
      console.info('selectSelectedOptionFontColor_Undefined_010 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_selectedOptionFontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectSelectedOptionFontColor_Undefined_010 END');
      done();
    });

    /**
     * @tc.name   selectOptionBgColor_Null_011
     * @tc.number SUB_ARKUI_SELECT_BGCOLOR_PARAM_011
     * @tc.desc   Test Select selectOptionBgColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectOptionBgColor_Null_011', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionBgColor_Null_011 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionBgColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.optionBgColor).assertEqual("#FFFFFFFF");
      console.info('selectOptionBgColor_Null_011 END');
      done();
    });

    /**
     * @tc.name   selectOptionBgColor_Undefined_012
     * @tc.number SUB_ARKUI_SELECT_BGCOLOR_PARAM_012
     * @tc.desc   Test Select selectOptionBgColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectOptionBgColor_Undefined_012', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionBgColor_Undefined_012 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionBgColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.optionBgColor).assertEqual("#FFFFFFFF");
      console.info('selectOptionBgColor_Undefined_012 END');
      done();
    });

    /**
     * @tc.name   selectOptionFont_Null_013
     * @tc.number SUB_ARKUI_SELECT_FONT_PARAM_013
     * @tc.desc   Test Select selectOptionFont
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectOptionFont_Null_013', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionFont_Null_013 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionFont_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.optionFont).assertContain("FontWeight.Normal");
      console.info('selectOptionFont_Null_013 END');
      done();
    });

    /**
     * @tc.name   selectOptionFont_Undefined_014
     * @tc.number SUB_ARKUI_SELECT_FONT_PARAM_014
     * @tc.desc   Test Select selectOptionFont
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectOptionFont_Undefined_014', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionFont_Undefined_014 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionFont_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.optionFont).assertContain("FontWeight.Normal");
      console.info('selectOptionFont_Undefined_014 END');
      done();
    });

    /**
     * @tc.name   selectOptionFontColor_Null_015
     * @tc.number SUB_ARKUI_SELECT_FONTCOLOR_PARAM_015
     * @tc.desc   Test Select selectOptionFontColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectOptionFontColor_Null_015', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionFontColor_Null_015 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionFontColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectOptionFontColor_Null_015 END');
      done();
    });

    /**
     * @tc.name   selectOptionFontColor_Undefined_016
     * @tc.number SUB_ARKUI_SELECT_FONTCOLOR_PARAM_016
     * @tc.desc   Test Select selectOptionFontColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
      it('selectOptionFontColor_Undefined_016', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionFontColor_Undefined_016 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionFontColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectOptionFontColor_Undefined_016 END');
      done();
    });

    // pass
    /**
     * @tc.name   selectSpace_Null_017
     * @tc.number SUB_ARKUI_SELECT_SELECTSPACE_PARAM_017
     * @tc.desc   Test Select selectSpace
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSpace_Null_017', Level.LEVEL0, async (done: Function) => {
      console.info('selectSpace_Null_017 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_space_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.space).assertEqual('8.00vp');
      console.info('selectSpace_Null_017 END');
      done();
    });

    // pass
    /**
     * @tc.name   selectSpace_Undefined_018
     * @tc.number SUB_ARKUI_SELECT_SELECTSPACE_PARAM_018
     * @tc.desc   Test Select selectSpace
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectSpace_Undefined_018', Level.LEVEL0, async (done: Function) => {
      console.info('selectSpace_Undefined_018 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_space_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.space).assertEqual('8.00vp');
      console.info('selectSpace_Undefined_018 END');
      done();
    });

    // pass
    /**
     * @tc.name   selectArrowPosition_Start_019
     * @tc.number SUB_ARKUI_SELECT_POSITION_PARAM_019
     * @tc.desc   Test Select selectArrowPosition
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectArrowPosition_Start_019', Level.LEVEL0, async (done: Function) => {
      console.info('selectArrowPosition_Start_019 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_arrowPosition_start');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.arrowPosition).assertEqual('ArrowPosition.START');
      console.info('selectArrowPosition_Start_019 END');
      done();
    });

    /**
     * @tc.name   selectArrowPosition_Null_020
     * @tc.number SUB_ARKUI_SELECT_POSITION_PARAM_020
     * @tc.desc   Test Select selectArrowPosition
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectArrowPosition_Null_020', Level.LEVEL0, async (done: Function) => {
      console.info('selectArrowPosition_Null_020 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_arrowPosition_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.arrowPosition).assertEqual('ArrowPosition.END');
      console.info('selectArrowPosition_Null_020 END');
      done();
    });

    /**
     * @tc.name   selectArrowPosition_Undefined_021
     * @tc.number SUB_ARKUI_SELECT_POSITION_PARAM_021
     * @tc.desc   Test Select selectArrowPosition
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectArrowPosition_Undefined_021', Level.LEVEL0, async (done: Function) => {
      console.info('selectArrowPosition_Undefined_021 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_arrowPosition_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.arrowPosition).assertEqual('ArrowPosition.END');
      console.info('selectArrowPosition_Undefined_021 END');
      done();
    });

    /**
     * @tc.name   selectMenuAlign_Null_022
     * @tc.number SUB_ARKUI_SELECT_MENUALIGN_PARAM_022
     * @tc.desc   Test Select selectMenuAlign
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectMenuAlign_Null_022', Level.LEVEL0, async (done: Function) => {
      console.info('selectMenuAlign_Null_022 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_menuAlign_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(obj.$attrs + JSON.stringify(obj.$attrs.menuAlign)+"======menuAlign=============")
      expect(JSON.stringify(obj.$attrs.menuAlign)).assertContain("MenuAlignType.Start");
      console.info('selectMenuAlign_Null_022 END');
      done();
    });

    /**
     * @tc.name   selectMenuAlign_Undefined_023
     * @tc.number SUB_ARKUI_SELECT_MENUALIGN_PARAM_023
     * @tc.desc   Test Select selectMenuAlign
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectMenuAlign_Undefined_023', Level.LEVEL0, async (done: Function) => {
      console.info('selectMenuAlign_Undefined_023 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_menuAlign_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs.menuAlign)).assertContain("MenuAlignType.Start");
      console.info('selectMenuAlign_Undefined_023 END');
      done();
    });

    /**
     * @tc.name   selectOptionWidth_Null_024
     * @tc.number SUB_ARKUI_SELECT_WIDTH_PARAM_024
     * @tc.desc   Test Select selectOptionWidth
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectOptionWidth_Null_024', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionWidth_Null_024 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.optionWidth).assertEqual('0.000000');
      console.info('selectOptionWidth_Null_024 END');
      done();
    });

    /**
     * @tc.name   selectOptionWidth_Undefined_025
     * @tc.number SUB_ARKUI_SELECT_WIDTH_PARAM_025
     * @tc.desc   Test Select selectOptionWidth
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectOptionWidth_Undefined_025', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionWidth_Undefined_025 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.optionWidth).assertEqual('0.000000');
      console.info('selectOptionWidth_Undefined_025 END');
      done();
    });

    /**
     * @tc.name   selectOptionHeight_Null_026
     * @tc.number SUB_ARKUI_SELECT_HEIGHT_PARAM_026
     * @tc.desc   Test Select selectOptionHeight
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectOptionHeight_Null_026', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionHeight_Null_026 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionHeight_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.optionHeight).assertEqual('0.000000');
      console.info('selectOptionHeight_Null_026 END');
      done();
    });

    /**
     * @tc.name   selectOptionHeight_Undefined_027
     * @tc.number SUB_ARKUI_SELECT_HEIGHT_PARAM_027
     * @tc.desc   Test Select selectOptionHeight
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectOptionHeight_Undefined_027', Level.LEVEL0, async (done: Function) => {
      console.info('selectOptionHeight_Undefined_027 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_optionHeight_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.optionHeight).assertEqual('0.000000');
      console.info('selectOptionHeight_Undefined_027 END');
      done();
    });

    /**
     * @tc.name   selectMenuBackgroundColor_Null_028
     * @tc.number SUB_ARKUI_SELECT_MENUBACKGROUNDCOLOR_PARAM_028
     * @tc.desc   Test Select selectMenuBackgroundColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectMenuBackgroundColor_Null_028', Level.LEVEL0, async (done: Function) => {
      console.info('selectMenuBackgroundColor_Null_028 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_menuBackgroundColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.menuBackgroundColor).assertEqual("#00000000");
      console.info('selectMenuBackgroundColor_Null_028 END');
      done();
    });

    /**
     * @tc.name   selectMenuBackgroundColor_Undefined_029
     * @tc.number SUB_ARKUI_SELECT_MENUBACKGROUNDCOLOR_PARAM_029
     * @tc.desc   Test Select selectMenuBackgroundColor
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectMenuBackgroundColor_Undefined_029', Level.LEVEL0, async (done: Function) => {
      console.info('selectMenuBackgroundColor_Undefined_029 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_menuBackgroundColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.menuBackgroundColor).assertEqual("#00000000");
      console.info('selectMenuBackgroundColor_Undefined_029 END');
      done();
    });

    /**
     * @tc.name   selectMenuBackgroundBlurStyle_Null_030
     * @tc.number SUB_ARKUI_SELECT_MENUBACKGROUNDBLURSTYLE_PARAM_030
     * @tc.desc   Test Select selectMenuBackgroundBlurStyle
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectMenuBackgroundBlurStyle_Null_030', Level.LEVEL0, async (done: Function) => {
      console.info('selectMenuBackgroundBlurStyle_Null_030 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_menuBackgroundBlurStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectMenuBackgroundBlurStyle_Null_030 END');
      done();
    });

    /**
     * @tc.name   selectMenuBackgroundBlurStyle_Undefined_031
     * @tc.number SUB_ARKUI_SELECT_MENUBACKGROUNDBLURSTYLE_PARAM_031
     * @tc.desc   Test Select selectMenuBackgroundBlurStyle
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectMenuBackgroundBlurStyle_Undefined_031', Level.LEVEL0, async (done: Function) => {
      console.info('selectMenuBackgroundBlurStyle_Undefined_031 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_menuBackgroundBlurStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(JSON.stringify(obj.$attrs)).assertContain('BorderStyle');
      console.info('selectMenuBackgroundBlurStyle_Undefined_031 END');
      done();
    });

    /**
     * @tc.name   selectControlSize_Null_032
     * @tc.number SUB_ARKUI_SELECT_CONTROLSIZE_PARAM_032
     * @tc.desc   Test Select selectControlSize
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectControlSize_Null_032', Level.LEVEL0, async (done: Function) => {
      console.info('selectControlSize_Null_032 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_controlSize_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.controlSize).assertEqual('ControlSize.NORMAL');
      console.info('selectControlSize_Null_032 END');
      done();
    });

    /**
     * @tc.name   selectControlSize_Undefined_033
     * @tc.number SUB_ARKUI_SELECT_CONTROLSIZE_PARAM_033
     * @tc.desc   Test Select selectControlSize
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectControlSize_Undefined_033', Level.LEVEL0, async (done: Function) => {
      console.info('selectControlSize_Undefined_033 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_controlSize_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.controlSize).assertEqual('ControlSize.NORMAL');
      console.info('selectControlSize_Undefined_033 END');
      done();
    });

    /**
     * @tc.name   selectShowDefaultSelectedIcon_Null_034
     * @tc.number SUB_ARKUI_SELECT_ICON_PARAM_034
     * @tc.desc   Test Select selectShowDefaultSelectedIcon
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectShowDefaultSelectedIcon_Null_034', Level.LEVEL0, async (done: Function) => {
      console.info('selectShowDefaultSelectedIcon_Null_034 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_showDefaultSelectedIcon_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info(obj.$attrs+JSON.stringify(obj.$attrs.showDefaultSelectedIcon) +"=====showDefaultSelectedIcon=========")
      expect(obj.$attrs.showDefaultSelectedIcon).assertEqual("false");
      console.info('selectShowDefaultSelectedIcon_Null_034 END');
      done();
    });

    /**
     * @tc.name   selectShowDefaultSelectedIcon_Undefined_035
     * @tc.number SUB_ARKUI_SELECT_ICON_PARAM_035
     * @tc.desc   Test Select selectShowDefaultSelectedIcon
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectShowDefaultSelectedIcon_Undefined_035', Level.LEVEL0, async (done: Function) => {
      console.info('selectShowDefaultSelectedIcon_Undefined_035 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_showDefaultSelectedIcon_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.showDefaultSelectedIcon).assertEqual("false");
      console.info('selectShowDefaultSelectedIcon_Undefined_035 END');
      done();
    });

    /**
     * @tc.name   selectKeyboardAvoidMode_Null_036
     * @tc.number SUB_ARKUI_SELECT_KEYBOARDAVOIDMODE_PARAM_036
     * @tc.desc   Test Select selectKeyboardAvoidMode
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectKeyboardAvoidMode_Null_036', Level.LEVEL0, async (done: Function) => {
      console.info('selectKeyboardAvoidMode_Null_036 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_keyboardAvoidMode_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // expect(obj.$attrs.keyboardAvoidMode).assertEqual('KeyboardAvoidMode.DEFAULT');
      expect(obj.$attrs.keyboardAvoidMode).assertEqual(undefined);
      console.info('selectKeyboardAvoidMode_Null_036 END');
      done();
    });

    /**
     * @tc.name   selectKeyboardAvoidMode_Undefined_037
     * @tc.number SUB_ARKUI_SELECT_KEYBOARDAVOIDMODE_PARAM_037
     * @tc.desc   Test Select selectKeyboardAvoidMode
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectKeyboardAvoidMode_Undefined_037', Level.LEVEL0, async (done: Function) => {
      console.info('selectKeyboardAvoidMode_Undefined_037 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_keyboardAvoidMode_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(obj.$attrs.keyboardAvoidMode).assertEqual(undefined);
      console.info('selectKeyboardAvoidMode_Undefined_037 END');
      done();
    });

    /**
     * @tc.name   selectMinKeyboardAvoidDistance_Null_038
     * @tc.number SUB_ARKUI_SELECT_KEYBOARDAVOIDDISTANCE_PARAM_038
     * @tc.desc   Test Select selectKeyboardAvoidDistance
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectMinKeyboardAvoidDistance_Null_038', Level.LEVEL0, async (done: Function) => {
      console.info('selectMinKeyboardAvoidDistance_Null_038 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_minKeyboardAvoidDistance_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // expect(obj.$attrs.minKeyboardAvoidDistance).assertEqual('0.00vp');
      expect(obj.$attrs.minKeyboardAvoidDistance).assertEqual(undefined);
      console.info('selectMinKeyboardAvoidDistance_Null_038 END');
      done();
    });

    /**
     * @tc.name   selectMinKeyboardAvoidDistance_Undefined_039
     * @tc.number SUB_ARKUI_SELECT_KEYBOARDAVOIDDISTANCE_PARAM_039
     * @tc.desc   Test Select selectKeyboardAvoidDistance
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectMinKeyboardAvoidDistance_Undefined_039', Level.LEVEL0, async (done: Function) => {
      console.info('selectMinKeyboardAvoidDistance_Undefined_039 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_minKeyboardAvoidDistance_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // expect(obj.$attrs.minKeyboardAvoidDistance).assertEqual('0.00vp');
      expect(!(obj.$attrs.minKeyboardAvoidDistance)).assertTrue();
      console.info('selectMinKeyboardAvoidDistance_Undefined_039 END');
      done();
    });

    /**
     * @tc.name   selectDividerStyle_Null_040
     * @tc.number SUB_ARKUI_SELECT_DIVIDERSTYLE_PARAM_040
     * @tc.desc   Test Select selectDividerStyle
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectDividerStyle_Null_040', Level.LEVEL0, async (done: Function) => {
      console.info('selectDividerStyle_Null_040 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_dividerStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(!(obj.$attrs.dividerStyle)).assertTrue();
      console.info('selectDividerStyle_Null_040 END');
      done();
    });

    /**
     * @tc.name   selectDividerStyle_Undefined_041
     * @tc.number SUB_ARKUI_SELECT_DIVIDERSTYLE_PARAM_041
     * @tc.desc   Test Select selectDividerStyle
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectDividerStyle_Undefined_041', Level.LEVEL0, async (done: Function) => {
      console.info('selectDividerStyle_Undefined_041 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_dividerStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      expect(!(obj.$attrs.dividerStyle)).assertTrue();
      console.info('selectDividerStyle_Undefined_041 END');
      done();
    });

    /**
     * @tc.name   selectAvoidance_Null_042
     * @tc.number SUB_ARKUI_SELECT_AVOIDANCE_PARAM_042
     * @tc.desc   Test Select selectAvoidance
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectAvoidance_Null_042', Level.LEVEL0, async (done: Function) => {
      console.info('selectAvoidance_Null_042 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_avoidance_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // expect(obj.$attrs.avoidance).assertEqual('SelectAvoidance.AVOIDANCE');
      expect(!(obj.$attrs.avoidance)).assertTrue();
      console.info('selectAvoidance_Null_042 END');
      done();
    });

    /**
     * @tc.name   selectAvoidance_Undefined_043
     * @tc.number SUB_ARKUI_SELECT_AVOIDANCE_PARAM_043
     * @tc.desc   Test Select selectAvoidance
     * @tc.type   
     * @tc.size   
     * @tc.level  
     */
    it('selectAvoidance_Undefined_043', Level.LEVEL0, async (done: Function) => {
      console.info('selectAvoidance_Undefined_043 START');
      await Utils.sleep(1000);
      let strJson = getInspectorByKey('select_avoidance_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      // expect(obj.$attrs.avoidance).assertEqual('SelectAvoidance.AVOIDANCE');
      expect(!(obj.$attrs.avoidance)).assertTrue();
      console.info('selectAvoidance_Undefined_043 END');
      done();
    });

  })
}