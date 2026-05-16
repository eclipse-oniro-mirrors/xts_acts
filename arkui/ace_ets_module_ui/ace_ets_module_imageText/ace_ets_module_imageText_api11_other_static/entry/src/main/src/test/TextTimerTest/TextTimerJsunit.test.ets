'use static';
/**
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
import { TextTimerController } from '@ohos.arkui.component';


let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;



export default function TextTimerJsunit() {
  describe('TextTimerJsunit', () => {
    beforeAll(async () => {
      
      await UtilsTest.startAbility("com.arkui.ace.imageText.api11.other.static", "EntryAbility")
      
    });

    beforeEach(async (): Promise<void> => {
      console.info("TextTimer beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextTimer/TextTimerPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextTimer state pages:" + JSON.stringify(pages));
        if (!("TextTimerPage" == pages.name)) {
          console.info("get TextTimer pages.name:" + JSON.stringify(pages.name));
          // let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push TextTimer page result:" + JSON.stringify(result));
        }

      } catch (err:Error) {
        console.error("push TextTimer page error: " + err);
        expect().assertFail();
      }

    });


    
/**
     * @tc.number   TextTimerJsunit_static_0100
     * @tc.name     TextTimerJsunit_static_0100
     * @tc.desc     TextTimerJsunit_static_0100
     * @tc.level    Level.LEVEL2
     */
it('TextTimerJsunit_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Get the information of TextTimer component
      console.info('[TextTimerJsunit_0100] START');
      let strJson = inspector.getInspectorByKey('textTimer');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextTimerJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[TextTimerJsunit_0100] isCountDown: " + JSON.stringify(obj.getElement('$attrs').getString('isCountDown')));
      console.info("[TextTimerJsunit_0100] count: " + JSON.stringify(obj.getElement('$attrs').getString('count')));
      console.info("[TextTimerJsunit_0100] format: " + JSON.stringify(obj.getElement('$attrs').getString('format')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('isCountDown')).assertEqual('true');
      expect(obj.getElement('$attrs').getString('count')).assertEqual('50000.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('mm:ss.SS');

      // Get default attributes of TextTimer component
      let strJson1 = inspector.getInspectorByKey('default');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[TextTimerJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[TextTimerJsunit_0100] isCountDown1: " + JSON.stringify(obj1.getElement('$attrs').getString('isCountDown')));
      console.info("[TextTimerJsunit_0100] count1: " + JSON.stringify(obj1.getElement('$attrs').getString('count')));
      console.info("[TextTimerJsunit_0100] format1: " + JSON.stringify(obj1.getElement('$attrs').getString('format')));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('isCountDown')).assertEqual('false');
      expect(obj1.getElement('$attrs').getString('count')).assertEqual('60000.000000');
      expect(obj1.getElement('$attrs').getString('format')).assertEqual('HH:mm:ss.SS');
      console.info('[TextTimerJsunit_0100] END');
      done();
    });

    
/**
     * @tc.number   TextTimerJsunit_static_0200
     * @tc.name     TextTimerJsunit_static_0200
     * @tc.desc     TextTimerJsunit_static_0200
     * @tc.level    Level.LEVEL2
     */
it('TextTimerJsunit_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Modify the attribute of TextTimer component
      console.info('[TextTimerJsunit_0200] START');
      AppStorage.get<MessageManager<number | string | long | int | boolean>>("messageManager")!.notify({ name: 'isCountDown', value: false })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number | string | long | int | boolean>>("messageManager")!.notify({ name: 'count', value: new Long(30000) })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number | string | long | int | boolean>>("messageManager")!.notify({ name: 'format', value: 'HH:mm:ss.SS' })
      await CommonFunc.sleep(2000);

      // Get the attribute of TextTimer component
      let strJson = inspector.getInspectorByKey('textTimer');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextTimerJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[TextTimerJsunit_0200] isCountDown: " + JSON.stringify(obj.getElement('$attrs').getString('isCountDown')));
      console.info("[TextTimerJsunit_0200] count: " + JSON.stringify(obj.getElement('$attrs').getString('count')));
      console.info("[TextTimerJsunit_0200] format: " + JSON.stringify(obj.getElement('$attrs').getString('format')));
      await CommonFunc.sleep(1000);
      //expect(obj.getElement('$attrs').getString('isCountDown')).assertEqual('false');
      // expect(obj.getElement('$attrs').getString('count')).assertEqual('30000.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('HH:mm:ss.SS');
      console.info('[TextTimerJsunit_0200] END');
      done();
    });

    
/**
     * @tc.number   TextTimerJsunit_static_0300
     * @tc.name     TextTimerJsunit_static_0300
     * @tc.desc     TextTimerJsunit_static_0300
     * @tc.level    Level.LEVEL2
     */
it('TextTimerJsunit_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify start function of TextTimer component
      console.info('[TextTimerJsunit_0300] START');
      let driver = Driver.create()
      let utc = await driver.findComponent(ON.id('utcNum'));
      console.log('driver.findComponent(ON.id(utcNum))' + JSON.stringify(utc))
      await CommonFunc.sleep(2000);
      let utcText = await (utc?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0300] utcText: " + JSON.stringify(utcText));

      let startButton = await driver.findComponent(ON.text('start'));
      await (startButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let utcText1 = await (utc?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0300] utcText1: " + JSON.stringify(utcText1));
      expect(Number(utcText) < Number(utcText1)).assertTrue();

      let elapsedTime = await driver.findComponent(ON.id('elapsedTime'));
      let time = await (elapsedTime?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0300] time: " + JSON.stringify(time));
      expect(Number(time) > 100).assertTrue();

      let start = await driver.findComponent(ON.id('start'));
      let startText = await (start?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0300] startText: " + JSON.stringify(startText));
      expect(startText).assertEqual('start:succ');
      console.info('[TextTimerJsunit_0300] END');
      done();
    });

    
