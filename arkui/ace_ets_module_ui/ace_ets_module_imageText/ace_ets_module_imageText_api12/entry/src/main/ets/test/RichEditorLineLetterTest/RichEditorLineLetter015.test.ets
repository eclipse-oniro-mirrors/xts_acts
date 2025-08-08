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

export default function RichEditorLineLetter015() {
  describe('RichEditorLineLetter015', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineLetter015 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineLetter/RichEditorLineLetter015',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineLetter015 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineLetter015" == pages.name)) {
          console.info("get RichEditorLineLetter015 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineLetter015 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineLetter015 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0009
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0009
     * @tc.desc  : Test RichEditor LineHeight and LetterSpacing by setting lineHeight and LetterSpacing values to undefined for plain text content
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 4
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0009',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0009 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineLetter015'));
      let pointCenter = await rich.getBoundsCenter();

      let textStyle = await driver.findComponent(ON.id('textStyle'));
      let textStyleText = await textStyle.getText();
      await CommonFunc.sleep(500);
      expect(textStyleText).assertContain('"lineHeight');
      expect(textStyleText).assertContain('"letterSpacing');
      done();
    });

  })
}


