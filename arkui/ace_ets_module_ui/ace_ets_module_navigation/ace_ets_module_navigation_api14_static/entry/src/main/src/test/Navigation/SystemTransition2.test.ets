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

export default function SystemTransition2() {
  describe('SystemTransition2', () => {
    beforeAll(() => {
      console.info("SystemTransition2 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info('SystemTransition2 beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/SystemTransition2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get SystemTransition2 state pages:' + JSON.stringify(pages));
        if (!('SystemTransition2' == pages.name)) {
          console.info('get SystemTransition2 pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info('push SystemTransition2 page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SystemTransition2 page error:' + err);
      }
      console.info('SystemTransition2 beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SystemTransition2 after each called');
    });


    
    

    /**
     * @tc.number   SystemTransition2_static_0100
     * @tc.name     SystemTransition2_static_0100
     * @tc.desc     SystemTransition2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SystemTransition2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SystemTransition2_0100 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await driver.findComponent(ON.id('pushOneId'));
      await (btn1?.click() as Promise<void>)
      console.info('[SystemTransition2_0100] btn1 click');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('pageOneId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SystemTransition2_0100] component obj is: ' + JSON.stringify(obj));
      console.log('[SystemTransition2_0100] systemTransition is: ' + JSON.stringify(obj.getElement('$attrs').getString('systemTransition')));
      expect(obj.getElement('$attrs').getString('systemTransition')).assertEqual('NavigationSystemTransitionType.DEFAULT');


      let btn2 = await driver.findComponent(ON.id('popId'));
      await (btn2?.click() as Promise<void>)
      console.info('[SystemTransition2_0100] btn2 click');
      await CommonFunc.sleep(1000);
      console.info('SystemTransition2_0100 END');
      done();
    });

    
    

    /**
     * @tc.number   SystemTransition2_static_0200
     * @tc.name     SystemTransition2_static_0200
     * @tc.desc     SystemTransition2_static_0200
     * @tc.level    Level.LEVEL0
     */
it('SystemTransition2_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SystemTransition2_0200 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await driver.findComponent(ON.id('pushTwoId'));
      await (btn1?.click() as Promise<void>)
      console.info('[SystemTransition2_0200] btn1 click');
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('pageTwoId');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[SystemTransition2_0200] component obj is: ' + JSON.stringify(obj));
      console.log('[SystemTransition2_0200] systemTransition is: ' + JSON.stringify(obj.getElement('$attrs').getString('systemTransition')));
      expect(obj.getElement('$attrs').getString('systemTransition')).assertEqual('NavigationSystemTransitionType.NONE');

      console.info('SystemTransition2_0200 END');
      done();
    });

  })
}