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

export default function RichEditorOnWillChange002() {
  describe('RichEditorOnWillChange002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnWillChange002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnWillChange002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange002" == pages.name)) {
          console.info("get RichEditorOnWillChange002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(11000);
          console.info("push RichEditorOnWillChange002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0019
     * @tc.name  : Test the RichEditor onWillChange callback
     * @tc.desc  : The addition of image/symbol/builder will not trigger callbacks to test RichEditor OnSelectionChange
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0019', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0019 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      await CommonFunc.sleep(500);
      let int_callback_status = await driver.findComponent(ON.id('int_callback_status'));

      let add_image = await driver.findComponent(ON.id('add_image'));
      add_image.click();
      await CommonFunc.sleep(500);
      let onWillChange = await driver.findComponent(ON.id('onWillChange_callback'));
      let onWillText = await onWillChange.getText();
      let onDidChange = await driver.findComponent(ON.id('onDidChange_callback'));
      let didText = await onDidChange.getText();
      await CommonFunc.sleep(500);
      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');

      int_callback_status.click();
      await CommonFunc.sleep(500);

      let add_symbol = await driver.findComponent(ON.id('add_symbol'));
      add_symbol.click();
      await CommonFunc.sleep(500);
      onWillText = await onWillChange.getText();
      didText = await onDidChange.getText();
      await CommonFunc.sleep(500);
      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');

      int_callback_status.click();
      await CommonFunc.sleep(500);

      let builder = await driver.findComponent(ON.id('builder'));
      builder.click();
      await CommonFunc.sleep(500);

      let add_builder = await driver.findComponent(ON.id('add_builder'));
      add_builder.click();
      await CommonFunc.sleep(500);

      onWillText = await onWillChange.getText();
      didText = await onDidChange.getText();
      await CommonFunc.sleep(500);

      expect(onWillText).assertEqual('onWillChange_callback:false');
      expect(didText).assertEqual('onDidChange_callback:false');

      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0019
     * @tc.name  : Test the RichEditor onWillChange callback
     * @tc.desc  : Deleting image/symbol/builder will trigger a callback to test RichEditor OnSelectionChange
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0020', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0020 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      await CommonFunc.sleep(500);
      let int_callback_status = await driver.findComponent(ON.id('int_callback_status'));

      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);

      //KEYCODE_DEL delete builder
      int_callback_status.click();
      await CommonFunc.sleep(500);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(500);
      let onWillChange = await driver.findComponent(ON.id('onWillChange_callback'));
      let onDidChange = await driver.findComponent(ON.id('onDidChange_callback'));
      let onWillText = await onWillChange.getText();
      let didText = await onDidChange.getText();
      await CommonFunc.sleep(500);
      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');

      //KEYCODE_DEL delete symbol
      int_callback_status.click();
      await CommonFunc.sleep(500);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(500);
      onWillText = await onWillChange.getText();
      didText = await onDidChange.getText();
      await CommonFunc.sleep(500);
      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');

      //KEYCODE_DEL delete image
      int_callback_status.click();
      await CommonFunc.sleep(500);
      await driver.triggerKey(2055);
      await CommonFunc.sleep(500);
      onWillText = await onWillChange.getText();
      didText = await onDidChange.getText();
      await CommonFunc.sleep(500);
      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');
      done();
    });
  })
}


