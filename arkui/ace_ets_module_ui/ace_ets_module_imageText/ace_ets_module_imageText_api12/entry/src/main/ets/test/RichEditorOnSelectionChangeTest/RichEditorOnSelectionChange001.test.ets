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

export default function RichEditorOnSelectionChange001() {
  describe('RichEditorOnSelectionChange001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnSelectionChange001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnSelectionChange/RichEditorOnSelectionChange001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnSelectionChange001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnSelectionChange001" == pages.name)) {
          console.info("get RichEditorOnSelectionChange001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnSelectionChange001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnSelectionChange001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0180
     * @tc.name  : Test the RichEditor OnSelectionChange
     * @tc.desc  : Test RichEditor OnSelectionChange by selecting all content with Ctrl A
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0180',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0180 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);

      let onSelectCallBack = await driver.findComponent(ON.id('onSelectCallBack'));
      let onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertEqual('onSelectCallBack:true');

      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertEqual('message:{"start":0,"end":5}');
      done();
    });

  })
}


