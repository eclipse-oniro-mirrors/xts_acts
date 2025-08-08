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

export default function RichEditorGetNumber014() {
  describe('RichEditorGetNumber014', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorGetNumber014 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorGetNumber/RichEditorGetNumber014',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorGetNumber014 state pages: " + JSON.stringify(pages));
        if (!("RichEditorGetNumber014" == pages.name)) {
          console.info("get RichEditorGetNumber014 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorGetNumber014 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorGetNumber014 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GET_NUMBEROF_TEXT_LINES_0014
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GET_NUMBEROF_TEXT_LINES_0014
     * @tc.desc  : By adding symbols, imagespan,builderspan, Add a line break key to test RichEditor Text Line
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GET_NUMBEROF_TEXT_LINES_0014',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_GET_NUMBEROF_TEXT_LINES_0014 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorGetNumber014'));
      let pointCenter = await rich.getBoundsCenter();
      let getLineCount = await driver.findComponent(ON.id('getLineCount'));
      await getLineCount.click();
      await CommonFunc.sleep(500);
      let lineCount = await driver.findComponent(ON.id('lineCount'));
      let lineCountText = await lineCount.getText();
      expect(lineCountText).assertContain('lineCount:10');
      done();
    });

  })
}


