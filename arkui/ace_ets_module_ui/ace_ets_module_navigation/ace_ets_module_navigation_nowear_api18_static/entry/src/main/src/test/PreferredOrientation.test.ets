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

import { describe, beforeEach, it, expect, Level, beforeAll, Size, TestType, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter'
import CommonFunc from '../../ets/MainAbility/common/Common';
import Utils from '../../ets/MainAbility/common/Utils';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function PreferredOrientation() {
  describe('PreferredOrientation', () => {

    beforeAll(() => {
      console.info("stepper beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear18.static", "EntryAbility")

    });

    beforeEach(async (done: () => void): Promise<void> => {
      console.info('PreferredOrientation beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PreferredOrientation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        // routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get PreferredOrientation state pages:' + JSON.stringify(pages));
        if (!('PreferredOrientation' == pages.name)) {
          console.info('get PreferredOrientation pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info('push PreferredOrientation page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push PreferredOrientation page error:' + err);
      }
      console.info('PreferredOrientation beforeEach end');
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info('PreferredOrientation after each called');
    });


    
    /**
     * @tc.number   PreferredOrientation_static_0100
     * @tc.name     PreferredOrientation_static_0100
     * @tc.desc     PreferredOrientation_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('PreferredOrientation_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PreferredOrientation_static_0100 START');
      if ( AppStorage.get<number>("winLeft") == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('getPortraitPage')) as Component;
        await btn1.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get<number>('testOrientation') as number
        console.info('[PreferredOrientation_static_0100] rotation is ', rotation);
        expect(rotation).assertEqual(0);
        AppStorage.delete('testOrientation');
      }
      console.info('PreferredOrientation_static_0100 END');
      done();
    });

    
    /**
     * @tc.number   PreferredOrientation_static_0200
     * @tc.name     PreferredOrientation_static_0200
     * @tc.desc     PreferredOrientation_static_0200
     * @tc.level    Level.LEVEL0
     */
    it('PreferredOrientation_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PreferredOrientation_static_0200 START');
      if ( AppStorage.get<number>("winLeft") == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('landscapeId')) as Component;
        await btn1.click()
        console.info('[PreferredOrientation_static_0200] btn1 click');
        await driver.delayMs(1000);

        let btn2: Component = await driver.findComponent(ON.id('getLandscapePage')) as Component;
        await btn2.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get<number>('testOrientation') as number
        console.info('[PreferredOrientation_static_0200] rotation is ', rotation);
        expect(rotation == 1 || rotation == 3).assertTrue();
        AppStorage.delete('testOrientation');

      }
      console.info('PreferredOrientation_static_0200 END');
      done();
    });

    
    /**
     * @tc.number   PreferredOrientation_static_0300
     * @tc.name     PreferredOrientation_static_0300
     * @tc.desc     PreferredOrientation_static_0300
     * @tc.level    Level.LEVEL0
     */
    it('PreferredOrientation_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PreferredOrientation_static_0300 START');
      if ( AppStorage.get<number>("winLeft") == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('unspecifiedId')) as Component;
        await btn1.click()
        console.info('[PreferredOrientation_static_0300] btn1 click');
        await driver.delayMs(1000);

        let btn2: Component = await driver.findComponent(ON.id('getUnspecifiedPage')) as Component;
        await btn2.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get<number>('testOrientation') as number
        console.info('[PreferredOrientation_static_0300] rotation is ', rotation);
        let navigation: Component = await driver.findComponent(ON.type('Navigation')) as Component;
        let rect = await navigation.getBounds();
        let navigationWidth = rect.right;
        console.info('[PreferredOrientation_static_0300] navigationWidth is ', navigationWidth);
        if (navigationWidth < 1500) {
          expect(rotation).assertEqual(0);
        }
        AppStorage.delete('testOrientation');
      }
      console.info('PreferredOrientation_static_0300 END');
      done();
    });

    
    /**
     * @tc.number   PreferredOrientation_static_0400
     * @tc.name     PreferredOrientation_static_0400
     * @tc.desc     PreferredOrientation_static_0400
     * @tc.level    Level.LEVEL0
     */
    it('PreferredOrientation_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PreferredOrientation_static_0400 START');
      if ( AppStorage.get<number>("winLeft") == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('portraitInvertedId')) as Component;
        await btn1.click()
        console.info('[PreferredOrientation_static_0400] btn1 click');
        await driver.delayMs(1000);

        let btn2: Component = await driver.findComponent(ON.id('getPortraitInvertedPage')) as Component;
        await btn2.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get<number>('testOrientation') as number
        console.info('[PreferredOrientation_static_0400] rotation is ', rotation);
        expect(rotation).assertEqual(2);
        AppStorage.delete('testOrientation');
      }
      console.info('PreferredOrientation_static_0400 END');
      done();
    });

    
    /**
     * @tc.number   PreferredOrientation_static_0500
     * @tc.name     PreferredOrientation_static_0500
     * @tc.desc     PreferredOrientation_static_0500
     * @tc.level    Level.LEVEL0
     */
    it('PreferredOrientation_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PreferredOrientation_static_0500 START');
      if ( AppStorage.get<number>("winLeft") == 0) {
        await CommonFunc.sleep(500);
        let driver = Driver.create();
        await driver.delayMs(500);

        let btn1: Component = await driver.findComponent(ON.id('lanscapeInvertedId')) as Component;
        await btn1.click()
        console.info('[PreferredOrientation_static_0500] btn1 click');
        await driver.delayMs(1000);

        let btn3: Component = await driver.findComponent(ON.id('getLandscapInvertedPage')) as Component;
        await btn3.click();
        await driver.delayMs(2000);

        let rotation: number = AppStorage.get<number>('testOrientation') as number
        console.info('[PreferredOrientation_static_0500] rotation is ', rotation);
        expect(rotation == 1 || rotation == 3).assertTrue();
        AppStorage.delete('testOrientation');
      }
      console.info('PreferredOrientation_static_0500 END');
      done();
    });

  })
}