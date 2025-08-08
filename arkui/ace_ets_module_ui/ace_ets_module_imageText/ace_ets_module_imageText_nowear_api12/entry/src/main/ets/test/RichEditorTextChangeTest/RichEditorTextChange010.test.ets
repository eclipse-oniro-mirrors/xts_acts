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

export default function RichEditorTextChange010() {
  describe('RichEditorTextChange010', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTextChange010 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorTextChange/RichEditorTextChange010',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTextChange010 state pages: " + JSON.stringify(pages));
        if (!("RichEditorTextChange010" == pages.name)) {
          console.info("get RichEditorTextChange010 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorTextChange010 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTextChange010 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0007
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0007
     * @tc.desc  : Edit state to non edit state (click outside the component to defocuse) _onEditingChange callback query tisEditing state query to test RichEditor TextChange
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 4
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0007',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0007 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let text_input = await driver.findComponent(ON.id('text_input'));
      await text_input.click();
      await CommonFunc.sleep(1000);

      let onEditingChangeCallBack = await driver.findComponent(ON.id('onEditingChangeCallBack'));
      let onEditingChangeCallBackText = await onEditingChangeCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onEditingChangeCallBackText).assertEqual('onEditingChangeCallBack:2');

      let isEditingFlag = await driver.findComponent(ON.id('isEditingFlag'));
      let isEditingFlagText = await isEditingFlag.getText();
      await CommonFunc.sleep(500);
      expect(isEditingFlagText).assertEqual('isEditingFlag:false');
      done();
    });

  })
}


