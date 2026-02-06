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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';
import { MessageManager, Callback } from '../../MainAbility/utils/MessageManager';

export default function TimePickerJsunit() {
  describe('TimePickerJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("TimePicker beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/TimePickerPage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TimePicker state pages: " + JSON.stringify(pages));
        if (!("TimePickerPage" == pages.name)) {
          console.info("get TimePicker state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info("push TimePicker page result: " + JSON.stringify(result));
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push TimePicker page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   TimePickerJsunit_0100
     * @tc.number TimePickerJsunit_0100
     * @tc.desc   TimePickerJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerJsunit_0100', Level.LEVEL1, async (done: Function) => {
      // Verify 12-hour function of TimePicker component
      // switch 12-hour
      console.info('[TimePickerJsunit_0100] START');
      let driver = await Driver.create()
      let switchButton = await driver.findComponent(ON.id('button'));
      await switchButton.click();
      await CommonFunc.sleep(1000);

      let timePicker = await driver.findComponent(ON.id('timePicker'));
      let rect = await timePicker.getBounds();
      let left = rect.left
      let top = rect.top
      let bottom = rect.bottom
      let right = rect.right
      let middle = (top + bottom) / 2

      // Verify AM or PM
      let hour = await driver.findComponent(ON.id('hour'));
      let hour1 = await hour.getText();
      console.info("[TimePickerJsunit_0100] hour1: " + JSON.stringify(hour1));
      expect(hour1).assertEqual('hour:8');
      await driver.swipe(Math.round(left + (right - left) / 6), Math.round(top + (bottom - top) / 2),
        Math.round(left + (right - left) / 6), Math.round(top));
      await CommonFunc.sleep(6000);
      let hour2 = await hour.getText();
      console.info("[TimePickerJsunit_0100] hour2: " + JSON.stringify(hour2));
      expect(hour2).assertEqual('hour:20');

      // Verify hour
      await driver.swipe(Math.round(left + (right - left) / 2), Math.round(top + (bottom - top) / 2),
        Math.round(left + (right - left) / 2), Math.round(top + (bottom - top) * 0.75));
      await CommonFunc.sleep(6000);
      let hour3 = await hour.getText();
      console.info("[TimePickerJsunit_0100] hour3: " + JSON.stringify(hour3));
      expect(hour2 == hour3).assertFalse();

      // Verify minute
      let minute = await driver.findComponent(ON.id('minute'));
      let minute1 = await minute.getText();
      console.info("[TimePickerJsunit_0100] minute1: " + JSON.stringify(minute1));
      expect(minute1).assertEqual('minute:0');
      await driver.swipe(Math.round(left + (right - left) * 5 / 6), Math.round(top + (bottom - top) / 2),
        Math.round(left + (right - left) * 5 / 6), Math.round(top + (bottom - top) * 0.75));
      await CommonFunc.sleep(6000);
      let minute2 = await minute.getText();
      console.info("[TimePickerJsunit_0100] minute2: " + JSON.stringify(minute2));
      expect(minute1 == minute2).assertFalse();
      console.info('[TimePickerJsunit_0100] END');
      done();
    });

    /**
     * @tc.name   TimePickerJsunit_0200
     * @tc.number TimePickerJsunit_0200
     * @tc.desc   TimePickerJsunit_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerJsunit_0200', Level.LEVEL1, async (done: Function) => {
      // Verify switch 12-hour/24-hour system of TimePicker component
      console.info('[TimePickerJsunit_0200] START');
      // Verify switch 24-hour
      let driver = await UiDriver.create()
      let switchButton = await driver.findComponent(BY.key('button'));
      await switchButton.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('mode');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[TimePickerJsunit_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('24hour:true');

      // Verify switch 12-hour
      await switchButton.click();
      await CommonFunc.sleep(1000);
      let strJson1 = getInspectorByKey('mode');
      let obj1: Record<string, ESObject> = JSON.parse(strJson1);
      console.info("[TimePickerJsunit_0200] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.$attrs.content).assertEqual('24hour:false');
      console.info('[TimePickerJsunit_0200] END');
      done();
    });

    /**
     * @tc.name   TimePickerJsunit_0300
     * @tc.number TimePickerJsunit_0300
     * @tc.desc   TimePickerJsunit_0300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('TimePickerJsunit_0300', Level.LEVEL1, async (done: Function) => {
      // Verify 24-hour function of TimePicker component
      console.info('[TimePickerJsunit_0300] START');
      let driver = await Driver.create()
      let switchButton = await driver.findComponent(ON.id('button'));
      await switchButton.click();
      await CommonFunc.sleep(1000);

      let timePicker = await driver.findComponent(ON.id('timePicker'));
      let rect = await timePicker.getBounds();
      let left = rect.left
      let top = rect.top
      let bottom = rect.bottom
      let right = rect.right
      let middle = (top + bottom) / 2

      // Verify hour
      let hour = await driver.findComponent(ON.id('hour'));
      let hour1 = await hour.getText();
      console.info("[TimePickerJsunit_0300] hour1: " + JSON.stringify(hour1));
      await driver.swipe(Math.round(left + (right - left) / 4), Math.round(top + (bottom - top) / 2),
        Math.round(left + (right - left) / 4), Math.round(top + (bottom - top) * 0.75));
      await CommonFunc.sleep(6000);
      let hourComponent = await driver.findComponent(ON.id('hour'));
      let hour2 = await hourComponent.getText();
      console.info("[TimePickerJsunit_0300] hour2: " + JSON.stringify(hour2));
      expect(hour1 == hour2).assertFalse();

      // Verify minute
      let minute = await driver.findComponent(ON.id('minute'));
      let minute1 = await minute.getText();
      console.info("[TimePickerJsunit_0300] minute1: " + JSON.stringify(minute1));
      await driver.swipe(Math.round(left + (right - left) * 0.75), Math.round(top + (bottom - top) / 2),
        Math.round(left + (right - left) * 0.75), Math.round(top + (bottom - top) * 0.75));
      await CommonFunc.sleep(6000);
      let minute2 = await minute.getText();
      console.info("[TimePickerJsunit_0300] minute2: " + JSON.stringify(minute2));
      expect(minute1 == minute2).assertFalse();
      console.info('[TimePickerJsunit_0300] END');
      done();
    });
  })
}
