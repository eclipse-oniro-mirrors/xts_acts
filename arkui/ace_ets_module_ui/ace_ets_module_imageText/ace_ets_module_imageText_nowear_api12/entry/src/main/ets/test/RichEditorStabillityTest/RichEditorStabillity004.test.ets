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

export default function RichEditorStabillity004() {
  describe('RichEditorStabillity004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorStabillity/RichEditorStabillity004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorStabillity004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorStabillity004" == pages.name)) {
          console.info("get RichEditorStabillity004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorStabillity004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorStabillity004 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0007
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0007
     * @tc.desc  : Test RichEditor Stability with Continuous Up and Down Bone Movement Text Content
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0007',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_STABILLITY_0007 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorStabillity004'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      await driver.drag(pointCenter.x + 50, pointCenter.y + 50, pointCenter.x + 50, pointCenter.y + 650, 600);
      await CommonFunc.sleep(1000);
      await driver.click(pointCenter.x + 50, pointCenter.y + 650);
      await CommonFunc.sleep(500);
      await driver.drag(pointCenter.x + 50, pointCenter.y + 650, pointCenter.x + 50, pointCenter.y + 50, 600);
      await CommonFunc.sleep(1000);
      done();
    });

  })
}


