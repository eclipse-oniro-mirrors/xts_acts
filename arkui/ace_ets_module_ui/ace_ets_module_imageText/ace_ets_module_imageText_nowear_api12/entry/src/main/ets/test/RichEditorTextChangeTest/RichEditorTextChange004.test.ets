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

export default function RichEditorTextChange004() {
  describe('RichEditorTextChange004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTextChange004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorTextChange/RichEditorTextChange004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTextChange004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorTextChange004" == pages.name)) {
          console.info("get RichEditorTextChange004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorTextChange004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTextChange004 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0013
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0013
     * @tc.desc  : When connecting an external physical keyboard, pulling and retracting the soft keyboard does not affect the editing status to test RichEditor TextChange
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0013',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_TEXTCHANGE_0013 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let select = await driver.findComponent(ON.id('select'));
      await select.click();
      await CommonFunc.sleep(1000);

      let onEditingChangeCallBack = await driver.findComponent(ON.id('onEditingChangeCallBack'));
      let onEditingChangeCallBackText = await onEditingChangeCallBack.getText();
      await CommonFunc.sleep(500);
      expect(onEditingChangeCallBackText).assertEqual('onEditingChangeCallBack:true');

      let isEditingFlag = await driver.findComponent(ON.id('isEditingFlag'));
      let isEditingFlagText = await isEditingFlag.getText();
      await CommonFunc.sleep(500);
      expect(isEditingFlagText).assertEqual('isEditingFlag:false');
      done();
    });

  })
}


