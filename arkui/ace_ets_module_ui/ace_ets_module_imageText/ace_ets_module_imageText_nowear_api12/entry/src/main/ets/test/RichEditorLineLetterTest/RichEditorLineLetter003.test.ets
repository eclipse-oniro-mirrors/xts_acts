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

export default function RichEditorLineLetter003() {
  describe('RichEditorLineLetter003', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineLetter003 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineLetter/RichEditorLineLetter003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineLetter003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineLetter003" == pages.name)) {
          console.info("get RichEditorLineLetter003 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineLetter003 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineLetter003 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0018
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0018
     * @tc.desc  : Test RichEditor LineHeight and LetterSpacing by pasting text of the same height and character spacing in the Rich Text component
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 4
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0018',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0018 START');
      let driver = Driver.create();

      let richEditor = await driver.findComponent(ON.id('RichEditor'));
      let pointCenter1 = await richEditor.getBoundsCenter();
      await driver.click(pointCenter1.x, pointCenter1.y);
      await CommonFunc.sleep(1000);

      await driver.longClick(pointCenter1.x, pointCenter1.y);
      await CommonFunc.sleep(1000);

      let selectAll = await driver.findComponent(ON.text('全选'))
      await selectAll?.click();
      await CommonFunc.sleep(1000);
      let copy = await driver.findComponent(ON.text('复制'))
      await copy?.click()
      await CommonFunc.sleep(1000);


      let rich = await driver.findComponent(ON.id('RichEditorLineLetter003'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let paste = await driver.findComponent(ON.text('粘贴'))
      await paste?.click()
      await CommonFunc.sleep(1000);

      let textStyle = await driver.findComponent(ON.id('textStyle'));
      let textStyleText = await textStyle.getText();
      await CommonFunc.sleep(500);
      expect(textStyleText).assertContain('"lineHeight');
      expect(textStyleText).assertContain('"letterSpacing');
      done();
    });

  })
}


