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
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';
import router from '@ohos.router';

export default function ReplaceDestination2() {
  describe('ReplaceDestination2', () => {
    beforeAll(() => {

      await UtilsTest.startAbility("com.arkui.ace.navigation16.static", "EntryAbility")

    });
    beforeEach(async (): Promise<void> => {
      console.info("ReplaceDestination2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/ReplaceDestination2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ReplaceDestination2 state pages:" + JSON.stringify(pages));
        if (!("ReplaceDestination2" == pages.name)) {
          console.info("get ReplaceDestination2 pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ReplaceDestination2 page error:" + err);
      }
      console.info("ReplaceDestination2 beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("ReplaceDestination2 after each called");
    });


    
    

/**
     * @tc.number   ReplaceDestination2_static_0100
     * @tc.name     ReplaceDestination2_static_0100
     * @tc.desc     ReplaceDestination2_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ReplaceDestination2_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ReplaceDestination2_static_0100 START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(200);

      let btn1 = await (driver.findComponent(ON.id('pageTwoId')) as Promise<Component>);
      await btn1.click()
      console.info('[ReplaceDestination2_static_0100] btn1 click');
      await CommonFunc.sleep(500);

      let strJson = inspector.getInspectorByKey('id05');
      let obj = JSON.parseJsonElement(strJson);
      console.info('[ReplaceDestination2_static_0100] component obj is: ' + JSON.stringify(obj));
      console.info('[ReplaceDestination2_static_0100] content obj is: ' + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('100005');

      console.info('ReplaceDestination2_static_0100 END');
      done();
    });

  })
}