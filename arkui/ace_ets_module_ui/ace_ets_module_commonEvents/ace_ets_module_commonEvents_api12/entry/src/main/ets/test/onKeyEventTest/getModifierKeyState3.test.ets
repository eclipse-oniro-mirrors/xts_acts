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
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { KeyCode } from '@kit.InputKit';
import { MouseButton } from '@kit.TestKit';
import Utils from '../../MainAbility/common/Utils';


export default function getModifierKeyState3Test() {
  describe('getModifierKeyState3Test', () => {
    beforeEach(async (done: Function) => {
      console.info("getModifierKeyState3Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/onKeyEvent/getModifierKeyState3",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getModifierKeyState3Test state pages: " + JSON.stringify(pages));
        if (!("getModifierKeyState" == pages.name)) {
          console.info("get getModifierKeyState3Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push getModifierKeyState3Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getModifierKeyState3Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   getModifierKeyState3Test_0030
     * @tc.number getModifierKeyState3Test_0030
     * @tc.desc   DragEvent: getModifierKeyState true and false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getModifierKeyState3Test_0030', Level.LEVEL0, async (done: Function) => {
      console.info('getModifierKeyState3Test_0030 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      await driver.triggerKey(KeyCode.KEYCODE_TAB)
      await driver.triggerKey(KeyCode.KEYCODE_TAB)
      let button: Component = await driver.findComponent(ON.id('getModifierKeyState_DragEvent'));
      let button1: Component = await driver.findComponent(ON.id('getModifierKeyState_KeyEvent'));
      const ctrlPromise = async () => {
        await Utils.simulateByShell('uinput -K -l 2072 1000');
      };
      const dragPromise = async () => {
        await button.dragTo(button1);
      };
      await ctrlPromise();
      await dragPromise();
      expect(AppStorage.get('DragEventCtrl')).assertEqual(undefined);
      expect(AppStorage.get('DragEventShift')).assertEqual(false);
      console.info('[getModifierKeyState3Test_0030] END');
      done();
    });
  })
}