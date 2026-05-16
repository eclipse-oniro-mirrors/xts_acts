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

export default function RichEditorAttributeStrings003() {
  describe('RichEditorAttributeStrings003', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorAttributeStrings003 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorAttributeStrings/RichEditorAttributeStrings003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorAttributeStrings003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorAttributeStrings003" == pages.name)) {
          console.info("get RichEditorAttributeStrings003 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorAttributeStrings003 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorAttributeStrings003 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0008
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0008
     * @tc.desc   Test the RichEditor Properties Strings in a single non -attribute string component in a single non -attribute string component
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0008',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0008 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorAttributeStrings003'));
      let getBounds = await rich.getBoundsCenter();
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(500);
      let setCare = await driver.findComponent(ON.id('setCare'));
      await setCare.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      let getSpans = await driver.findComponent(ON.id('getSpans'));
      await getSpans.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('Spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertContain('Spans:0123\nabc12');
      done();
    });

  })
}


