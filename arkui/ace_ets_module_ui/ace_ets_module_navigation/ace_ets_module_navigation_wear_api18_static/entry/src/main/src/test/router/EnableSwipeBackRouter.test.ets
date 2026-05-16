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
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Rect} from '@ohos.UiTest';
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
let uiContext = AppStorage.get<UIContext>('uiContext');

export default function EnableSwipeBackRouter() {
  describe('EnableSwipeBackRouter', () => {
    beforeAll(() => {
      console.info("EnableSwipeBackRouter beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.navigationwear18.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info('EnableSwipeBackRouter beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/EnableSwipeBackRouter',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get EnableSwipeBackRouter state pages:' + JSON.stringify(pages));
        if (!('EnableSwipeBackRouter' == pages.name)) {
          console.info('get EnableSwipeBackRouter pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push EnableSwipeBackRouter page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EnableSwipeBackRouter page error:' + err);
      }
      console.info('EnableSwipeBackRouter beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('EnableSwipeBackRouter after each called');
    });


    
    

    /**
     * @tc.number   EnableSwipeBackRouter_static_00100
     * @tc.name     EnableSwipeBackRouter_static_00100
     * @tc.desc     EnableSwipeBackRouter_static_00100
     * @tc.level    Level.LEVEL0
     */
it('EnableSwipeBackRouter_static_00100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('EnableSwipeBackRouter_0100 START');

      // try {
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1 = await driver.findComponent(ON.id('pushId'));
        await (btn1?.click() as Promise<void>);
        console.info('[EnableSwipeBackRouter_0100] btn1 click');
        await driver.delayMs(500);

        let navComponent = await driver.findComponent(ON.id('columnId'));
        console.info('[EnableSwipeBackRouter_0100] navComponent is ', navComponent);
        let navRect = await (navComponent?.getBounds() as Promise<Rect>);
        let right = navRect.right;
        let bottom = navRect.bottom;
        console.info('[EnableSwipeBackRouter_0100] right is ', right);
        console.info('[EnableSwipeBackRouter_0100] bottom is ', bottom);
        await driver.fling({x: Math.round(uiContext!.vp2px(11)) as int, y: Math.round(bottom/2) as int}, {x: Math.round(right/3) as int, y: Math.round(bottom/2) as int}, 2, 40000);
        await driver.delayMs(1000)

        await driver.assertComponentExist(ON.id('pushId'));
        console.log('[EnableSwipeBackRouter_0100] END');
      // }catch(error) {
      //   expect().assertFail();
      // }
      done();
    });

    
    

    /**
     * @tc.number   EnableSwipeBackRouter_static_0200
     * @tc.name     EnableSwipeBackRouter_static_0200
     * @tc.desc     EnableSwipeBackRouter_static_0200
     * @tc.level    Level.LEVEL0
     */
it('EnableSwipeBackRouter_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('EnableSwipeBackRouter_0200 START');

      // try {
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1 = await driver.findComponent(ON.id('pushId'));
        await (btn1?.click() as Promise<void>);
        console.info('[EnableSwipeBackRouter_0200] btn1 click');
        await driver.delayMs(500);

        let btn2 = await driver.findComponent(ON.id('enableId'));
        await (btn2?.click() as Promise<void>);
        console.info('[EnableSwipeBackRouter_0200] btn2 click');
        await driver.delayMs(500);

        let navComponent = await driver.findComponent(ON.id('columnId'));
        console.info('[EnableSwipeBackRouter_0200] navComponent is ', navComponent);
        let navRect = await (navComponent?.getBounds() as Promise<Rect>);
        let right = navRect.right;
        let bottom = navRect.bottom;
        console.info('[EnableSwipeBackRouter_0200] right is ', right);
        console.info('[EnableSwipeBackRouter_0200] bottom is ', bottom);
        await driver.fling({x: Math.round(uiContext!.vp2px(11)) as int, y: Math.round(bottom/2) as int}, {x: Math.round(right/3) as int, y: Math.round(bottom/2) as int}, 2, 40000);
        await driver.delayMs(1000)
        await driver.assertComponentExist(ON.id('enableId'));

        let btn3 = await driver.findComponent(ON.id('enableId'));
        await (btn3?.click() as Promise<void>);
        console.info('[EnableSwipeBackRouter_0200] btn3 click');
        await driver.delayMs(1000);
        console.log('[EnableSwipeBackRouter_0200] END');
      // }catch(error) {
      //   expect().assertFail();
      // }
      done();
    });

  })
}