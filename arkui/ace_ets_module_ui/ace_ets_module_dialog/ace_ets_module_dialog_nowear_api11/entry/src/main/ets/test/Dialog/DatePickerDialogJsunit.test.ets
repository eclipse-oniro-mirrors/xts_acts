/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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


export default function DatePickerDialogAJsunit() {
  describe('DatePickerDialogAJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerDialogAJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerDialog/DatePickerDialogUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerDialogAJsunit state pages: " + JSON.stringify(pages));
        if (!("DatePickerDialog" == pages.name)) {
          console.info("get DatePickerDialogAJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerDialogAJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerDialogAJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });


    it('DatePickerDialogAJsunit_0100', 0, async (done: Function) => {

      console.info('DatePickerDialogAJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('DatePicker_dialog_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('DatePicker_dialog_A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[DatePickerDialogAJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual("DatePickerDialog按esc弹窗逐层退出");
      console.info('[DatePickerDialogAJsunit_0100] END');
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      done();
    });

  })
}
