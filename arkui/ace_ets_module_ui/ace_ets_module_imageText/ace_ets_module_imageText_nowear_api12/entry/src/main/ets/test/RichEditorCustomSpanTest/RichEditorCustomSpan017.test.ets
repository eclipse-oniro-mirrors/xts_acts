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

export default function RichEditorCustomSpan017() {
  describe('RichEditorCustomSpan017', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan017 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan017',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan017 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan017" == pages.name)) {
          console.info("get RichEditorCustomSpan017 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan017 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan017 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0027
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0027
     * @tc.desc  : Test RichEditor Custom Span by binding long press events with Custom Span
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0027',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0027 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan017'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 200, getBounds.top + 30);
      await CommonFunc.sleep(500);
      let addCustom = await driver.findComponent(ON.id('addCustom'));
      await addCustom.click();
      await CommonFunc.sleep(500);
      await addCustom.click();
      await CommonFunc.sleep(500);
      let imageTop = await driver.findComponent(ON.id('imageTop'));
      await imageTop.click();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 200, getBounds.top + 50);
      await CommonFunc.sleep(500);
      let onClickFlag = await driver.findComponent(ON.id('onClickFlag'));
      let onClickFlagText = await onClickFlag.getText();
      await CommonFunc.sleep(500);
      expect(onClickFlagText).assertContain('onClickFlag:true');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0028
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0028
     * @tc.desc  : Test RichEditor Custom Span by binding click events with Custom Span
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0028',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0028 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan017'));
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


