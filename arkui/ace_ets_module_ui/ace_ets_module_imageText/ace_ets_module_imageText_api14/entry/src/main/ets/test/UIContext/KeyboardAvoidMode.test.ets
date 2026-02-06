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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { MessageManager, Callback } from '../../MainAbility/common/MessageManager';

export default function KeyboardAvoidModeTest() {
  describe('KeyboardAvoidModeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("KeyboardAvoidModeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/UIContext/KeyboardAvoidMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get KeyboardAvoidModeTest state pages: " + JSON.stringify(pages));
        if (!("KeyboardAvoidMode" == pages.name)) {
          console.info("get KeyboardAvoidModeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push KeyboardAvoidModeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push KeyboardAvoidModeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    SUB_ACE_KeyboardAvoidModeTest_0100
     * @tc.name      KeyboardAvoidModeTest_0100
     * @tc.desc      set KeyboardAvoidMode OFFSET_WITH_CARET
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('KeyboardAvoidModeTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('KeyboardAvoidModeTest_0100 START');
      globalThis.value.message.notify({
        value:'OFFSET_WITH_CARET'
      });
	  let driver: Driver = Driver.create();
	  await CommonFunc.sleep(1000);
	  let button: Component = await driver.findComponent(ON.id('getKeyboardAvoidMode'));
	  await CommonFunc.sleep(1000);
	  await button.click()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[KeyboardAvoidModeTest_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('2');
      console.info('[KeyboardAvoidModeTest_0100] END');
      done();
    });
	/**
     * @tc.number    SUB_ACE_KeyboardAvoidModeTest_0200
     * @tc.name      KeyboardAvoidModeTest_0200
     * @tc.desc      set KeyboardAvoidMode RESIZE_WITH_CARET
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('KeyboardAvoidModeTest_0200', Level.LEVEL2, async (done: Function) => {
      console.info('KeyboardAvoidModeTest_0200 START');
      globalThis.value.message.notify({
        value:'RESIZE_WITH_CARET'
      });
	  let driver: Driver = Driver.create();
	  await CommonFunc.sleep(1000);
	  let button: Component = await driver.findComponent(ON.id('getKeyboardAvoidMode'));
	  await CommonFunc.sleep(1000);
	  await button.click()
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('Text');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[KeyboardAvoidModeTest_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('3');
      console.info('[KeyboardAvoidModeTest_0200] END');
      done();
    });
  })
}

