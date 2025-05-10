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

export default function RichEditorCustomSpan014() {
  describe('RichEditorCustomSpan014', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan014 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan014',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan014 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan014" == pages.name)) {
          console.info("get RichEditorCustomSpan014 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan014 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan014 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0021
     * @tc.name  : Test the RichEditor CustomSpan
     * @tc.desc  : Replace with images using replaceStyledSstring() CustomSpan、 The attribute string of the string is tested to the specified position using RichEditor Custom Span
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0021', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0021 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan014'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      let imageTop = await driver.findComponent(ON.id('imageTop'));
      await imageTop.click();
      await CommonFunc.sleep(500);
      let addCustom = await driver.findComponent(ON.id('addCustom'));
      await addCustom.click();
      await CommonFunc.sleep(500);
      let getStyles = await driver.findComponent(ON.id('getStyles'));
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await driver.findComponent(ON.id('stylesInfo'));
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      let str = '{"start":5,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":80,"word":"Hello"}}';
      expect(stylesInfoText).assertContain(str);
      let replaceStyledString = await driver.findComponent(ON.id('replaceStyledString'));
      await replaceStyledString.click();
      await CommonFunc.sleep(500);
      await getStyles.click();
      await CommonFunc.sleep(500);
      stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      str = '{"start":5,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":60,"word":"word"}}';
      expect(stylesInfoText).assertContain(str);
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0022
     * @tc.name  : Test the RichEditor CustomSpan
     * @tc.desc  : Test RichEditor Custom Span by replacing the attribute string with only a string to the specified position using replaceStyledSString()
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0022', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0022 START');
      let driver = Driver.create();

      let getString = await driver.findComponent(ON.id('getString'));
      await getString.click();
      await CommonFunc.sleep(500);
      let styleString = await driver.findComponent(ON.id('styleString'));
      let styleStringText = await styleString.getText();
      await CommonFunc.sleep(500);
      expect(styleStringText).assertContain('styleString:1234  ');
      let replaceString = await driver.findComponent(ON.id('replaceString'));
      await replaceString.click();
      await CommonFunc.sleep(500);
      await getString.click();
      await CommonFunc.sleep(500);
      styleStringText = await styleString.getText();
      await CommonFunc.sleep(500);
      expect(styleStringText).assertContain('styleString:hello  ');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0023
     * @tc.name  : Test the RichEditor CustomSpan
     * @tc.desc  : Replace the attribute string containing only the Custom Span with replaceStyledString () to the specified location to test RichEditor Custom Span
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0023', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0023 START');
      let driver = Driver.create();
      let getStyles = await driver.findComponent(ON.id('getStyles'));
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await driver.findComponent(ON.id('stylesInfo'));
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      let str = '{"start":6,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":60,"word":"word"}}';
      expect(stylesInfoText).assertContain(str);
      let replaceCustom = await driver.findComponent(ON.id('replaceCustom'));
      await replaceCustom.click();
      await CommonFunc.sleep(500);
      await getStyles.click();
      await CommonFunc.sleep(500);
      stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      str = '{"start":6,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":90,"word":"custom"}}';
      expect(stylesInfoText).assertContain(str);
      done();
    });

  })
}


