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

export default function SystemTransition() {
  describe('SystemTransition', () => {
    beforeAll(() => {
      console.info("SystemTransition beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.navigation14.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info('SystemTransition beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/SystemTransition',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get SystemTransition state pages:' + JSON.stringify(pages));
        if (!('SystemTransition' == pages.name)) {
          console.info('get SystemTransition pages.name:' + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info('push SystemTransition page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push SystemTransition page error:' + err);
      }
      console.info('SystemTransition beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('SystemTransition after each called');
    });


    
    

    /**
     * @tc.number   SystemTransition_static_0100
     * @tc.name     SystemTransition_static_0100
     * @tc.desc     SystemTransition_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SystemTransition_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('SystemTransition_0100 START');
      await CommonFunc.sleep(200);

      let driver = Driver.create();
      await CommonFunc.sleep(500);

      let btn1 = await driver.findComponent(ON.id('pageOneId'));
      await (btn1?.click() as Promise<void>)
      console.info('[SystemTransition_0100] btn1 click');
      await CommonFunc.sleep(200);

      let strJson1 = inspector.getInspectorByKey('pageOne');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[SystemTransition_0100] component page one obj is: ' + JSON.stringify(obj1));
      console.info('[SystemTransition_0100] content page one obj is: ' + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('This is page one');

      let btn2 = await driver.findComponent(ON.id('popId'));
      await (btn2?.click() as Promise<void>)
      console.info('[SystemTransition_0100] btn2 click');
      await CommonFunc.sleep(200);

      let btn3 = await driver.findComponent(ON.id('pageTwoId'));
      await (btn3?.click() as Promise<void>)
      console.info('[SystemTransition_0100] btn3 click');
      await CommonFunc.sleep(200);

      let strJson2 = inspector.getInspectorByKey('pageTwo');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[SystemTransition_0100] component page two obj is: ' + JSON.stringify(obj2));
      console.info('[SystemTransition_0100] content page two obj is: ' + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('This is page two');

      console.info('SystemTransition_0100 END');
      done();
    });

  })
}