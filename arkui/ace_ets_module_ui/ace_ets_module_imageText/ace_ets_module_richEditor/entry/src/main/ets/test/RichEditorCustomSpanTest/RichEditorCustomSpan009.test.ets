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

export default function RichEditorCustomSpan009() {
  describe('RichEditorCustomSpan009', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan009 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan009',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan009 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan009" == pages.name)) {
          console.info("get RichEditorCustomSpan009 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan009 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan009 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0013
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0013
     * @tc.desc   Add strings and pictures and Custonspan, Removestring (Remove the string within the specified range to test the RichEditor CustomSpan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0013',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0013 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan009'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      let addCustom = await driver.findComponent(ON.id('addCustom'));
      await addCustom.click();
      await CommonFunc.sleep(500);
      let imageTop = await driver.findComponent(ON.id('imageTop'));
      await imageTop.click();
      await CommonFunc.sleep(500);
      let removeString = await driver.findComponent(ON.id('removeString'));
      await removeString.click();
      await CommonFunc.sleep(500);
      let getContent = await driver.findComponent(ON.id('getContent'));
      await getContent.click();
      await CommonFunc.sleep(500);
      let length = await driver.findComponent(ON.id('length'));
      let lengthText = await length.getText();
      await CommonFunc.sleep(500);
      expect(lengthText).assertContain('length:3');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0014
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0014
     * @tc.desc   ReplaceStyle () replaces the specified range content as a specified type of new style to test the RichEditor CustomSpan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0014',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0014 START');
      let driver = Driver.create();
      let addCustom = await driver.findComponent(ON.id('addCustom'));
      await addCustom.click();
      await CommonFunc.sleep(500);
      let replaceStyle = await driver.findComponent(ON.id('replaceStyle'));
      await replaceStyle.click();
      await CommonFunc.sleep(500);
      let getStyles = await driver.findComponent(ON.id('getStyles'));
      await getStyles.click();
      await CommonFunc.sleep(500);
      let stylesInfo = await driver.findComponent(ON.id('stylesInfo'));
      let stylesInfoText = await stylesInfo.getText();
      await CommonFunc.sleep(500);
      expect(stylesInfoText).assertContain('{"start":0,"length":2,"styledKey":0,"styledValue":{}}');
      expect(stylesInfoText).assertContain('"styledValue":{"type_":"CustomSpan","width":80,"word":"123"}');
      done();
    });

  })
}


