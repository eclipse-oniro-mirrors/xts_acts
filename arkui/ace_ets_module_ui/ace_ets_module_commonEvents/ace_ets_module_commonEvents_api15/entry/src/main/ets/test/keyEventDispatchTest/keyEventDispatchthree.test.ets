/**
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { KeyCode } from '@kit.InputKit';

export default function keyEventDispatchTest3() {
  describe('keyEventDispatchTest3', () => {
    beforeEach(async (done: Function) => {
      console.info("keyEventDispatchTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/keyEventDispatchTest/keyEventDispatchTest03",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get keyEventDispatchTest3 state pages: " + JSON.stringify(pages));
        if (!("keyEventDispatchTest03" == pages.name)) {
          console.info("get keyEventDispatchTest03 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push keyEventDispatchTest03 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push keyEventDispatchTest03 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number keyEventDispatchTest3_0100
     * @tc.name   keyEventDispatchTest3_0100
     * @tc.desc   test the onKeyEvent api16 CallBack get getModifierKeyState when trigger keyboard key
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  0
     */
    it('keyEventDispatchTest3_0100', 0, async (done: Function) => {
      console.info('[keyEventDispatchTest3_0100] START');
      let driver: Driver = Driver.create();
      await driver.triggerKey(2049);
      await CommonFunc.sleep(1500);
      // test ctrl & alt & shift
      await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_SHIFT_LEFT)
      await CommonFunc.sleep(1500);

      let strJson = getInspectorByKey('modifierStatePress');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[keyEventDispatchTest3_0100] obj is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('ctrl & alt & shift  is press');

      // test ctrl & shift
      await driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_CTRL_LEFT)
      await CommonFunc.sleep(1500);
      let strJson3 = getInspectorByKey('modifierStatePress');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[keyEventDispatchTest3_0100] obj is: " + obj3.$attrs.content);
      expect(obj3.$attrs.content).assertEqual('ctrl & shift  is press');

      // test ctrl & alt
      await driver.triggerCombineKeys(KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_CTRL_LEFT)
      await CommonFunc.sleep(1500);
      let strJson4 = getInspectorByKey('modifierStatePress');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[keyEventDispatchTest3_0100] obj is: " + obj4.$attrs.content);
      expect(obj4.$attrs.content).assertEqual('ctrl & alt  is press');

      // test alt & shift
      await driver.triggerCombineKeys(KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_SHIFT_LEFT)
      await CommonFunc.sleep(1500);
      let strJson6 = getInspectorByKey('modifierStatePress');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info("[keyEventDispatchTest3_0100] obj is: " + obj6.$attrs.content);
      expect(obj6.$attrs.content).assertEqual('alt & shift  is press');

      //  test ctrl
      await driver.triggerKey(KeyCode.KEYCODE_CTRL_LEFT)
      await CommonFunc.sleep(1500);
      let strJson8 = getInspectorByKey('modifierStatePress');
      let obj8: ESObject = JSON.parse(strJson8);
      console.info("[keyEventDispatchTest3_0100] obj is: " + obj8.$attrs.content);
      expect(obj8.$attrs.content).assertEqual('ctrl is press');

      //  test alt
      await driver.triggerKey(KeyCode.KEYCODE_ALT_LEFT)
      await CommonFunc.sleep(1500);
      let strJson9 = getInspectorByKey('modifierStatePress');
      let obj9: ESObject = JSON.parse(strJson9);
      console.info("[keyEventDispatchTest3_0100] obj is: " + obj9.$attrs.content);
      expect(obj9.$attrs.content).assertEqual('alt is press');

      //  test shift
      await driver.triggerKey(KeyCode.KEYCODE_SHIFT_LEFT)
      await CommonFunc.sleep(1500);
      let strJson10 = getInspectorByKey('modifierStatePress');
      let obj10: ESObject = JSON.parse(strJson10);
      console.info("[keyEventDispatchTest3_0100] obj is: " + obj10.$attrs.content);
      expect(obj10.$attrs.content).assertEqual('shift is press');

      console.info('[keyEventDispatchTest3_0100] END');

      done();
    });
  })
}