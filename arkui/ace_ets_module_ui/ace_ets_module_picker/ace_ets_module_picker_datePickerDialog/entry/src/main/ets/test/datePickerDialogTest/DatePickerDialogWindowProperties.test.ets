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
import { UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';

export default function DatePickerDialogWindowPropertiesTest() {
  describe('DatePickerDialogWindowPropertiesTest', () => {
    beforeEach(async (done: Function) => {
      console.info("DatePickerDialogWindowPropertiesTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerDialog/DatePickerDialogWindowProperties',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DatePickerDialogWindowPropertiesTest state pages: " + JSON.stringify(pages));
        if (!("DatePickerDialogWindowProperties" == pages.name)) {
          console.info("get DatePickerDialogWindowPropertiesTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push DatePickerDialogWindowPropertiesTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DatePickerDialogWindowPropertiesTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   DatePickerDialogWindowPropertiesTest0100
     * @tc.number SUB_ACE_DatePickerDialogWindowPropertiesTest0100
     * @tc.desc   set api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DatePickerDialogWindowPropertiesTest0100', Level.LEVEL2, async (done: Function) => {
      console.info('DatePickerDialogWindowPropertiesTest0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('DatePickerDialogWindowProperties'));
      await button.click();
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[DatePickerDialogWindowPropertiesTest0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1) //1表示系统告警窗口TYPE_SYSTEM_ALERT

      await CommonFunc.sleep(1000);
      await driver.click(Math.round(globalThis.winLeft + vp2px(100)), Math.round(globalThis.winTop + vp2px(100)));
      await CommonFunc.sleep(1000);
      console.info('[DatePickerDialogWindowPropertiesTest0100] END');
      done();
    });
  })
}

