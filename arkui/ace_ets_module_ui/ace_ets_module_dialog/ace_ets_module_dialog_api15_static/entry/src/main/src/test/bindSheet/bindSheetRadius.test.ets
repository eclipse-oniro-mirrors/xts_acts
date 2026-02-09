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
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function bindSheetRadius() {
  describe('bindSheetRadius', () => {
  let currentDeviceIsPC = false
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.dialog.api15.static", "EntryAbility")
      
    })

    beforeEach(async () => {
      console.info("bindSheetRadius beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/bindSheet/bindSheetRadius",
      }
      try {
        const bindSheetRadius = AppStorage.get<Router>("router") as Router
        bindSheetRadius.clear();
        let pages:router.RouterState = bindSheetRadius.getState();
        console.info("get bindSheetRadius state pages: " + JSON.stringify(pages));
        if (!("bindSheetRadius" == pages.name)) {
          console.info("get bindSheetRadius state pages.name: " + JSON.stringify(pages.name));
          // let result = await bindSheetRadius.pushUrl(options);
          bindSheetRadius.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push bindSheetRadius success: " + JSON.stringify(result));
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push bindSheetRadius page error: " + err);
        expect().assertFail();
      }
    });



    
    

/**
     * @tc.number   bindSheetRadius_static_0100
     * @tc.name     bindSheetRadius_static_0100
     * @tc.desc     bindSheetRadius_static_0100
     * @tc.level    Level.LEVEL1
     */
it('bindSheetRadius_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('bindSheetRadius_static_0100 START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('bindSheet')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0100] bindSheet click');
      await CommonFunc.sleep(1000);

      
      let btn1: Component = (await driver.findComponent(ON.id('radiusPX'))) as Component;
      await ( btn1?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0100] radiusPX click');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_static_0100] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_static_0100] obj2.$children[1].$children[0] radiusPX is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[bindSheetRadius_static_0100] obj2.$children[1].$children[0] radiusPX is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderRadius')));
      let topLeft: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topLeft') as string
      let topRight: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topRight') as string
      expect(topLeft).assertEqual('20.00px');
      expect(topRight).assertEqual('20.00px');
      
      let btn2: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn2?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0100] END');
      done();
    });

    
    

/**
     * @tc.number   bindSheetRadius_static_0200
     * @tc.name     bindSheetRadius_static_0200
     * @tc.desc     bindSheetRadius_static_0200
     * @tc.level    Level.LEVEL1
     */
it('bindSheetRadius_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('bindSheetRadius_static_0200 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('bindSheet')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0200] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('radiusVP')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0200] radiusVP click');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_static_0200] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_static_0200] obj2.$children[1].$children[0] radiusVP is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[bindSheetRadius_static_0200] obj2.$children[1].$children[0] radiusVP is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderRadius')));
      
      let topLeft: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topLeft') as string
      let topRight: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topRight') as string
      expect(topLeft).assertEqual('20.00vp');
      expect(topRight).assertEqual('20.00vp');
      let btn2: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn2?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0200] END');
      done();
    });

    
    

/**
     * @tc.number   bindSheetRadius_static_0300
     * @tc.name     bindSheetRadius_static_0300
     * @tc.desc     bindSheetRadius_static_0300
     * @tc.level    Level.LEVEL1
     */
it('bindSheetRadius_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('bindSheetRadius_static_0300 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('bindSheet')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0300] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component =(  await driver.findComponent(ON.id('radiusFP')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0300] radiusFP click');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_static_0300] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_static_0300] obj2.$children[1].$children[0] radiusFP is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[bindSheetRadius_static_0300] obj2.$children[1].$children[0] radiusFP is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderRadius')));
      
      let topLeft: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topLeft') as string
      let topRight: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topRight') as string
      expect(topLeft).assertEqual('20.00fp');
      expect(topRight).assertEqual('20.00fp');
      let btn2: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn2?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0300] END');
      done();
    });

    
    

/**
     * @tc.number   bindSheetRadius_static_0400
     * @tc.name     bindSheetRadius_static_0400
     * @tc.desc     bindSheetRadius_static_0400
     * @tc.level    Level.LEVEL1
     */
