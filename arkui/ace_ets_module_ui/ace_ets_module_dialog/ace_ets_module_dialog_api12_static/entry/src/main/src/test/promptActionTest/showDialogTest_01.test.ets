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

export default function showDialogTest_01() {
  describe('showDialogTest_01', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.api12.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showDialogTest_01',
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
     * @tc.number   showDialogTest_static_0800
     * @tc.name     showDialogTest_static_0800
     * @tc.desc     showDialogTest_static_0800
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_0800 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click7')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string
      console.info('[showDialogTest_0800] backgroundBlurStyle '+ backgroundBlurStyle)
      expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE')

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0800 END');
      done();
    });



/**
     * @tc.number   showDialogTest_static_0900
     * @tc.name     showDialogTest_static_0900
     * @tc.desc     showDialogTest_static_0900
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_0900 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click8')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_0900] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_0900] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THIN')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_0900 END');
      done();
    });



/**
     * @tc.number   showDialogTest_static_1000
     * @tc.name     showDialogTest_static_1000
     * @tc.desc     showDialogTest_static_1000
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_1000 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click9')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_1000] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_1000] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THIN')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1000 END');
      done();
    });


/**
     * @tc.number   showDialogTest_static_1100
     * @tc.name     showDialogTest_static_1100
     * @tc.desc     showDialogTest_static_1100
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_1100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click10')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_1100] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_1100] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_REGULAR')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1100 END');
      done();
    });



/**
     * @tc.number   showDialogTest_static_1200
     * @tc.name     showDialogTest_static_1200
     * @tc.desc     showDialogTest_static_1200
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_1200 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click11')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_1200] backgroundBlurStyle '+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_1200] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_THICK')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1200 END');
      done();
    });



/**
     * @tc.number   showDialogTest_static_1300
     * @tc.name     showDialogTest_static_1300
     * @tc.desc     showDialogTest_static_1300
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_1300 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click12')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_1300] backgroundBlurStyle '+ backgroundBlurStyle)

      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_1200] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1300 END');
      done();
    });


/**
     * @tc.number   showDialogTest_static_1400
     * @tc.name     showDialogTest_static_1400
     * @tc.desc     showDialogTest_static_1400
     * @tc.level    TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0
     */
it('showDialogTest_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('showDialogTest_1400 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button:Component = await driver.findComponent(ON.id('click13')) as Component;
      await button.click();
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);

      let column = obj.getArray('$children')[1].getArray('$children')[0].getElement('$attrs')
      let backgroundBlurStyle:string =  column.getElement('backgroundBlurStyle')?.getString('value') as string

      console.info('[showDialogTest_1400] backgroundBlurStyle '+ backgroundBlurStyle)
      let uniRenderFlag: string = obj.getArray('$children')[1].getElement('$attrs')?.getString('uniRender') as string;
      console.info('[DialogOptions_1200] uniRenderFlag'+ uniRenderFlag)
      if (uniRenderFlag == 'false') {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.NONE');
      } else {
        expect(backgroundBlurStyle).assertEqual('BlurStyle.COMPONENT_ULTRA_THICK')
      }

      let button1:Component = await driver.findComponent(ON.text('button1')) as Component;
      await button1.click();
      await CommonFunc.sleep(1000);
      console.info('showDialogTest_1400 END');
      done();
    });
  })
}