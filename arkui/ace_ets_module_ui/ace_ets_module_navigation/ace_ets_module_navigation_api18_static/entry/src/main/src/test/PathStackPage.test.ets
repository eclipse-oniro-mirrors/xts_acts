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
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import router from '@ohos.router';
export default function PathStackPage() {
  describe('PathStackPage', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation18.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info('PathStackPage beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PathStackPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get PathStackPage state pages:' + JSON.stringify(pages));
        if (!('PathStackPage' == pages.name)) {
          console.info('get PathStackPage pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push PathStackPage page error:' + err);
      }
      console.info('PathStackPage beforeEach end');
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('PathStackPage after each called');
    });


    
    


/**
     * @tc.number   PathStackPage_static_0100
     * @tc.name     PathStackPage_static_0100
     * @tc.desc     PathStackPage_static_0100
     * @tc.level    Level.LEVEL0
     */
it('PathStackPage_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('PathStackPage_static_0100 START');
      await CommonFunc.sleep(500);
      let driver = Driver.create();
      await driver.delayMs(500);

      let setBtn = await (driver.findComponent(ON.id('pushId')) as Promise<Component>);
      await setBtn.click()
      console.info('[PathStackPage_static_0100] setBtn click');
      await driver.delayMs(1000);

      let getBtn = await (driver.findComponent(ON.id('getId')) as Promise<Component>);
      await getBtn.click()
      console.info('[PathStackPage_static_0100] getBtn click');
      await driver.delayMs(2000);

      let stackLen = AppStorage.get<int>('stackLen')
      expect(stackLen).assertEqual(2);
      AppStorage.delete('stackLen');
      AppStorage.delete('navDestinationId1')

      console.info('PathStackPage_static_0100 END');
      done();
    });

  })
}