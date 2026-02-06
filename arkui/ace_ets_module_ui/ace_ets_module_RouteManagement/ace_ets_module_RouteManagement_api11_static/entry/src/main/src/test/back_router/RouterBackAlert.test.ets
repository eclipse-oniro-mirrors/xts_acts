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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import events_emitter from '@ohos.events.emitter'

export default function RouterBackAlert() {
  describe('RouterBackAlert', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.RouteManagement.api11.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info('RouterBackAlert beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/back_router/RouterBackAlert',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get RouterBackAlert state pages:' + JSON.stringify(pages));
        if (!('RouterBackAlert' == pages.name)) {
          console.info('get RouterBackAlert pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push RouterBackAlert page error:' + err);
      }
      console.info('RouterBackAlert beforeEach end');
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('RouterBackAlert after each called');
    });


    
    
/**
     * @tc.number   RouterBackAlert_static_0100
     * @tc.name     RouterBackAlert_static_0100
     * @tc.desc     RouterBackAlert_static_0100
     * @tc.level    Level.LEVEL0
     */
it('RouterBackAlert_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('RouterBackAlert_0100 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 51,
        priority: events_emitter.EventPriority.LOW
      }
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1 = await driver.findComponent(ON.id('push1Id'));
      await (btn1?.click() as Promise<void>)
      console.info('[RouterBackAlert_0100] btn1 click');
      await driver.delayMs(1000);

      let btn2 = await driver.findComponent(ON.id('enableId'));
      await (btn2?.click() as Promise<void>)
      console.info('[RouterBackAlert_0100] btn2 click');
      await driver.delayMs(3000);

      // await driver.assertComponentExist(ON.type('Dialog'));

      let buttonList = await driver.findComponents(ON.type('Button'));
      console.info('[RouterBackAlert_0100] buttonList is', JSON.stringify(buttonList));
      
      // await (buttonList![2]?.click() as Promise<void>);
      console.info('[RouterBackAlert_0100] btn3 click');
      await driver.delayMs(3000);

      // let enableSuccess:number = AppStorage.get('enableSuccess')! as number
      // let enableComplete:number = AppStorage.get('enableComplete')! as number
      // expect(enableSuccess).assertEqual(1);
      // expect(enableComplete).assertEqual(1);
      // AppStorage.delete('enableSuccess');
      // AppStorage.delete('enableComplete');

      // await driver.assertComponentExist(ON.id('push1Id'));

      let btn4 = await driver.findComponent(ON.id('push1Id'));
      await (btn4?.click() as Promise<void>)
      console.info('[RouterBackAlert_0100] btn4 click');
      await driver.delayMs(1000);

      let btn5 = await driver.findComponent(ON.id('enableId'));
      await (btn5?.click() as Promise<void>)
      console.info('[RouterBackAlert_0100] btn5 click');
      await driver.delayMs(3000);

      // await driver.assertComponentExist(ON.type('Dialog'));

      let buttonList2 = await driver.findComponents(ON.type('Button'));
      console.info('[RouterBackAlert_0100] buttonList2 is', JSON.stringify(buttonList2));
      
      await (buttonList2![1]?.click() as Promise<void>);
      console.info('[RouterBackAlert_0100] btn6 click');
      await driver.delayMs(3000);

      // let enableCancel:number = AppStorage.get('enableCancel')! as number
      // let enableComplete2:number = AppStorage.get('enableComplete')! as number
      // expect(enableCancel).assertEqual(1);
      // expect(enableComplete2).assertEqual(1);
      // AppStorage.delete('enableCancel');
      // AppStorage.delete('enableComplete');

      // await driver.assertComponentExist(ON.id('enableId'));

      console.info('[RouterBackAlert_0100] END');
      done();
    });

    
    
/**
     * @tc.number   RouterBackAlert_0200
     * @tc.name     RouterBackAlert_0200
     * @tc.desc     RouterBackAlert_0200
     * @tc.level    Level.LEVEL2
     */
it('RouterBackAlert_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('RouterBackAlert_0200 START');
      let indexEvent: events_emitter.InnerEvent = {
        eventId: 52,
        priority: events_emitter.EventPriority.LOW
      }
      await CommonFunc.sleep(500);

      let driver = Driver.create();
      await driver.delayMs(500);

      let btn1 = await driver.findComponent(ON.id('push2Id'));
      await (btn1?.click() as Promise<void>)
      console.info('[RouterBackAlert_0200] btn1 click');
      await driver.delayMs(1000);

      let btn2 = await driver.findComponent(ON.id('disableId'));
      await (btn2?.click() as Promise<void>)
      console.info('[RouterBackAlert_0200] btn2 click');
      await driver.delayMs(1000);

      // let disableSuccess:number = AppStorage.get('disableSuccess')! as number
      // let disableComplete:number = AppStorage.get('disableComplete')! as number
      // expect(disableSuccess).assertEqual(1);
      // expect(disableComplete).assertEqual(1);
      // AppStorage.delete('disableSuccess');
      // AppStorage.delete('disableComplete');

      await driver.assertComponentExist(ON.id('push2Id'));

      console.info('[RouterBackAlert_0200] END');
      done();
    });

  })
}