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

export default function RichEditorCustomSpan007() {
  describe('RichEditorCustomSpan007', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan007 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan007',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan007 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan007" == pages.name)) {
          console.info("get RichEditorCustomSpan007 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan007 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan007 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0010
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0010
     * @tc.desc  : subStyledString() Get the attribute string sub -skewers to test RichEditor CustomSpan
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0010 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan007'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      let addCustom = await driver.findComponent(ON.id('addCustom'));
      await addCustom.click();
      await CommonFunc.sleep(500);
      let imageTop = await driver.findComponent(ON.id('imageTop'));
      await imageTop.click();
      await CommonFunc.sleep(500);
      let getContent = await driver.findComponent(ON.id('getContent'));
      await getContent.click();
      await CommonFunc.sleep(500);
      let content = await driver.findComponent(ON.id('content'));
      let contentText = await content.getText();
      await CommonFunc.sleep(500);
      expect(contentText).assertContain('content:abcd  ');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0011
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0011
     * @tc.desc  : GetStyles () Get the style collection of the specified range attribute string to test the RichEditor CustomSpan
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0011',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0011 START');
      let driver = Driver.create();
      let getStyles = await driver.findComponent(ON.id('getStyles'));
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await driver.findComponent(ON.id('stylesInfo'));
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      let str = '[{"start":5,"length":1,"styledKey":300,"styledValue":{}},' +
        '{"start":4,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":80,"word":"Hello"}},' +
        '{"start":0,"length":4,"styledKey":0,"styledValue":{}}]';
      expect(stylesInfoText).assertContain(str);
      done();
    });

  })
}


