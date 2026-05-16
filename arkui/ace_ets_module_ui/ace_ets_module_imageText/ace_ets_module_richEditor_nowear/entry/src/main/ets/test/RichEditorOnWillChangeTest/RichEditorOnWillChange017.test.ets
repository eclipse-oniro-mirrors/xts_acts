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

export default function RichEditorOnWillChange017() {
  describe('RichEditorOnWillChange017', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnWillChange017 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange017',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnWillChange017 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange017" == pages.name)) {
          console.info("get RichEditorOnWillChange017 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnWillChange017 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange017 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0017
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0017
     * @tc.desc   Test RichEditor on WillChange callback by adding multiple spans with line breaks and splitting to occupy AddTextCpan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0017',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0017 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let add_text_span = await driver.findComponent(ON.id('add_text_span'));
      await add_text_span.click();
      await CommonFunc.sleep(500);

      let onDidChange_rangeBefore = await driver.findComponent(ON.id('onDidChange_rangeBefore'));
      let onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      expect(onDidBefore).assertEqual('onDidChange rangeBefore:{"start":3,"end":3}');

      let ondid_rangeAfter = await driver.findComponent(ON.id('ondid_rangeAfter'));
      let ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter).assertEqual('ondid rangeAfter:{"start":3,"end":11}');

      let replacedSpansCallback = await driver.findComponent(ON.id('replacedSpansCallback'));
      let replaceCall = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);
      expect(replaceCall).assertEqual('replacedSpans Callback:"03"');


      done();
    });

  })
}


