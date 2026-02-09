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

export default function RichEditorLineBreakStrategy002() {
  describe('RichEditorLineBreakStrategy002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineBreakStrategy002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineBreakStrategy/RichEditorLineBreakStrategy002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineBreakStrategy002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineBreakStrategy002" == pages.name)) {
          console.info("get RichEditorLineBreakStrategy002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineBreakStrategy002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineBreakStrategy002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0002
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0002
     * @tc.desc   Add textSpan and set LineBreakStrategy to BALANCED to obtain the LineBreakStrategy attribute value for testing RichEditor LayoutStyle
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0002',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0002 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineBreakStrategy002'));
      let pointCenter = await rich.getBoundsCenter();

      let getAttr = await driver.findComponent(ON.id('getAttr'));
      await getAttr.click();
      await CommonFunc.sleep(500);

      let attributeValue = await driver.findComponent(ON.id('attributeValue'));
      let attributeValueText = await attributeValue.getText();
      await CommonFunc.sleep(500);
      expect(attributeValueText).assertEqual('linebreak attributeValue:BALANCED');
      done();
    });

  })
}


