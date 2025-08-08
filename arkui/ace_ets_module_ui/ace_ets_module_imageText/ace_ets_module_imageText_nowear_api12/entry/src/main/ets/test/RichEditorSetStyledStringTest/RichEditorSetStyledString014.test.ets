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
  Driver,
  Component,
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

export default function RichEditorSetStyledString014() {
  describe('RichEditorSetStyledString014', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString014 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString014',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString014 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString014" == pages.name)) {
          console.info("get RichEditorSetStyledString014 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString014 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString014 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0038
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0038
     * @tc.desc  : Input method callback onWillChange event in attribute string to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0038',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0038 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString014'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(500);
      let image_top = await driver.findComponent(ON.id('image_top'));
      await image_top.click();
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      let onWillChangeCall = await driver.findComponent(ON.id('onWillChangeCall'));
      let onWillChangeCallText = await onWillChangeCall.getText();
      await CommonFunc.sleep(500);
      expect(onWillChangeCallText).assertContain('onWillChangeCall:false');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0039
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0039
     * @tc.desc  : Input method callback onDidChange event in attribute string to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0039',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0039 START');
      let driver = Driver.create();
      let onDidChangeCall = await driver.findComponent(ON.id('onDidChangeCall'));
      let onDidChangeCallText = await onDidChangeCall.getText();
      await CommonFunc.sleep(500);
      expect(onDidChangeCallText).assertContain('onDidChangeCall:false');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0040
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0040
     * @tc.desc  : Calling setStyledstring will not trigger onWillChange and onDidChange callbacks to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0040',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0040 START');
      let driver = Driver.create();
      let setStyledString = await driver.findComponent(ON.id('setStyledString'));
      await setStyledString.click();
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      let onWillChangeCall = await driver.findComponent(ON.id('onWillChangeCall'));
      let onWillChangeCallText = await onWillChangeCall.getText();
      await CommonFunc.sleep(500);
      expect(onWillChangeCallText).assertContain('onWillChangeCall:false');
      let onDidChangeCall = await driver.findComponent(ON.id('onDidChangeCall'));
      let onDidChangeCallText = await onDidChangeCall.getText();
      await CommonFunc.sleep(500);
      expect(onDidChangeCallText).assertContain('onDidChangeCall:false');
      done();
    });
  })
}


