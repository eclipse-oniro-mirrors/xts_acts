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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../ets/MainAbility/common/MessageManager';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { startAbility, UtilsTest } from '../test/Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SimpleAnimatorOptionsPage() {
  describe('SimpleAnimatorOptionsPage', () => {

    beforeAll(() => {
      console.info("SimpleAnimatorOptionsPage beforeEach start");

      await UtilsTest.startAbility("com.arkui.ace.animation12.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("SimpleAnimatorOptionsPage beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/SimpleAnimatorOptionsPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setExpectedFrameRateRangeTest state pages:" + JSON.stringify(pages));
        if (!("SimpleAnimatorOptionsPage" == pages.name)) {
          console.info("get setExpectedFrameRateRangeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push setExpectedFrameRateRangeTest page error:" + err);
      }
      console.info("setExpectedFrameRateRangeTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("SimpleAnimatorOptionsPage after each called");
    });


    
    /**
     * @tc.number   SimpleAnimatorOptionsPage_static_0100
     * @tc.name     SimpleAnimatorOptionsPage_static_0100
     * @tc.desc     SimpleAnimatorOptionsPage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SimpleAnimatorOptionsPage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SimpleAnimatorOptionsPage_0100 START');
      let driver = Driver.create();
      await driver.delayMs(1000);
      console.log('btn1 start  ')
      let btn1 = await driver.findComponent(ON.id('playId'));
      // await CommonFunc.sleep(2000);
      console.log('btn1 start  ' + JSON.stringify(btn1))
      await (btn1?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0100] btn1 click');
      await driver.delayMs(5000);

      let cubeSize: Number = AppStorage.get<Number>('cube_size')!
      console.log('SimpleAnimatorOptionsPage_0100 on cubeSize value : ' + cubeSize)
      expect(cubeSize).assertEqual(50);
      AppStorage.delete('cube_size');

      let changeFillModeBtn = await driver.findComponent(ON.id('changeFillMode'));
      await driver.delayMs(2000);
      await (changeFillModeBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0100] changeFillModeBtn click');
      await driver.delayMs(1000);

      let btn2 = await driver.findComponent(ON.id('playId'));
      await driver.delayMs(2000);
      await (btn2?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0100] btn2 click');
      await driver.delayMs(5000);

      let cubeSize2: Number = AppStorage.get<Number>('cube_size')!
      console.log('SimpleAnimatorOptionsPage_0100 on cubeSize2 value : ' + cubeSize2)
      expect(cubeSize2).assertEqual(100);
      AppStorage.delete('cube_size');

      let recoverBtn = await driver.findComponent(ON.id('recoverId'));
      await driver.delayMs(2000);
      await (recoverBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0100] recoverBtn click');
      await driver.delayMs(1000);

      console.log('[SimpleAnimatorOptionsPage_0100] END');
      done();
    });


    
    /**
     * @tc.number   SimpleAnimatorOptionsPage_static_0200
     * @tc.name     SimpleAnimatorOptionsPage_static_0200
     * @tc.desc     SimpleAnimatorOptionsPage_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SimpleAnimatorOptionsPage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SimpleAnimatorOptionsPage_0200 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let delayBtn = await driver.findComponent(ON.id('changeDelayId'));
      await (delayBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0200] delayBtn click');
      await driver.delayMs(1000);

      let playBtn = await driver.findComponent(ON.id('playId'));
      await (playBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0200] playBtn click');
      await driver.delayMs(5000);

      let testTime: Number = AppStorage.get<Number>('testTime')!
      console.log('SimpleAnimatorOptionsPage_0200 on testTime value : ' + testTime)
      expect(Number(testTime) > 2000 && Number(testTime) < 2500).assertTrue();
      AppStorage.delete('testTime');

      let recoverBtn = await driver.findComponent(ON.id('recoverId'));
      await (recoverBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0200] recoverBtn click');
      await driver.delayMs(1000);

      console.log('[SimpleAnimatorOptionsPage_0200] END');
      done();
    });


    
    /**
     * @tc.number   SimpleAnimatorOptionsPage_static_0300
     * @tc.name     SimpleAnimatorOptionsPage_static_0300
     * @tc.desc     SimpleAnimatorOptionsPage_static_0300
     * @tc.level    Level.LEVEL0
     */
it('SimpleAnimatorOptionsPage_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SimpleAnimatorOptionsPage_0300 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let iterationsBtn = await driver.findComponent(ON.id('changeIterationsId'));
      await (iterationsBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0300] iterationsBtn click');
      await driver.delayMs(1000);

      let playBtn = await driver.findComponent(ON.id('playId'));
      await (playBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0300] playBtn click');
      await driver.delayMs(6000);

      let testTime: Number = AppStorage.get<Number>('testTime')!
      console.log('SimpleAnimatorOptionsPage_0300 on testTime value : ' + testTime)
      expect(Number(testTime) > 5000 && Number(testTime) < 5500).assertTrue();
      AppStorage.delete('testTime');

      let recoverBtn = await driver.findComponent(ON.id('recoverId'));
      await (recoverBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0300] recoverBtn click');
      await driver.delayMs(1000);

      console.log('[SimpleAnimatorOptionsPage_0300] END');
      done();
    });


    
    /**
     * @tc.number   SimpleAnimatorOptionsPage_static_0400
     * @tc.name     SimpleAnimatorOptionsPage_static_0400
     * @tc.desc     SimpleAnimatorOptionsPage_static_0400
     * @tc.level    Level.LEVEL0
     */
it('SimpleAnimatorOptionsPage_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SimpleAnimatorOptionsPage_0400 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let iterationsBtn = await driver.findComponent(ON.id('changeIterationsId'));
      await (iterationsBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0400] iterationsBtn click');
      await driver.delayMs(1000);

      let directionBtn = await driver.findComponent(ON.id('changeDirectionId'));
      await (directionBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0400] directionBtn click');
      await driver.delayMs(1000);

      let playBtn = await driver.findComponent(ON.id('playId'));
      await (playBtn?.click() as Promise<void>);
      console.info('[SimpleAnimatorOptionsPage_0300] playBtn click');
      await driver.delayMs(6000);

      let cubeSize = AppStorage.get<Number>('cube_size')!
      console.log('SimpleAnimatorOptionsPage_0400 on cubeSize value : ' + cubeSize)
      expect(cubeSize).assertEqual(100);
      AppStorage.delete('cube_size');

      console.log('[SimpleAnimatorOptionsPage_0400] END');
      done();
    });

  })
}