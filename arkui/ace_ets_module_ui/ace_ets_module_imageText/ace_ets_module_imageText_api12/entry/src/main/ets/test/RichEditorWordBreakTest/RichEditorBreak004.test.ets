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

export default function RichEditorBreak004() {
  describe('RichEditorBreak004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorBreak004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorWordBreak/RichEditorBreak004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorBreak004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorBreak004" == pages.name)) {
          console.info("get RichEditorBreak004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(4000);
          console.info("push RichEditorBreak004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorBreak004 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_WORDBREAK_0003
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_WORDBREAK_0003
     * @tc.desc  : Add textSpan and set wordBreak attribute -1 to test RichEditor WordBreak
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 4
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_WORDBREAK_0003',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_WORDBREAK_0003 START');
      let driver = Driver.create();
      await driver.findComponent(ON.id('rich_struct'));
      await CommonFunc.sleep(1000);

      let getPara = await driver.findComponent(ON.id('getParagraphStyle'));
      getPara.click();
      await CommonFunc.sleep(1000);

      let text = await driver.findComponent(ON.id('word_break_text'));
      let wordBreakText = await text.getText();
      await CommonFunc.sleep(500);
      expect(wordBreakText.indexOf('"wordBreak":2') > 0).assertEqual(true);
      done();
    });
  })
}


