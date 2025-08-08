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

import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix, MouseButton } from '@ohos.UiTest';
import { KeyCode } from '@kit.InputKit';

export default function XComponentKeyMouseTest() {
  describe('XComponentKeyMouseTest', () => {
    beforeEach(async (done: Function) => {
      console.info("XComponentKeyMouse beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/XComponent/XComponentKeyMousePage',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get XComponentKeyMouse state pages:" + JSON.stringify(pages));
        if (!("XComponentKeyMousePage" == pages.name)) {
          console.info("get XComponentKeyMouse pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push XComponentKeyMouse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push XComponentKeyMouse page error:" + err);
      }
      console.info("XComponentKeyMouse beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("XComponentKeyMouse after each called");
    });

    /*
     * @tc.number    XComponentKeyMouseTest_0100
     * @tc.name      XComponentKeyMouseTest_0100
     * @tc.desc      Test XComponentKeyMouse
     * @tc.level     Level 1
     */
    it('XComponentKeyMouseTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseTest_0100] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // ctrl + a
      await driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      console.info('[XComponentKeyMouseTest_0200] triggerCombineKeys(CTRL, A)');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('XComponentKeyMousePage_KeyStr');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentKeyMouseTest_0100] keyStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('key: A ctrl: down');

      // shift + a
      await driver.triggerCombineKeys(KeyCode.KEYCODE_SHIFT_LEFT, KeyCode.KEYCODE_A);
      console.info('[XComponentKeyMouseTest_0200] triggerCombineKeys(SHIFT, A)');
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentKeyMousePage_KeyStr');
      obj = JSON.parse(strJson);
      console.info("[XComponentKeyMouseTest_0100] keyStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('key: A shift: down');

      // alt + a
      await driver.triggerCombineKeys(KeyCode.KEYCODE_ALT_LEFT, KeyCode.KEYCODE_A);
      console.info('[XComponentKeyMouseTest_0200] triggerCombineKeys(ALT, A)');
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentKeyMousePage_KeyStr');
      obj = JSON.parse(strJson);
      console.info("[XComponentKeyMouseTest_0100] keyStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('key: A alt: down');

      console.info('[XComponentKeyMouseTest_0100] END');
      done();
    });

    /*
     * @tc.number    XComponentKeyMouseTest_0200
     * @tc.name      XComponentKeyMouseTest_0200
     * @tc.desc      Test XComponentKeyMouse
     * @tc.level     Level 1
     */
    it('XComponentKeyMouseTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[XComponentKeyMouseTest_0200] START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // mouseClick + ctrl
      let xc = await driver.findComponent(ON.type('XComponent'));
      let rect = await xc.getBounds();
      let centerX = Math.round((rect.left + rect.right) / 2);
      let centerY = Math.round((rect.top + rect.bottom) / 2);
      console.info('[XComponentKeyMouseTest_0200] XComponent centerX: ' + centerX + ',centerY: ' + centerY);
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT, KeyCode.KEYCODE_CTRL_LEFT);
      console.info('[XComponentKeyMouseTest_0200] mouseClick(XComponent) and triggerKey(ctrl)');
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('XComponentKeyMousePage_MouseStr');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[XComponentKeyMouseTest_0200] mouseStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('mouse: ctrl: down');

      // mouseClick + shift
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT, KeyCode.KEYCODE_SHIFT_LEFT);
      console.info('[XComponentKeyMouseTest_0200] mouseClick(XComponent) and triggerKey(shift)');
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentKeyMousePage_MouseStr');
      obj = JSON.parse(strJson);
      console.info("[XComponentKeyMouseTest_0200] mouseStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('mouse: shift: down');

      // mouseClick + alt
      await driver.mouseClick({ x: centerX, y: centerY }, MouseButton.MOUSE_BUTTON_LEFT, KeyCode.KEYCODE_ALT_LEFT);
      console.info('[XComponentKeyMouseTest_0200] mouseClick(XComponent) and triggerKey(alt)');
      await CommonFunc.sleep(1000);

      strJson = getInspectorByKey('XComponentKeyMousePage_MouseStr');
      obj = JSON.parse(strJson);
      console.info("[XComponentKeyMouseTest_0200] mouseStr content is: " + obj.$attrs.content);
      expect(obj.$attrs.content).assertEqual('mouse: alt: down');

      console.info('[XComponentKeyMouseTest_0200] END');
      done();
    });
  })
}