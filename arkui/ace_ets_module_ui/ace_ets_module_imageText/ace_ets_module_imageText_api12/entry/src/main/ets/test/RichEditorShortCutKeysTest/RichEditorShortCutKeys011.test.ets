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

export default function RichEditorShortCutKeys011() {
  describe('RichEditorShortCutKeys011', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorShortCutKeys011 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys011',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorShortCutKeys011 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys011" == pages.name)) {
          console.info("get RichEditorShortCutKeys011 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys011 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys011 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0018
     * @tc.name  : Test the RichEditor shortCutKeys
     * @tc.desc  : The font has preset the texture effect, use CTRL+I shortcut key again to test RichEditor shortCutKeys
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0018',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0018 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorShortCutKeys011'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let getSpans = await driver.findComponent(ON.id('getSpans'));
      await getSpans.click();
      await CommonFunc.sleep(500);
      let style = await driver.findComponent(ON.id('style'));
      let styleText = await style.getText();
      await CommonFunc.sleep(500);
      expect(styleText).assertContain('"fontStyle":1');
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let selectAll = await driver.findComponent(ON.text('全选'));
      await selectAll.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_I);
      await CommonFunc.sleep(500);
      await getSpans.click();
      await CommonFunc.sleep(500);
      styleText = await style.getText();
      await CommonFunc.sleep(500);
      expect(styleText).assertContain('"fontStyle":0');
      done();
    });

  })
}


