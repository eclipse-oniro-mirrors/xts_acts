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

export default function RichEditorLineLetter002() {
  describe('RichEditorLineLetter002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineLetter002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineLetter/RichEditorLineLetter002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineLetter002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineLetter002" == pages.name)) {
          console.info("get RichEditorLineLetter002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineLetter002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineLetter002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0017
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0017
     * @tc.desc   Copy and paste text of different line heights and character spacing into components within Rich Text to test RichEditor LineHeight and LetterSpacing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0017',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEHEIGHT_LETTERSPACING_0017 START');
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


      let rich = await driver.findComponent(ON.id('RichEditorLineLetter002'));
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


