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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function CalendarDialogAJsunit() {
  describe('CalendarDialogAJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("CalendarDialogAJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPickerDialog/CalendarDialog',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CalendarDialogAJsunit state pages: " + JSON.stringify(pages));
        if (!("CalendarDialog" == pages.name)) {
          console.info("get CalendarDialogAJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CalendarDialogAJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CalendarDialogAJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });


    it('CalendarDialogAJsunit_0100', Level.LEVEL2, async (done: Function) => {

      console.info('CalendarDialogAJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('Calendar_dialog_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('Calendar_dialog_A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CalendarDialogAJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual("CalendarPickerDialog按esc弹窗逐层退出");
      console.info('[CalendarDialogAJsunit_0100] END');
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      done();
    });

  })
}
