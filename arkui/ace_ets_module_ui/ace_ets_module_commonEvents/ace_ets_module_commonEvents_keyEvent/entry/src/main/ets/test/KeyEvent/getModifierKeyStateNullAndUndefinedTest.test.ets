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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import { KeyCode } from '@kit.InputKit';
import { MouseButton } from '@kit.TestKit';

export default function getModifierKeyStateNullAndUndefinedTest() {
  describe('getModifierKeyStateNullAndUndefinedTest', () => {
    beforeEach(async (done: Function) => {
      console.info("getModifierKeyStateNullAndUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/KeyEvent/getModifierKeyStateNullAndUndefined",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get getModifierKeyStateNullAndUndefinedTest state pages:" + JSON.stringify(pages));
        if (!("getModifierKeyStateNullAndUndefined" == pages.name)) {
          console.info("get getModifierKeyStateNullAndUndefinedTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push getModifierKeyStateNullAndUndefinedTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push getModifierKeyStateNullAndUndefinedTest page error:" + err);
        expect().assertFail();
      }
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("getModifierKeyStateNullAndUndefinedTest after each called");
    });

    /**
     * @tc.name   SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_001
     * @tc.number  SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_001
     * @tc.desc   Test getModifierKeyState with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_001', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_001] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('testNull'));
      let point = await button.getBoundsCenter();
      await driver.mouseClick({ x: point.x, y: point.y }, MouseButton.MOUSE_BUTTON_LEFT, 2072);
      await CommonFunc.sleep(200);
      
      console.info('[SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_001] getModifierKeyStateNullResult: ' + AppStorage.get('getModifierKeyStateNullResult'));
      
      expect(AppStorage.get('getModifierKeyStateNullResult')).assertEqual(false);
      console.info('[SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_001] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_002
     * @tc.number  SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_002
     * @tc.desc   Test getModifierKeyState with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_002', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_002] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('testUndefined'));
      let point = await button.getBoundsCenter();
      await driver.mouseClick({ x: point.x, y: point.y }, MouseButton.MOUSE_BUTTON_LEFT, 2072);
      await CommonFunc.sleep(200);
      
      console.info('[SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_002] getModifierKeyStateUndefinedResult: ' + AppStorage.get('getModifierKeyStateUndefinedResult'));
      
      expect(AppStorage.get('getModifierKeyStateUndefinedResult')).assertEqual(false);
      console.info('[SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_002] END');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_003
     * @tc.number  SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_003
     * @tc.desc   Test getModifierKeyState with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_003', Level.LEVEL0, async (done: Function) => {
      console.info('[SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_003] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button: Component = await driver.findComponent(ON.id('testEmpty'));
      let point = await button.getBoundsCenter();
      await driver.mouseClick({ x: point.x, y: point.y }, MouseButton.MOUSE_BUTTON_LEFT, 2072);
      await CommonFunc.sleep(200);
      
      console.info('[SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_003] getModifierKeyStateEmptyResult: ' + AppStorage.get('getModifierKeyStateEmptyResult'));
      
      expect(AppStorage.get('getModifierKeyStateEmptyResult')).assertEqual(false);
      console.info('[SUB_ARKUI_KEYEVENT_GETMODIFIERKEYSTATE_PARAM_003] END');
      done();
    });
  })
}