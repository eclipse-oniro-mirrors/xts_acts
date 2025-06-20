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
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';

export default function CustomDialog3() {
  describe('CustomDialog3', () => {
    beforeEach(async (done: Function) => {
      console.info("CustomDialog3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomDialog/CustomDialog3',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get CustomDialog3 state pages: " + JSON.stringify(pages));
        if (!("CustomDialog3" == pages.name)) {
          console.info("get CustomDialog3 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push CustomDialog3 success: " + JSON.stringify(result));
        }
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let Column = await driver.findComponent(ON.id('CustomDialog3Reset'));
        await Column.click();
      } catch (err) {
        console.error("push CustomDialog3 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : CustomDialog3_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('CustomDialog3_0100', 0, async (done: Function) => {
      console.info('CustomDialog3_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let Column = await driver.findComponent(ON.id('CustomDialog3'));
      await Column.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[CustomDialog3_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1)

      let strJson = getInspectorByKey('CustomDialog3Text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CustomDialog3_0100] component obj is: " + JSON.stringify(obj));
      console.info("[CustomDialog3_0100] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("reason=0");
      console.info('[CustomDialog3_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : CustomDialog3_0200
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('CustomDialog3_0200', 0, async (done: Function) => {
      console.info('CustomDialog3_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('CustomDialog3'));
      await button.click();
      await CommonFunc.sleep(1000);

      await driver.click(Math.round(globalThis.winLeft+20), Math.round(globalThis.winTop+200));
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[CustomDialog3_0200] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0)

      let button1 = await driver.findComponent(ON.text('confirm'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('CustomDialog3Text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[CustomDialog3_0200] component obj is: " + JSON.stringify(obj));
      console.info("[CustomDialog3_0200] title: " + JSON.stringify(obj.$attrs.content));
      expect(obj.$attrs.content).assertEqual("CustomDialog3");
      console.info('[CustomDialog3_0200] END');
      done();
    });


  })
}

