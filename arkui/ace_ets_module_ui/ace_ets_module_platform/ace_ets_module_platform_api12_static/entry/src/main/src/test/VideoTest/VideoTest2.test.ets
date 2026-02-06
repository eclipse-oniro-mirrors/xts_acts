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

export default function VideoTest2() {
  describe('VideoTest2', () => {
    beforeAll(() => {
      
      
      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("VideoTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoTest2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get VideoTest2 state success " + JSON.stringify(pages));
        if (!("VideoTest2" == pages.name)) {
          console.info("get VideoTest2 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push VideoTest2 page error: " + err);
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("VideoTest2 after each called");
    });

    
    /**
     * @tc.number   VideoTest2_static_0100
     * @tc.name     VideoTest2_static_0100
     * @tc.desc     VideoTest2_static_0100
     * @tc.level    Level.LEVEL2
     */
it('VideoTest2_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[VideoTest2_static_0100] START');
      await CommonFunc.sleep(5000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('VideoTest2_start'));
      await (btn1?.click() as Promise<void>)
      console.info("[VideoTest2_static_0100] btn1");
      await CommonFunc.sleep(3000);

      let strJson1 = inspector.getInspectorByKey('VideoTest2_text');
      await CommonFunc.sleep(1000);
      console.info("[VideoTest2_static_0100] obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('onStart');

      console.info('[VideoTest2_static_0100] END');
      done();
    });
  })
}

