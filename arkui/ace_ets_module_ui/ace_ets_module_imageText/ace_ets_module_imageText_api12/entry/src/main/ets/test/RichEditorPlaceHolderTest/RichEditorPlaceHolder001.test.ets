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

export default function RichEditorPlaceHolder001() {
  describe('RichEditorPlaceHolder001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorPlaceHolder001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorPlaceHolder/RichEditorPlaceHolder001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorPlaceHolder001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorPlaceHolder001" == pages.name)) {
          console.info("get RichEditorPlaceHolder001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorPlaceHolder001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorPlaceHolder001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PLACEHOLDER_0022
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PLACEHOLDER_0022
     * @tc.desc  : Set the font size of the placeholder to test RichEditor PlaceHolder
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PLACEHOLDER_0022',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PLACEHOLDER_0022 START');
      let driver = Driver.create();
      await driver.findComponent(ON.id('rich_struct'));

      let holderFontSize = await driver.findComponent(ON.id('holderFontSize'));
      let holderFontSizeText = await holderFontSize.getText();
      await CommonFunc.sleep(500);
      expect(holderFontSizeText).assertEqual('holderFontSize:10');
      done();
    });

  })
}


