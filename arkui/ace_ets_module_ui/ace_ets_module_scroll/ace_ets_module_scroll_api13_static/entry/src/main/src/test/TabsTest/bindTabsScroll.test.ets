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

export default function bindTabsScroll() {
  describe('bindTabsScroll', () => {
    beforeAll(() => {
      // await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.scroll13.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("bindTabsScroll beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/bindTabsScroll",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindTabsScroll state pages:" + JSON.stringify(pages));
        if (!("bindTabsScroll" == pages.name)) {
          console.info("get bindTabsScroll pages.name:" + '');


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindTabsScroll page error:" + err);
      }
      console.info("bindTabsScroll beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("bindTabsScroll after each called");
    });



    
    /**
     * @tc.number   bindTabsScroll_static_0100
     * @tc.name     bindTabsScroll_static_0100
     * @tc.desc     bindTabsScroll_static_0100
     * @tc.level    Level.LEVEL1
     */
it('bindTabsScroll_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {

      console.info('[bindTabsScroll_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let text01: Component = await driver.findComponent(ON.text("Top tab")) as Component
      let textContent01:string = await (text01?.getText() as Promise<string>);
      expect(textContent01).assertEqual("Top tab");
      await CommonFunc.sleep(1000);
      let scrollTabs = CommonFunc.getComponentRectOnScreen('bind_tabsScroll');
      let top = scrollTabs.top;
      let right = scrollTabs.right;
      let left = scrollTabs.left;
      let bottom = scrollTabs.bottom;
      console.info("bindTabsScroll_static_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe((Math.round(left + width/2)).toInt(),(Math.round(top + height*0.8)).toInt(),(Math.round(left + width/2)).toInt(),(Math.round(top + height*0.2)).toInt());
      await driver.swipe((Math.round(left + width/2)).toInt(),(Math.round(top + height*0.2)).toInt(),(Math.round(left + width/2)).toInt(),(Math.round(top + height*0.8)).toInt());
      await CommonFunc.sleep(6000);
      let text02: Component = await driver.findComponent(ON.text("nested_scroller")) as Component
      let textContent02:string = await (text02?.getText() as Promise<string>);
      expect(textContent02).assertEqual("nested_scroller");
      await (text02?.click() as Promise<void>);
      console.info('[bindTabsScroll_static_0100] END');
      done();
    });
  })
}
