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

export default function RichEditorQueryLayout010() {
  describe('RichEditorQueryLayout011', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorQueryLayout011 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorQueryLayout/RichEditorQueryLayout011',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorQueryLayout011 state pages: " + JSON.stringify(pages));
        if (!("RichEditorQueryLayout011" == pages.name)) {
          console.info("get RichEditorQueryLayout011 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorQueryLayout011 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorQueryLayout011 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0008
     * @tc.name  : Test the RichEditor query for paragraphStyle and layoutStyle
     * @tc.desc  : The leadindMargin property in paragraphStyle is of the LeadinglargenFlaceholder size type to test the RichEditor query for paragraphStyle and layoutStyle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0008', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_QUERYLAYOUTPARAGRAPHSTYLE_0008 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let get_content = await driver.findComponent(ON.id('get_content'));
      await get_content.click();
      await CommonFunc.sleep(1000);

      let style = await driver.findComponent(ON.id('style'));
      let styleText = await style.getText();
      await CommonFunc.sleep(500);
      expect(styleText.indexOf('{"textAlign":0,"leadingMargin":["0.00px","0.00px"]') > 0).assertEqual(true);
      done();
    });

  })
}


