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
let tag = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function EnableModeChangeAnimation() {
  describe('EnableModeChangeAnimation', () => {
    beforeAll(() => {
      console.info("EnableModeChangeAnimation beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.navigation15.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info('EnableModeChangeAnimation beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/EnableModeChangeAnimation',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get EnableModeChangeAnimation state pages:' + JSON.stringify(pages));
        if (!('EnableModeChangeAnimation' == pages.name)) {
          console.info('get EnableModeChangeAnimation pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info('push EnableModeChangeAnimation page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push EnableModeChangeAnimation page error:' + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('EnableModeChangeAnimation after each called');
    });


    
    

    /**
     * @tc.number   EnableModeChangeAnimation_static_0100
     * @tc.name     EnableModeChangeAnimation_static_0100
     * @tc.desc     EnableModeChangeAnimation_static_0100
     * @tc.level    Level.LEVEL0
     */
it('EnableModeChangeAnimation_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('EnableModeChangeAnimation_0100 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let enableTrueId = await driver.findComponent(ON.id('enableTrueId'));
      await (enableTrueId?.click() as Promise<void>)
      console.info('[EnableModeChangeAnimation_0100] enableTrueId click');
      await CommonFunc.sleep(200);
	  
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let splitId = await (scrollBar?.scrollSearch(ON.id('splitId')) as Promise<Component>);
      await (splitId?.click() as Promise<void>)
      console.info('[EnableModeChangeAnimation_0100] splitId click');
      await CommonFunc.sleep(200);

      let stackId = await (scrollBar?.scrollSearch(ON.id('stackId')) as Promise<Component>);
      await (stackId?.click() as Promise<void>)
      console.info('[EnableModeChangeAnimation_0100] stackId click');
      await CommonFunc.sleep(200);

      let strJson = inspector.getInspectorByKey('navigationId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[EnableModeChangeAnimation_0100] component $attrs is: ' + JSON.stringifyJsonElement(obj.getElement('$attrs')));
      console.info('[EnableModeChangeAnimation_0100] enableModeChangeAnimation obj is: ' + obj.getElement('$attrs').getBoolean('enableModeChangeAnimation'));
      expect(obj.getElement('$attrs').getBoolean('enableModeChangeAnimation')).assertTrue();

      console.info('EnableModeChangeAnimation_0100 END');
      done();
    });

        
    

    /**
     * @tc.number   EnableModeChangeAnimation_static_0200
     * @tc.name     EnableModeChangeAnimation_static_0200
     * @tc.desc     EnableModeChangeAnimation_static_0200
     * @tc.level    Level.LEVEL0
     */
it('EnableModeChangeAnimation_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('EnableModeChangeAnimation_0200 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);
	  
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let enableFalseId = await (scrollBar?.scrollSearch(ON.id('enableFalseId')) as Promise<Component>);
      await (enableFalseId?.click() as Promise<void>)
      console.info('[EnableModeChangeAnimation_0200] enableFalseId click');
      await CommonFunc.sleep(200);

      let splitId = await (scrollBar?.scrollSearch(ON.id('splitId')) as Promise<Component>);
      await (splitId?.click() as Promise<void>)
      console.info('[EnableModeChangeAnimation_0200] splitId click');
      await CommonFunc.sleep(200);

      let stackId = await (scrollBar?.scrollSearch(ON.id('stackId')) as Promise<Component>);
      await (stackId?.click() as Promise<void>)
      console.info('[EnableModeChangeAnimation_0200] stackId click');
      await CommonFunc.sleep(200);

      let strJson = inspector.getInspectorByKey('navigationId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[EnableModeChangeAnimation_0200] component obj is: ' + JSON.stringify(obj));
      console.info('[EnableModeChangeAnimation_0200] enableModeChangeAnimation obj is: ' + JSON.stringify(obj.getElement('$attrs').getBoolean('enableModeChangeAnimation')));
      expect(obj.getElement('$attrs').getBoolean('enableModeChangeAnimation')).assertFalse();

      console.info('EnableModeChangeAnimation_0200 END');
      done();
    });

  })
}