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
import {Driver, Component, UiWindow, ON,  MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
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
export default function HideBackButtonPage() {
  describe('HideBackButtonPage', () => {
    beforeAll(() => {
      console.info("HideBackButtonPage beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.navigation15.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("HideBackButtonPage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestination/HideBackButtonPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get HideBackButtonPage state pages:" + JSON.stringify(pages));
        if (!("HideBackButtonPage" == pages.name)) {
          console.info("get HideBackButtonPage pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push HideBackButtonPage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push HideBackButtonPage page error:" + err);
      }
      console.info("HideBackButtonPage beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("HideBackButtonPage after each called");
    });


    
    

    /**
     * @tc.number   HideBackButtonPage_static_0100
     * @tc.name     HideBackButtonPage_static_0100
     * @tc.desc     HideBackButtonPage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('HideBackButtonPage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HideBackButtonPage_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('pushOneId'));
      await (btn1?.click() as Promise<void>)
      console.info('[CustomTransitionPage_0100] btn1 click');
      await CommonFunc.sleep(500);

      let button = await driver.findComponent(ON.type('BackButton'));
      expect(button).assertEqual(null);

      console.info('HideBackButtonPage_0100 END');
      done();
    });

    
    

    /**
     * @tc.number   HideBackButtonPage_static_0200
     * @tc.name     HideBackButtonPage_static_0200
     * @tc.desc     HideBackButtonPage_static_0200
     * @tc.level    Level.LEVEL0
     */
it('HideBackButtonPage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HideBackButtonPage_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btnPop = await driver.findComponent(ON.id('popId'));
      await (btnPop?.click() as Promise<void>)
      await CommonFunc.sleep(500);

      let btn1 = await driver.findComponent(ON.id('pushTwoId'));
      await (btn1?.click() as Promise<void>)
      console.info('[HideBackButtonPage_0200] btn1 click');
      await CommonFunc.sleep(500);

      await driver.assertComponentExist(ON.type('BackButton'));

      console.info('HideBackButtonPage_0200 END');
      done();
    });


    
    

    /**
     * @tc.number   HideBackButtonPage_static_0300
     * @tc.name     HideBackButtonPage_static_0300
     * @tc.desc     HideBackButtonPage_static_0300
     * @tc.level    Level.LEVEL0
     */
it('HideBackButtonPage_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HideBackButtonPage_0300 START');

      try {
        await CommonFunc.sleep(1000);

        let driver = Driver.create();
        await CommonFunc.sleep(200);

        let btnPop = await driver.findComponent(ON.id('popId'));
        await (btnPop?.click() as Promise<void>)
        await CommonFunc.sleep(500);

        let btn1 = await driver.findComponent(ON.id('pageThreeId'));
        await (btn1?.click() as Promise<void>)
        console.info('[HideBackButtonPage_0300] btn1 click');
        await CommonFunc.sleep(500);

        await driver.assertComponentExist(ON.type('BackButton'));
      }catch(error) {
        expect().assertFail();
      }
      console.info('HideBackButtonPage_0300 END');
      done();
    });

    
    

    /**
     * @tc.number   HideBackButtonPage_static_0400
     * @tc.name     HideBackButtonPage_static_0400
     * @tc.desc     HideBackButtonPage_static_0400
     * @tc.level    Level.LEVEL0
     */
it('HideBackButtonPage_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('HideBackButtonPage_0400 START');

      try {
        await CommonFunc.sleep(1000);

        let driver = Driver.create();
        await CommonFunc.sleep(200);

        let btnPop = await driver.findComponent(ON.id('popId'));
        await (btnPop?.click() as Promise<void>)
        await CommonFunc.sleep(500);

        let btn1 = await driver.findComponent(ON.id('pushFourId'));
        await (btn1?.click() as Promise<void>)
        console.info('[HideBackButtonPage_0300] btn1 click');
        await CommonFunc.sleep(500);

        await driver.assertComponentExist(ON.type('BackButton'));
      }catch(error) {
        expect().assertFail();
      }
      console.info('HideBackButtonPage_0400 END');
      done();
    });

  })
}