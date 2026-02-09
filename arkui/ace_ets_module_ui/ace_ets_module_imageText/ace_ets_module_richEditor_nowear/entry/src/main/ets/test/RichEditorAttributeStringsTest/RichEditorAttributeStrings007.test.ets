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

export default function RichEditorAttributeStrings007() {
  describe('RichEditorAttributeStrings007', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorAttributeStrings007 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorAttributeStrings/RichEditorAttributeStrings007',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorAttributeStrings007 state pages: " + JSON.stringify(pages));
        if (!("RichEditorAttributeStrings007" == pages.name)) {
          console.info("get RichEditorAttributeStrings007 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorAttributeStrings007 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorAttributeStrings007 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0039
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0039
     * @tc.desc   Call the toStyledString and set the stump to the Range with multiple sections of TextSpan to test the RichEditor Properties Strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0039',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0039 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorAttributeStrings007'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      let toStyledString = await driver.findComponent(ON.id('toStyledString'));
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      let str = 'spans:012345678901234567890123456789012345678901234567890123456789012345678901234567890123' +
        '4567890123456789abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwx' +
        'yzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklm' +
        'nopqrstuvwxyzabcdefghigklmnopqrstuvwxyz';
      expect(spansText).assertEqual(str);
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0040
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0040
     * @tc.desc   Call the toStyledString, set the stump to test the Range Range with multiple TextSpan and ImageSpar to test the RichEditor Properties String
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0040',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0040 START');
      let driver = Driver.create();
      let addImage = await driver.findComponent(ON.id('addImage'));
      await addImage.click();
      await CommonFunc.sleep(500);
      let toStyledString = await driver.findComponent(ON.id('toStyledString'));
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      let str = 'spans:012345678901234567890123456789012345678901234567890123456789012345678901234567890123' +
        '4567890123456789abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwx' +
        'yzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklm' +
        'nopqrstuvwxyzabcdefghigklmnopqrstuvwxyz    ';
      expect(spansText).assertEqual(str);
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0041
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0041
     * @tc.desc   Call the toStyledString, set the stump to test the Range Range with multiple sections of SymbolSpan and BuilderSpan to test the RichEditor Properties String
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0041',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0041 START');
      let driver = Driver.create();
      let builder = await driver.findComponent(ON.id('builder'));
      await builder.click();
      await CommonFunc.sleep(500);
      let addSpans = await driver.findComponent(ON.id('addSpans'));
      await addSpans.click();
      await CommonFunc.sleep(500);
      let toStyledString = await driver.findComponent(ON.id('toStyledString'));
      await toStyledString.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      let str = 'spans:012345678901234567890123456789012345678901234567890123456789012345678901234567890123' +
        '4567890123456789abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwx' +
        'yzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklm' +
        'nopqrstuvwxyzabcdefghigklmnopqrstuvwxyz          ';
      console.log('000000000:'+ spansText);
      console.log('000000000:'+ str);
      expect(spansText).assertEqual(str);
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0042
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0042
     * @tc.desc   Call toStyledString, set the parameters as illegal value to test the RichEditor property string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0042',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0042 START');
      let driver = Driver.create();
      let toStyledStringUndefined = await driver.findComponent(ON.id('toStyledStringUndefined'));
      await toStyledStringUndefined.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      let str = 'spans:012345678901234567890123456789012345678901234567890123456789012345678901234567890123' +
        '4567890123456789abcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwx' +
        'yzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklmnopqrstuvwxyzabcdefghigklm' +
        'nopqrstuvwxyzabcdefghigklmnopqrstuvwxyz          ';
      console.log('000000000:'+ spansText);
      console.log('000000000:'+ str);
      expect(spansText).assertEqual(str);
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0043
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0043
     * @tc.desc   Call the toStyledString, set the parameters as [2,2] and [2,1] to test the RichEditor property string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0043',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0043 START');
      let driver = Driver.create();
      let toStyledString1 = await driver.findComponent(ON.id('toStyledString1'));
      await toStyledString1.click();
      await CommonFunc.sleep(500);
      let spans = await driver.findComponent(ON.id('spans'));
      let spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertEqual('spans:');
      let toStyledString2 = await driver.findComponent(ON.id('toStyledString2'));
      await toStyledString2.click();
      await CommonFunc.sleep(500);
      spansText = await spans.getText();
      await CommonFunc.sleep(500);
      expect(spansText).assertEqual('spans:1');
      done();
    });

  })
}


