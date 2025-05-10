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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
export default function DatePickerDialog() {
  describe('DatePickerDialog', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerDialog beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/DatePickerDialog/DatePickerDialog",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerDialog state pages:" + JSON.stringify(pages));
        if (!("DatePickerDialog" == pages.name)) {
          console.info("get DatePickerDialog pages.name:" + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerDialog page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerDialog page error:" + err);
      }
      console.info("DatePickerDialog beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DatePickerDialog after each called");
    });
    /**
     * @tc.number    DatePickerDialog_001
     * @tc.name      testBack
     * @tc.desc      Return specified page by index value
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('DatePickerDialog_001', 0, async (done: Function) => {
      console.info('[DatePickerDialog_001] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('DatePickerDialog'));
      await btn1.click();
      await CommonFunc.sleep(1000);
      let row: Component = await driver.findComponent(ON.id('row'));
      let point = await row.getBoundsCenter();
      await CommonFunc.sleep(1000);
      await driver.click(point.x+globalThis.winLeft, Math.round(point.y/2)+globalThis.winTop)
      await CommonFunc.sleep(2000);
      let text = getInspectorByKey('AppearText');
      expect(JSON.parse(text).$attrs.content).assertEqual('onWillAppear_onDidAppear_onWillDisappear_onDidDisappear');
      console.info('[DatePickerDialog_001] END');
      done();
    });
  })
}
