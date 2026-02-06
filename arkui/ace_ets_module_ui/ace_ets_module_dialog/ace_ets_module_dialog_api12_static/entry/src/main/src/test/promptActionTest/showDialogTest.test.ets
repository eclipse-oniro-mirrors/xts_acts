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
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import window from '@ohos.window';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function showDialogTest() {
  describe('showDialogTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showDialogTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info('get showDialogTest state success ' + JSON.stringify(pages));
        if (!('showDialogTest' == pages.name)) {
          console.info('get showDialogTest state success ' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push showDialogTest page error ' + JSON.stringify(err));
      }
    });

    
    
/**
     * @tc.number   showDialogTest_static_0100
     * @tc.name     showDialogTest_static_0100
     * @tc.desc     showDialogTest_static_0100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      console.log('abc123')
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      console.log('efg123')
      await CommonFunc.sleep(2000);
      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string
      console.info('[showDialogTest_0100] backgroundBlurStyle'+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_0100] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thin')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0100 END');
      done();
    });

    
    
/**
     * @tc.number   showDialogTest_static_0200
     * @tc.name     showDialogTest_static_0200
     * @tc.desc     showDialogTest_static_0200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_0200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click1')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      console.log('abc123')
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      console.log('efg123')
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundColor:string = column.getString('backgroundColor')

      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_0200] backgroundBlurStyle'+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_0200] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Regular')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0200 END');
      done();
    });


    
/**
     * @tc.number   showDialogTest_static_0300
     * @tc.name     showDialogTest_static_0300
     * @tc.desc     showDialogTest_static_0300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_0300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click2')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundColor:string = column.getString('backgroundColor')

      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_0300] backgroundBlurStyle'+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_0300] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THIN')
      }


      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0300 END');
      done();
    });


    
/**
     * @tc.number   showDialogTest_static_0400
     * @tc.name     showDialogTest_static_0400
     * @tc.desc     showDialogTest_static_0400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_0400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click3')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundColor:string = column.getString('backgroundColor')

      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_0400] shadow'+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_0400] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.Thick')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0400 END');
      done();
    });



    
/**
     * @tc.number   showDialogTest_static_0500
     * @tc.name     showDialogTest_static_0500
     * @tc.desc     showDialogTest_static_0500
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_0500 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click4')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string
      console.info('[showDialogTest_0500] backgroundBlurStyle '+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_0500] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_REGULAR')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0500 END');
      done();
    });


    
/**
     * @tc.number   showDialogTest_static_0600
     * @tc.name     showDialogTest_static_0600
     * @tc.desc     showDialogTest_static_0600
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_0600 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click5')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_0600] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_0600] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_THICK')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0600 END');
      done();
    });



    
/**
     * @tc.number   showDialogTest_static_0700
     * @tc.name     showDialogTest_static_0700
     * @tc.desc     showDialogTest_static_0700
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_0700 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click6')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_0700] backgroundBlurStyle '+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_0700] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.BACKGROUND_ULTRA_THICK')
      }
      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0700 END');
      done();
    });
  })
}