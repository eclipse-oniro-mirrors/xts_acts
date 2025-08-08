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

export default function RichEditorCustomSpan005() {
  describe('RichEditorCustomSpan005', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan005 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan005',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan005 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan005" == pages.name)) {
          console.info("get RichEditorCustomSpan005 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan005 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan005 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0007
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0007
     * @tc.desc  : Test RichEditor CustomSpan through getString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0007',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0007 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan005'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);

      let getCustomSpanInfo = await driver.findComponent(ON.id('getCustomSpanInfo'));
      await getCustomSpanInfo.click();
      await CommonFunc.sleep(500);
      let getString = await driver.findComponent(ON.id('getString'));
      let getStringText = await getString.getText();
      await CommonFunc.sleep(500);
      expect(getStringText).assertContain('getString: ');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0008
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0008
     * @tc.desc  : Through length (), obtain CustomSpan length test the RichEditor CustomSpan
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0008',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0008 START');
      let driver = Driver.create();
      let length = await driver.findComponent(ON.id('length'));
      let lengthText = await length.getText();
      await CommonFunc.sleep(500);
      expect(lengthText).assertContain('length:1');
      done();
    });

  })
}


