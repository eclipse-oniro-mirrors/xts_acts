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

export default function RichEditorLineMetrics021() {
  describe('RichEditorLineMetrics021', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineMetrics021 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics021',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineMetrics021 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics021" == pages.name)) {
          console.info("get RichEditorLineMetrics021 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics021 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics021 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0026
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0026
     * @tc.desc   Test RichEditor LineMetrics by calling getLineMetrics in onWillchanga and onDidChange text change callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0026',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0026 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineMetrics021'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);

      let lineMetricsWill = await driver.findComponent(ON.id('lineMetricsWill'));
      let lineMetricsWillText = await lineMetricsWill.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsWillText).assertContain('lineMetricsWill{"startIndex":0,"endIndex":2');

      let lineMetricsDid = await driver.findComponent(ON.id('lineMetricsDid'));
      let lineMetricsDidText = await lineMetricsDid.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsDidText).assertContain('lineMetricsDid:{"startIndex":0,"endIndex":2');
      done();
    });

  })
}


