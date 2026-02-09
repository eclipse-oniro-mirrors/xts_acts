/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function EnableToolBarAdaptation() {
  describe('EnableToolBarAdaptation', () => {
    beforeEach(async (done: Function) => {
      console.info('EnableToolBarAdaptation beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navigation/EnableToolBarAdaptation',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get EnableToolBarAdaptation state pages:' + JSON.stringify(pages));
        if (!('EnableToolBarAdaptation' == pages.name)) {
          console.info('get EnableToolBarAdaptation pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push EnableToolBarAdaptation page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EnableToolBarAdaptation page error:' + err);
      }
      console.info('EnableToolBarAdaptation beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('EnableToolBarAdaptation after each called');
    });


    /**
     * @tc.name   EnableToolBarAdaptation_0100
     * @tc.number EnableToolBarAdaptation_0100
     * @tc.desc   Test Navigation\NavDestination hideItemValue is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableToolBarAdaptation_0100',  Level.LEVEL0, async (done: Function) => {
      console.info('EnableToolBarAdaptation_0100 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      await driver.assertComponentExist(ON.text('a'));
      await driver.delayMs(500);
      let btn1: Component = await driver.findComponent(ON.id('showTextId'));
      await btn1.click()
      console.info('[EnableToolBarAdaptation_0100] btn1 click');
      await driver.delayMs(500);

      let text: Component | null = await driver.findComponent(ON.text('a'));
      await driver.delayMs(500);
      expect(text).assertEqual(null);
      console.info('EnableToolBarAdaptation_0100 END');
      done();
    });

    /**
     * @tc.name   EnableToolBarAdaptation_0200
     * @tc.number EnableToolBarAdaptation_0200
     * @tc.desc   Test navDestination hideItemValue is true and false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableToolBarAdaptation_0200',  Level.LEVEL0, async (done: Function) => {
      console.info('EnableToolBarAdaptation_0200 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushOneId'));
      await btn1.click()
      console.info('[EnableToolBarAdaptation_0200] btn1 click');

      await driver.assertComponentExist(ON.text('a1'));
      await driver.delayMs(500);

      let btn2: Component = await driver.findComponent(ON.id('navShowTextId'));
      await btn2.click()
      console.info('[EnableToolBarAdaptation_0200] btn2 click');
      await driver.delayMs(500);

      let text: Component | null = await driver.findComponent(ON.text('a1'));
      await driver.delayMs(500);
      expect(text).assertEqual(null);

      let btn3: Component = await driver.findComponent(ON.id('popId'));
      await btn3.click();
      console.info('[EnableToolBarAdaptation_0200] btn3 click');
      console.info('EnableToolBarAdaptation_0200 END');
      done();
    });

    /**
     * @tc.name   EnableToolBarAdaptation_0300
     * @tc.number EnableToolBarAdaptation_0300
     * @tc.desc   Test Navigation EnableToolBarAdaptation is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableToolBarAdaptation_0300',  Level.LEVEL0, async (done: Function) => {
      console.info('EnableToolBarAdaptation_0300 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      await driver.assertComponentExist(ON.type('ToolBar'));
      await driver.delayMs(500);

      let landscapeBtn: Component = await driver.findComponent(ON.id('landscapeId'));
      await landscapeBtn.click();
      console.info('[EnableToolBarAdaptation_0300] landscapeBtn click');
      await driver.delayMs(1000);

      await driver.assertComponentExist(ON.type('ToolBar'));
      console.info('[EnableToolBarAdaptation_0300] ROTATION_90 ToolBar exist');
      await driver.delayMs(500);

      let btn1: Component = await driver.findComponent(ON.id('pushOneId'));
      await btn1.click();
      console.info('[EnableToolBarAdaptation_0300] btn1 click');
      await driver.delayMs(500);

      await driver.assertComponentExist(ON.type('ToolBar'));
      let toolBar1: Component | null = await driver.findComponent(ON.type('ToolBar'));
      expect(toolBar1 !== null).assertTrue();
      console.info('[EnableToolBarAdaptation_0300] navDestination ToolBar exist');

      await driver.delayMs(500);
      let btn3: Component = await driver.findComponent(ON.id('popId'));
      await btn3.click();
      console.info('[EnableToolBarAdaptation_0300] btn3 click');
      await driver.delayMs(1000);

      let portraitBtn: Component = await driver.findComponent(ON.id('portraitId'));
      await portraitBtn.click();
      console.info('[EnableToolBarAdaptation_0300] portraitBtn click');
      await driver.delayMs(1000);
      console.info('EnableToolBarAdaptation_0300 END');
      done();
    });

    /**
     * @tc.name   EnableToolBarAdaptation_0400
     * @tc.number EnableToolBarAdaptation_0400
     * @tc.desc   Test Navigation\navDestination EnableToolBarAdaptation is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('EnableToolBarAdaptation_0400',  Level.LEVEL0, async (done: Function) => {
      console.info('EnableToolBarAdaptation_0400 START');
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1: Component = await driver.findComponent(ON.id('changeEnableId'));
      await btn1.click();
      console.info('[EnableToolBarAdaptation_0400] btn1 click');

      let navigation: Component = await driver.findComponent(ON.type('Navigation'));
      let rect = await navigation.getBounds();
      let navigationWidth = rect.right;
      console.info('[EnableToolBarAdaptation_0400] navigationWidth is ', navigationWidth);
      if (navigationWidth < 1500) {
        await driver.assertComponentExist(ON.type('ToolBar'));
        console.info('[EnableToolBarAdaptation_0400] ToolBar is exist');
        await driver.delayMs(1000);
      }

      let landscapeBtn: Component = await driver.findComponent(ON.id('landscapeId'));
      await landscapeBtn.click();
      console.info('[EnableToolBarAdaptation_0400] landscapeBtn click');
      await driver.delayMs(1000);

      let toolBar1: Component | null = await driver.findComponent(ON.type('ToolBar'));
      await driver.delayMs(500);
      if (toolBar1 == null) {
        expect(toolBar1).assertEqual(null)
        console.info('[EnableToolBarAdaptation_0400] Navigation ToolBar is not exist');
        await driver.delayMs(500);
        await driver.assertComponentExist(ON.type('NavigationMenu'));
        console.info('[EnableToolBarAdaptation_0400] ROTATION_90 ToolBar is exist');
      }

      let btn2: Component = await driver.findComponent(ON.id('pushOneId'));
      await btn2.click();
      console.info('[EnableToolBarAdaptation_0400] btn2 click');
      await driver.delayMs(500);

      let toolBar2: Component | null = await driver.findComponent(ON.type('ToolBar'));
      await driver.delayMs(500);

      if (toolBar2 == null) {
        expect(toolBar2).assertEqual(null)
        console.info('[EnableToolBarAdaptation_0400] navDestination ToolBar is not exist');
        await driver.delayMs(500);
        await driver.assertComponentExist(ON.type('NavigationMenu'));
        console.info('[EnableToolBarAdaptation_0400] navDestination ROTATION_90 NavigationMenu is exist');
      }
      
      let btn3: Component = await driver.findComponent(ON.id('popId'));
      await btn3.click();
      console.info('[EnableToolBarAdaptation_0400] btn3 click');
      await driver.delayMs(1000);

      let portraitBtn: Component = await driver.findComponent(ON.id('portraitId'));
      await portraitBtn.click();
      console.info('[EnableToolBarAdaptation_0400] portraitBtn click');
      await driver.delayMs(1000);
      console.info('EnableToolBarAdaptation_0400 END');
      done();
    });

  })
}