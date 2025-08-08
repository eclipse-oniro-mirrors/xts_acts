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

export default function RichEditorUxConFormance001() {
  describe('RichEditorUxConFormance001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorUxConFormance001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorUxConFormance/RichEditorUxConFormance001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorUxConFormance001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorUxConFormance001" == pages.name)) {
          console.info("get RichEditorUxConFormance001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorUxConFormance001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorUxConFormance001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0004
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0004
     * @tc.desc  : Do not set fonts, use decorative line colors to test RichEditor UXConformance
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0004',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0004 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorUxConFormance001'));
      let pointCenter = await rich.getBoundsCenter();

      let updateSpanStyle = await driver.findComponent(ON.id('updateSpanStyle'));
      await updateSpanStyle.click();
      await CommonFunc.sleep(1000);

      let get_spans = await driver.findComponent(ON.id('get_spans'));
      await get_spans.click();
      await CommonFunc.sleep(1000);

      let colorInfo = await driver.findComponent(ON.id('colorInfo'));
      let colorInfoText = await colorInfo.getText();
      await CommonFunc.sleep(500);
      expect(colorInfoText.indexOf('"fontColor":') > 0).assertEqual(true);
      expect(colorInfoText.indexOf('"decoration":{"type":2,"color":') > 0).assertEqual(true);
      done();
    });

  })
}


