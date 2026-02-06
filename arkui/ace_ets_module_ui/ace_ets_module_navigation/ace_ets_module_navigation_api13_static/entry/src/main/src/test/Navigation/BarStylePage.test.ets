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
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function BarStylePage() {
  describe('BarStylePage', () => {
    beforeAll(() => {
      console.info("BarStylePage beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.navigation13.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info('BarStylePage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/BarStylePage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get BarStylePage state pages:' + JSON.stringify(pages));
        if (!('BarStylePage' == pages.name)) {
          console.info('get BarStylePage pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push BarStylePage page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push BarStylePage page error:' + err);
      }
      console.info('BarStylePage beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('BarStylePage after each called');
    });


    
    

    /**
     * @tc.number   BarStylePage_static_0100
     * @tc.name     BarStylePage_static_0100
     * @tc.desc     BarStylePage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('BarStylePage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('BarStylePage_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let component1 = await driver.findComponent(ON.type('TitleBar'));
      await CommonFunc.sleep(1000);
      let titleRect = await (component1?.getBounds() as Promise<Rect>);
      await CommonFunc.sleep(1000);
      let titleBottom = titleRect.bottom;
      console.info('BarStylePage_0100 titleBottom', titleBottom);

      let nav = await driver.findComponent(ON.id('switchId'));
      await CommonFunc.sleep(1000);
      let btnRect = await (nav?.getBounds() as Promise<Rect>);
      await CommonFunc.sleep(1000);
      let btnTop = btnRect.top;
      console.info('BarStylePage_0100 btnTop', btnTop);
      expect(titleBottom == btnTop).assertTrue();

      let btn1 = await driver.findComponent(ON.id('switchId'));
      await CommonFunc.sleep(1000);
      await (btn1?.click() as Promise<void>)
      console.info('[BarStylePage_0100] btn1 click');
      await CommonFunc.sleep(3000);

      let component2 = await driver.findComponent(ON.type('TitleBar'));
      await CommonFunc.sleep(1000);
      let titleRect2 = await (component2?.getBounds() as Promise<Rect>);
      await CommonFunc.sleep(1000);
      let titleBottom2 = titleRect2.bottom;
      console.info('BarStylePage_0100 titleBottom2', titleBottom2);

      let nav2 = await driver.findComponent(ON.id('switchId'));
      await CommonFunc.sleep(1000);
      let btnRect2 = await (nav2?.getBounds() as Promise<Rect>);
      await CommonFunc.sleep(1000);
      let btnTop2 = btnRect2.top;
      console.info('BarStylePage_0100 btnTop2', btnTop2);
      expect(titleBottom2 > btnTop2).assertTrue();

      console.info('BarStylePage_0100 END');
      done();
    });

  })
}