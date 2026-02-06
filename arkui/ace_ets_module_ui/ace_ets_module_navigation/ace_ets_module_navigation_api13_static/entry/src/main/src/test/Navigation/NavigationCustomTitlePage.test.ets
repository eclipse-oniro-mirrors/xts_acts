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

export default function NavigationCustomTitlePage() {
  describe('NavigationCustomTitlePage', () => {
    beforeAll(() => {
      console.info("NavigationCustomTitlePage beforeEach start");
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.navigation13.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("NavigationCustomTitlePage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavigationCustomTitlePage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavigationCustomTitlePage state pages:" + JSON.stringify(pages));
        if (!("NavigationCustomTitlePage" == pages.name)) {
          console.info("get NavigationCustomTitlePage pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push NavigationCustomTitlePage page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push NavigationCustomTitlePage page error:" + err);
      }
      console.info("NavigationCustomTitlePage beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("NavigationCustomTitlePage after each called");
    });


    
    

    /**
     * @tc.number   NavigationCustomTitlePage_static_0100
     * @tc.name     NavigationCustomTitlePage_static_0100
     * @tc.desc     NavigationCustomTitlePage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavigationCustomTitlePage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('NavigationCustomTitlePage_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('customTitleId'));
      console.log('+++++++++++++btn1',btn1)
      await (btn1?.click() as Promise<void>) //master22 undefined cannot be cast to Promise<void>
      console.info('[NavigationCustomTitlePage_0100] btn1 click');
      await CommonFunc.sleep(3000);

      let customTitle:Double = AppStorage.get<Double>('customTitle')! as Double
      expect(customTitle).assertEqual(14);
      AppStorage.delete('customTitle');

      console.info('NavigationCustomTitlePage_0100 END');
      done();
    });

    
    

    /**
     * @tc.number   NavigationCustomTitlePage_static_0200
     * @tc.name     NavigationCustomTitlePage_static_0200
     * @tc.desc     NavigationCustomTitlePage_static_0200
     * @tc.level    Level.LEVEL0
     */
it('NavigationCustomTitlePage_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('NavigationCustomTitlePage_0200 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let push = await driver.findComponent(ON.text('push'));
      await (push?.click() as Promise<void>)
      await CommonFunc.sleep(1000);
      console.info('[NavigationCustomTitlePage_0200] push click');

      let btn1 = await driver.findComponent(ON.id('customNavTitleId'));
      await (btn1?.click() as Promise<void>) //master22 undefined cannot be cast to Promise<void>
      console.info('[NavigationCustomTitlePage_0200] btn1 click');
      await CommonFunc.sleep(5000);

      let customNavTitle:Double = AppStorage.get<Double>('customNavTitle')! as Double;
      expect(customNavTitle).assertEqual(15);
      AppStorage.delete('customNavTitle');

      console.info('NavigationCustomTitlePage_0200 END');
      done();
    });

  })
}