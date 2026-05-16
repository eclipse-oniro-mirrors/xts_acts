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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function TextClockJsunit2() {
  describe('TextClockJsunit2', () => {
    beforeEach(async (done: Function) => {
      console.info("TextClockJsunit2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextClock/TextClockJsunit2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextClockJsunit2 state pages: " + JSON.stringify(pages));
        if (!("TextClockJsunit2" == pages.name)) {
          console.info("get TextClockJsunit2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push TextClockJsunit2 page result: " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TextClockJsunit2 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   TextClock_0100
     * @tc.number TextClock_0100
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextClock_0100', Level.LEVEL2, async (done: Function) => {
      // Get the information of TextClock component
      console.info('[TextClock_0100] START');
      let strJson = getInspectorByKey('textClockJsunit2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextClock_0100] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.timeZoneOffset).assertEqual('-8.000000');
      expect(obj.$attrs.format).assertEqual('hms');

      // Get the content of buttons
      let driver = await UiDriver.create()
      let operation = await driver.findComponent(BY.key('operation'));
      let textOperation = await operation.getText();
      expect(textOperation).assertEqual('run success');
      let change = await driver.findComponent(BY.key('change'));
      let textChange = await change.getText();
      expect(textChange).assertEqual('change success');
      console.info('[TextClock_0100] END');
      done();
    });
    /**
     * @tc.name   TextClock_0200
     * @tc.number TextClock_0200
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextClock_0200', Level.LEVEL2, async (done: Function) => {
      // Modify the attribute of TextClock component
      console.info('[TextClock_0200] START');
      globalThis.value.message.notify({name:'timeZoneOffset',value:8})
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'format',value:'yyyyMMddHms'})
      await CommonFunc.sleep(1000);
      // Get the attribute of TextClock component
      let strJson = getInspectorByKey('textClockJsunit2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TextClock_0200] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.timeZoneOffset).assertEqual('8.000000');
      expect(obj.$attrs.format).assertEqual('yyyyMMddHms');
      console.info('[TextClock_0200] END');
      done();
    });
    /**
     * @tc.name   TextClock_0300
     * @tc.number TextClock_0300
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TextClock_0300', Level.LEVEL2, async (done: Function) => {
      // Verify the functions of the button of start
      console.info('[TextClock_0300] START');

      // Click start button
      let driver = await UiDriver.create()
      let startButton = await driver.findComponent(BY.text('start TextClock'));
      await startButton.click();
      await CommonFunc.sleep(1000);
      let accumulateTime1 = await driver.findComponent(BY.key('accumulateTime'));
      let text1 = await accumulateTime1.getText();
      await CommonFunc.sleep(2000);
      let accumulateTime2 = await driver.findComponent(BY.key('accumulateTime'));
      let text2 = await accumulateTime2.getText();
      expect(text1 == text2).assertFalse();
      console.info("[TextClock_0300] text1 and text2 not equal !");

      let change = await driver.findComponent(BY.key('change'));
      let textChange = await change.getText();
      expect(textChange).assertEqual('change success');
      console.info("[TextClock_0300] change success !");

      let operation = await driver.findComponent(BY.key('operation'));
      let textOperation = await operation.getText();
      expect(textOperation).assertEqual('start success');
      console.info("[TextClock_0300] start success !");
      console.info('[TextClock_0300] END');
      done();
    });

  })
}
