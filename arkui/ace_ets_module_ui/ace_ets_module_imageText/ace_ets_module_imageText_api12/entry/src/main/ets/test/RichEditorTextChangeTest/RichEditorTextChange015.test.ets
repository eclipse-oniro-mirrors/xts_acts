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

export default function RichEditorTextChange015() {
  describe('RichEditorTextChange015', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTextChange015 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorTextChange/RichEditorTextChange015',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTextChange015 state pages: " + JSON.stringify(pages));
        if (!("RichEditorTextChange015" == pages.name)) {
          console.info("get RichEditorTextChange015 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorTextChange015 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTextChange015 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0001
     * @tc.name  : Test the RichEditor TextChange
     * @tc.desc  : Non editing state to editing state (click to focus) _onEditingChange callback query eisEditing state query to test RichEditor TextChange
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0001', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0001 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let onEditingChangeCallBack = await driver.findComponent(ON.id('onEditingChangeCallBack'));
      let onEditingChangeCallBackText = await onEditingChangeCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onEditingChangeCallBackText).assertEqual('onEditingChangeCallBack:true');

      let isEditingFlag = await driver.findComponent(ON.id('isEditingFlag'));
      let isEditingFlagText = await isEditingFlag.getText();
      await CommonFunc.sleep(500);
      expect(isEditingFlagText).assertEqual('isEditingFlag:true');
      done();
    });

  })
}


