'use static';
/**
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
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;



export default function CustomDialogBorderColor() {
  describe('CustomDialogBorderColor', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info("CustomDialogBorderColor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomDialog/CustomDialogBorderColor',
      }
      try {
        const CustomDialogBorderColor = AppStorage.get<Router>("router") as Router
        CustomDialogBorderColor.clear();
        let pages:router.RouterState = CustomDialogBorderColor.getState();
        console.info("get CustomDialogBorderColor state pages: " + JSON.stringify(pages));
        if (!("CustomDialogBorderColor" == pages.name)) {
          console.info("get CustomDialogBorderColor state pages.name: " + JSON.stringify(pages.name));
          
          CustomDialogBorderColor.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push CustomDialogBorderColor page error: " + err);
        expect().assertFail();
      }
    });



    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CustomDialogBorderColor after each called");
    });


    
/**
     * @tc.number   CustomDialogBorderColor_static_0100
     * @tc.name     CustomDialogBorderColor_static_0100
     * @tc.desc     CustomDialogBorderColor_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('CustomDialogBorderColor_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CustomDialogBorderColor_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('color')) as Component;
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let obj2= JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[CustomDialogBorderColor_static_0100] obj2 is: " + JSON.stringify(obj2));

      console.info("[CustomDialogBorderColor_static_0100] obj2.getArray('$children')[1].getArray('$children')[0] borderColor is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[CustomDialogBorderColor_static_0100] obj2.getArray('$children')[1].getArray('$children')[0] borderColor is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getString('borderColor')));
      let borderColor:string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getString('borderColor')

      expect(borderColor).assertEqual('#FF0000FF');
      let btn2: Component|null = (await driver.findComponent(ON.id('close'))) ;
      await (btn2?.click() as Promise<void>);
      console.info('CustomDialogBorderColor_static_0100 END');
      done();
    });


    
    
/**
     * @tc.number   CustomDialogBorderColor_static_0200
     * @tc.name     CustomDialogBorderColor_static_0200
     * @tc.desc     CustomDialogBorderColor_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('CustomDialogBorderColor_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CustomDialogBorderColor_static_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('color1')) as Component;
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let obj2= JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[CustomDialogBorderColor_static_0200] obj2 is: " + JSON.stringify(obj2));

      console.info("[CustomDialogBorderColor_static_0200] obj2.getArray('$children')[1].getArray('$children')[0] borderColor is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[CustomDialogBorderColor_static_0200] obj2.getArray('$children')[1].getArray('$children')[0] borderColor is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getString('borderColor')));
      let borderColor:string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getString('borderColor')

      expect(borderColor).assertEqual('#FF6582F8');
      let btn2: Component|null = (await driver.findComponent(ON.id('close'))) ;
      await (btn2?.click() as Promise<void>);
      console.info('CustomDialogBorderColor_static_0200 END');
      done();
    });
   
  })
}