/**
     * @tc.number   TextTimerJsunit_static_0400
     * @tc.name     TextTimerJsunit_static_0400
     * @tc.desc     TextTimerJsunit_static_0400
     * @tc.level    Level.LEVEL2
     */
it('TextTimerJsunit_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify pause function of TextTimer component
      console.info('[TextTimerJsunit_0400] START');
      let driver = Driver.create()
      let pauseButton = await driver.findComponent(ON.text('pause'));
      await (pauseButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let utc = await driver.findComponent(ON.id('utcNum'));
      let utcText = await (utc?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0400] utcText: " + JSON.stringify(utcText));

      let elapsedTime = await driver.findComponent(ON.id('elapsedTime'));
      let time = await (elapsedTime?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0400] time: " + JSON.stringify(time));
      await CommonFunc.sleep(1000);

      let utcText1 = await (utc?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0400] utcText1: " + JSON.stringify(utcText1));
      expect(utcText == utcText1).assertTrue();

      let time1 = await (elapsedTime?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0400] time1: " + JSON.stringify(time1));
      expect(time == time1).assertTrue();

      let startButton = await driver.findComponent(ON.id('start1'));
      await (startButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let utcText2 = await (utc?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0400] utcText2: " + JSON.stringify(utcText2));
      expect(Number(utcText1) < Number(utcText2)).assertTrue();

      let pause = await driver.findComponent(ON.id('pause'));
      let pauseText = await (pause?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0400] pauseText: " + JSON.stringify(pauseText));
      expect(pauseText).assertEqual('pause:succ');
      console.info('[TextTimerJsunit_0400] END');
      done();
    });

    
/**
     * @tc.number   TextTimerJsunit_static_0500
     * @tc.name     TextTimerJsunit_static_0500
     * @tc.desc     TextTimerJsunit_static_0500
     * @tc.level    Level.LEVEL2
     */
it('TextTimerJsunit_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Verify reset function of TextTimer component
      console.info('[TextTimerJsunit_0500] START');
      let driver = Driver.create()
      let utc = await driver.findComponent(ON.id('utcNum'));
      await CommonFunc.sleep(2000);
      let utcText = await (utc?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0300] utcText: " + JSON.stringify(utcText));
      await CommonFunc.sleep(1000);

      let resetButton = await driver.findComponent(ON.id('reset1'));
      await (resetButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('reset'));
      let resetText = await (button?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0500] resetText: " + JSON.stringify(resetText));
      expect(resetText).assertEqual('reset:succ');

      let utcText1 = await (utc?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0300] utcText1: " + JSON.stringify(utcText1));
      expect(Number(utcText) < Number(utcText1)).assertTrue();

      let elapsedTime = await driver.findComponent(ON.id('elapsedTime'));
      let time1 = await (elapsedTime?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0300] time1: " + JSON.stringify(time1));
      await CommonFunc.sleep(1000);
      let utcText2 = await (utc?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0300] utcText2: " + JSON.stringify(utcText2));
      expect(utcText1 == utcText2).assertTrue();

      let time2 = await (elapsedTime?.getText() as Promise<string>);
      console.info("[TextTimerJsunit_0300] time2: " + JSON.stringify(time2));
      expect(time1 == time2).assertTrue();
      console.info('[TextTimerJsunit_0500] END');
      done();
    });

    
/**
     * @tc.number   TextTimerJsunit_static_0600
     * @tc.name     TextTimerJsunit_static_0600
     * @tc.desc     TextTimerJsunit_static_0600
     * @tc.level    Level.LEVEL2
     */
it('TextTimerJsunit_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      // Illegal modification of properties of TextTimer component
      console.info('[TextTimerJsunit_0600] START');
      AppStorage.get<MessageManager<number | string | long | int | boolean>>("messageManager")!.notify({ name: 'isCountDown', value: 123 as number })
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number | string | long | int | boolean>>("messageManager")!.notify({ name: 'count', value: 'abc'})
      await CommonFunc.sleep(1000);
      AppStorage.get<MessageManager<number | string | long | int | boolean>>("messageManager")!.notify({ name: 'format', value: 123 as long })
      await CommonFunc.sleep(2000);

      // Get the attribute of TextTimer component
      let strJson = inspector.getInspectorByKey('textTimer');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TextTimerJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[TextTimerJsunit_0600] isCountDown: " + JSON.stringify(obj.getElement('$attrs').getString('isCountDown')));
      console.info("[TextTimerJsunit_0600] count: " + JSON.stringify(obj.getElement('$attrs').getString('count')));
      console.info("[TextTimerJsunit_0600] format: " + JSON.stringify(obj.getElement('$attrs').getString('format')));
      await CommonFunc.sleep(1000);
      expect(obj.getElement('$attrs').getString('isCountDown')).assertEqual('true');
      
      expect(obj.getElement('$attrs').getString('count')).assertEqual('30000.000000');
      expect(obj.getElement('$attrs').getString('format')).assertEqual('HH:mm:ss.SS');
      console.info('[TextTimerJsunit_0600] END');
      done();
    });
  })
}
