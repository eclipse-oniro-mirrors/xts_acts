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

export default function RichEditorLineMetrics008() {
  describe('RichEditorLineMetrics008', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineMetrics008 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics008',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineMetrics008 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics008" == pages.name)) {
          console.info("get RichEditorLineMetrics008 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics008 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics008 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0013
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0013
     * @tc.desc  : By using getLineMetries (0), only add textspan to fill one line, and preset textspan properties (lineHeight, letterSpan) to test RichEditor LineMetrics
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 4
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0013',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0013 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineMetrics008'));
      let pointCenter = await rich.getBoundsCenter();

      let getFirst = await driver.findComponent(ON.id('getFirst'));
      await getFirst.click();
      await CommonFunc.sleep(500);

      let getHeight = await driver.findComponent(ON.id('getHeight'));
      let getHeightText = await getHeight.getText();
      await CommonFunc.sleep(500);
      expect(getHeightText).assertContain('getHeight:30');
      done();
    });

  })
}


