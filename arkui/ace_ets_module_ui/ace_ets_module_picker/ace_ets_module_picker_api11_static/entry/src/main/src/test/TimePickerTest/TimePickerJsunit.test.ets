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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, Rect } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import Utils  from "../../../ets/MainAbility/common/Utils";
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function TimePickerJsunit() {
  describe('TimePickerJsunit', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info("TimePicker beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/TimePickerPage',
      }

      try {
        const router = AppStorage.get<Router>("router") as Router
        let pages:router.RouterState = router.getState();
        console.info("[TimePickerTest] current page is: " + JSON.stringify(pages.name));
        if (!('TimePickerPage' == pages.name)) {
          router.pushUrl(options);
        }
      } catch (err) {
        console.info("push TimePicker page error " + JSON.stringify(err));
      }
      await sleep(2);
    });



    
    
    /**
     * @tc.number   TimePickerJsunit_static_0100
     * @tc.name     TimePickerJsunit_static_0100
     * @tc.desc     TimePickerJsunit_static_0100
     * @tc.level    Level.LEVEL1
     */
it('TimePickerJsunit_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify 12-hour function of TimePicker component
      // switch 12-hour
      console.info('[TimePickerJsunit_static_0100] START');
      let driver = Driver.create()
      let switchButton = await driver.findComponent(ON.id('button'));
      await (switchButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let timePicker = await driver.findComponent(ON.id('timePicker'));
      let rect = await (timePicker?.getBounds() as Promise<Rect>);
      let left = rect.left
      let top = rect.top
      let bottom = rect.bottom
      let right = rect.right
      let middle = (top + bottom) / 2

      // Verify AM or PM
      let hour = await driver.findComponent(ON.id('hour'));
      let hour1 = await (hour?.getText() as Promise<string>);
      console.info("[TimePickerJsunit_static_0100] hour1: " + JSON.stringify(hour1));
      expect(hour1).assertEqual('hour:8');
      await driver.swipe(Math.round(left + (right - left) / 6).toInt(), Math.round(top + (bottom - top) / 2).toInt(),
        Math.round(left + (right - left) / 6).toInt(), Math.round(top).toInt());
      await CommonFunc.sleep(6000);
      let hour2 = await (hour?.getText() as Promise<string>);
      console.info("[TimePickerJsunit_static_0100] hour2: " + JSON.stringify(hour2));
      expect(hour2).assertEqual('hour:20');

      // Verify hour
      await driver.swipe(Math.round(left + (right - left) / 2).toInt(), Math.round(top + (bottom - top) / 2).toInt(),
        Math.round(left + (right - left) / 2).toInt(), Math.round(top + (bottom - top) * 0.75).toInt());
      await CommonFunc.sleep(6000);
      let hour3 = await (hour?.getText() as Promise<string>);
      console.info("[TimePickerJsunit_static_0100] hour3: " + JSON.stringify(hour3));
      expect(hour2 == hour3).assertFalse();

      // Verify minute
      let minute = await driver.findComponent(ON.id('minute'));
      let minute1 = await (minute?.getText() as Promise<string>);
      console.info("[TimePickerJsunit_static_0100] minute1: " + JSON.stringify(minute1));
      expect(minute1).assertEqual('minute:0');
      await driver.swipe(Math.round(left + (right - left) * 5 / 6).toInt(), Math.round(top + (bottom - top) / 2).toInt(),
        Math.round(left + (right - left) * 5 / 6).toInt(), Math.round(top + (bottom - top) * 0.75).toInt());
      await CommonFunc.sleep(6000);
      let minute2 = await (minute?.getText() as Promise<string>);
      console.info("[TimePickerJsunit_static_0100] minute2: " + JSON.stringify(minute2));
      expect(minute1 == minute2).assertFalse();
      console.info('[TimePickerJsunit_static_0100] END');
      done();
    });

    
    
    /**
     * @tc.number   TimePickerJsunit_static_0200
     * @tc.name     TimePickerJsunit_static_0200
     * @tc.desc     TimePickerJsunit_static_0200
     * @tc.level    Level.LEVEL1
     */
it('TimePickerJsunit_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify switch 12-hour/24-hour system of TimePicker component
      console.info('[TimePickerJsunit_static_0200] START');
      // Verify switch 24-hour
      let driver = Driver.create()
      let switchButton = await driver.findComponent(ON.id('button'));
      await (switchButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('mode');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[TimePickerJsunit_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('24hour:true');

      // Verify switch 12-hour
      await (switchButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('mode');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[TimePickerJsunit_static_0200] component obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('24hour:false');
      console.info('[TimePickerJsunit_static_0200] END');
      done();
    });


    
    
    /**
     * @tc.number   TimePickerJsunit_static_0300
     * @tc.name     TimePickerJsunit_static_0300
     * @tc.desc     TimePickerJsunit_static_0300
     * @tc.level    Level.LEVEL1
     */
it('TimePickerJsunit_static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      // Verify 24-hour function of TimePicker component
      console.info('[TimePickerJsunit_static_0300] START');
      let driver = Driver.create()
      let switchButton = await driver.findComponent(ON.id('button'));
      await (switchButton?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let timePicker = await driver.findComponent(ON.id('timePicker'));
      let rect = await (timePicker?.getBounds() as Promise<Rect>);
      let left = rect.left
      let top = rect.top
      let bottom = rect.bottom
      let right = rect.right
      let middle = (top + bottom) / 2

      // Verify hour
      let hour = await driver.findComponent(ON.id('hour'));
      let hour1 = await (hour?.getText() as Promise<string>);
      console.info("[TimePickerJsunit_static_0300] hour1: " + JSON.stringify(hour1));
      await driver.swipe(Math.round(left + (right - left) / 4).toInt(), Math.round(top + (bottom - top) / 2).toInt(),
        Math.round(left + (right - left) / 4).toInt(), Math.round(top + (bottom - top) * 0.75).toInt());
      await CommonFunc.sleep(6000);
      let hourComponent = await driver.findComponent(ON.id('hour'));
      let hour2 = await (hourComponent?.getText() as Promise<string>);
      console.info("[TimePickerJsunit_static_0300] hour2: " + JSON.stringify(hour2));
      expect(hour1 == hour2).assertFalse();

      // Verify minute
      let minute = await driver.findComponent(ON.id('minute'));
      let minute1 = await (minute?.getText() as Promise<string>);
      console.info("[TimePickerJsunit_static_0300] minute1: " + JSON.stringify(minute1));
      await driver.swipe(Math.round(left + (right - left) * 0.75).toInt(), Math.round(top + (bottom - top) / 2).toInt(),
        Math.round(left + (right - left) * 0.75).toInt(), Math.round(top + (bottom - top) * 0.75).toInt());
      await CommonFunc.sleep(6000);
      let minute2 = await (minute?.getText() as Promise<string>);
      console.info("[TimePickerJsunit_static_0300] minute2: " + JSON.stringify(minute2));
      expect(minute1 == minute2).assertFalse();
      console.info('[TimePickerJsunit_static_0300] END');
      done();
    });
  })
}
