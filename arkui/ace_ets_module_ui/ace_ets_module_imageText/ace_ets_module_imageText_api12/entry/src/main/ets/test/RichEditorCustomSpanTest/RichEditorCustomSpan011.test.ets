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

export default function RichEditorCustomSpan011() {
  describe('RichEditorCustomSpan011', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan011 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan011',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan011 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan011" == pages.name)) {
          console.info("get RichEditorCustomSpan011 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan011 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan011 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0016
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0016
     * @tc.desc  : Through the specified type style of the specified range content through removeStyle(), the removal position is only one CustomSpan to test RichEditor CustomSpan
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0016',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0016 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan011'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      let addCustom = await driver.findComponent(ON.id('addCustom'));
      await addCustom.click();
      await CommonFunc.sleep(500);
      let removeStyle = await driver.findComponent(ON.id('removeStyle'));
      await removeStyle.click();
      await CommonFunc.sleep(500);
      let getContent = await driver.findComponent(ON.id('getContent'));
      await getContent.click();
      await CommonFunc.sleep(500);
      let length = await driver.findComponent(ON.id('length'));
      let lengthText = await length.getText();
      await CommonFunc.sleep(500);
      expect(lengthText).assertContain('length:0');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0017
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0017
     * @tc.desc  : Through the specified type style of the specified range content through Removestyleo, the removal position is only multi CustomSpan to test RichEditor CustomSpan
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0017',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0017 START');
      let driver = Driver.create();
      let addCustom = await driver.findComponent(ON.id('addCustom'));
      await addCustom.click();
      await CommonFunc.sleep(500);
      await addCustom.click();
      await CommonFunc.sleep(500);
      let removeStyle = await driver.findComponent(ON.id('removeStyle'));
      await removeStyle.click();
      await CommonFunc.sleep(500);
      let getContent = await driver.findComponent(ON.id('getContent'));
      await getContent.click();
      await CommonFunc.sleep(500);
      let length = await driver.findComponent(ON.id('length'));
      let lengthText = await length.getText();
      await CommonFunc.sleep(500);
      expect(lengthText).assertContain('length:1');
      done();
    });
  })
}


