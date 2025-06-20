/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeEach, afterEach, it, expect, Level} from '@ohos/hypium';
import { UiDriver, UiComponent, BY, Driver, Component, ON } from '@ohos.UiTest'
import Utils from './Utils';
import router from '@ohos.router';

export default function selectJsunit() {
  describe('selectTest', () => {
    beforeEach(async (done: Function) => {
      console.info("selectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select',
      }

      try {
        router.clear();
        let pages = router.getState();
        console.info("get select state pages: " + JSON.stringify(pages));
        if (!("select" == pages.name)) {
          console.info("get select state pages.name: " + JSON.stringify(pages.name));
          await router.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push select page error: " + err);
      }
      done();
    })

    /**
     * @tc.number ArkUI_Stage_Select_Layout_0100
     * @tc.name Test the properties of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_Layout_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Layout_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_Layout_0100: arrowPosition=" + objNew.$attrs.arrowPosition)
      expect(objNew.$attrs.arrowPosition == 'ArrowPosition.END').assertTrue();
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_Space_0100
     * @tc.name Test the properties of components
     * @tc.desc Set space values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_Space_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_Space_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_Space_0100: space=" + objNew.$attrs.space);
      expect(objNew.$attrs.space).assertEqual('50.00vp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_selected_0100
     * @tc.name Test the properties of components
     * @tc.desc Set selected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_selected_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_selected_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_selected_0100: selected=" + objNew.$attrs.selected);
      expect(objNew.$attrs.selected).assertEqual("1");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_value_0100
     * @tc.name Test the properties of components
     * @tc.desc Set value values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_value_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_value_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_value_0100: space=" + objNew.$attrs.value);
      expect(objNew.$attrs.value).assertEqual("Test");
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_font_0100
     * @tc.name Test the properties of components
     * @tc.desc Set font values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_font_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_font_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_font_0100: space=" + objNew.$attrs.font.size);
      expect(JSON.parse(objNew.$attrs.font).size).assertEqual('30.00fp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_fontColor_0100
     * @tc.name Test the properties of components
     * @tc.desc Set fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_fontColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_fontColor_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_fontColor_0100: space=" + objNew.$attrs.fontColor);
      expect(objNew.$attrs.fontColor).assertEqual('#FFCCCCCC');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_selectedOptionFont_0100
     * @tc.name Test the properties of components
     * @tc.desc Set selectedOptionFont values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_selectedOptionFont_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_selectedOptionFont_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_selectedOptionFont_0100: space=" + objNew.$attrs.selectedOptionFont.size);
      expect(JSON.parse(objNew.$attrs.selectedOptionFont).size).assertEqual('40.00fp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_selectedOptionFontColor_0100
     * @tc.name Test the selectedOptionFontColor of components
     * @tc.desc Set attribute values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_selectedOptionFontColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_selectedOptionFontColor_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      expect(objNew.$attrs.selectedOptionFontColor).assertEqual('#FF000000');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_menuAlign_0100
     * @tc.name Test the properties of components
     * @tc.desc Set menuAlign values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_menuAlign_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_menuAlign_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      expect(objNew.$attrs.menuAlign.alignType).assertEqual('MenuAlignType.Start');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_selectedOptionBgColor_0100
     * @tc.name Test the properties of components
     * @tc.desc Set selectedOptionBgColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_selectedOptionBgColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_selectedOptionBgColor_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_selectedOptionBgColor_0100: selectedOptionBgColor=" + objNew.$attrs.selectedOptionBgColor);
      expect(objNew.$attrs.selectedOptionBgColor).assertEqual('#FFCCCCCC');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_optionBgColor_0100
     * @tc.name Test the properties of components
     * @tc.desc Set optionBgColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_optionBgColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_optionBgColor_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_optionBgColor_0100: optionBgColor=" + objNew.$attrs.optionBgColor);
      expect(objNew.$attrs.optionBgColor).assertEqual('#FFFFFFFF');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_optionFont_0100
     * @tc.name Test the properties of components
     * @tc.desc Set optionFont values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_optionFont_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_optionFont_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_optionFont_0100: optionFont=" + objNew.$attrs.optionFont.size);
      expect(JSON.parse(objNew.$attrs.optionFont).size).assertEqual('30.00fp');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_optionWidth_0100
     * @tc.name Test the properties of components
     * @tc.desc Set optionWidth values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_optionWidth_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_optionWidth_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_optionWidth_0100: " + objNew.$attrs.optionWidth);
      expect(objNew.$attrs.optionWidth).assertEqual('200.000000');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_optionHeight_0100
     * @tc.name Test the properties of components
     * @tc.desc Set optionHeight values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_optionHeight_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_optionHeight_0100 start");
      let strJson = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJson);
      console.info("ArkUI_Stage_Select_optionHeight_0100: " + objNew.$attrs.optionHeight);
      expect(objNew.$attrs.optionHeight).assertEqual('100.000000');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_optionFontColor_0100
     * @tc.name Test the properties of components
     * @tc.desc Change fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_optionFontColor_0100', Level.LEVEL0, async (done: Function) => {
      console.info("ArkUI_Stage_Select_optionFontColor_0100 start");
      let strJsonNew = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUI_Stage_Select_optionFontColor_0100 component  is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontColor).assertEqual("#FFCCCCCC");
      console.info('ArkUI_Stage_Select_optionFontColor_0100 END ');
      done();
    });

    /**
     * @tc.number ArkUI_Stage_Select_change_0101
     * @tc.name Test the properties of components
     * @tc.desc Change fontColor values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level 0
     */
    it('ArkUI_Stage_Select_change_0101', Level.LEVEL0, async (done: Function) => {
      console.info('ArkUI_Stage_Select_change_0101 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await button.click();
      await Utils.sleep(2000)
      let strJsonNew = getInspectorByKey('selectTest');
      let objNew: ESObject = JSON.parse(strJsonNew);
      console.info("ArkUI_Stage_Select_change_0101 component  is: " + JSON.stringify(objNew));
      expect(objNew.$attrs.fontColor).assertEqual("#FF123456");
      console.info('ArkUI_Stage_Select_change_0101 END ');
      done();
    });

  })
}