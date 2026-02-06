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

export default function RichEditorUxConFormance006() {
  describe('RichEditorUxConFormance006', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorUxConFormance006 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorUxConFormance/RichEditorUxConFormance006',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorUxConFormance006 state pages: " + JSON.stringify(pages));
        if (!("RichEditorUxConFormance006" == pages.name)) {
          console.info("get RichEditorUxConFormance006 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorUxConFormance006 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorUxConFormance006 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0010
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0010
     * @tc.desc   Validate paragraph attributes to test RichEditor UXConformance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_UXCONFORMANCE_0010 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorUxConFormance006'));
      let pointCenter = await rich.getBoundsCenter();

      let getParagraphStyle = await driver.findComponent(ON.id('getParagraphStyle'));
      await getParagraphStyle.click();
      await CommonFunc.sleep(1000);

      let paragraphStyleInfo = await driver.findComponent(ON.id('paragraphStyleInfo'));
      let paragraphStyleInfoText = await paragraphStyleInfo.getText();
      await CommonFunc.sleep(500);
      let str = '"style":{"textAlign":0,"wordBreak":2,"lineBreakStrategy":0,"leadingMargin":{"size":["0.00px","0.00px"]}}';
      expect(paragraphStyleInfoText.indexOf(str) > 0).assertEqual(true);
      done();
    });

  })
}


