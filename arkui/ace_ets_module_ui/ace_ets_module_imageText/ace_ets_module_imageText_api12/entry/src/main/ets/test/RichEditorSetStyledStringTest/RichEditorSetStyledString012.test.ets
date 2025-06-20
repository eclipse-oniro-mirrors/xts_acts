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

export default function RichEditorSetStyledString012() {
  describe('RichEditorSetStyledString012', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString012 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString012',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString012 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString012" == pages.name)) {
          console.info("get RichEditorSetStyledString012 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString012 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString012 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0022
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Verify property string support for onSelectionChange to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0022', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0022 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString012'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);
      let image_top = await driver.findComponent(ON.id('image_top'));
      await image_top.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      let onSelectionChangeCall = await driver.findComponent(ON.id('onSelectionChangeCall'));
      let onSelectionChangeCallText = await onSelectionChangeCall.getText();
      await CommonFunc.sleep(500);
      expect(onSelectionChangeCallText).assertContain('onSelectionChangeCall:true');
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('message:{"start":0,"end":3}');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0025
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Validating attribute strings does not support onSelect to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0025', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0025 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString012'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      let onSelectCallBack = await driver.findComponent(ON.id('onSelectCallBack'));
      let onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertContain('onSelectCallBack:false');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0026
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Validating attribute strings does not support aboutToIMEInput to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0026', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0026 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString012'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      let aboutToIMEInputCall = await driver.findComponent(ON.id('aboutToIMEInputCall'));
      let aboutToIMEInputCallText = await aboutToIMEInputCall.getText();
      await CommonFunc.sleep(500);
      expect(aboutToIMEInputCallText).assertContain('aboutToIMEInputCall:false');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0035
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Validating attribute strings does not support onIMEInputComplete to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0035', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0035 START');
      let driver = Driver.create();
      await driver.triggerKey(KeyCode.KEYCODE_B);
      await CommonFunc.sleep(500);
      let onIMEInputCompleteCall = await driver.findComponent(ON.id('onIMEInputCompleteCall'));
      let onIMEInputCompleteCallText = await onIMEInputCompleteCall.getText();
      await CommonFunc.sleep(500);
      expect(onIMEInputCompleteCallText).assertContain('onIMEInputCompleteCall:false');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0036
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Validating attribute strings does not support aboutToDelete to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0036', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0036 START');
      let driver = Driver.create();
      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      let aboutToDeleteCall = await driver.findComponent(ON.id('aboutToDeleteCall'));
      let aboutToDeleteCallText = await aboutToDeleteCall.getText();
      await CommonFunc.sleep(500);
      expect(aboutToDeleteCallText).assertContain('aboutToDeleteCall:false');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0037
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Validating attribute strings does not support onDeleteComplete to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0037', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0037 START');
      let driver = Driver.create();
      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      let onDeleteCompleteCall = await driver.findComponent(ON.id('onDeleteCompleteCall'));
      let onDeleteCompleteCallText = await onDeleteCompleteCall.getText();
      await CommonFunc.sleep(500);
      expect(onDeleteCompleteCallText).assertContain('onDeleteCompleteCall:false');
      done();
    });

  })
}


