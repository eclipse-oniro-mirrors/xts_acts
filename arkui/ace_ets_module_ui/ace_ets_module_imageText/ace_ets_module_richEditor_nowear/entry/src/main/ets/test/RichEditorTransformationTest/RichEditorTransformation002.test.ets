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

export default function RichEditorTransformation002() {
  describe('RichEditorTransformation002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTransformation002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorTransformation/RichEditorTransformation002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTransformation002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorTransformation002" == pages.name)) {
          console.info("get RichEditorTransformation002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorTransformation002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTransformation002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_003
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_003
     * @tc.desc   Set a single handle test with counterclockwise rotation to test RichEditor AffineTransformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_003',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_003 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorTransformation002'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let selectAll = await driver.findComponent(ON.text('全选'))
      await selectAll?.click();
      await CommonFunc.sleep(500);
      expect(selectAll instanceof Component).assertEqual(true);
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_004
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_004
     * @tc.desc   Set up counterclockwise rotation of the dual handle test to test RichEditor AffineTransformation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_004',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_004 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorTransformation002'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);

      let selectAll = await driver.findComponent(ON.text('全选'))
      await selectAll?.click();
      await CommonFunc.sleep(500);
      expect(selectAll instanceof Component).assertEqual(true);
      done();
    });

  })
}


