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

export default function RichEditorOnSelectionChange002() {
  describe('RichEditorOnSelectionChange002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnSelectionChange002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnSelectionChange/RichEditorOnSelectionChange002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnSelectionChange002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnSelectionChange002" == pages.name)) {
          console.info("get RichEditorOnSelectionChange002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnSelectionChange002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnSelectionChange002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0060
     * @tc.name  : Test the RichEditor OnSelectionChange
     * @tc.desc  : Test RichEditor OnSelectionChange by changing the cursor position using the setCareOffset method
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0060', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONSELECTIONCHANGE_0060 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let set1 = await driver.findComponent(ON.id('set1'))
      await set1?.click();
      await CommonFunc.sleep(500);

      let set2 = await driver.findComponent(ON.id('set2'))
      await set2?.click();
      await CommonFunc.sleep(500);

      let set3 = await driver.findComponent(ON.id('set3'))
      await set3?.click();
      await CommonFunc.sleep(500);

      let set4 = await driver.findComponent(ON.id('set4'))
      await set4?.click();
      await CommonFunc.sleep(500);

      let set5 = await driver.findComponent(ON.id('set5'))
      await set5?.click();
      await CommonFunc.sleep(500);

      let onSelectCallBack = await driver.findComponent(ON.id('onSelectCallBack'));
      let onSelectCallBackText = await onSelectCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallBackText).assertEqual('onSelectCallBack:true');

      let setCaretOffset = await driver.findComponent(ON.id('setCaretOffset'));
      let setCaretOffsetText = await setCaretOffset.getText();
      await CommonFunc.sleep(500);
      expect(setCaretOffsetText).assertEqual('setCaretOffset:0,1,5,');
      done();
    });

  })
}


