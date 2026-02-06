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
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function NavDestinationStateActive() {
  describe('NavDestinationStateActive', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation18.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("NavDestinationStateActive beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/NavDestinationStateActive',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get NavDestinationStateActive state pages:" + JSON.stringify(pages));
        if (!("NavDestinationStateActive" == pages.name)) {
          console.info("get NavDestinationStateActive pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push NavDestinationStateActive page error:" + err);
      }
      console.info("NavDestinationStateActive beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("NavDestinationStateActive after each called");
    });


    
    


/**
     * @tc.number   NavDestinationStateActive_static_0100
     * @tc.name     NavDestinationStateActive_static_0100
     * @tc.desc     NavDestinationStateActive_static_0100
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationStateActive_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('NavDestinationStateActive_static_0100 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1 = await (driver.findComponent(ON.id('pushId')) as Promise<Component>);
      await btn1.click();
      console.info('[NavDestinationStateActive_static_0100] btn1 click');
      await driver.delayMs(3000);

      let testVal = AppStorage.get<int>('ON_ACTIVE')
      console.log('NavDestinationStateActive_static_0100 on ON_ACTIVE value : ' + testVal)
      expect(testVal).assertEqual(8);
      AppStorage.delete('ON_ACTIVE');
      console.log('[NavDestinationStateActive_static_0100] END');
      done();
    });

    
    


/**
     * @tc.number   NavDestinationStateActive_static_0200
     * @tc.name     NavDestinationStateActive_static_0200
     * @tc.desc     NavDestinationStateActive_static_0200
     * @tc.level    Level.LEVEL0
     */
it('NavDestinationStateActive_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('NavDestinationStateActive_static_0200 START');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let btn1 = await (driver.findComponent(ON.id('backId')) as Promise<Component>);
      await btn1.click();
      console.info('[NavDestinationStateActive_static_0200] btn1 click');
      await driver.delayMs(3000);

      let testVal2 = AppStorage.get<int>('ON_INACTIVE')
      console.log('NavDestinationStateActive_static_0200 on ON_INACTIVE value : ' + testVal2)
      expect(testVal2).assertEqual(9);
      AppStorage.delete('ON_INACTIVE');
      console.log('[NavDestinationStateActive_static_0200] END');
      done();
    });

  })
}