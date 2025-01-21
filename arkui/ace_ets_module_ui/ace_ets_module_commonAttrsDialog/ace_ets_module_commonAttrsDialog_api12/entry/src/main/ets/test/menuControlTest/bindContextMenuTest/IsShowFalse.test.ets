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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../../MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';

export default function IsShowFalse() {
  describe('IsShowFalse',  () =>{
    beforeEach(async (done:Function) =>{
      console.info("IsShowFalse beforeEach start");
      let options:router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindContextMenu/IsShowFalse',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get IsShowFalse state pages: " + JSON.stringify(pages));
        if (!("IsShowFalse" == pages.name)) {
          console.info("get IsShowFalse state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push IsShowFalse success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push IsShowFalse page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : IsShowFalse_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('IsShowFalse_0100', 0, async (done:Function) =>{
      console.info('IsShowFalse_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('IsShowFalse'));
      await button.click();
      await CommonFunc.sleep(1000);

      await driver.click(200,200);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[IsShowFalse_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1)

      console.info('[IsShowFalse_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : IsShowFalse_0200
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('IsShowFalse_0200', 0, async (done:Function) =>{
      console.info('IsShowFalse_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('IsShowFalse'));
      await button.click();
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[IsShowFalse_0200] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1)

      console.info('[IsShowFalse_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : IsShowFalse_0300
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('IsShowFalse_0300', 0, async (done:Function) =>{
      console.info('IsShowFalse_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('IsShowFalse'));
      await button.click();
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[IsShowFalse_0300] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0)
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);
      console.info('[IsShowFalse_0300] END');
      done();
    });
  })
}

