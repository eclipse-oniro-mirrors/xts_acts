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

export default function RichEditorOnWillChange003() {
  describe('RichEditorOnWillChange003', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnWillChange003 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange003',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnWillChange003 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange003" == pages.name)) {
          console.info("get RichEditorOnWillChange003 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnWillChange003 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange003 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0003
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0003
     * @tc.desc   The return value of onWillchange is false. Click on Add Text Span to add characters to test RichEditor OnSelectionChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0003',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0003 START');
      let driver = Driver.create();
      await driver.findComponent(ON.id('rich_struct'));
      await CommonFunc.sleep(500);

      let add_text = await driver.findComponent(ON.id('add_text'));
      await add_text.click();
      await CommonFunc.sleep(500);
      let onWillChange = await driver.findComponent(ON.id('onWillChange_callback'));
      let onWillText = await onWillChange.getText();

      let replacedSpans_callback = await driver.findComponent(ON.id('replacedSpans_callback'));
      let replaceText = await replacedSpans_callback.getText();

      let onDidChange = await driver.findComponent(ON.id('onDidChange_callback'));
      let didText = await onDidChange.getText();
      await CommonFunc.sleep(500);
      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(replaceText).assertEqual('replacedSpans_callback:true');
      expect(didText).assertEqual('onDidChange_callback:false');

      done();
    });

  })
}


