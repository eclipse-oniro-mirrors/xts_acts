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

export default function RichEditorStabillity005() {
  describe('RichEditorStabillity005', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorStabillity/RichEditorStabillity005',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStabillity005 state pages: " + JSON.stringify(pages));
        if (!("RichEditorStabillity005" == pages.name)) {
          console.info("get RichEditorStabillity005 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorStabillity005 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStabillity005 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handleoptimization_0004
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handleoptimization_0004
     * @tc.desc  : There is a lot of content in builderspan, and a scrollbar appears to test RichEditor handleOptimization
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handleoptimization_0004',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_handleoptimization_0004 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorStabillity005'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let getPosition = await driver.findComponent(ON.id('getPosition'));
      await getPosition.click();
      await CommonFunc.sleep(500);
      let pointPosition = await driver.findComponent(ON.id('pointPosition'));
      let pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(500);
      expect(pointPositionText).assertLarger(0);
      await driver.drag(pointCenter.x + 50, pointCenter.y + 50, pointCenter.x + 50, pointCenter.y + 650, 600);
      await CommonFunc.sleep(1000);
      await driver.click(pointCenter.x + 50, pointCenter.y + 650);
      await CommonFunc.sleep(500);
      await getPosition.click();
      await CommonFunc.sleep(500);
      pointPositionText = await pointPosition.getText();
      await CommonFunc.sleep(500);
      expect(pointPositionText).assertLarger(0);
      done();
    });

  })
}


