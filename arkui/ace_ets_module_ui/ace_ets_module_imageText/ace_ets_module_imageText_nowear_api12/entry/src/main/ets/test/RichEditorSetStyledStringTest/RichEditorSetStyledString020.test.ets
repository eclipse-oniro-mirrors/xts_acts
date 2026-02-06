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

export default function RichEditorSetStyledString020() {
  describe('RichEditorSetStyledString020', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString020 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString020',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString020 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString020" == pages.name)) {
          console.info("get RichEditorSetStyledString020 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString020 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString020 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000116
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000116
     * @tc.desc  : Verify the effect of the attribute string setting after clicking on the image gesture event to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000116',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000116 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString020'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 200, getBounds.top + 30);
      await CommonFunc.sleep(500);
      let imageTop = await driver.findComponent(ON.id('imageTop'));
      await imageTop.click();
      await CommonFunc.sleep(500);
      await imageTop.click();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 210, getBounds.top + 40);
      await CommonFunc.sleep(500);
      let onClickFlag = await driver.findComponent(ON.id('onClickFlag'));
      let onClickFlagText = await onClickFlag.getText();
      await CommonFunc.sleep(500);
      expect(onClickFlagText).assertContain('onClickFlag:true');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000117
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000117
     * @tc.desc  : Verify the effect of the attribute string setting after long pressing the image gesture event to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000117',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledStrin_000117 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString020'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.longClick(getBounds.left + 180, getBounds.top + 40);
      await CommonFunc.sleep(100);
      let onLongPressFlag = await driver.findComponent(ON.id('onLongPressFlag'));
      let onLongPressFlagText = await onLongPressFlag.getText();
      await CommonFunc.sleep(500);
      expect(onLongPressFlagText).assertContain('onLongPressFlag:true');
      done();
    });

  })
}


