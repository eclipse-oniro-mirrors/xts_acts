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
import { UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';


export default function TimePickerDialogOptionsTest() {
  describe('TimePickerDialogOptionsTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TimePickerDialogOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/timePickerDialog/timePickerDialogOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TimePickerDialogOptionsTest state pages: " + JSON.stringify(pages));
        if (!("timePickerDialogOptions" == pages.name)) {
          console.info("get TimePickerDialogOptionsTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push TimePickerDialogOptionsTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TimePickerDialogOptionsTest page error: " + err);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.name   TimePickerDialogOptionsTest_0100
     * @tc.number TimePickerDialogOptionsTest_0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TimePickerDialogOptionsTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('TimePickerDialogOptionsTest_0100 START');
      let driver = await UiDriver.create()
      let button = await driver.findComponent(BY.key('TimePickerDialogOptions'));
      await button.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('TimePickerDialogOptions');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[TimePickerDialogOptionsTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.label).assertEqual("TimePickerDialog");
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('[TimePickerDialogOptionsTest_0100] END');
      done();
    });
  })
}
