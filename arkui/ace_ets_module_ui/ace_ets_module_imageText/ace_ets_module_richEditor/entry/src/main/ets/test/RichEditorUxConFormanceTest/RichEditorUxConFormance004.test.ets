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

export default function RichEditorUxConFormance004() {
  describe('RichEditorUxConFormance004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorUxConFormance004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorUxConFormance/RichEditorUxConFormance004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorUxConFormance004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorUxConFormance004" == pages.name)) {
          console.info("get RichEditorUxConFormance004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorUxConFormance004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorUxConFormance004 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0005
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0005
     * @tc.desc   Set font color, do not set decorative line color to test RichEditor UXConformance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0005',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0005 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorUxConFormance004'));
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
      expect(colorInfoText.indexOf('"fontColor":"#FFFF0000"') > 0).assertEqual(true);
      expect(colorInfoText.indexOf('"decoration":{"type":2,"color":"#FFFF0000"') > 0).assertEqual(true);
      done();
    });

  })
}


