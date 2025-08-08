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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
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

export default function RichEditorInterFace001() {
  describe('RichEditorInterFace001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorInterFace001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomColors/RichEditorInterFace001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorInterFace001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorInterFace001" == pages.name)) {
          console.info("get RichEditorInterFace001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorInterFace001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorInterFace001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1450
     * @tc.name  : Test the RichEditor interface callback
     * @tc.desc  : bindSelectionMenu Set parameter test RichEditor interface callback
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1450', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_1450 START');
      let driver = Driver.create();

      let richEditor = await driver.findComponent(ON.id('RichEditorInterFace001'));
      let pointCenter = await richEditor.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let select1 = await driver.findComponent(ON.id('select1'))
      await select1?.click()
      await CommonFunc.sleep(500);

      let copy = await driver.findComponent(ON.text('复制'))
      await copy?.click()
      await CommonFunc.sleep(500);

      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);

      let select2 = await driver.findComponent(ON.id('select2'))
      await select2?.click()
      await CommonFunc.sleep(500);

      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);

      let onAppearCall = await driver.findComponent(ON.id('onAppearCall'));
      let onAppearCallText = await onAppearCall.getText();
      await CommonFunc.sleep(500);
      expect(onAppearCallText).assertContain('onAppearCall');

      let disAppearCall = await driver.findComponent(ON.id('disAppearCall'));
      let disAppearCallText = await disAppearCall.getText();
      await CommonFunc.sleep(500);
      expect(disAppearCallText).assertContain('disAppearCall');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_PC_MENU_0080
     * @tc.name  : Test the RichEditor menu
     * @tc.desc  : Add advanced component SelectionMenu, and set the callback and builder to test the RichEditor menu
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_PC_MENU_0080', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_PC_MENU_0080 START');
      let driver = Driver.create();

      let richEditor = await driver.findComponent(ON.id('RichEditorInterFace001'));
      let pointCenter = await richEditor.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      let addSpan = await driver.findComponent(ON.id('addSpan'))
      await addSpan?.click()
      await CommonFunc.sleep(500);
      let select1 = await driver.findComponent(ON.id('select1'))
      await select1?.click()
      await CommonFunc.sleep(500);
      let copy = await driver.findComponent(ON.text('复制'))
      await copy?.click()
      await CommonFunc.sleep(500);
      let select3 = await driver.findComponent(ON.id('select3'))
      await select3?.click()
      await CommonFunc.sleep(500);
      let onAppearCall = await driver.findComponent(ON.id('onAppearCall'));
      let onAppearCallText = await onAppearCall.getText();
      await CommonFunc.sleep(500);
      expect(onAppearCallText).assertContain('onAppearCall');
      let disAppearCall = await driver.findComponent(ON.id('disAppearCall'));
      let disAppearCallText = await disAppearCall.getText();
      await CommonFunc.sleep(500);
      expect(disAppearCallText).assertContain('disAppearCall');
      done();
    });

  })
}


