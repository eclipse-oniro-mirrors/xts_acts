'use static';
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix,
  Rect
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from './Util.test';
import Utils from "../../ets/MainAbility/common/Utils";
import accessibility from '@ohos.accessibility';
import Utils from '../../ets/MainAbility/common/Utils'
import events_emitter from '@ohos.events.emitter';

export default function selectJsunit() {
  describe('selectTest', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.open.harmony.modifiernowear.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("selectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get select state pages:" + JSON.stringify(pages));
        if (!("select" == pages.name)) {
          console.info("get select pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push select page error: " + err);
      }
    })


    
    /**
     * @tc.number   ArkUI_Stage_Select_Layout_static_0100
     * @tc.name     ArkUI_Stage_Select_Layout_static_0100
     * @tc.desc     ArkUI_Stage_Select_Layout_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Layout_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Layout_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_Layout_0100: arrowPosition=" +
      objNew.getElement('$attrs').getString('arrowPosition'))
      expect(objNew.getElement('$attrs').getString('arrowPosition') == 'ArrowPosition.END').assertTrue();
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_Space_static_0100
     * @tc.name     ArkUI_Stage_Select_Space_static_0100
     * @tc.desc     ArkUI_Stage_Select_Space_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_Space_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_Space_0100: space=" + objNew.getElement('$attrs').getString('space'));
      expect(objNew.getElement('$attrs').getString('space')).assertEqual('50.00vp');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_selected_static_0100
     * @tc.name     ArkUI_Stage_Select_selected_static_0100
     * @tc.desc     ArkUI_Stage_Select_selected_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_selected_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_selected_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_selected_0100: selected=" + objNew.getElement('$attrs').getString('selected'));
      expect(objNew.getElement('$attrs').getString('selected')).assertEqual("1");
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_value_static_0100
     * @tc.name     ArkUI_Stage_Select_value_static_0100
     * @tc.desc     ArkUI_Stage_Select_value_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_value_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_value_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_value_0100: space=" + objNew.getElement('$attrs').getString('value'));
      expect(objNew.getElement('$attrs').getString('value')).assertEqual("Test");
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_font_static_0100
     * @tc.name     ArkUI_Stage_Select_font_static_0100
     * @tc.desc     ArkUI_Stage_Select_font_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_font_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_font_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_font_0100: font = " + objNew.getElement('$attrs').getString('font'));
      let fontJson = JSON.parseJsonElement(objNew.getElement('$attrs').getString('font'));
      console.info("ArkUI_Stage_Select_font_0100: font size = " + fontJson.getString('size'));
      expect(fontJson.getString('size')).assertEqual('30.00fp');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_fontColor_static_0100
     * @tc.name     ArkUI_Stage_Select_fontColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_fontColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_fontColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_fontColor_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_fontColor_0100: space=" + objNew.getElement('$attrs').getString('fontColor'));
      expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual('#FFCCCCCC');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_selectedOptionFont_static_0100
     * @tc.name     ArkUI_Stage_Select_selectedOptionFont_static_0100
     * @tc.desc     ArkUI_Stage_Select_selectedOptionFont_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_selectedOptionFont_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_selectedOptionFont_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_selectedOptionFont_0100: selectedOptionFont=" + objNew.getElement('$attrs').getString('selectedOptionFont'));
      let selectedOptionFontJson = JSON.parseJsonElement(objNew.getElement('$attrs').getString('selectedOptionFont'));
      console.info("ArkUI_Stage_Select_selectedOptionFont_0100: space=" + selectedOptionFontJson.getString('size'));
      expect(selectedOptionFontJson.getString('size')).assertEqual('40.00fp');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_selectedOptionFontColor_static_0100
     * @tc.name     ArkUI_Stage_Select_selectedOptionFontColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_selectedOptionFontColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_selectedOptionFontColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info("ArkUI_Stage_Select_selectedOptionFontColor_0100 start");
        let strJson = inspector.getInspectorByKey('selectTest');
        let objNew = JSON.parseJsonElement(strJson);
        expect(objNew.getElement('$attrs').getString('selectedOptionFontColor')).assertEqual('#FF000000');
        done();
      });


    
    /**
     * @tc.number   ArkUI_Stage_Select_menuAlign_static_0100
     * @tc.name     ArkUI_Stage_Select_menuAlign_static_0100
     * @tc.desc     ArkUI_Stage_Select_menuAlign_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_menuAlign_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_menuAlign_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      expect(objNew.getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual('MenuAlignType.Start');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_selectedOptionBgColor_static_0100
     * @tc.name     ArkUI_Stage_Select_selectedOptionBgColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_selectedOptionBgColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_selectedOptionBgColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info("ArkUI_Stage_Select_selectedOptionBgColor_0100 start");
        let strJson = inspector.getInspectorByKey('selectTest');
        let objNew = JSON.parseJsonElement(strJson);
        console.info("ArkUI_Stage_Select_selectedOptionBgColor_0100: selectedOptionBgColor=" +
        objNew.getElement('$attrs').getString('selectedOptionBgColor'));
        expect(objNew.getElement('$attrs').getString('selectedOptionBgColor')).assertEqual('#FFCCCCCC');
        done();
      });


    
    /**
     * @tc.number   ArkUI_Stage_Select_optionBgColor_static_0100
     * @tc.name     ArkUI_Stage_Select_optionBgColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_optionBgColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_optionBgColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_optionBgColor_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_optionBgColor_0100: optionBgColor=" + objNew.getElement('$attrs').getString('optionBgColor'));
      expect(objNew.getElement('$attrs').getString('optionBgColor')).assertEqual('#FFFFFFFF');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_optionFont_static_0100
     * @tc.name     ArkUI_Stage_Select_optionFont_static_0100
     * @tc.desc     ArkUI_Stage_Select_optionFont_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_optionFont_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_optionFont_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_optionFont_0100: optionFont=" + objNew.getElement('$attrs').getString('optionFont'));
      let optionFontJson = JSON.parseJsonElement(objNew.getElement('$attrs').getString('optionFont'));
      console.info("ArkUI_Stage_Select_optionFont_0100: optionFont=" + optionFontJson.getString('size'));
      expect(optionFontJson.getString('size')).assertEqual('30.00fp');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_optionWidth_static_0100
     * @tc.name     ArkUI_Stage_Select_optionWidth_static_0100
     * @tc.desc     ArkUI_Stage_Select_optionWidth_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_optionWidth_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_optionWidth_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_optionWidth_0100: " + objNew.getElement('$attrs').getString('optionWidth'));
      expect(objNew.getElement('$attrs').getString('optionWidth')).assertEqual('200.000000');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_optionHeight_static_0100
     * @tc.name     ArkUI_Stage_Select_optionHeight_static_0100
     * @tc.desc     ArkUI_Stage_Select_optionHeight_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_optionHeight_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_optionHeight_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_optionHeight_0100: " + objNew.getElement('$attrs').getString('optionHeight'));
      expect(objNew.getElement('$attrs').getString('optionHeight')).assertEqual('100.000000');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_optionFontColor_static_0100
     * @tc.name     ArkUI_Stage_Select_optionFontColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_optionFontColor_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_optionFontColor_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_optionFontColor_0100 start");
      let strJsonNew = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUI_Stage_Select_optionFontColor_0100 component  is: " + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual("#FFCCCCCC");
      console.info('ArkUI_Stage_Select_optionFontColor_0100 END ');
      done();
    });


    
    /**
     * @tc.number   ArkUI_Stage_Select_change_static_0101
     * @tc.name     ArkUI_Stage_Select_change_static_0101
     * @tc.desc     ArkUI_Stage_Select_change_static_0101
     * @tc.level    Level.LEVEL0
     */
it('ArkUI_Stage_Select_change_static_0101', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUI_Stage_Select_change_0101 START');
      let driver = Driver.create();
      let button = await driver.findComponent(ON.id('changeButton'));
      await (button?.click() as Promise<void>);
      await Utils.sleep(2000)
      let strJsonNew = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJsonNew);
      console.info("ArkUI_Stage_Select_change_0101 component  is: " + JSON.stringify(objNew));
      expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual("#FF123456");
      console.info('ArkUI_Stage_Select_change_0101 END ');
      done();
    });

  })
}