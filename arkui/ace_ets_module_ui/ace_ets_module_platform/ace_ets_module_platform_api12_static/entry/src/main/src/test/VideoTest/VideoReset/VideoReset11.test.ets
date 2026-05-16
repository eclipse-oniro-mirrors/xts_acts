'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import wifiMg from '@ohos.wifiManager';

export default function VideoReset11() {
  describe('VideoReset11', () => {
    beforeAll(async (): Promise<void> => {

      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("VideoReset11 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoReset/VideoReset11',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get VideoReset11 state success " + JSON.stringify(pages));
        if (!("VideoReset11" == pages.name)) {
          console.info("get VideoReset11 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push VideoReset11 page error: " + err);
      }

      try {
        let data: wifiMg.WifiLinkedInfo = await wifiMg.getLinkedInfo();
        console.info("======> Internet WifiLinkedInfo : " + JSON.stringify(data));
        console.info("======> Internet speed : " + JSON.stringify(data.linkSpeed));
        console.info("======> Internet chload : " + JSON.stringify(data.chload));
        console.info("======> Internet rssi : " + JSON.stringify(data.rssi));
            
        if (data.connState == wifiMg.ConnState.CONNECTED) {
          console.info("======> WLAN connection established ");
        } else {
          expect().message("======> WLAN Network error").assertFail(); 
        }
        if (data.chload >= 900 || data.rssi <= -80) {
          expect().message("======> WLAN Network error").assertFail();
        } else if (data.chload >= 500) {
          console.info("======> The internet connection is poor. ");
        }
            
      } catch (err) {
        console.info("======> getLinkedInfo promise failed, err :" + JSON.stringify(err));
        throw (err as Error);
      }
      
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoReset11 after each called");
    });

    
    /**
     * @tc.number   VideoReset11_static_0100
     * @tc.name     VideoReset11_static_0100
     * @tc.desc     VideoReset11_static_0100
     * @tc.level    Level.LEVEL2
     */
it('VideoReset11_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[VideoReset11_0100] START');
      await CommonFunc.sleep(5000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('VideoReset11_start'));
      await (btn1?.click() as Promise<void>)
      console.info("[VideoReset11_0100] btnStart");
      await CommonFunc.sleep(18000);

      let strJson = inspector.getInspectorByKey('VideoReset11_text3');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[VideoReset11_0100] obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('onFinish');

      let btn2 = await driver.findComponent(ON.id('VideoReset11_reset'));
      await (btn2?.click() as Promise<void>)
      console.info("[VideoReset11_0100] btnReset");
      await CommonFunc.sleep(3000);

      let strJson1 = inspector.getInspectorByKey('VideoReset11_text2');

      await CommonFunc.sleep(1000);
      console.info("[VideoReset11_0100] JSON.parseJsonElement(strJson1) is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('0');

      await (btn1?.click() as Promise<void>)
      console.info("[VideoReset11_0100] btnStart click2");
      await CommonFunc.sleep(3000);

      let strJson2 = inspector.getInspectorByKey('VideoReset11_text1');

      await CommonFunc.sleep(1000);
      console.info("[VideoReset11_0100] JSON.parseJsonElement(strJson2) is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onStart2');

      let btnAutoPlay = await driver.findComponent(ON.id('VideoReset11_autoPlay'));
      await (btnAutoPlay?.click() as Promise<void>)
      console.info("[VideoReset11_0100] btnAutoPlay");
      await CommonFunc.sleep(3000);

      await (btn2?.click() as Promise<void>)
      console.info("[VideoReset11_0100] btnReset click2");
      await CommonFunc.sleep(3000);

      let strJson3 = inspector.getInspectorByKey('VideoReset11_text1');

      await CommonFunc.sleep(1000);
      console.info("[VideoReset11_0100] JSON.parseJsonElement(strJson3) is: " + JSON.stringify(JSON.parseJsonElement(strJson3)));
      expect(JSON.parseJsonElement(strJson3).getElement('$attrs').getString('content')).assertEqual('onStart3');

      console.info('[VideoReset11_0100] END');
      done();
    });
  })
}

