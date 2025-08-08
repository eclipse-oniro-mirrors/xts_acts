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

export default function RichEditorCustomSpan004() {
  describe('RichEditorCustomSpan004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan004" == pages.name)) {
          console.info("get RichEditorCustomSpan004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan004 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0004
     * @tc.name  : Test the RichEditor CustomSpan
     * @tc.desc  : CustomSpan sets width = 80, height is not set to test the RichEditor CustomSpan
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 4
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0004', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0004 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan004'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);
      let getCustomSpanInfo = await driver.findComponent(ON.id('getCustomSpanInfo'));
      await getCustomSpanInfo.click();
      await CommonFunc.sleep(500);
      let customSpanInfo = await driver.findComponent(ON.id('customSpanInfo'));
      let customSpanInfoText = await customSpanInfo.getText();
      await CommonFunc.sleep(500);
      expect(customSpanInfoText).assertContain('"type_":"CustomSpan","width":80,"word":"Hello"');
      done();
    });

  })
}


