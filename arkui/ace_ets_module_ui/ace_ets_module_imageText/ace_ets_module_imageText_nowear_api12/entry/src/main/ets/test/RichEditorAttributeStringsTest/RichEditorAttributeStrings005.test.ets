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

export default function RichEditorAttributeStrings005() {
  describe('RichEditorAttributeStrings005', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorAttributeStrings005 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorAttributeStrings/RichEditorAttributeStrings005',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorAttributeStrings005 state pages: " + JSON.stringify(pages));
        if (!("RichEditorAttributeStrings005" == pages.name)) {
          console.info("get RichEditorAttributeStrings005 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorAttributeStrings005 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorAttributeStrings005 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0031
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0031
     * @tc.desc  : Call the fromStyledString, set the text type attribute -type attribute character string object to test the RichEditor property string display results
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0031',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0031 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorAttributeStrings005'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      let fromStyledString = await driver.findComponent(ON.id('fromStyledString'));
      await fromStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertContain('spans:aaa');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_COPY_PASTE_ATTRIBUTE_STRINGS_0032
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_COPY_PASTE_ATTRIBUTE_STRINGS_0032
     * @tc.desc  : Call the fromStyledString, set the input parameter as the picture type attribute string object to test the RichEditor property string display result
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_COPY_PASTE_ATTRIBUTE_STRINGS_0032',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_COPY_PASTE_ATTRIBUTE_STRINGS_0032 START');
      let driver = Driver.create();
      let imageFromStyledString = await driver.findComponent(ON.id('imageFromStyledString'));
      await imageFromStyledString.click();
      await CommonFunc.sleep(500);
      let imageSpan = await driver.findComponent(ON.id('imageSpan'));
      let imageSpanText = await imageSpan.getText();
      await CommonFunc.sleep(500);
      expect(imageSpanText).assertContain('imageSpan index:0, range: 0, 1, size : 30, 30');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0033
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0033
     * @tc.desc  : Call the fromStyledString, set the reference to the CustomSpan test RichEditor property string display results
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0033',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0033 START');
      let driver = Driver.create();
      let cusFromStyledString = await driver.findComponent(ON.id('cusFromStyledString'));
      await cusFromStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertContain('spans:[{"offsetInSpan":[0,1],"spanPosition":{"spanIndex":0,"spanRange":[0,1]}}]');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0034
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0034
     * @tc.desc  : Call the fromStyledString, set the input parameters as illegal value test RichEditor property string display results
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0034',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0034 START');
      let driver = Driver.create();
      let undefinedFromStyledString = await driver.findComponent(ON.id('undefinedFromStyledString'));
      await undefinedFromStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertContain('spans:undefined');
      done();
    });
  })
}


