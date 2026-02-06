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

export default function RichEditorLineBreakStrategy001() {
  describe('RichEditorLineBreakStrategy001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineBreakStrategy001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineBreakStrategy/RichEditorLineBreakStrategy001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineBreakStrategy001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineBreakStrategy001" == pages.name)) {
          console.info("get RichEditorLineBreakStrategy001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineBreakStrategy001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineBreakStrategy001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0001
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0001
     * @tc.desc  : Add textSpan without setting the lineBreakStrategy property to obtain the value of the lineBreakStrategy property for testing RichEditor LayoutStyle
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0001',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0001 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineBreakStrategy001'));
      let pointCenter = await rich.getBoundsCenter();

      let getAttr = await driver.findComponent(ON.id('getAttr'));
      await getAttr.click();
      await CommonFunc.sleep(500);

      let attributeValue = await driver.findComponent(ON.id('attributeValue'));
      let attributeValueText = await attributeValue.getText();
      await CommonFunc.sleep(500);
      expect(attributeValueText).assertEqual('linebreak attributeValue:GREEDY');
      done();
    });

  })
}


