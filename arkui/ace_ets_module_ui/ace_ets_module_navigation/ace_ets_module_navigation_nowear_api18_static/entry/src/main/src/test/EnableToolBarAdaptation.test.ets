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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function EnableToolBarAdaptation() {
  describe('EnableToolBarAdaptation', () => {

    beforeAll(() => {
      console.info("stepper beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear18.static", "EntryAbility")

    });

    beforeEach(async () => {
      console.info('EnableToolBarAdaptation beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/EnableToolBarAdaptation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear()
        let pages = routerInstance.getState();
        console.info('get EnableToolBarAdaptation state pages:' + JSON.stringify(pages));
        if (!('EnableToolBarAdaptation' == pages.name)) {
          console.info('get EnableToolBarAdaptation pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push EnableToolBarAdaptation page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EnableToolBarAdaptation page error:' + err);
      }
      console.info('EnableToolBarAdaptation beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('EnableToolBarAdaptation after each called');
    });


    /**
     * @tc.number    EnableToolBarAdaptation_static_0100
     * @tc.name      EnableToolBarAdaptation_static_0100
     * @tc.desc      Test Navigation\NavDestination hideItemValue is false
     * @tc.level     Level.LEVEL0
     */
    it('EnableToolBarAdaptation_static_0100',  Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('EnableToolBarAdaptation_static_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      await driver.assertComponentExist(ON.text('a'));
      await driver.delayMs(500);
      let btn1: Component = await driver.findComponent(ON.id('showTextId')) as Component;
      await btn1.click()
      console.info('[EnableToolBarAdaptation_static_0100] btn1 click');
      await driver.delayMs(500);

      let text: Component | null = await driver.findComponent(ON.text('a'));
      await driver.delayMs(500);
      expect(text).assertEqual(null);
      console.info('EnableToolBarAdaptation_static_0100 END');
      done();
    });

    
    /**
     * @tc.number   EnableToolBarAdaptation_static_0200
     * @tc.name     EnableToolBarAdaptation_static_0200
     * @tc.desc     EnableToolBarAdaptation_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('EnableToolBarAdaptation_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        console.info('EnableToolBarAdaptation_static_0200 START');
        await CommonFunc.sleep(500);

        let driver = Driver.create();
        await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushOneId')) as Component;
      await btn1.click()
      console.info('[EnableToolBarAdaptation_static_0200] btn1 click');
      await driver.delayMs(3000);

        await driver.assertComponentExist(ON.text('a1'));
        await driver.delayMs(500);

        let btn2: Component = await driver.findComponent(ON.id('navShowTextId')) as Component;
        await btn2.click()
        console.info('[EnableToolBarAdaptation_static_0200] btn2 click');
        await driver.delayMs(500);

        let text: Component | null = await driver.findComponent(ON.text('a1'));
        await driver.delayMs(500);
        expect(text).assertEqual(null);

        let btn3: Component = await driver.findComponent(ON.id('popId')) as Component;
        await btn3.click();
        console.info('[EnableToolBarAdaptation_static_0200] btn3 click');
        console.info('EnableToolBarAdaptation_static_0200 END');
        done();
      }catch(error){
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   EnableToolBarAdaptation_static_0300
     * @tc.name     EnableToolBarAdaptation_static_0300
     * @tc.desc     EnableToolBarAdaptation_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('EnableToolBarAdaptation_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        console.info('EnableToolBarAdaptation_static_0300 START');
        await CommonFunc.sleep(500);

        let driver = Driver.create();
        await driver.delayMs(500);

        await driver.assertComponentExist(ON.type('ToolBar'));
        await driver.delayMs(500);

        let landscapeBtn: Component = await driver.findComponent(ON.id('landscapeId')) as Component;
        await landscapeBtn.click();
        console.info('[EnableToolBarAdaptation_static_0300] landscapeBtn click');
        await driver.delayMs(1000);

        await driver.assertComponentExist(ON.type('ToolBar'));
        console.info('[EnableToolBarAdaptation_static_0300] ROTATION_90 ToolBar exist');
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('pushOneId')) as Component;
        await btn1.click();
        console.info('[EnableToolBarAdaptation_static_0300] btn1 click');
        await driver.delayMs(500);

        await driver.assertComponentExist(ON.type('ToolBar'));
        console.info('[EnableToolBarAdaptation_static_0300] navDestination ToolBar exist');

        await driver.delayMs(500);
        let btn3: Component = await driver.findComponent(ON.id('popId')) as Component;
        await btn3.click();
        console.info('[EnableToolBarAdaptation_static_0300] btn3 click');
        await driver.delayMs(1000);

        let portraitBtn: Component = await driver.findComponent(ON.id('portraitId')) as Component;
        await portraitBtn.click();
        console.info('[EnableToolBarAdaptation_static_0300] portraitBtn click');
        await driver.delayMs(1000);
        console.info('EnableToolBarAdaptation_static_0300 END');
        done();
      }catch(error){
        expect().assertFail();
      }
    });

    
    /**
     * @tc.number   EnableToolBarAdaptation_static_0400
     * @tc.name     EnableToolBarAdaptation_static_0400
     * @tc.desc     EnableToolBarAdaptation_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('EnableToolBarAdaptation_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try{
        console.info('EnableToolBarAdaptation_static_0400 START');
        await CommonFunc.sleep(500);

        let driver = Driver.create();
        await driver.delayMs(1000);

        let btn1: Component = await driver.findComponent(ON.id('changeEnableId')) as Component;
        await btn1.click();
        console.info('[EnableToolBarAdaptation_static_0400] btn1 click');

        let navigation: Component = await driver.findComponent(ON.type('Navigation')) as Component;
        let rect = await navigation.getBounds();
        let navigationWidth = rect.right;
        console.info('[EnableToolBarAdaptation_static_0400] navigationWidth is ', navigationWidth);
        if (navigationWidth < 1500) {
          await driver.assertComponentExist(ON.type('ToolBar'));
          console.info('[EnableToolBarAdaptation_static_0400] ToolBar is exist');
          await driver.delayMs(1000);
        }

        let landscapeBtn: Component = await driver.findComponent(ON.id('landscapeId')) as Component;
        await landscapeBtn.click();
        console.info('[EnableToolBarAdaptation_static_0400] landscapeBtn click');
        await driver.delayMs(1000);

      let toolBar1: Component | null = await driver.findComponent(ON.type('ToolBar'));
      await driver.delayMs(500);
      if (toolBar1 == null) {
        expect(toolBar1).assertEqual(null)
        console.info('[EnableToolBarAdaptation_static_0400] Navigation ToolBar is not exist');
        await driver.delayMs(500);
        await driver.assertComponentExist(ON.type('NavigationMenu'));
        console.info('[EnableToolBarAdaptation_static_0400] ROTATION_90 ToolBar is exist');
      }
      await CommonFunc.sleep(5000);
      let btn2: Component = await driver.findComponent(ON.id('pushOneId')) as Component;
      await btn2.click();
      console.info('[EnableToolBarAdaptation_static_0400] btn2 click');
      await driver.delayMs(500);

        let toolBar2: Component | null = await driver.findComponent(ON.type('ToolBar'));
        await driver.delayMs(500);

        if (toolBar2 == null) {
          expect(toolBar2).assertEqual(null)
          console.info('[EnableToolBarAdaptation_static_0400] navDestination ToolBar is not exist');
          await driver.delayMs(500);
          await driver.assertComponentExist(ON.type('NavigationMenu'));
          console.info('[EnableToolBarAdaptation_static_0400] navDestination ROTATION_90 NavigationMenu is exist');
        }

        let btn3: Component = await driver.findComponent(ON.id('popId')) as Component;
        await btn3.click();
        console.info('[EnableToolBarAdaptation_static_0400] btn3 click');
        await driver.delayMs(1000);

        let portraitBtn: Component = await driver.findComponent(ON.id('portraitId')) as Component;
        await portraitBtn.click();
        console.info('[EnableToolBarAdaptation_static_0400] portraitBtn click');
        await driver.delayMs(1000);
        console.info('EnableToolBarAdaptation_static_0400 END');
        done();
      }catch(error){
        expect().assertFail();
      }
    });

  })
}