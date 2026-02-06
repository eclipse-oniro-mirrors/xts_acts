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


export default function DialogOptions() {
  describe('DialogOptions', () => {

    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.static", "EntryAbility")
    })

    beforeEach(async () => {
      console.info("DialogOptions beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/DialogOptions',
      }
      try {
        const DialogOptions = AppStorage.get<Router>("router") as Router
        DialogOptions.clear();
        let pages:router.RouterState = DialogOptions.getState();
        console.info("get DialogOptions state pages: " + JSON.stringify(pages));
        if (!("DialogOptions" == pages.name)) {
          console.info("get DialogOptions state pages.name: " + JSON.stringify(pages.name));
          // let result = await DialogOptions.pushUrl(options);
          DialogOptions.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push DialogOptions success: ");
        }
        let driver = Driver.create()
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.error("push DialogOptions page error: " + err);
        expect().assertFail();
      }
    });



    
    
/**
     * @tc.number   DialogOptions_static_0100
     * @tc.name     DialogOptions_static_0100
     * @tc.desc     DialogOptions_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_0100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click1'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundColor:string = column.getString('backgroundColor')

      let borderStyle:string = column.getString('borderStyle')
      let backgroundBlurStyle:string|undefined =  column.getElement('backgroundBlurStyle')?.getString('value')
      console.info('[DialogOptions_static_0100] column $attrs'+ JSON.stringify(column))

      console.info('[DialogOptions_static_0100] borderStyle'+ borderStyle)
      expect(borderStyle).assertEqual('BorderStyle.Solid')
      console.info('[DialogOptions_static_0100] backgroundBlurStyle'+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      console.info('[DialogOptions_static_0100] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');

      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin');
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_0100 END');
      done();
    });

    
    
/**
     * @tc.number   DialogOptions_static_0200
     * @tc.name     DialogOptions_static_0200
     * @tc.desc     DialogOptions_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_0200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click2'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundColor:string = column.getString('backgroundColor')
      let topLeft:string = column.getElement('borderRadius').getString('topLeft')
      let topRight:string = column.getElement('borderRadius').getString('topRight')
      let bottomLeft:string = column.getElement('borderRadius').getString('bottomLeft')
      console.info('[DialogOptions_static_0200] borderWidth'+ JSON.stringifyJsonElement(column.getElement('borderWidth')))
      let borderWidth:string = column.getString('borderWidth')
      console.info('[DialogOptions_static_0200] borderColor'+ JSON.stringifyJsonElement(column.getElement('borderColor')))
      let borderColor:string = column.getString('borderColor')
      let borderStyle:string = column.getString('borderStyle')
      let width:string|undefined = column.getElement('size')?.getString('width')
      let height:string|undefined  = column.getElement('size')?.getString('height')
      let shadow:string = column.getString('shadow')
      let backgroundBlurStyle:string |undefined =  column.getElement('backgroundBlurStyle')?.getString('value')
      console.info('[DialogOptions_static_0200] backgroundColor'+ backgroundColor)
      expect(column.getString('backgroundColor')).assertEqual('#FF6582F8')

      console.info('[DialogOptions_static_0200] topLeft'+ topLeft)
      expect(topLeft).assertEqual('20.00vp')

      console.info('[DialogOptions_static_0200] topRight'+ topRight)
      expect(topRight).assertEqual('20.00px')

      console.info('[DialogOptions_static_0200] bottomLeft'+ bottomLeft)
      expect(bottomLeft).assertEqual('0.00vp')


      console.info('[DialogOptions_static_0200] borderWidth'+ borderWidth)
      expect(borderWidth).assertEqual('1.00vp')

      console.info('[DialogOptions_static_0200] borderColor'+ borderColor)
      expect(borderColor).assertEqual('#FFFFC0CB')

      console.info('[DialogOptions_static_0200] borderStyle'+ borderStyle)
      expect(borderStyle).assertEqual('BorderStyle.Dotted')

      console.info('[DialogOptions_static_0200] width'+ width)
      expect(width).assertEqual('200.00vp')
      console.info('[DialogOptions_static_0200] height'+ height)
      expect(height).assertEqual('80.00vp')
      console.info('[DialogOptions_static_0200] shadow'+ shadow)
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultXS')
      console.info('[DialogOptions_static_0200] backgroundBlurStyle'+ backgroundBlurStyle)

      expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE')

      let button1 = await driver.findComponent(ON.text('确认'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_0200 END');
      done();
    });
    
    
    
/**
     * @tc.number   DialogOptions_static_0300
     * @tc.name     DialogOptions_static_0300
     * @tc.desc     DialogOptions_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_0300 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click3'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      console.info('DialogOptions_static_0300 ----' + JSON.stringifyJsonElement(obj));

      console.info('DialogOptions_static_0300 ----' + JSON.stringify(obj.getArray('$children')[1]));
      console.info('DialogOptions_static_0300 1111----' + JSON.stringify(obj.getArray('$children')[1].getArray('$children')[0]));
      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')

      // let backgroundColor:string|undefined = column.getString('backgroundColor')
      let borderStyle:string|undefined = column.getString('borderStyle')
      let width:string|undefined = column.getElement('size')?.getString('width')
      let height:string|undefined = column.getElement('size')?.getString('height')
      let shadow:string|undefined= column.getString('shadow')
      let backgroundBlurStyle:string|undefined =  column.getElement('backgroundBlurStyle')?.getString('value')



      console.info('[DialogOptions_static_0300] borderStyle'+ borderStyle)
      expect(borderStyle).assertEqual('BorderStyle.Solid')

      console.info('[DialogOptions_static_0300] height'+ shadow)
      expect(shadow).assertEqual('ShadowStyle.OuterDefaultSM')

      console.info('[DialogOptions_static_0300] height'+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      console.info('[DialogOptions_static_0300] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular');
      }
      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_0300 END');
      done();
    });

    
    
/**
     * @tc.number   DialogOptions_static_0400
     * @tc.name     DialogOptions_static_0400
     * @tc.desc     DialogOptions_static_0400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_0400 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click4'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')

      let backgroundColor:string|undefined = column.getString('backgroundColor')
      let borderStyle:string|undefined = column.getString('borderStyle')
      let width:string|undefined = column.getElement('size')?.getString('width')
      let height:string|undefined = column.getElement('size')?.getString('height')
      let shadow:string|undefined = column.getString('shadow')
      let backgroundBlurStyle:string|undefined =  column.getElement('backgroundBlurStyle')?.getString('value')

      console.info('[DialogOptions_static_0400] borderStyle'+ borderStyle)
      expect(borderStyle).assertEqual('BorderStyle.Solid')

      console.info('[DialogOptions_static_0400] shadow'+ shadow)
      expect(shadow).assertEqual('ShadowStyle.OuterFloatingSM')
      console.info('[DialogOptions_static_0400] backgroundBlurStyle'+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      console.info('[DialogOptions_static_0400] uniRenderFlag'+ uniRenderFlag)

      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick');
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_0400 END');
      done();
    });


    
    
/**
     * @tc.number   DialogOptions_static_0500
     * @tc.name     DialogOptions_static_0500
     * @tc.desc     DialogOptions_static_0500
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_0500 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click5'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let radius:string|undefined = column.getElement('shadow')?.getString('radius')
      let type:string|undefined = column.getElement('shadow')?.getString('type')
      let color:string|undefined = column.getElement('shadow')?.getString('color')
      let offsetX:string|undefined = column.getElement('shadow')?.getString('offsetX')
      let offsetY:string|undefined = column.getElement('shadow')?.getString('offsetY')
      let fill:string|undefined = column.getElement('shadow')?.getString('fill')
      let backgroundBlurStyle:string|undefined =  column.getElement('backgroundBlurStyle')?.getString('value')

      console.info('[DialogOptions_static_0500] radius '+ radius)
      console.info('[DialogOptions_static_0500] type '+ type)
      console.info('[DialogOptions_static_0500] color '+ color)
      console.info('[DialogOptions_static_0500] offsetX '+ offsetX)
      console.info('[DialogOptions_static_0500] offsetY '+ offsetY)
      console.info('[DialogOptions_static_0500] fill '+ fill)
      console.info('[DialogOptions_static_0500] backgroundBlurStyle '+ backgroundBlurStyle)

      expect(radius).assertEqual('10.000000')
      expect(type).assertEqual('1')
      expect(color).assertEqual('#FF94A0F0')
      expect(offsetX).assertEqual('2.000000')
      expect(offsetY).assertEqual('3.000000')
      expect(fill).assertEqual('1')
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN');
      }


      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_0500 END');
      done();
    });

    
    
/**
     * @tc.number   DialogOptions_static_0600
     * @tc.name     DialogOptions_static_0600
     * @tc.desc     DialogOptions_static_0600
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_0600 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click6'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string|undefined=  column.getElement('backgroundBlurStyle')?.getString('value')


      console.info('[DialogOptions_static_0600] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string|undefined = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR');
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_0600 END');
      done();
    });


     
    
/**
     * @tc.number   DialogOptions_static_0700
     * @tc.name     DialogOptions_static_0700
     * @tc.desc     DialogOptions_static_0700
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_0700 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click7'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string|undefined  =  column.getElement('backgroundBlurStyle')?.getString('value')

      console.info('[DialogOptions_static_0700] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK');
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_0700 END');
      done();
    });
    
    
/**
     * @tc.number   DialogOptions_static_0800
     * @tc.name     DialogOptions_static_0800
     * @tc.desc     DialogOptions_static_0800
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_0800 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click8'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string|undefined  =  column.getElement('backgroundBlurStyle')?.getString('value')

      console.info('[DialogOptions_static_0800] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK')
      }


      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_0800 END');
      done();
    });

    
    
/**
     * @tc.number   DialogOptions_static_0900
     * @tc.name     DialogOptions_static_0900
     * @tc.desc     DialogOptions_static_0900
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_0900 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click9'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string|undefined  =  column.getElement('backgroundBlurStyle')?.getString('value')

      console.info('[DialogOptions_static_0900] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN')
      }

      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_0900 END');
      done();
    });

    
    
/**
     * @tc.number   DialogOptions_static_1000
     * @tc.name     DialogOptions_static_1000
     * @tc.desc     DialogOptions_static_1000
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_1000 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click10'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string|undefined  =  column.getElement('backgroundBlurStyle')?.getString('value')

      console.info('[DialogOptions_static_1000] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN')
      }


      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_1000 END');
      done();
    });
    
    
/**
     * @tc.number   DialogOptions_static_1100
     * @tc.name     DialogOptions_static_1100
     * @tc.desc     DialogOptions_static_1100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_1100 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click11'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string|undefined  =  column.getElement('backgroundBlurStyle')?.getString('value')

      console.info('[DialogOptions_static_1100] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR')
      }


      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_1100 END');
      done();
    });

    
    
/**
     * @tc.number   DialogOptions_static_1200
     * @tc.name     DialogOptions_static_1200
     * @tc.desc     DialogOptions_static_1200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_1200 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click12'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string |undefined =  column.getElement('backgroundBlurStyle')?.getString('value')

      console.info('[DialogOptions_static_1200] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK')
      }
      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_1200 END');
      done();
    });

    
    
/**
     * @tc.number   DialogOptions_static_1300
     * @tc.name     DialogOptions_static_1300
     * @tc.desc     DialogOptions_static_1300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('DialogOptions_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('DialogOptions_static_1300 START');
      let driver =  Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('click13'));
      await ( button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column= obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string|undefined  =  column.getElement('backgroundBlurStyle')?.getString('value')

      console.info('[DialogOptions_static_1300] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs').getString('uniRender');
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK')
      }
      let button1 = await driver.findComponent(ON.text('确认'));
      await ( button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('DialogOptions_static_1300 END');
      done();
    });

  })
}