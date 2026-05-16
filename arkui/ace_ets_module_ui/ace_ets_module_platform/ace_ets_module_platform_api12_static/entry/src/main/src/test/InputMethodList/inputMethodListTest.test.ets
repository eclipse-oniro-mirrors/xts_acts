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

export default function inputMethodListTest() {
  describe('inputMethodListTest', () => {
    beforeAll(() => {
      
      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("inputMethodListTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/InputMethodList/inputMethodListTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get inputMethodListTest state pages: " + JSON.stringify(pages));
        if (!("inputMethodListTest" == pages.name)) {
          console.info("get inputMethodListTest state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push inputMethodListTest page error:" + err);
      }
      console.info("inputMethodListTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("inputMethodListTest after each called");
    });


    
    /**
     * @tc.number   inputMethodListTest_0100
     * @tc.name     inputMethodListTest_0100
     * @tc.desc     inputMethodListTest_0100
     * @tc.level    Level.LEVEL1
     */
it('inputMethodListTest_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('inputMethodListTest_0100 START');
      await CommonFunc.sleep(2000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let open = await driver.findComponent(ON.id('inputMethodListTest_col'));
      await (open?.click() as Promise<void>)
      console.info("[addParallelGestureTest1_0100] text");
      await CommonFunc.sleep(1000);

      let strJson1 = inspector.getInspectorByKey('inputMethodListTest_text');
      await CommonFunc.sleep(1000);
      console.info("[inputMethodListTest_0100] obj1 is: " + JSON.stringify(strJson1));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('1');

      await driver.triggerKey(2070);
      await CommonFunc.sleep(2000);

      console.info('inputMethodListTest_0100 END');
      done();
    });
  })
}