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

export default function RichEditorLineMetrics013() {
  describe('RichEditorLineMetrics013', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineMetrics013 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics013',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineMetrics013 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics013" == pages.name)) {
          console.info("get RichEditorLineMetrics013 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics013 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics013 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0018
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0018
     * @tc.desc   Using getLineMetrics (0), the current line has no content and no preset Placeholder to test RichEditor LineMetrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0018',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0018 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineMetrics013'));
      let pointCenter = await rich.getBoundsCenter();

      let getFirst = await driver.findComponent(ON.id('getFirst'));
      await getFirst.click();
      await CommonFunc.sleep(500);

      let lineMetrics = await driver.findComponent(ON.id('lineMetrics'));
      let lineMetricsText = await lineMetrics.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsText).assertEqual('lineMetrics:undefined');
      done();
    });

  })
}


