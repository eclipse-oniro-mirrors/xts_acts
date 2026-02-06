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

export default function RichEditorLineMetrics023() {
  describe('RichEditorLineMetrics023', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineMetrics023 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics023',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineMetrics023 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics023" == pages.name)) {
          console.info("get RichEditorLineMetrics023 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics023 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics023 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0028
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0028
     * @tc.desc  : Test RichEditor LineMetrics by calling getLineMetrics in onCut and onPaste text change callbacks
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0028',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0028 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineMetrics023'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let select = await driver.findComponent(ON.id('select'));
      await select.click();
      await CommonFunc.sleep(500);

      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(500);

      let set_end = await driver.findComponent(ON.id('set_end'));
      await set_end.click();
      await CommonFunc.sleep(500);

      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);

      let lineMetricsOnCut = await driver.findComponent(ON.id('lineMetricsOnCut'));
      let lineMetricsOnCutText = await lineMetricsOnCut.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsOnCutText).assertContain('"startIndex":0,"endIndex":6');

      let lineMetricsOnPaste = await driver.findComponent(ON.id('lineMetricsOnPaste'));
      let lineMetricsOnPasteText = await lineMetricsOnPaste.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsOnPasteText).assertContain('"startIndex":0,"endIndex":5');
      done();
    });

  })
}


