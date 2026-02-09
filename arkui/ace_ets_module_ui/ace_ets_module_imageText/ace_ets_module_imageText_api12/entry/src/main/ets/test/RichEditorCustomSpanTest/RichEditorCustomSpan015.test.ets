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

export default function RichEditorCustomSpan015() {
  describe('RichEditorCustomSpan015', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan015 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan015',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan015 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan015" == pages.name)) {
          console.info("get RichEditorCustomSpan015 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan015 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan015 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0024
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0024
     * @tc.desc   Test RichEditor's Custom Span by inserting a property string with Custom Span to the specified location using insertStyledString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0024',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0024 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan015'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      let imageTop = await driver.findComponent(ON.id('imageTop'));
      await imageTop.click();
      await CommonFunc.sleep(500);
      let insertStyledString = await driver.findComponent(ON.id('insertStyledString'));
      await insertStyledString.click();
      await CommonFunc.sleep(500);
      let getStyles = await driver.findComponent(ON.id('getStyles'));
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await driver.findComponent(ON.id('stylesInfo'));
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      let str = '{"start":4,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":80,"word":"Hello"}}';
      expect(stylesInfoText).assertContain(str);
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0025
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0025
     * @tc.desc   Test RichEditor's Custom Span by adding a Custom Span to the end of appendStyles String()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0025',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0025 START');
      let driver = Driver.create();
      let appendStyledString = await driver.findComponent(ON.id('appendStyledString'));
      await appendStyledString.click();
      await CommonFunc.sleep(500);
      let getStyles = await driver.findComponent(ON.id('getStyles'));
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await driver.findComponent(ON.id('stylesInfo'));
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      let str = '{"start":4,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":80,"word":"Hello"}}';
      let str1 = '{"start":6,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":60,"word":"test"}}';
      expect(stylesInfoText).assertContain(str);
      expect(stylesInfoText).assertContain(str1);
      done();
    });

  })
}


