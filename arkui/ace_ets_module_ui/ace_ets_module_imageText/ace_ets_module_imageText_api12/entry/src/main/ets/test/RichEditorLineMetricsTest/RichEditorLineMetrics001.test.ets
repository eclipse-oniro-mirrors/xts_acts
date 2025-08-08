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

export default function RichEditorLineMetrics001() {
  describe('RichEditorLineMetrics001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorLineMetrics001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorLineMetrics/RichEditorLineMetrics001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorLineMetrics001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorLineMetrics001" == pages.name)) {
          console.info("get RichEditorLineMetrics001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorLineMetrics001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorLineMetrics001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0001
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0001
     * @tc.desc  : Test RichEditor LineMetrics by passing parameter 0 through getLineMetrics
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0001',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0001 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorLineMetrics001'));
      let pointCenter = await rich.getBoundsCenter();

      let getFirst = await driver.findComponent(ON.id('getFirst'));
      await getFirst.click();
      await CommonFunc.sleep(500);

      let lineMetrics = await driver.findComponent(ON.id('lineMetrics'));
      let lineMetricsText = await lineMetrics.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsText).assertContain('lineMetrics:{"startIndex":0,"endIndex":7');
      done();
    });


    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0006
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0006
     * @tc.desc  : By using getLineMetrics, the correct start and end indexes can be obtained for testing RichEditor LineMetrics
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0006',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0006 START');
      let driver = Driver.create();

      let getFirst = await driver.findComponent(ON.id('getFirst'));
      await getFirst.click();
      await CommonFunc.sleep(500);

      let lineMetricsIndex = await driver.findComponent(ON.id('lineMetricsIndex'));
      let lineMetricsIndexText = await lineMetricsIndex.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsIndexText).assertEqual('lineMetricsIndex:0,7');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0007
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0007
     * @tc.desc  : By using getLineMetrics, it is possible to obtain correct parameter information such as text ascending height and text descending height to test RichEditor LineMetrics
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0007',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEMETRICS_0007 START');
      let driver = Driver.create();

      let getFirst = await driver.findComponent(ON.id('getFirst'));
      await getFirst.click();
      await CommonFunc.sleep(500);

      let lineMetrics = await driver.findComponent(ON.id('lineMetrics'));
      let lineMetricsText = await lineMetrics.getText();
      await CommonFunc.sleep(500);
      expect(lineMetricsText).assertContain('ascent');
      expect(lineMetricsText).assertContain('descent');
      expect(lineMetricsText).assertContain('height');
      expect(lineMetricsText).assertContain('width');
      expect(lineMetricsText).assertContain('left');
      expect(lineMetricsText).assertContain('baseline');
      expect(lineMetricsText).assertContain('topHeight');
      expect(lineMetricsText).assertContain('runMetrics');
      done();
    });
  })
}


