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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

export default function selectJsunit() {
  describe('selectJsunit', () => {
    beforeAll(() => {
      console.info("selectJsunit beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.picker.nowear.api12.static", "EntryAbility")
    });

    beforeEach(async () => {
      console.info("selectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/select',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get select state pages: " + JSON.stringify(pages));
        if (!("select" == pages.name)) {
          console.info("get select state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await Utils.sleep(2000);
        }
      } catch (err) {
        console.error("push select page error: " + err);
      }
    })

    
    
/**
     * @tc.number   ArkUI_Stage_Select_Layout_static_0100
     * @tc.name     ArkUI_Stage_Select_Layout_static_0100
     * @tc.desc     ArkUI_Stage_Select_Layout_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_Layout_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Layout_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_Layout_static_0100: arrowPosition=" + objNew.getElement('$attrs').getString('arrowPosition'))
      expect(objNew.getElement('$attrs').getString('arrowPosition') == 'ArrowPosition.END').assertTrue();
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_Space_static_0100
     * @tc.name     ArkUI_Stage_Select_Space_static_0100
     * @tc.desc     ArkUI_Stage_Select_Space_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_Space_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_Space_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_Space_static_0100: space=" + objNew.getElement('$attrs').getString('space'));
      expect(objNew.getElement('$attrs').getString('space')).assertEqual('50.00vp');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_selected_static_0100
     * @tc.name     ArkUI_Stage_Select_selected_static_0100
     * @tc.desc     ArkUI_Stage_Select_selected_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_selected_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_selected_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_selected_static_0100: space=" + objNew.getElement('$attrs').getString('selected'));
      expect(objNew.getElement('$attrs').getString('selected')).assertEqual("1");
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_value_static_0100
     * @tc.name     ArkUI_Stage_Select_value_static_0100
     * @tc.desc     ArkUI_Stage_Select_value_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_value_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_value_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_value_static_0100: space=" + objNew.getElement('$attrs').getString('value'));
      expect(objNew.getElement('$attrs').getString('value')).assertEqual("Test");
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_font_static_0100
     * @tc.name     ArkUI_Stage_Select_font_static_0100
     * @tc.desc     ArkUI_Stage_Select_font_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_font_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_font_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_font_static_0100: space=" + JSON.parseJsonElement(objNew.getElement('$attrs').getString('font')).getString('size'));
      expect(JSON.parseJsonElement(objNew.getElement('$attrs').getString('font')).getString('size')).assertEqual('30.00fp');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_fontColor_static_0100
     * @tc.name     ArkUI_Stage_Select_fontColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_fontColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_fontColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_fontColor_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_fontColor_static_0100: space=" + objNew.getElement('$attrs').getString('fontColor'));
      expect(objNew.getElement('$attrs').getString('fontColor')).assertEqual('#FFCCCCCC');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_selectedOptionFont_static_0100
     * @tc.name     ArkUI_Stage_Select_selectedOptionFont_static_0100
     * @tc.desc     ArkUI_Stage_Select_selectedOptionFont_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_selectedOptionFont_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_selectedOptionFont_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_selectedOptionFont_static_0100: space=" +
      JSON.parseJsonElement(objNew.getElement('$attrs').getString('selectedOptionFont')).getString('size'));
      expect(JSON.parseJsonElement(objNew.getElement('$attrs').getString('selectedOptionFont')).getString('size')).assertEqual('40.00fp');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_selectedOptionFontColor_static_0100
     * @tc.name     ArkUI_Stage_Select_selectedOptionFontColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_selectedOptionFontColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_selectedOptionFontColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_selectedOptionFontColor_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      expect(objNew.getElement('$attrs').getString('selectedOptionFontColor')).assertEqual('#FF000000');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_selectedOptionFontColor_static_0200
     * @tc.name     ArkUI_Stage_Select_selectedOptionFontColor_static_0200
     * @tc.desc     ArkUI_Stage_Select_selectedOptionFontColor_static_0200
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_selectedOptionFontColor_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_selectedOptionFontColor_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      expect(objNew.getElement('$attrs').getElement('menuAlign').getString('alignType')).assertEqual('MenuAlignType.Start');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_selectedOptionBgColor_static_0100
     * @tc.name     ArkUI_Stage_Select_selectedOptionBgColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_selectedOptionBgColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_selectedOptionBgColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_selectedOptionBgColor_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_selectedOptionBgColor_static_0100: space=" + objNew.getElement('$attrs').getString('selectedOptionBgColor'));
      expect(objNew.getElement('$attrs').getString('selectedOptionBgColor')).assertEqual('#FFCCCCCC');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_optionBgColor_static_0100
     * @tc.name     ArkUI_Stage_Select_optionBgColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_optionBgColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_optionBgColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_optionBgColor_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_optionBgColor_static_0100: space=" + objNew.getElement('$attrs').getString('optionBgColor'));
      expect(objNew.getElement('$attrs').getString('optionBgColor')).assertEqual('#FFFFFFFF');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_optionFont_static_0100
     * @tc.name     ArkUI_Stage_Select_optionFont_static_0100
     * @tc.desc     ArkUI_Stage_Select_optionFont_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_optionFont_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_optionFont_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_optionFont_static_0100: space=" +
      JSON.parseJsonElement(objNew.getElement('$attrs').getString('optionFont')).getString('size'));
      expect(JSON.parseJsonElement(objNew.getElement('$attrs').getString('optionFont')).getString('size')).assertEqual('30.00fp');
      done();
    });

    
    
/**
     * @tc.number   ArkUI_Stage_Select_optionFontColor_static_0100
     * @tc.name     ArkUI_Stage_Select_optionFontColor_static_0100
     * @tc.desc     ArkUI_Stage_Select_optionFontColor_static_0100
     * @tc.level    Level.LEVEL1
     */
it('ArkUI_Stage_Select_optionFontColor_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("ArkUI_Stage_Select_optionFontColor_static_0100 start");
      let strJson = inspector.getInspectorByKey('selectTest');
      let objNew = JSON.parseJsonElement(strJson);
      console.info("ArkUI_Stage_Select_optionFontColor_static_0100: space=" + objNew.getElement('$attrs').getString('optionFontColor'));
      expect(objNew.getElement('$attrs').getString('optionFontColor')).assertEqual('#FF000000');
      done();
    });
  })
}