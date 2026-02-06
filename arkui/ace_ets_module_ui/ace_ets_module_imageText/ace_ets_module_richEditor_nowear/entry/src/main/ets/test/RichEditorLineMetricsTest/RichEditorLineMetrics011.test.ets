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

export default function RichEditorLineMetrics011() {
  describe('RichEditorLineMetrics011', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineMetrics011 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics011',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineMetrics011 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics011" == pages.name)) {
          console.info("get RichEditorLineMetrics011 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics011 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics011 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0016
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0016
     * @tc.desc   Complete input and deletion, call getLineMetrics+getlinecount to test RichEditor LineMetrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0016',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0016 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineMetrics011'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);
      let getFirst = await driver.findComponent(ON.id('getFirst'));
      await getFirst.click();
      await CommonFunc.sleep(500);
      let lineCount = await driver.findComponent(ON.id('lineCount'));
      let lineMetrics1Text = await lineCount.getText();
      expect(lineMetrics1Text).assertContain('lineCount:2');
      await CommonFunc.sleep(500);
      let lineMetrics2 = await driver.findComponent(ON.id('lineMetrics2'));
      let lineMetrics2Text = await lineMetrics2.getText();
      await CommonFunc.sleep(500);
      expect(lineMetrics2Text).assertContain('lineMetrics(1):{"startIndex"');
      expect(lineMetrics2Text).assertContain('"endIndex"');
      driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);
      await getFirst.click();
      await CommonFunc.sleep(500);
      lineMetrics1Text = await lineCount.getText();
      expect(lineMetrics1Text).assertContain('lineCount:1');
      await CommonFunc.sleep(500);
      lineMetrics2Text = await lineMetrics2.getText();
      await CommonFunc.sleep(500);
      expect(lineMetrics2Text).assertEqual('lineMetrics(1):undefined');
      done();
    });

  })
}


