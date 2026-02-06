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

export default function RichEditorLineMetrics010() {
  describe('RichEditorLineMetrics010', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineMetrics010 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics010',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineMetrics010 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics010" == pages.name)) {
          console.info("get RichEditorLineMetrics010 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics010 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics010 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0015
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0015
     * @tc.desc   Test RichEditor LineMetrics by adding content to make the component have a scrollbar and the first line is not within the display range of the page using getLineMetrics (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0015',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0015 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineMetrics010'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);
      await driver.drag(pointCenter.x, pointCenter.y, pointCenter.x, pointCenter.y + 100, 600);
      await CommonFunc.sleep(1000);
      let getFirst = await driver.findComponent(ON.id('getFirst'));
      await getFirst.click();
      await CommonFunc.sleep(500);

      let topHeight = await driver.findComponent(ON.id('topHeight'));
      let topHeightText = await topHeight.getText();
      await CommonFunc.sleep(500);
      expect(isNaN(parseInt(topHeightText))).assertFalse();
      let baseLine = await driver.findComponent(ON.id('baseLine'));
      let baseLineText = await baseLine.getText();
      await CommonFunc.sleep(500);
      expect(isNaN(parseInt(baseLineText))).assertFalse();
      done();
    });

  })
}


