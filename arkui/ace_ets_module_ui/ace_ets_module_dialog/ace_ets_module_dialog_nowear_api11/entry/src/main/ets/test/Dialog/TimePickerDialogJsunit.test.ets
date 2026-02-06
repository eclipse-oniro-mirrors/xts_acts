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


export default function TimePickerDialogAJsunit() {
  describe('TimePickerDialogAJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("TimePickerDialogAJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerDialog/TimePickerDialogUI',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TimePickerDialogAJsunit state pages: " + JSON.stringify(pages));
        if (!("TimePickerDialog" == pages.name)) {
          console.info("get TimePickerDialogAJsunit state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TimePickerDialogAJsunit page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TimePickerDialogAJsunit page error: " + err);
        expect().assertFail();
      }
      done()
    });


    /**
     * @tc.name   TimePickerDialogAJsunit_0100
     * @tc.number TimePickerDialogAJsunit_0100
     * @tc.desc   TimePickerDialogAJsunit_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TimePickerDialogAJsunit_0100', Level.LEVEL2, async (done: Function) => {

      console.info('TimePickerDialogAJsunit_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('TimePicker_dialog_A'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('TimePicker_dialog_A');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TimePickerDialogAJsunit_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual("TimePickerDialog按esc弹窗逐层退出");
      console.info('[TimePickerDialogAJsunit_0100] END');
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      done();
    });

  })
}
