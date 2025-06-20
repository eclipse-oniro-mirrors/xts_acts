/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import CommonFunc from "../../MainAbility/common/Common";

export default function TimePickerAddApi() {
  describe('TimePickerAddApi', () => {
    beforeEach(async (done: Function) => {
      console.info("TimePickerAddApi beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TimePicker/TimePickerAddApi',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TimePickerAddApi state pages: " + JSON.stringify(pages));
        if (!("TimePickerAddApi" == pages.name)) {
          console.info("get TimePickerAddApi state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TimePickerAddApi page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TimePickerAddApi page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TimePickerAddApi_0010
     * @tc.name       : TimePickerAddApi_001
     * @tc.desc       : TimePicker Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TimePickerAddApi_001', 0, async (done: Function) => {

      console.info('[TimePickerAddApi_001] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      let pos = CommonFunc.getComponentRectOnScreen('TimePickerAddApi')
      await CommonFunc.sleep(500);
      await driver.swipe(Math.round(pos.right - vp2px(100)),Math.round(pos.bottom - vp2px(10)),Math.round(pos.right - vp2px(100)),Math.round(pos.top));
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TimePickerAddApiText');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TimePicker_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.content).assertEqual('second');

      console.info('[TimePicker_001] END');
      done();
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_TimePickerAddApi_0020
     * @tc.name       : TimePickerAddApi_002
     * @tc.desc       : TimePicker Test
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */

    it('TimePickerAddApi_002', 0, async (done: Function) => {

      console.info('[TimePickerAddApi_001] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TimePickerAddApi2');
      await CommonFunc.sleep(200);
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TimePicker_001] component obj is: " + JSON.stringify(obj));
      await CommonFunc.sleep(1000);
      expect(obj.$attrs.label).assertEqual('TimePickerDialog');

      console.info('[TimePicker_001] END');
      done();
    });





  })
}
