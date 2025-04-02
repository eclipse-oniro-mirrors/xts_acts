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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import router from '@ohos.router';
import Utils from './Utils';
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
import { MessageManager, Callback } from '../MainAbility/utils/MessageManager';
import events_emitter from '@ohos.events.emitter';
import CommonFunc from '../MainAbility/utils/Common';
import { KeyCode } from '@kit.InputKit';

export default function videoEnableShortcutKeyTest() {
  describe('videoEnableShortcutKeyTest', () => {
    beforeEach(async (done: Function) => {
      console.info("videoEnableShortcutKeyTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/videoEnableShortcutKey',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get videoEnableShortcutKeyTest state pages: " + JSON.stringify(pages));
        if (!("VideoCallback" == pages.name)) {
          console.info("get videoEnableShortcutKeyTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push videoEnableShortcutKeyTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push videoEnableShortcutKeyTest page error: " + err);
        expect().assertFail();
      }
      done()
    });

    /**
     * @tc.number
     * @tc.name      SUB_ACESUB_ACE_UI_COMPONENT_MEDIA_VIDEO_KEYBOARD_0020
     * @tc.desc      Video component support for shortcut key response
     * @tc.level:    Level 3
     * @tc.type :
     * @tc.size :
     */
    it('videoEnableShortcutKeyTest_0100', 0, async (done: Function) => {
      console.info('videoEnableShortcutKeyTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      // enableShortcutKey is true, controls is true, Shortcut Keys is effective.
      console.info("[videoEnableShortcutKeyTest_0100] set enableShortcutKey is true and showControls is true");
      let strJson_video = getInspectorByKey('videoEnableShortcutKey_video');
      let obj_video: ESObject = JSON.parse(strJson_video);
      console.info("[videoEnableShortcutKeyTest_0100] get enableShortcutKey is: " + JSON.stringify(obj_video.$attrs.enableShortcutKey));
      expect(obj_video.$attrs.enableShortcutKey).assertEqual('true');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(2000);

      let strJson_text = getInspectorByKey('videoEnableShortcutKey_text');
      let obj_text: ESObject = JSON.parse(strJson_text);
      console.info("[videoEnableShortcutKeyTest_0100] state is: " + JSON.stringify(obj_text.$attrs.content));
      expect(obj_text.$attrs.content).assertEqual('onStart');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parse(strJson_text);
      console.info("[videoEnableShortcutKeyTest_0100] state is: " + JSON.stringify(obj_text.$attrs.content));
      expect(obj_text.$attrs.content).assertEqual('onPause');

      let strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      let obj_text2: ESObject = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time1 is: " + JSON.stringify(obj_text2.$attrs.content));
      let time_1 = Number(obj_text2.$attrs.content);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(1000);

      strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time2 is: " + JSON.stringify(obj_text2.$attrs.content));
      let time_2 = Number(obj_text2.$attrs.content);
      expect(time_2).assertEqual(time_1 + 1);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(1000);

      strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time3 is: " + JSON.stringify(obj_text2.$attrs.content));
      let time_3 = Number(obj_text2.$attrs.content);
      expect(time_3).assertEqual(time_2 - 1);

      // reset
      let button = await driver.findComponent(ON.id('videoEnableShortcutKey_reset'));
      await button.click();
      await CommonFunc.sleep(1000);

      // change controls is false (enableShortcutKey is true), Shortcut Keys is effective.
      console.info("[videoEnableShortcutKeyTest_0100] set enableShortcutKey is true and showControls is false");
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_showControls'));
      await button.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(2000);

      strJson_text = getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parse(strJson_text);
      console.info("[videoEnableShortcutKeyTest_0100] state is: " + JSON.stringify(obj_text.$attrs.content));
      expect(obj_text.$attrs.content).assertEqual('onStart');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parse(strJson_text);
      console.info("[videoEnableShortcutKeyTest_0100] state is: " + JSON.stringify(obj_text.$attrs.content));
      expect(obj_text.$attrs.content).assertEqual('onPause');

      strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time1 is: " + JSON.stringify(obj_text2.$attrs.content));
      time_1 = Number(obj_text2.$attrs.content);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(1000);

      strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time2 is: " + JSON.stringify(obj_text2.$attrs.content));
      time_2 = Number(obj_text2.$attrs.content);
      expect(time_2).assertEqual(time_1 + 1);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(1000);

      strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time3 is: " + JSON.stringify(obj_text2.$attrs.content));
      time_3 = Number(obj_text2.$attrs.content);
      expect(time_3).assertEqual(time_2 - 1);

      // reset
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_reset'));
      await button.click();
      await CommonFunc.sleep(1000);

      // change enableShortcutKey false (showControls is false), Shortcut Keys is invaild.
      console.info("[videoEnableShortcutKeyTest_0100] set enableShortcutKey is false and showControls is false");
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_enableShortcutKey'));
      await button.click();
      await CommonFunc.sleep(1000);

      strJson_video = getInspectorByKey('videoEnableShortcutKey_video');
      obj_video = JSON.parse(strJson_video);
      console.info("[videoEnableShortcutKeyTest_0100] get enableShortcutKey is: " + JSON.stringify(obj_video.$attrs.enableShortcutKey));
      expect(obj_video.$attrs.enableShortcutKey).assertEqual('false');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parse(strJson_text);
      console.info("[videoEnableShortcutKeyTest_0100] state is: " + JSON.stringify(obj_text.$attrs.content));
      expect(obj_text.$attrs.content).assertEqual('init');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parse(strJson_text);
      console.info("[videoEnableShortcutKeyTest_0100] state is: " + JSON.stringify(obj_text.$attrs.content));
      expect(obj_text.$attrs.content).assertEqual('init');

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(1000);

      strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time2 is: " + JSON.stringify(obj_text2.$attrs.content));
      expect(Number(obj_text2.$attrs.content)).assertEqual(0);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(1000);

      strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time3 is: " + JSON.stringify(obj_text2.$attrs.content));
      expect(Number(obj_text2.$attrs.content)).assertEqual(0);

      // reset
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_reset'));
      await button.click();
      await CommonFunc.sleep(1000);

      // change controls is true (enableShortcutKey is false), only left and right keys respond.
      console.info("[videoEnableShortcutKeyTest_0100] set enableShortcutKey is false and showControls is true");
      button = await driver.findComponent(ON.id('videoEnableShortcutKey_showControls'));
      await button.click();
      await CommonFunc.sleep(1000);

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parse(strJson_text);
      console.info("[videoEnableShortcutKeyTest_0100] state is: " + JSON.stringify(obj_text.$attrs.content));
      expect(obj_text.$attrs.content).assertEqual('init');

      await driver.triggerKey(KeyCode.KEYCODE_SPACE);
      await CommonFunc.sleep(1000);

      strJson_text = getInspectorByKey('videoEnableShortcutKey_text');
      obj_text = JSON.parse(strJson_text);
      console.info("[videoEnableShortcutKeyTest_0100] state is: " + JSON.stringify(obj_text.$attrs.content));
      expect(obj_text.$attrs.content).assertEqual('init');


      await driver.triggerKey(KeyCode.KEYCODE_DPAD_RIGHT);
      await CommonFunc.sleep(1000);

      strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time3 is: " + JSON.stringify(obj_text2.$attrs.content));
      expect(Number(obj_text2.$attrs.content)).assertEqual(1);

      await driver.triggerKey(KeyCode.KEYCODE_DPAD_LEFT);
      await CommonFunc.sleep(1000);

      strJson_text2 = getInspectorByKey('videoEnableShortcutKey_text2');
      obj_text2 = JSON.parse(strJson_text2);
      console.info("[videoEnableShortcutKeyTest_0100] current time2 is: " + JSON.stringify(obj_text2.$attrs.content));
      expect(Number(obj_text2.$attrs.content)).assertEqual(0);

      console.info('[videoEnableShortcutKeyTest_0100] END');
      done();
    });
  })
}

