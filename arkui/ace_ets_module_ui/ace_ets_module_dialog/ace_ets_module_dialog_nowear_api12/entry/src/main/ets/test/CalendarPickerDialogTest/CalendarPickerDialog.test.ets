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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
export default function CalendarPickerDialog() {
  describe('CalendarPickerDialog', () => {
    beforeEach(async (done: Function) => {
      console.info("CalendarPickerDialog beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CalendarPickerDialog/CalendarPickerDialog",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CalendarPickerDialog state pages:" + JSON.stringify(pages));
        if (!("CalendarPickerDialog" == pages.name)) {
          console.info("get CalendarPickerDialog pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CalendarPickerDialog page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CalendarPickerDialog page error:" + err);
      }
      console.info("CalendarPickerDialog beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CalendarPickerDialog after each called");
    });
    /**
     * @tc.name   CalendarPickerDialog_001
     * @tc.number CalendarPickerDialog_001
     * @tc.desc   Return specified page by index value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('CalendarPickerDialog_001', Level.LEVEL3, async (done: Function) => {
      console.info('[CalendarPickerDialog_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('CalendarPicker'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      await confirmBtn.click();
      await CommonFunc.sleep(2000);
      let text = getInspectorByKey('AppearText');
      expect(JSON.parse(text).$attrs.content).assertEqual('onWillAppear_onDidAppear_onWillDisappear_onDidDisappear');
      console.info('[CalendarPickerDialog_001] END');
      done();
    });
  })
}