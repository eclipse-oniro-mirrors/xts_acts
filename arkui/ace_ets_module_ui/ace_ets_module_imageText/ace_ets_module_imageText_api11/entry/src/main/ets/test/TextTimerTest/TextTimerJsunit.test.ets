/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function TextTimerJsunit() {
  describe('TextTimerJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("TextTimer beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextTimer/TextTimerPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextTimer state pages: " + JSON.stringify(pages));
        if (!("TextTimerPage" == pages.name)) {
          console.info("get TextTimer state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push TextTimer page result: " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextTimer page error: " + err);
        expect().assertFail();
      }
      done();
    });

    it('TextTimerJsunit_0100', 0, async (done: Function) => {
      // Get the information of TextTimer component
      console.info('[TextTimerJsunit_0100] START');
      let strJson = getInspectorByKey('textTimer');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextTimerJsunit_0100] component obj is: " + JSON.stringify(obj));
      console.info("[TextTimerJsunit_0100] isCountDown: " + JSON.stringify(obj.$attrs.isCountDown));
      console.info("[TextTimerJsunit_0100] count: " + JSON.stringify(obj.$attrs.count));
      console.info("[TextTimerJsunit_0100] format: " + JSON.stringify(obj.$attrs.format));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.isCountDown).assertEqual('true');
      expect(obj.$attrs.count).assertEqual('50000.000000');
      expect(obj.$attrs.format).assertEqual('mm:ss.SS');

      // Get default attributes of TextTimer component
      let strJson1 = getInspectorByKey('default');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[TextTimerJsunit_0100] component obj1 is: " + JSON.stringify(obj1));
      console.info("[TextTimerJsunit_0100] isCountDown1: " + JSON.stringify(obj1.$attrs.isCountDown));
      console.info("[TextTimerJsunit_0100] count1: " + JSON.stringify(obj1.$attrs.count));
      console.info("[TextTimerJsunit_0100] format1: " + JSON.stringify(obj1.$attrs.format));
      await CommonFunc.sleep(1000);
      expect(obj1.$attrs.isCountDown).assertEqual('false');
      expect(obj1.$attrs.count).assertEqual('60000.000000');
      expect(obj1.$attrs.format).assertEqual('HH:mm:ss.SS');
      console.info('[TextTimerJsunit_0100] END');
      done();
    });

    it('TextTimerJsunit_0200', 0, async (done: Function) => {
      // Modify the attribute of TextTimer component
      console.info('[TextTimerJsunit_0200] START');
      globalThis.value.message.notify({name:'isCountDown',value:'false'})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'count',value:30000})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'format',value:'HH:mm:ss.SS'})
      await CommonFunc.sleep(2000);

      // Get the attribute of TextTimer component
      let strJson = getInspectorByKey('textTimer');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextTimerJsunit_0200] component obj is: " + JSON.stringify(obj));
      console.info("[TextTimerJsunit_0200] isCountDown: " + JSON.stringify(obj.$attrs.isCountDown));
      console.info("[TextTimerJsunit_0200] count: " + JSON.stringify(obj.$attrs.count));
      console.info("[TextTimerJsunit_0200] format: " + JSON.stringify(obj.$attrs.format));
      await CommonFunc.sleep(1000);
      //expect(obj.$attrs.isCountDown).assertEqual('false');
      //expect(obj.$attrs.count).assertEqual('30000.000000');
      expect(obj.$attrs.format).assertEqual('HH:mm:ss.SS');
      console.info('[TextTimerJsunit_0200] END');
      done();
    });

    it('TextTimerJsunit_0300', 0, async (done: Function) => {
      // Verify start function of TextTimer component
      console.info('[TextTimerJsunit_0300] START');
      let driver = await UiDriver.create()
      let utc = await driver.findComponent(BY.key('utcNum'));
      let utcText = await utc.getText();
      console.info("[TextTimerJsunit_0300] utcText: " + JSON.stringify(utcText));

      let startButton = await driver.findComponent(BY.text('start'));
      await startButton.click();
      await CommonFunc.sleep(1000);
      let utcText1 = await utc.getText();
      console.info("[TextTimerJsunit_0300] utcText1: " + JSON.stringify(utcText1));
      expect(Number(utcText) < Number(utcText1)).assertTrue();

      let elapsedTime = await driver.findComponent(BY.key('elapsedTime'));
      let time = await elapsedTime.getText();
      console.info("[TextTimerJsunit_0300] time: " + JSON.stringify(time));
      expect(Number(time) > 100).assertTrue();

      let start = await driver.findComponent(BY.key('start'));
      let startText = await start.getText();
      console.info("[TextTimerJsunit_0300] startText: " + JSON.stringify(startText));
      expect(startText).assertEqual('start:succ');
      console.info('[TextTimerJsunit_0300] END');
      done();
    });

    it('TextTimerJsunit_0400', 0, async (done: Function) => {
      // Verify pause function of TextTimer component
      console.info('[TextTimerJsunit_0400] START');
      let driver = await UiDriver.create()
      let pauseButton = await driver.findComponent(BY.text('pause'));
      await pauseButton.click();
      await CommonFunc.sleep(1000);

      let utc = await driver.findComponent(BY.key('utcNum'));
      let utcText = await utc.getText();
      console.info("[TextTimerJsunit_0400] utcText: " + JSON.stringify(utcText));

      let elapsedTime = await driver.findComponent(BY.key('elapsedTime'));
      let time = await elapsedTime.getText();
      console.info("[TextTimerJsunit_0400] time: " + JSON.stringify(time));
      await CommonFunc.sleep(1000);
      
      let utcText1 = await utc.getText();
      console.info("[TextTimerJsunit_0400] utcText1: " + JSON.stringify(utcText1));
      expect(utcText == utcText1).assertTrue();

      let time1 = await elapsedTime.getText();
      console.info("[TextTimerJsunit_0400] time1: " + JSON.stringify(time1));
      expect(time == time1).assertTrue();

      let startButton = await driver.findComponent(BY.text('start'));
      await startButton.click();
      await CommonFunc.sleep(1000);
      
      let utcText2 = await utc.getText();
      console.info("[TextTimerJsunit_0400] utcText2: " + JSON.stringify(utcText2));
      expect(Number(utcText1) < Number(utcText2)).assertTrue();

      let pause = await driver.findComponent(BY.key('pause'));
      let pauseText = await pause.getText();
      console.info("[TextTimerJsunit_0400] pauseText: " + JSON.stringify(pauseText));
      expect(pauseText).assertEqual('pause:succ');
      console.info('[TextTimerJsunit_0400] END');
      done();
    });

    it('TextTimerJsunit_0500', 0, async (done: Function) => {
      // Verify reset function of TextTimer component
      console.info('[TextTimerJsunit_0500] START');
      let driver = await UiDriver.create()
      let utc = await driver.findComponent(BY.key('utcNum'));
      let utcText = await utc.getText();
      console.info("[TextTimerJsunit_0300] utcText: " + JSON.stringify(utcText));
      await CommonFunc.sleep(1000);

      let resetButton = await driver.findComponent(BY.text('reset'));
      await resetButton.click();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(BY.key('reset'));
      let resetText = await button.getText();
      console.info("[TextTimerJsunit_0500] resetText: " + JSON.stringify(resetText));
      expect(resetText).assertEqual('reset:succ');

      let utcText1 = await utc.getText();
      console.info("[TextTimerJsunit_0300] utcText1: " + JSON.stringify(utcText1));
      expect(Number(utcText) < Number(utcText1)).assertTrue();

      let elapsedTime = await driver.findComponent(BY.key('elapsedTime'));
      let time1 = await elapsedTime.getText();
      console.info("[TextTimerJsunit_0300] time1: " + JSON.stringify(time1));
      await CommonFunc.sleep(1000);
      let utcText2 = await utc.getText();
      console.info("[TextTimerJsunit_0300] utcText2: " + JSON.stringify(utcText2));
      expect(utcText1 == utcText2).assertTrue();

      let time2 = await elapsedTime.getText();
      console.info("[TextTimerJsunit_0300] time2: " + JSON.stringify(time2));
      expect(time1 == time2).assertTrue();
      console.info('[TextTimerJsunit_0500] END');
      done();
    });

    it('TextTimerJsunit_0600', 0, async (done: Function) => {
      // Illegal modification of properties of TextTimer component
      console.info('[TextTimerJsunit_0600] START');
      globalThis.value.message.notify({name:'isCountDown',value:123})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'count',value:'abc'})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'format',value:123})
      await CommonFunc.sleep(2000);

      // Get the attribute of TextTimer component
      let strJson = getInspectorByKey('textTimer');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextTimerJsunit_0600] component obj is: " + JSON.stringify(obj));
      console.info("[TextTimerJsunit_0600] isCountDown: " + JSON.stringify(obj.$attrs.isCountDown));
      console.info("[TextTimerJsunit_0600] count: " + JSON.stringify(obj.$attrs.count));
      console.info("[TextTimerJsunit_0600] format: " + JSON.stringify(obj.$attrs.format));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.isCountDown).assertEqual('true');
      expect(obj.$attrs.count).assertEqual('50000.000000');
      expect(obj.$attrs.format).assertEqual('HH:mm:ss.SS');
      console.info('[TextTimerJsunit_0600] END');
      done();
    });
  })
}
