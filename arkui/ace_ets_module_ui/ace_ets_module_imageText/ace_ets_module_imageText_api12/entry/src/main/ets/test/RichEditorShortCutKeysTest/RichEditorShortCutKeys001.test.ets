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

export default function RichEditorShortCutKeys001() {
  describe('RichEditorShortCutKeys001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorShortCutKeys001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorShortCutKeys001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys001" == pages.name)) {
          console.info("get RichEditorShortCutKeys001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTKCUTKEYS_0250
     * @tc.name  : Test the RichEditor shortCutKeys
     * @tc.desc  : Mouse cutting text+shortcut key pasting to test RichEditor shortCutKeys
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTKCUTKEYS_0250', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTKCUTKEYS_0250 START');
      let driver = Driver.create();

      let richEditor = await driver.findComponent(ON.id('RichEditor'));
      let pointCenter1 = await richEditor.getBoundsCenter();
      await driver.click(pointCenter1.x, pointCenter1.y);
      await CommonFunc.sleep(1000);

      let select = await driver.findComponent(ON.id('select'))
      await select?.click()
      await CommonFunc.sleep(1000);

      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(500);

      let rich = await driver.findComponent(ON.id('RichEditorShortCutKeys001'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(1000);

      let finalText = await driver.findComponent(ON.id('finalText'));
      let finalTextText = await finalText.getText();
      await CommonFunc.sleep(500);
      expect(finalTextText).assertEqual('finalText:"abcd23"');
      done();
    });

  })
}


