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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function TextPickerJsunit() {
  describe('TextPickerJsunit', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextPicker beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextPicker/TextPickerPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextPicker state pages:" + JSON.stringify(pages));
        if (!("TextPickerPage" == pages.name)) {
          console.info("get TextPicker pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextPicker page error: " + err);
        expect().assertFail();
      }
    });


    
    
    /**
     * @tc.number   TextPickerJsunit_static_0100
     * @tc.name     TextPickerJsunit_static_0100
     * @tc.desc     TextPickerJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('TextPickerJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Get the information of TextPicker component
      console.info('[TextPickerJsunit_static_0100] START');
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextPickerJsunit_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[TextPickerJsunit_static_0100] range: " + JSON.stringify(obj.getElement('$attrs').getString('range')));
      console.info("[TextPickerJsunit_static_0100] selected: " + JSON.stringify(obj.getElement('$attrs').getString('selected')));
      console.info("[TextPickerJsunit_static_0100] value: " + JSON.stringify(obj.getElement('$attrs').getString('value')));
      console.info("[TextPickerJsunit_static_0100] defaultPickerItemHeight: " + JSON.stringify(obj.getElement('$attrs').getString('defaultPickerItemHeight')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('range')).assertEqual('["icon:,text:apple1","icon:,text:orange2","icon:,text:peach3","icon:,text:grape4"]');
      expect(obj.getElement('$attrs').getString('selected')).assertEqual('0');
      expect(obj.getElement('$attrs').getString('value')).assertEqual('orange2');
      expect(obj.getElement('$attrs').getString('defaultPickerItemHeight')).assertEqual('20.00vp');

      // Get the content of Initial value
      let driver = Driver.create()
      let strJson1 = inspector.getInspectorByKey('textContent1');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[TextPickerJsunit_static_0100] obj1: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('value: 0');
      console.info('[TextPickerJsunit_static_0100] END');
      done();
    });


    
    
    /**
     * @tc.number   TextPickerJsunit_static_0200
     * @tc.name     TextPickerJsunit_static_0200
     * @tc.desc     TextPickerJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('TextPickerJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Modify the attribute of TextPicker component
      console.info('[TextPickerJsunit_static_0200] START');
  AppStorage.setOrCreate<string[]>('fruits',new Array<string>('banana1', 'orange2', 'peach3', 'grape4'))
      await CommonFunc.sleep(1000);
  AppStorage.setOrCreate<int>('select',1)
      await CommonFunc.sleep(1000);
  AppStorage.setOrCreate<string>('parameterValue','peach3')
      await CommonFunc.sleep(1000);
  AppStorage.setOrCreate<number>('defaultPickerItemHeight',25)
      await CommonFunc.sleep(2000);

      // Get the attribute of TextPicker component
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextPickerJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      console.info("[TextPickerJsunit_static_0200] range: " + JSON.stringify(obj.getElement('$attrs').getString('range')));
      console.info("[TextPickerJsunit_static_0200] selected: " + JSON.stringify(obj.getElement('$attrs').getString('selected')));
      console.info("[TextPickerJsunit_static_0200] value: " + JSON.stringify(obj.getElement('$attrs').getString('value')));
      console.info("[TextPickerJsunit_static_0200] defaultPickerItemHeight: " + JSON.stringify(obj.getElement('$attrs').getString('defaultPickerItemHeight')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('range')).assertEqual('["icon:,text:banana1","icon:,text:orange2","icon:,text:peach3","icon:,text:grape4"]');
      expect(obj.getElement('$attrs').getString('selected')).assertEqual('1');
      expect(obj.getElement('$attrs').getString('value')).assertEqual('peach3');
      expect(obj.getElement('$attrs').getString('defaultPickerItemHeight')).assertEqual('25.00vp');
      console.info('[TextPickerJsunit_static_0200] END');
      done();
    });


    
    
    /**
     * @tc.number   TextPickerJsunit_static_0300
     * @tc.name     TextPickerJsunit_static_0300
     * @tc.desc     TextPickerJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('TextPickerJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify the functions of TextPicker component
      await CommonFunc.sleep(500);
      console.info('[TextPickerJsunit_static_0300] START');
      let component = CommonFunc.getComponentRectOnScreen('textPicker');
      let bottom = component.bottom
      let right = component.right
      let top = component.top
      let middle = (top + bottom) / 2
      console.info("[TextPickerJsunit_static_0300] bottom: " + JSON.stringify(bottom));
      console.info("[TextPickerJsunit_static_0300] right: " + JSON.stringify(right));
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(right / 2).toInt(), Math.round(middle + 50).toInt(), Math.round(right / 2).toInt(), Math.round(middle - 50).toInt());
      await CommonFunc.sleep(6000);
      let strJson = inspector.getInspectorByKey('textContent1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextPickerJsunit_static_0300] obj: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content') == 'value: 0').assertFalse();
      done();
    });


    
    
    /**
     * @tc.number   TextPickerJsunit_static_0400
     * @tc.name     TextPickerJsunit_static_0400
     * @tc.desc     TextPickerJsunit_static_0400
     * @tc.level    Level.LEVEL1
     */
it('TextPickerJsunit_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Illegal modification of properties of TextPicker component
      console.info('[TextPickerJsunit_static_0400] START');
    AppStorage.setOrCreate<string>('fruits','abc')
    AppStorage.setOrCreate<string>('select','test')
    AppStorage.setOrCreate<int>('parameterValue',123)
     AppStorage.setOrCreate<string>('defaultPickerItemHeight','abc')
      await CommonFunc.sleep(1000);

      // Get the attribute of TextPicker component
      let strJson = inspector.getInspectorByKey('textPicker');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextPickerJsunit_static_0400] component obj is: " + JSON.stringify(obj));
      console.info("[TextPickerJsunit_static_0400] range: " + JSON.stringify(obj.getElement('$attrs').getString('range')));
      console.info("[TextPickerJsunit_static_0400] selected: " + JSON.stringify(obj.getElement('$attrs').getString('selected')));
      console.info("[TextPickerJsunit_static_0400] value: " + JSON.stringify(obj.getElement('$attrs').getString('value')));
      console.info("[TextPickerJsunit_static_0400] defaultPickerItemHeight: " + JSON.stringify(obj.getElement('$attrs').getString('defaultPickerItemHeight')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('range')).assertEqual('["icon:,text:banana1","icon:,text:orange2","icon:,text:peach3","icon:,text:grape4"]');
      expect(obj.getElement('$attrs').getString('selected')).assertEqual('1');
      expect(obj.getElement('$attrs').getString('value')).assertEqual('peach3');
      expect(obj.getElement('$attrs').getString('defaultPickerItemHeight')).assertEqual('25.00vp');
      console.info('[TextPickerJsunit_static_0400] END');
      done();
    });
  })
}
