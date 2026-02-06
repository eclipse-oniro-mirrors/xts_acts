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

export default function RichEditorStringSpan005() {
  describe('RichEditorStringSpan005', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorStringSpan005 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorStringSpan/RichEditorStringSpan005',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStringSpan005 state pages: " + JSON.stringify(pages));
        if (!("RichEditorStringSpan005" == pages.name)) {
          console.info("get RichEditorStringSpan005 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorStringSpan005 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStringSpan005 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_stringspan_0018
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_stringspan_0018
     * @tc.desc  : Test RichEditor StringSpan by adding a new text/image attribute string at the end using appendStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_stringspan_0018',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_stringspan_0018 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorStringSpan005'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      let add_text = await driver.findComponent(ON.id('add_text'));
      await add_text.click();
      await CommonFunc.sleep(500);
      let image_top = await driver.findComponent(ON.id('image_top'));
      await image_top.click();
      await CommonFunc.sleep(500);
      let get_content = await driver.findComponent(ON.id('get_content'));
      await get_content.click();
      await CommonFunc.sleep(500);
      let content = await driver.findComponent(ON.id('content'));
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      expect(contentText).assertContain('content:11');
      done();
    });

  })
}


