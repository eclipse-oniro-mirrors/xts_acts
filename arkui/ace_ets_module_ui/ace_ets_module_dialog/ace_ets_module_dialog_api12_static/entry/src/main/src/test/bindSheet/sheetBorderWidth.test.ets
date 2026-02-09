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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
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
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function sheetBorderWidth() {
  describe('sheetBorderWidth', () => {
    let currentDeviceIsPC = false
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
      
      console.info("popupKeyboardAvoidMode beforeAll start")
      AppStorage.get<number>('winLeft') == 0 ? true : false
      console.info("the value of the currentDeviceIsPC is " + currentDeviceIsPC)
      console.info("the value of the deviceType is " + deviceInfo.deviceType)
    })

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/bindSheet/sheetBorderWidth',
      }
      try {
        const sheetBorderWidth = AppStorage.get<Router>("router") as Router
        sheetBorderWidth.clear();
        let pages:router.RouterState = sheetBorderWidth.getState();
        console.info('get sheetBorderWidth state success ' + JSON.stringify(pages));
        if (!('sheetBorderWidth' == pages.name)) {
          console.info('get sheetBorderWidth state success ' + JSON.stringify(pages.name));
          
          sheetBorderWidth.pushUrl(options)
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error('push sheetBorderWidth page error ' + JSON.stringify(err));
      }
    });

    
    
/**
     * @tc.number   sheetBorderWidth_static_0100
     * @tc.name     sheetBorderWidth_static_0100
     * @tc.desc     sheetBorderWidth_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('sheetBorderWidth_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sheetBorderWidth_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('bindSheet_borderWidth')) as Component;
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[sheetBorderWidth_static_0100] obj2 is: " + inspector.getInspectorTree());

      console.info("[sheetBorderWidth_static_0100] obj2.getArray('$children') is: " + JSON.stringify(obj2.getArray('$children')));
      console.info("[sheetBorderWidth_static_0100] obj2.getArray('$children')[1].getArray('$children')[0] borderWidth is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderWidth')));
      let left:string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getString('borderWidth')
      expect(left).assertEqual('10.00vp');
      
      let btn2: Component = await driver.findComponent(ON.id('close1_border')) as Component;
      await (btn2?.click() as Promise<void>);
      console.info('sheetBorderWidth_static_0100 END');
      done();
    });


    
    
/**
     * @tc.number   sheetBorderWidth_static_0200
     * @tc.name     sheetBorderWidth_static_0200
     * @tc.desc     sheetBorderWidth_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('sheetBorderWidth_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sheetBorderWidth_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('bindSheet_borderWidth1')) as Component;
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[sheetBorderWidth_static_0200] obj2 is: " + JSON.stringify(obj2));

      console.info("[sheetBorderWidth_static_0200] obj2.getArray('$children')[1].getArray('$children')[0] borderWidth is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[sheetBorderWidth_static_0200] obj2.getArray('$children')[1].getArray('$children')[0] borderWidth is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderWidth')));
      let left:string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderWidth').getString('left')
      let right:string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderWidth').getString('right')
      let top:string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderWidth').getString('top')
      let bottom:string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderWidth').getString('bottom')
      expect(top).assertEqual('10.00px');
      expect(right).assertEqual('5.00vp');
      expect(left).assertEqual('5.00vp');
      expect(bottom).assertEqual('0.00vp');
      
      let btn2: Component  = await driver.findComponent(ON.id('close1_border')) as Component;
      await (btn2?.click() as Promise<void>);
      console.info('sheetBorderWidth_static_0200 END');
      done();
    });

    
    
/**
     * @tc.number   sheetBorderWidth_static_0300
     * @tc.name     sheetBorderWidth_static_0300
     * @tc.desc     sheetBorderWidth_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('sheetBorderWidth_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('sheetBorderWidth_static_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('bindSheet_borderWidth2')) as Component;
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[sheetBorderWidth_static_0300] obj2 is: " + JSON.stringify(obj2));

      console.info("[sheetBorderWidth_static_0300] obj2.getArray('$children')[1].getArray('$children')[0] borderWidth is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[sheetBorderWidth_static_0300] obj2.getArray('$children')[1].getArray('$children')[0] borderWidth is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderWidth')));
      let borderWidth = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getString('borderWidth')

      if(currentDeviceIsPC){
        expect(borderWidth).assertEqual('1.00px');
      }else{
        expect(borderWidth).assertEqual('0.00vp');
      }
            
      let btn2: Component = await driver.findComponent(ON.id('close1_border')) as Component;
      await (btn2?.click() as Promise<void>);
      console.info('sheetBorderWidth_static_0300 END');
      done();
    });

  })
}