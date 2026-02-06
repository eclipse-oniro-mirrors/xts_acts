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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from './Util.test';
import Utils from '../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { NavDestinationActiveReason} from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import router from '@ohos.router';

export default function OnActivePage() {
  describe('OnActivePage', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation18.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("OnActivePage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/OnActivePage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get OnActivePage state pages:" + JSON.stringify(pages));
        if (!("OnActivePage" == pages.name)) {
          console.info("get OnActivePage pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push OnActivePage page error:" + err);
      }
      console.info("OnActivePage beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("OnActivePage after each called");
    });


    
    


/**
     * @tc.number   OnActivePage_static_0100
     * @tc.name     OnActivePage_static_0100
     * @tc.desc     OnActivePage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('OnActivePage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnActivePage_static_0100 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1= await (driver.findComponent(ON.id('overLayBtnId')) as Promise<Component>);
      await btn1.click();
      console.info('[OnActivePage_static_0100] btn1 click');
      await driver.delayMs(1000);

      let btn2= await (driver.findComponent(ON.id('overLayPushId')) as Promise<Component>);
      await btn2.click();
      console.info('[OnActivePage_static_0100] btn2 click');
      await driver.delayMs(2000);

      let btn3= await (driver.findComponent(ON.id('openOverLayId')) as Promise<Component>);
      await btn3.click();
      console.info('[OnActivePage_static_0100] btn3 click');
      await driver.delayMs(5000);

      let testVal = AppStorage.get<NavDestinationActiveReason>('onInactive')
      console.log('OnActivePage_static_0100 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(4);
      AppStorage.delete('onInactive');

      let btn4= await (driver.findComponent(ON.id('closeOverLayId')) as Promise<Component>);
      await btn4.click();
      console.info('[OnActivePage_static_0100] btn4 click');
      await driver.delayMs(5000);

      let testVal2 = AppStorage.get<NavDestinationActiveReason>('onActive')
      console.log('OnActivePage_static_0100 on onActive value : ' + testVal2)
      expect(testVal2).assertEqual(4);
      AppStorage.delete('onActive');
      console.log('[OnActivePage_static_0100] END');
      done();
    });





/**
     * @tc.number   OnActivePage_static_0200
     * @tc.name     OnActivePage_static_0200
     * @tc.desc     OnActivePage_static_0200
     * @tc.level    Level.LEVEL0
     */
it('OnActivePage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnActivePage_static_0200 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1= await (driver.findComponent(ON.id('baseBtnId')) as Promise<Component>);
      await btn1.click();
      console.info('[OnActivePage_static_0200] btn1 click');
      await driver.delayMs(1000);

      let btn2 = await driver.findComponent(ON.id('pushId')) as Component;
      await CommonFunc.sleep(1000);
      await btn2!.click();
      await CommonFunc.sleep(4000);

      console.info('[OnActivePage_static_0200] btn2 click');
      await driver.delayMs(2000);
      let testVal = AppStorage.get<NavDestinationActiveReason>('onInactive')
      console.log('OnActivePage_static_0200 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(0);
      AppStorage.delete('onInactive');

      let btn3= await (driver.findComponent(ON.id('pushId')) as Promise<Component>);
      await btn3.click();
      console.info('[OnActivePage_static_0200] btn3 click');

      await driver.delayMs(3000);
      let testVal2 = AppStorage.get<NavDestinationActiveReason>('onActive')
      console.log('OnActivePage_0200 on onActive value : ' + testVal2)
      expect(testVal2).assertEqual(0);
      AppStorage.delete('onActive');

      console.log('[OnActivePage_static_0200] END');
      done();
    });





/**
     * @tc.number   OnActivePage_static_0300
     * @tc.name     OnActivePage_static_0300
     * @tc.desc     OnActivePage_static_0300
     * @tc.level    Level.LEVEL0
     */
it('OnActivePage_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnActivePage_static_0300 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1= await (driver.findComponent(ON.id('dialogBtnId')) as Promise<Component>);
      await btn1.click()
      console.info('[OnActivePage_static_0300] btn1 click');
      await driver.delayMs(1000);

      let btn2= await (driver.findComponent(ON.id('dialogPushId')) as Promise<Component>);
      await btn2.click();
      console.info('[OnActivePage_static_0300] btn2 click');
      await driver.delayMs(1000);

      let btn3= await (driver.findComponent(ON.id('openDialogId')) as Promise<Component>);
      await btn3.click();
      console.info('[OnActivePage_static_0300] btn3 click');
      await driver.delayMs(3000);

      let testVal = AppStorage.get<NavDestinationActiveReason>('onInactive')
      console.log('OnActivePage_static_0300 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(3);
      AppStorage.delete('onInactive');

      let btn4= await (driver.findComponent(ON.id('closeDialogId')) as Promise<Component>);
      await btn4.click();
      console.info('[OnActivePage_static_0300] btn4 click');

      await driver.delayMs(3000);
      let testVal2 = AppStorage.get<NavDestinationActiveReason>('onActive')
      console.log('OnActivePage_static_0300 on onActive value : ' + testVal2)
      expect(testVal2).assertEqual(3);
      AppStorage.delete('onActive');

      console.log('[OnActivePage_static_0300] END');
      done();
    });





/**
     * @tc.number   OnActivePage_static_0400
     * @tc.name     OnActivePage_static_0400
     * @tc.desc     OnActivePage_static_0400
     * @tc.level    Level.LEVEL0
     */
it('OnActivePage_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnActivePage_static_0400 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1= await (driver.findComponent(ON.id('halfBtnId')) as Promise<Component>);
      await btn1.click()
      console.info('[OnActivePage_static_0400] btn1 click');
      await driver.delayMs(1000);

      let btn2= await (driver.findComponent(ON.id('sheetPushId')) as Promise<Component>);
      await btn2.click();
      console.info('[OnActivePage_static_0400] btn2 click');
      await driver.delayMs(1000);

      let btn3= await (driver.findComponent(ON.id('openSheetId')) as Promise<Component>);
      await btn3.click();
      console.info('[OnActivePage_static_0400] btn3 click');
      await driver.delayMs(3000);

      let testVal = AppStorage.get<NavDestinationActiveReason>('onInactive')
      console.log('OnActivePage_static_0400 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(2);
      AppStorage.delete('onInactive');

      console.log('[OnActivePage_static_0400] END');
      done();
    });





/**
     * @tc.number   OnActivePage_static_0500
     * @tc.name     OnActivePage_static_0500
     * @tc.desc     OnActivePage_static_0500
     * @tc.level    Level.LEVEL0
     */
it('OnActivePage_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('OnActivePage_static_0500 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1= await (driver.findComponent(ON.id('allBtnId')) as Promise<Component>);
      await btn1.click()
      console.info('[OnActivePage_static_0500] btn1 click');
      await driver.delayMs(1000);

      let btn2= await (driver.findComponent(ON.id('allSheetPushId')) as Promise<Component>);
      await btn2.click();
      console.info('[OnActivePage_static_0500] btn2 click');
      await driver.delayMs(1000);

      let btn3= await (driver.findComponent(ON.id('openAllSheetId')) as Promise<Component>);
      await btn3.click();
      console.info('[OnActivePage_static_0500] btn3 click');
      await driver.delayMs(3000);

      let testVal = AppStorage.get<NavDestinationActiveReason>('onInactive')
      await driver.delayMs(500);
      console.log('OnActivePage_static_0500 on onInactive value : ' + testVal)
      expect(testVal).assertEqual(1);
      AppStorage.delete('onInactive');
      console.log('OnActivePage_static_0500 AppStorage.delete')
      let btn4= await (driver.findComponent(ON.id('closeAllSheetId')) as Promise<Component>);
      await btn4.click();
      console.info('[OnActivePage_static_0500] btn4 click');

      await driver.delayMs(3000);
      let testVal2 = AppStorage.get<NavDestinationActiveReason>('onActive')
      console.log('OnActivePage_static_0500 on onActive value : ' + testVal2)
      expect(testVal2).assertEqual(1);
      AppStorage.delete('onActive');

      console.log('[OnActivePage_static_0500] END');
      done();
    });

  })
}