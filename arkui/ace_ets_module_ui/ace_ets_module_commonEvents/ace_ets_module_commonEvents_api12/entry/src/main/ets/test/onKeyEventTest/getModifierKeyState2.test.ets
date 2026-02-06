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


export default function getModifierKeyState2Test() {
  describe('getModifierKeyState2Test', () => {
    beforeEach(async (done: Function) => {
      console.info("getModifierKeyState2Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/onKeyEvent/getModifierKeyState2",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getModifierKeyState2Test state pages: " + JSON.stringify(pages));
        if (!("getModifierKeyState" == pages.name)) {
          console.info("get getModifierKeyState2Test state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replace(options);
          await CommonFunc.sleep(2000);
          console.info("push getModifierKeyState2Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getModifierKeyState2Test page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    getModifierKeyState2Test_0020
     * @tc.name      getModifierKeyState2Test_0020
     * @tc.desc      KeyEvent: getModifierKeyState true and false
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('getModifierKeyState2Test_0020', Level.LEVEL0, async (done: Function) => {
      console.info('getModifierKeyState2Test_0020 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      await driver.triggerKey(KeyCode.KEYCODE_TAB)
      await driver.triggerKey(KeyCode.KEYCODE_CTRL_LEFT)
      await CommonFunc.sleep(500);
      expect(AppStorage.get('KeyEventCtrl')).assertEqual(true);
      expect(AppStorage.get('KeyEventShift')).assertEqual(false);
      console.info('[getModifierKeyState2Test_0020] END');
      done();
    });
  })
}