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

export default function Recoverable() {
  describe('Recoverable', () => {
    beforeAll(() => {
      console.info("Recoverable beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("Recoverable beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/Recoverable',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get Recoverable state pages:" + JSON.stringify(pages));
        if (!("Recoverable" == pages.name)) {
          console.info("get Recoverable pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Recoverable page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Recoverable page error:" + err);
      }
      console.info("Recoverable beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("Recoverable after each called");
    });


    
    

    /**
     * @tc.number   Recoverable_static_0100
     * @tc.name     Recoverable_static_0100
     * @tc.desc     Recoverable_static_0100
     * @tc.level    Level.LEVEL0
     */
it('Recoverable_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('Recoverable_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let strJson = inspector.getInspectorByKey('testNavigation');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[Recoverable_0100] component obj is: ' + JSON.stringify(obj));
      // console.info('[Recoverable_0100] recoverable obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('recoverable')));
      console.info('[Recoverable_0200] height obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('height')));
      expect('' + obj.getElement('$attrs').getString('height')).assertEqual('50.00%');

      console.info('Recoverable_0100 END');
      done();
    });

    
    

    /**
     * @tc.number   Recoverable_static_0200
     * @tc.name     Recoverable_static_0200
     * @tc.desc     Recoverable_static_0200
     * @tc.level    Level.LEVEL0
     */
it('Recoverable_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('Recoverable_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await driver.findComponent(ON.id('update'));
      await (btn1?.click() as Promise<void>)
      console.info('[Recoverable_0200] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('testNavigation');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[Recoverable_0200] component obj is: ' + JSON.stringify(obj));
      // console.info('[Recoverable_0200] recoverable obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('recoverable')));
      console.info('[Recoverable_0200] height obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('height')));
      expect('' + obj.getElement('$attrs').getString('height')).assertEqual('50.00%');

      console.info('Recoverable_0200 END');
      done();
    });

    
    

    /**
     * @tc.number   Recoverable_static_0300
     * @tc.name     Recoverable_static_0300
     * @tc.desc     Recoverable_static_0300
     * @tc.level    Level.LEVEL0
     */
it('Recoverable_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('Recoverable_0300 START');

      expect(true).assertEqual(true);

      console.info('Recoverable_0300 END');
      done();
    });

    
    

    /**
     * @tc.number   Recoverable_static_0400
     * @tc.name     Recoverable_static_0400
     * @tc.desc     Recoverable_static_0400
     * @tc.level    Level.LEVEL0
     */
it('Recoverable_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('Recoverable_0400 START');

      expect(false).assertEqual(false);

      console.info('Recoverable_0400 END');
      done();
    });

  })
}