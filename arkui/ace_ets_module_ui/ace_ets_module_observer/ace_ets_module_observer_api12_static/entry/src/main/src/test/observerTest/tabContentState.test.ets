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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function tabContentState() {
  describe('tabContentState', () => {
    beforeAll(() => {
      console.info("tabContentState beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.observer12.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("tabContentState beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/tabContentState",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get tabContentState state pages:" + JSON.stringify(pages));
        if (!("tabContentState" == pages.name)) {
          console.info("get tabContentState pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push tabContentState page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push tabContentState page error:" + err);
      }
      console.info("tabContentState beforeEach end");
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("tabContentState after each called");
    });

    
    
/**
     * @tc.number   tabContentState_static_001
     * @tc.name     tabContentState_static_001
     * @tc.desc     tabContentState_static_001
     * @tc.level    Level.LEVEL0
     */
it('tabContentState_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[tabContentState_001] START');
      await CommonFunc.sleep(1000);
      let swiperTabs = CommonFunc.getComponentRectOnScreen('tabsId');
      let top = swiperTabs.top;
      let right = swiperTabs.right;
      let left = swiperTabs.left;
      let bottom = swiperTabs.bottom;
      console.info("tabContentState_001 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      console.info("+++++++++++++++++++++++++++++swipe1 ");
      await driver.swipe(Math.round(left + width*0.9).toInt() ,Math.round(bottom - height/2).toInt() ,Math.round(left + width*0.1).toInt() ,Math.round(bottom - height/2).toInt());
       console.info("+++++++++++++++++++++++++++++swipe2 ");//这里appDied
      await CommonFunc.sleep(1000);
      console.info("+++++++++++++++++++++++++++++1 ");
      let btn = await driver.findComponent(ON.id('observer_getState'));
      await CommonFunc.sleep(500);
      console.info("+++++++++++++++++++++++++++++2 ");
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_state');
      console.info("+++++++++++++++++++++++++++++3 ");
      let obj = JSON.parseJsonElement(strJson);
      console.info("[tabContentState_001] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[tabContentState_001] component obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('HideShow');
      console.info('[tabContentState_001] END');
      done();
    });
  })
}
