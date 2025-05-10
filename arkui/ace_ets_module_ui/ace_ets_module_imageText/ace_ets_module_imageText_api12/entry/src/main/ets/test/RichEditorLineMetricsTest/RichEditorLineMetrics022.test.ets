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

export default function RichEditorLineMetrics022() {
  describe('RichEditorLineMetrics022', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineMetrics022 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics022',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineMetrics022 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics022" == pages.name)) {
          console.info("get RichEditorLineMetrics022 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics022 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics022 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0027
     * @tc.name  : Test the RichEditor LineMetrics
     * @tc.desc  : Test RichEditor LineMetrics by calling getLineMetrics in onIMEInputConplete and onDeleteConplete text change callbacks
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0027', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0027 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineMetrics022'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);

      let lineMetricsImeInput = await driver.findComponent(ON.id('lineMetricsImeInput'));
      let lineMetricsImeInputText = await lineMetricsImeInput.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsImeInputText).assertContain('{"startIndex":0,"endIndex":2');

      driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);

      let lineMetricsOnDelete = await driver.findComponent(ON.id('lineMetricsOnDelete'));
      let lineMetricsOnDeleteText = await lineMetricsOnDelete.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsOnDeleteText).assertContain('{"startIndex":0,"endIndex":3');
      done();
    });

  })
}