it('bindSheetRadius_static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('bindSheetRadius_static_0400 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('bindSheet')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0400] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = (  await driver.findComponent(ON.id('borderRadiuses')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0400] borderRadiuses click');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_static_0400] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_static_0400] obj2.$children[1].$children[0] borderRadiuses is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[bindSheetRadius_static_0400] obj2.$children[1].$children[0] borderRadiuses is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderRadius')));
      
      let topLeft: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topLeft') as string
      let topRight: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topRight') as string
      expect(topLeft).assertEqual('10.00px');
      expect(topRight).assertEqual('20.00vp');
      let btn2: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn2?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0400] END');
      done();
    });

    
    

/**
     * @tc.number   bindSheetRadius_static_0500
     * @tc.name     bindSheetRadius_static_0500
     * @tc.desc     bindSheetRadius_static_0500
     * @tc.level    Level.LEVEL1
     */
it('bindSheetRadius_static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('bindSheetRadius_static_0500 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('bindSheet')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0500] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = (  await driver.findComponent(ON.id('localizedBorderRadiuses')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0500] localizedBorderRadiuses click');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_static_0500] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_static_0500] obj2.$children[1].$children[0] localizedBorderRadiuses is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[bindSheetRadius_static_0500] obj2.$children[1].$children[0] localizedBorderRadiuses is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderRadius')));
      
      let topLeft: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topLeft') as string
      let topRight: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topRight') as string
      expect(topLeft).assertEqual('100.00px');
      expect(topRight).assertEqual('0.00vp');
      let btn2: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn2?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0400] END');
      done();
    });

    
    

/**
     * @tc.number   bindSheetRadius_static_0600
     * @tc.name     bindSheetRadius_static_0600
     * @tc.desc     bindSheetRadius_static_0600
     * @tc.level    Level.LEVEL1
     */
it('bindSheetRadius_static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('bindSheetRadius_static_0600 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('bindSheet')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0600] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = (await driver.findComponent(ON.id('undefined'))) as Component;
      await ( btn1?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0600] undefined click');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_static_0600] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_static_0600] obj2.$children[1].$children[0] undefined is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[bindSheetRadius_static_0600] obj2.$children[1].$children[0] undefined is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderRadius')));
      
      let topLeft: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topLeft') as string
      let topRight: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topRight') as string
      if(currentDeviceIsPC){
        expect(topLeft).assertEqual('16.00vp');
        expect(topRight).assertEqual('16.00vp');
      }else{
        expect(topLeft).assertEqual('32.00vp');
        expect(topRight).assertEqual('32.00vp');
      }
      let btn2: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn2?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0400] END');
      done();
    });
    
    

/**
     * @tc.number   bindSheetRadius_static_0700
     * @tc.name     bindSheetRadius_static_0700
     * @tc.desc     bindSheetRadius_static_0700
     * @tc.level    Level.LEVEL1
     */
it('bindSheetRadius_static_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('bindSheetRadius_static_0700 START');
      await CommonFunc.sleep(1000)
      let driver: Driver = Driver.create();
      let btn: Component = ( await driver.findComponent(ON.id('bindSheet')) ) as Component;
      await ( btn?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0700] bindSheet click');
      await CommonFunc.sleep(1000);

      let btn1: Component = ( await driver.findComponent(ON.id('null')) ) as Component;
      await ( btn1?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0700] null click');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(1000);
      console.info("[bindSheetRadius_static_0700] obj2 is: " + JSON.stringify(obj2));

      console.info("[bindSheetRadius_static_0700] obj2.$children[1].$children[0] null is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')));
      console.info("[bindSheetRadius_static_0700] obj2.$children[1].$children[0] null is: " + JSON.stringify(obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs').getElement('borderRadius')));
      
      let topLeft: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topLeft') as string
      let topRight: string = obj2.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')?.getElement('borderRadius').getString('topRight') as string

      if(currentDeviceIsPC){
        expect(topLeft).assertEqual('16.00vp');
        expect(topRight).assertEqual('16.00vp');
      }else{
        expect(topLeft).assertEqual('32.00vp');
        expect(topRight).assertEqual('32.00vp');
      }
      let btn2: Component = ( await driver.findComponent(ON.id('close')) ) as Component;
      await ( btn2?.click() as Promise<void>);
      console.info('[bindSheetRadius_static_0400] END');
      done();
    });

  })
}