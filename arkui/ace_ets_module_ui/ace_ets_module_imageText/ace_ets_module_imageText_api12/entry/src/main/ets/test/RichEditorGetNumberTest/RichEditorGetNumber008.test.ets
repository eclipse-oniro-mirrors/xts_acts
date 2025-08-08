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

export default function RichEditorGetNumber008() {
  describe('RichEditorGetNumber008', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorGetNumber008 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorGetNumber/RichEditorGetNumber008',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorGetNumber008 state pages: " + JSON.stringify(pages));
        if (!("RichEditorGetNumber008" == pages.name)) {
          console.info("get RichEditorGetNumber008 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorGetNumber008 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorGetNumber008 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GET_NUMBEROF_TEXT_LINES_0008
     * @tc.name  : Test the RichEditor Text Line
     * @tc.desc  : Test RichEditor Text Line by obtaining the number of text lines of the attribute string
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GET_NUMBEROF_TEXT_LINES_0008', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GET_NUMBEROF_TEXT_LINES_0008 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorGetNumber008'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let getLineCount = await driver.findComponent(ON.id('getLineCount'));
      await getLineCount.click();
      await CommonFunc.sleep(500);

      let lineCount = await driver.findComponent(ON.id('lineCount'));
      let lineCountText = await lineCount.getText();
      expect(lineCountText).assertContain('lineCount:1');

      done();
    });

  })
}


