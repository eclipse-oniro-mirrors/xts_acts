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
import { Driver, ON,Component, Point } from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import events_emitter from '@ohos.events.emitter'
import { BusinessError } from '@ohos.base';


export default function VideoReset3() {
  describe('VideoReset3', () => {
    beforeAll(() => {

      
      await UtilsTest.startAbility("com.arkui.ace.platform.api12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("VideoReset3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Video/VideoReset/VideoReset3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get VideoReset3 state success " + JSON.stringify(pages));
        if (!("VideoReset3" == pages.name)) {
          console.info("get VideoReset3 state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push VideoReset3 page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("VideoReset3 after each called");
    });

    
    /**
     * @tc.number   VideoReset3_static_0100
     * @tc.name     VideoReset3_static_0100
     * @tc.desc     VideoReset3_static_0100
     * @tc.level    Level.LEVEL2
     */
it('VideoReset3_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[VideoReset3_0100] START');
      await CommonFunc.sleep(5000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('VideoReset3_start'));
      await (btn1?.click() as Promise<void>)
      console.info("[VideoReset3_0100] btnStart");
      await CommonFunc.sleep(3000);

      let slider = await driver.findComponent(ON.type('Slider'));
      let point = await (slider?.getBoundsCenter() as Promise<Point>)
      console.info("[VideoReset3_0100] slider centerX:" + point.x + 'centerY:' + point.y);
      await driver.click(Math.round(point.x).toInt(), Math.round(point.y).toInt())
      await CommonFunc.sleep(2000);

      let btn2 = await driver.findComponent(ON.id('VideoReset3_enabled'));
      await (btn2?.click() as Promise<void>)
      console.info("[VideoReset3_0100] btnEnabled");
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('VideoReset3_reset'));
      await (btn3?.click() as Promise<void>)
      console.info("[VideoReset3_0100] btnReset");
      await CommonFunc.sleep(3000);

      let strJson1 = inspector.getInspectorByKey('VideoReset3_text2');
      await CommonFunc.sleep(1000);
      console.info("[VideoReset3_0100] JSON.parseJsonElement(strJson1) is: " + JSON.stringify(JSON.parseJsonElement(strJson1)));
      expect(JSON.parseJsonElement(strJson1).getElement('$attrs').getString('content')).assertEqual('0');

      await (btn1?.click() as Promise<void>)
      console.info("[VideoReset3_0100] btnStart click2");
      await CommonFunc.sleep(3000);

      let strJson2 = inspector.getInspectorByKey('VideoReset3_text1');
      await CommonFunc.sleep(1000);
      console.info("[VideoReset3_0100] JSON.parseJsonElement(strJson2) is: " + JSON.stringify(JSON.parseJsonElement(strJson2)));
      expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('content')).assertEqual('onStart2');

      console.info('[VideoReset3_0100] END');
      done();
    });
  })
}

