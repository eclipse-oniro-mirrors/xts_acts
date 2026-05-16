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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Rect, Point} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
// import { vp2px } from '@ohos.arkui.component'
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function NavigationBindToNestedScrollable() {
  describe('NavigationBindToNestedScrollable', () => {
    beforeAll(() => {
      console.info("NavigationBindToNestedScrollable beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("NavigationBindToNestedScrollable beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindToScrollable/NavigationBindToNestedScrollable',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationBindToNestedScrollable state pages:" + JSON.stringify(pages));
        if (!("NavigationBindToNestedScrollable" == pages.name)) {
          console.info("get NavigationBindToNestedScrollable pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push NavigationBindToNestedScrollable page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationBindToNestedScrollable page error:" + err);
      }
      console.info("NavigationBindToNestedScrollable beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("NavigationBindToNestedScrollable after each called");
    });


    
    

    /**
     * @tc.number   NavigationBindToNestedScrollable_static_0100
     * @tc.name     NavigationBindToNestedScrollable_static_0100
     * @tc.desc     NavigationBindToNestedScrollable_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationBindToNestedScrollable_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('NavigationBindToNestedScrollable_0100 START');
      let driver = Driver.create();
      let uiContext =AppStorage.get<UIContext>('uiContext');
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.text('push pageOne'));
      await (btn1?.click() as Promise<void>)
      console.info('[NavigationBindToNestedScrollable_0100] click push pageOne');
      await CommonFunc.sleep(1000);

      let navigation = await driver.findComponent(ON.type('Navigation'));
      await CommonFunc.sleep(1000);
      let rect2 = await (navigation?.getBounds() as Promise<Rect>);
      let navigationWidth = rect2.right;
      console.info('[NavigationBindToNestedScrollable_0100] navigationWidth is ', navigationWidth);

      await driver.assertComponentExist(ON.type('TitleBar'));
      if (navigationWidth < 1500) {
        await driver.assertComponentExist(ON.type('ToolBar'));
        console.info('[NavigationBindToNestedScrollable_0100] ToolBar is exist');
        await driver.delayMs(1000);
      }

      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let scrollBarRect = await (scrollBar?.getBounds() as Promise<Rect>);
      let top = scrollBarRect.top;
      let right = scrollBarRect.right;
      let bottom = scrollBarRect.bottom;
      
      await driver.swipe(Math.round(right - uiContext!.vp2px(11)) as int, Math.round(top + uiContext!.vp2px(12)) as int, Math.round(right - uiContext!.vp2px(11)) as int, Math.round(bottom) as int);
      await driver.delayMs(500)

      await driver.assertComponentExist(ON.type('TitleBar'));
      if (navigationWidth < 1500) {
        console.log('+++++++++++++1')
        await driver.assertComponentExist(ON.type('ToolBar')); //找不到Component not exist matching: {selfMatcher=[{attrName:visible; value:true; Pattern:0},{attrName:type; value:ToolBar; Pattern:0},]}
        console.log('+++++++++++++2')
        await driver.delayMs(1000);
      }
  console.log('+++++++++++++3')
      let component3  = await driver.findComponent(ON.type('ToolBar'));
  console.log('+++++++++++++4')
      let toolBarRect = await (component3?.getBounds() as Promise<Rect>);
      let tooBarTop1 = toolBarRect.top;
      let tooBarBottom1 = toolBarRect.bottom;
      console.info('NavigationBindToNestedScrollable_0100 tooBarTop1: ', tooBarTop1);
      console.info('NavigationBindToNestedScrollable_0100 tooBarBottom1: ', tooBarBottom1);

      await driver.swipe(Math.round(right - uiContext!.vp2px(11)) as int, Math.round(bottom - uiContext!.vp2px(12)) as int, Math.round(right - uiContext!.vp2px(11)) as int, Math.round(top) as int); //master22
      await driver.delayMs(500)
      let list = await driver.findComponent(ON.type('List'));
      
      let listRect = await (list?.getBounds() as Promise<Rect>);
      let listTop = listRect.top;
      let listRight = listRect.right;
      let listBottom = listRect.bottom;

      await driver.swipe(Math.round(listRight - uiContext!.vp2px(11)) as int, Math.round(listTop + uiContext!.vp2px(12)) as int, Math.round(listRight - uiContext!.vp2px(11)) as int, Math.round(listBottom) as int);
      await driver.delayMs(500)

      let component1 = await driver.findComponent(ON.type('TitleBar').text('pageOne'));
      let point = await (component1?.getBoundsCenter() as Promise<Point>);
      let x = point.x;
      let y = point.y;
      console.info('NavigationBindToNestedScrollable_0100 x', x);
      console.info('NavigationBindToNestedScrollable_0100 y', y);

      let nav = await driver.findComponent(ON.id('navId'));
      let rect = await (nav?.getBounds() as Promise<Rect>);
      let windowTop = rect.top;
      console.info('NavigationBindToNestedScrollable_0100 windowTop', windowTop);
      expect(y < windowTop).assertTrue();
     
      let component2  = await driver.findComponent(ON.type('ToolBar'));
      if (component2) {
        let toolBarRect2 = await (component2?.getBounds() as Promise<Rect>);
        let tooBarTop2 = toolBarRect2.top;
        let tooBarBottom2 = toolBarRect2.bottom;
        console.info('NavigationBindToNestedScrollable_0100 tooBarTop2: ', tooBarTop2);
        console.info('NavigationBindToNestedScrollable_0100 tooBarBottom2: ', tooBarBottom2);
        expect(Math.abs(Math.round(tooBarTop2 - tooBarTop1) - Math.round(tooBarBottom1 - tooBarTop1)) <= 1 ).assertTrue();
      } else {
        expect(component2).assertEqual(null); 
      }

      console.info('NavigationBindToNestedScrollable_0100 END');
      done();
    });
  })
}