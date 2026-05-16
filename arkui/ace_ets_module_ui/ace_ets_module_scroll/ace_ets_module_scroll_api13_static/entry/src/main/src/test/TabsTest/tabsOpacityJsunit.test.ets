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
import { UtilsTest, startAbility } from '../Util.test';
import {UtilsTest} from '../Util.test';
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function tabsOpacityJsunit() {
  describe('tabsOpacityJsunit', () => {
    beforeAll(() => {
      // await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("tabsOpacityJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/tabsOpacity",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get tabsOpacityJsunit state pages:" + JSON.stringify(pages));
        if (!("tabsOpacity" == pages.name)) {
          console.info("get tabsOpacityJsunit pages.name:" + '');


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push tabsOpacityJsunit page error:" + err);
      }
      console.info("tabsOpacityJsunit beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("tabsOpacityJsunit after each called");
    });



    
    /**
     * @tc.number   tabsOpacityJsunit_static_0100
     * @tc.name     tabsOpacityJsunit_static_0100
     * @tc.desc     tabsOpacityJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('tabsOpacityJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('[tabsOpacityJsunit_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('bar_translate')) as Component;
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let btn2: Component = await driver.findComponent(ON.id('bar_opacity')) as Component;
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      let strJson = inspector.getInspectorByKey('tabContent_bar_2');
      console.info("[tabsOpacityJsunit_static_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[tabsOpacityJsunit_static_0100] content: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[tabsOpacityJsunit_static_0100] tabBar: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('tabBar')));
      await CommonFunc.sleep(1000);
      let text01: Component = await driver.findComponent(ON.text("pink")) as Component
      let textContent01:string = await (text01?.getText() as Promise<string>);
      console.info("[tabsOpacityJsunit_static_0100] textContent01: " + textContent01);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('TabContent');
      expect(textContent01).assertEqual("pink");
      console.info('[tabsOpacityJsunit_static_0100] END');
      done();
    });
  })
}
