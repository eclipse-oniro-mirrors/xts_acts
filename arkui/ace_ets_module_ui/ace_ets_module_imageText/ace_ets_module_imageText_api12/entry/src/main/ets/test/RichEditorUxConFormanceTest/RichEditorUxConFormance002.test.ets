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

export default function RichEditorUxConFormance002() {
  describe('RichEditorUxConFormance002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorUxConFormance002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorUxConFormance/RichEditorUxConFormance002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorUxConFormance002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorUxConFormance002" == pages.name)) {
          console.info("get RichEditorUxConFormance002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorUxConFormance002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorUxConFormance002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0001
     * @tc.name  : Test the RichEditor UXConformance
     * @tc.desc  : Do not set font size to test RichEditor UXConformance
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0001', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0001 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorUxConFormance002'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let get_spans = await driver.findComponent(ON.id('get_spans'));
      await get_spans.click();
      await CommonFunc.sleep(1000);

      let spanInfo = await driver.findComponent(ON.id('spanInfo'));
      let spanInfoText = await spanInfo.getText();
      await CommonFunc.sleep(500);
      expect(spanInfoText.indexOf('"fontSize":16') > 0).assertEqual(true);
      done();
    });

  })
}


