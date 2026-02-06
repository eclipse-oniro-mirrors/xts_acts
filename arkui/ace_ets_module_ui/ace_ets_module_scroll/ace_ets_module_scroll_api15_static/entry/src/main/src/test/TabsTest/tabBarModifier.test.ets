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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, afterAll } from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function tabBarModifier() {
  describe('tabBarModifier', () => {
    beforeAll(() => {
      console.info("tabBarModifier beforeEach start");

      
      await UtilsTest.startAbility("com.arkui.ace.scroll15.static", "EntryAbility");
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("tabBarModifier beforeEach start");
      const tabBarModifier = AppStorage.get<Router>("router") as Router
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabBarModifier",
      }
      try {
        let pages = tabBarModifier.getState();
        console.info("get tabBarModifier state pages:" + JSON.stringify(pages));
        if (!("tabBarModifier" == pages.name)) {
          console.info("get tabBarModifier pages.name:" + JSON.stringify(pages.name));
          tabBarModifier.pushUrl(options);
          await CommonFunc.sleep(1000);
        }
      } catch (err) {
        console.error("push tabBarModifier page error:" + err);
      }
      console.info("tabBarModifier beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("tabBarModifier after each called");
    });

  


    
    /**
     * @tc.number   tabBarModifier_static_0100
     * @tc.name     tabBarModifier_static_0100
     * @tc.desc     tabBarModifier_static_0100
     * @tc.level    Level.LEVEL1
     */
it('tabBarModifier_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[tabBarModifier_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_barModifier_start')) as Component;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let tabRect = CommonFunc.getComponentRectOnScreen('tabBar_pTest_01');
      let tabLeft: number = tabRect.left;
      let tabRight: number = tabRect.right;
      let tabBarRect = CommonFunc.getComponentRectOnScreen('tabBar_pTest_001');
      let tabBarLeft: number = tabBarRect.left;
      console.info("tabBarModifier_static_0100 value is" + tabLeft + " --" + tabRight + "--" + tabBarLeft);
      console.info("[tabBarModifier_static_0100] start: " + Math.round(tabBarLeft - tabLeft));
      expect(Math.abs(Math.round(tabBarLeft - tabLeft)) <= 1).assertTrue();
      let strJson1 = inspector.getInspectorByKey('tabs_barModifier_t');
      console.info("[swiperPageMode_0100] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs')));
      console.info("[swiperPageMode_0100] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        .assertEqual("align: Alignment.Start");
      await CommonFunc.sleep(1000);
      console.info('[tabBarModifier_static_0100] Alignment.Start END');
      done();
    });


    
    /**
     * @tc.number   tabBarModifier_static_0200
     * @tc.name     tabBarModifier_static_0200
     * @tc.desc     tabBarModifier_static_0200
     * @tc.level    Level.LEVEL1
     */
it('tabBarModifier_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[tabBarModifier_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_barModifier_end')) as Component;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let btn2: Component = await driver.findComponent(ON.text('Blue')) as Component;
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1 = inspector.getInspectorByKey('tabs_barModifier_t');
      console.info("[swiperPageMode_0200] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs')));
      console.info("[swiperPageMode_0200] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        .assertEqual("align: Alignment.End");
      console.info('[tabBarModifier_static_0200] Alignment.End END');
      done();
    });


    
    /**
     * @tc.number   tabBarModifier_static_0300
     * @tc.name     tabBarModifier_static_0300
     * @tc.desc     tabBarModifier_static_0300
     * @tc.level    Level.LEVEL1
     */
it('tabBarModifier_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[tabBarModifier_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('tabs_barModifier_center')) as Component;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let btn2: Component = await driver.findComponent(ON.text('Green')) as Component;
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(1500);
      let strJson1 = inspector.getInspectorByKey('tabs_barModifier_t');
      console.info("[swiperPageMode_0300] component obj is: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs')));
      console.info("[swiperPageMode_0300] content: " +
      JSON.stringify(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content'))
        .assertEqual("align: Alignment.Center");
      console.info('[tabBarModifier_static_0300] Alignment.Center END');
      done();
    });
  })
}