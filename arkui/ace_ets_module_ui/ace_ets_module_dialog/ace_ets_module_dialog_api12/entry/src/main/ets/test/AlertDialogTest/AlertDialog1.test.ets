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
import CommonFunc from '../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../MainAbility/common/MessageManager';
import window from '@ohos.window';

export default function AlertDialog1() {
  describe('AlertDialog1', () => {
    beforeEach(async (done: Function) => {
      console.info("AlertDialog1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/AlertDialog/AlertDialog1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get AlertDialog1 state pages: " + JSON.stringify(pages));
        if (!("AlertDialog1" == pages.name)) {
          console.info("get AlertDialog1 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push AlertDialog1 success: " + JSON.stringify(result));
        }
        let driver = await Driver.create()
        await CommonFunc.sleep(1000);
        let Column = await driver.findComponent(ON.id('AlertDialog1Text'));
        await Column.click();
      } catch (err) {
        console.error("push AlertDialog1 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : AlertDialog1_0100
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('AlertDialog1_0100', Level.LEVEL2, async (done: Function) => {
      console.info('AlertDialog1_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('AlertDialog1'));
      await button.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(2070);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[AlertDialog1_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0)

      let button1 = await driver.findComponent(ON.text('button'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('AlertDialog1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[AlertDialog1_0100] component obj is: " + JSON.stringify(obj));
      console.info("[AlertDialog1_0100] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("reason=0");
      console.info('[AlertDialog1_0100] END');
      done();
    });
    /* *
    * @tc.number: SUB_ACE_STATUSMANAGER_SUPPORTUUNION_0350
    * @tc.name  : AlertDialog1_0200
    * @tc.desc  : To test that the Provide decorator supports union types.
    * @tc.level : Level 2
    */
    it('AlertDialog1_0200', Level.LEVEL2, async (done: Function) => {
      console.info('AlertDialog1_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('AlertDialog1'));
      await button.click();
      await CommonFunc.sleep(1000);

      await driver.click(Math.round(globalThis.winLeft+20), Math.round(globalThis.winTop+200));
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[AlertDialog1_0200] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0)

      let button1 = await driver.findComponent(ON.text('button'));
      await button1.click();
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('AlertDialog1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[AlertDialog1_0200] component obj is: " + JSON.stringify(obj));
      console.info("[AlertDialog1_0200] title: " + JSON.stringify(obj.$attrs.label));
      expect(obj.$attrs.label).assertEqual("reason=1");
      console.info('[AlertDialog1_0200] END');
      done();
    });


  })
}

