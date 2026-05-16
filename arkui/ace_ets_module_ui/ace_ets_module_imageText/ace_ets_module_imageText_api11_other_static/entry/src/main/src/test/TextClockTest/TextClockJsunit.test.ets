'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import router from '@ohos.router';
import window from '@ohos.window';
import events_emitter from '@ohos.events.emitter';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { AppStorage } from '@ohos.arkui.stateManagement'
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { UtilsTest, startAbility, stopApplication } from "../Util.test"
import CommonFunc from '../../../ets/MainAbility/common/Common';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;



export default function TextClockJsunit() {
  describe('TextClockJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextClock beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextClock/TextClockPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextClock state pages:" + JSON.stringify(pages));
        if (!("TextClockPage" == pages.name)) {
          console.info("get TextClock pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextClock page result:" + JSON.stringify(result));
        }

      } catch (err) {
        console.error("push TextClock page error: " + err);
        expect().assertFail();
      }

    });

    
/**
     * @tc.number   TextClock_static_0100
     * @tc.name     TextClock_static_0100
     * @tc.desc     TextClock_static_0100
     * @tc.level    Level.LEVEL2
     */
it('TextClock_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of TextClock component
      console.info('[TextClock_0100] START');
      let strJson = inspector.getInspectorByKey('textClock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('timeZoneOffset')).assertEqual('-8.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('hms');

      // Get the content of buttons
      let driver = Driver.create()
      let operation = await driver.findComponent(ON.id('operation'));
      let textOperation = await (operation?.getText() as Promise<string>);
      expect(textOperation).assertEqual('run success');
      let change = await driver.findComponent(ON.id('change'));
      let textChange = await (change?.getText() as Promise<string>);
      expect(textChange).assertEqual('change success');
      console.info('[TextClock_0100] END');
      done();
    });

    
/**
     * @tc.number   TextClock_static_0200
     * @tc.name     TextClock_static_0200
     * @tc.desc     TextClock_static_0200
     * @tc.level    Level.LEVEL2
     */
it('TextClock_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the attribute of TextClock component
      console.info('[TextClock_0200] START');
      AppStorage.get<MessageManager<int | string | long | number>>("messageManager")!.notify({ name: 'timeZoneOffset', value: 8 as number})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<int | string | long | number>>("messageManager")!.notify({ name: 'format', value: 'yyyyMMddHms' })
      await CommonFunc.sleep(1000);
      // Get the attribute of TextClock component
      let strJson = inspector.getInspectorByKey('textClock');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextClock_0200] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('timeZoneOffset')).assertEqual('8.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('yyyyMMddHms');
      console.info('[TextClock_0200] END');
      done();
    });

    
/**
     * @tc.number   TextClock_static_0300
     * @tc.name     TextClock_static_0300
     * @tc.desc     TextClock_static_0300
     * @tc.level    Level.LEVEL2
     */
it('TextClock_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify the functions of the button of start
      console.info('[TextClock_0300] START');

      // Click start button
      let driver = Driver.create()
      let startButton = await driver.findComponent(ON.text('start TextClock'));
      await CommonFunc.sleep(2000);
      await (startButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let accumulateTime1 = await driver.findComponent(ON.id('accumulateTime'));
      let text1 = await (accumulateTime1?.getText() as Promise<string>);
      await CommonFunc.sleep(2000);
      let accumulateTime2 = await driver.findComponent(ON.id('accumulateTime'));
      let text2 = await (accumulateTime2?.getText() as Promise<string>);
      expect(text1 == text2).assertFalse();
      console.info("[TextClock_0300] text1 and text2 not equal !");

      let change = await driver.findComponent(ON.id('change'));
      let textChange = await (change?.getText() as Promise<string>);
      expect(textChange).assertEqual('change success');
      console.info("[TextClock_0300] change success !");

      let operation = await driver.findComponent(ON.id('operation'));
      let textOperation = await (operation?.getText() as Promise<string>);
      expect(textOperation).assertEqual('start success');
      console.info("[TextClock_0300] start success !");
      console.info('[TextClock_0300] END');
      done();
    });

  })
}
