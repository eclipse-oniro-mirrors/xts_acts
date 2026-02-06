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

import router from '@ohos.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/utils/Common';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest, startAbility } from '../../Util.test'

export default function focus() {
  describe('focus', () => {
    beforeAll(() => {
      console.info("focus beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.RouteManagementnowear.api12.static", "EntryAbility")
    });
    beforeEach(async () => {
      console.info("focus beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/router/focus/focus1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get focus state success " + JSON.stringify(pages));
        if (!("focus" == pages.name)) {
          console.info("get focus state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push focus page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("focus after each called");
    });

    
    
/**
     * @tc.number   focus_0100
     * @tc.name     focus_0100
     * @tc.desc     focus_0100
     * @tc.level    Level.LEVEL2
     */
it('focus_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[focus_0100] START');
      await CommonFunc.sleep(1000);

      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn1 = await driver.findComponent(ON.id('focus1_btn1'));
      let btn1_isFocusedValue = await btn1!.isFocused()
      expect(btn1_isFocusedValue).assertEqual(true);
      console.info('[focus_0100] btn1 isFocused');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn2 = await driver.findComponent(ON.id('focus1_btn2'));
      let btn2_isFocusedValue = await btn2!.isFocused()
      expect(btn2_isFocusedValue).assertEqual(true);
      console.info('[focus_0100] btn2 isFocused');

      await btn2!.click()
      await CommonFunc.sleep(2000);
      console.info('[focus_0100] btn2 click');

      await driver.triggerKey(2049);
      await CommonFunc.sleep(1000);

      let btn3 = await driver.findComponent(ON.id('focus01_btn1'));
      let btn3_isFocusedValue = await btn3!.isFocused()
      expect(btn3_isFocusedValue).assertEqual(true);
      console.info('[focus_0100] btn3 isFocused');

      await driver.pressBack();
      await CommonFunc.sleep(2000);

      let btn4 = await driver.findComponent(ON.id('focus1_btn2'));
      let btn4_isFocusedValue = await btn4!.isFocused()
      expect(btn4_isFocusedValue).assertEqual(true);
      console.info('[focus_0100] btn4 isFocused');

      console.info('[focus_0100] END');
      done();
    });
  })
}

