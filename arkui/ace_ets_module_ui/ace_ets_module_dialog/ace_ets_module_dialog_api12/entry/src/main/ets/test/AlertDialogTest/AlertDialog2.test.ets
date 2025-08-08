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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import window from '@ohos.window';
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';


export default function AlertDialog2() {
  describe('AlertDialog2', () => {
    beforeEach(async (done: Function) => {
      console.info("AlertDialog2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/AlertDialog2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlertDialog2 state pages: " + JSON.stringify(pages));
        if (!("AlertDialog2" == pages.name)) {
          console.info("get AlertDialog2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlertDialog2 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AlertDialog2 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : AlertDialog2_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('AlertDialog2_0100', Level.LEVEL2, async (done: Function) => {
      console.info('AlertDialog2_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('AlertDialog2'));
      await button.click();
      await CommonFunc.sleep(1000);

      let windowClass1: window.Window | undefined = undefined;
      windowClass1 = await window.getLastWindow(globalThis.abilityContext);
      let properties1: window.WindowProperties = windowClass1.getWindowProperties();
      console.info("[AlertDialog2_0100] title: " + JSON.stringify(properties1.type));
      expect(properties1.type).assertEqual(0)

      let button1 = await driver.findComponent(ON.text('confirm'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[AlertDialog2_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1)

      console.info('[AlertDialog2_0100] END');
      done();
    });



  })
}

