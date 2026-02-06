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
} from '../../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../../Util.test';
import Utils from '../../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';


export default function VideoReset9() {
  describe('VideoReset9', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("VideoReset9 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoReset/VideoReset9',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get VideoReset9 state success " + JSON.stringify(pages));
        if (!("VideoReset9" == pages.name)) {
          console.info("get VideoReset9 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push VideoReset9 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoReset9 after each called");
    });

    
    /**
     * @tc.number   VideoReset9_static_0100
     * @tc.name     VideoReset9_static_0100
     * @tc.desc     VideoReset9_static_0100
     * @tc.level    Level.LEVEL2
     */
it('VideoReset9_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[VideoReset9_0100] START');
      await CommonFunc.sleep(5000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('VideoReset9_start'));
      await (btn1?.click() as Promise<void>)
      console.info("[VideoReset9_0100] btnStart");
      await CommonFunc.sleep(3000);

      let btn2 = await driver.findComponent(ON.id('VideoReset9_reset'));
      await (btn2?.click() as Promise<void>)
      console.info("[VideoReset9_0100] btnReset click1");
      await CommonFunc.sleep(3000);
      await (btn2?.click() as Promise<void>)
      console.info("[VideoReset9_0100] btnReset click2");
      await CommonFunc.sleep(3000);

      let strJson1 = inspector.getInspectorByKey('VideoReset9_text2');
      await CommonFunc.sleep(1000);
      console.info("[VideoReset9_0100] JSON.parseJsonElement(strJson1) is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('0');

      let btnAutoPlay = await driver.findComponent(ON.id('VideoReset9_autoPlay'));
      await (btnAutoPlay?.click() as Promise<void>)
      console.info("[VideoReset9_0100] btnAutoPlay");
      await CommonFunc.sleep(3000);

      await (btn2?.click() as Promise<void>)
      console.info("[VideoReset9_0100] btnReset click3");
      await CommonFunc.sleep(4000);
      await (btn2?.click() as Promise<void>)
      console.info("[VideoReset9_0100] btnReset click4");
      await CommonFunc.sleep(4000);

      let strJson2 = inspector.getInspectorByKey('VideoReset9_text1');
      await CommonFunc.sleep(1000);
      console.info("[VideoReset9_0100] JSON.parseJsonElement(strJson2) is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onStart3');

      console.info('[VideoReset9_0100] END');
      done();
    });
  })
}

