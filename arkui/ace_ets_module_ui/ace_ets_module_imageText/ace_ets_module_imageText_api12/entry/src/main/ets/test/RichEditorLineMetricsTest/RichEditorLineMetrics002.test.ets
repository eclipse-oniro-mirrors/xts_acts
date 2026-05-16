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

export default function RichEditorLineMetrics002() {
  describe('RichEditorLineMetrics002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineMetrics002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineMetrics002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics002" == pages.name)) {
          console.info("get RichEditorLineMetrics002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorLineMetrics002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0002
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0002
     * @tc.desc   Test RichEditor LineMetrics by passing parameter 1000 through getLineMetrics
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0002',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0002 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineMetrics002'));
      let pointCenter = await rich.getBoundsCenter();

      let getLineMetrics = await driver.findComponent(ON.id('getLineMetrics'));
      await getLineMetrics.click();
      await CommonFunc.sleep(500);
      let lineMetrics = await driver.findComponent(ON.id('lineMetrics'));
      let lineMetricsText = await lineMetrics.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsText).assertEqual('lineMetrics:undefined');
      done();
    });

  })
}


