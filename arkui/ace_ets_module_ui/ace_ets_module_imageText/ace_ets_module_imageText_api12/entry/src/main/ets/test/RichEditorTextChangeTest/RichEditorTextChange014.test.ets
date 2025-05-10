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

export default function RichEditorTextChange014() {
  describe('RichEditorTextChange014', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTextChange014 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorTextChange/RichEditorTextChange014',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTextChange014 state pages: " + JSON.stringify(pages));
        if (!("RichEditorTextChange014" == pages.name)) {
          console.info("get RichEditorTextChange014 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorTextChange014 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTextChange014 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0003
     * @tc.name  : Test the RichEditor TextChange
     * @tc.desc  : Non editing state to editing state (drag and drop content) _onEditingChange callback query eisEditing state query to test RichEditor TextChange
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0003', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0003 START');
      let driver = Driver.create();
      let richeditor = await driver.findComponent(ON.id("RichEditorTextChange014"));
      await richeditor.click();
      await CommonFunc.sleep(1000);
      let textArea = await driver.findComponent(ON.id('TextArea'));
      await textArea.click();
      await CommonFunc.sleep(500);
      await textArea.click()
      await CommonFunc.sleep(500);
      let selectAll = await driver.findComponent(ON.text('全选'))
      await selectAll?.click();
      await CommonFunc.sleep(1000);
      await textArea.dragTo(richeditor);
      await richeditor.click();
      await CommonFunc.sleep(2000);
      let isEditingFlag = await driver.findComponent(ON.id('isEditingFlag'));
      let isEditingFlagText = await isEditingFlag.getText();
      await CommonFunc.sleep(500);
      expect(isEditingFlagText).assertEqual('isEditingFlag:true');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0010
     * @tc.name  : Test the RichEditor TextChange
     * @tc.desc  : From editing state to non editing state (drag and drop content) _onEditingChange callback query tisEditing state query to test RichEditor TextChange
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0010', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0010 START');
      let driver = Driver.create();
      let textArea = await driver.findComponent(ON.id('TextArea'));
      await CommonFunc.sleep(500);
      let richeditor = await driver.findComponent(ON.id("RichEditorTextChange014"));
      await richeditor.click();
      await CommonFunc.sleep(300);
      await richeditor.click();
      await CommonFunc.sleep(300);
      await richeditor.click();
      await CommonFunc.sleep(300);
      let selectAll = await driver.findComponent(ON.text('全选'))
      await selectAll.click();
      await CommonFunc.sleep(2000);
      await richeditor.dragTo(textArea);
      await textArea.click();
      await CommonFunc.sleep(1000);
      let isEditingFlag = await driver.findComponent(ON.id('isEditingFlag'));
      let isEditingFlagText = await isEditingFlag.getText();
      await CommonFunc.sleep(500);
      expect(isEditingFlagText).assertEqual('isEditingFlag:false');
      done();
    });

  })
}


