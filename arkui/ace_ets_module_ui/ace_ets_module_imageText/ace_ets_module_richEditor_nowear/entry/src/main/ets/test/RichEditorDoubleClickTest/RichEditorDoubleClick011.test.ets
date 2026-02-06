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
import { uiAppearance } from '@kit.ArkUI'
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


export default function RichEditorDoubleClick011() {
  describe('RichEditorDoubleClick011', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorDoubleClick/RichEditorDoubleClick011',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorDoubleClick011 state pages: " + JSON.stringify(pages));
        if (!("RichEditorDoubleClick011" == pages.name)) {
          console.info("get RichEditorDoubleClick011 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorDoubleClick011 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorDoubleClick011 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_016
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_016
     * @tc.desc   Test the RichEditor doubleClick event by setting different typineStyle for some text in the component and double clicking the text content inside the component with the mouse
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_016',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_016 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorDoubleClick011'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 30, getBounds.top + 20);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      await driver.click(getBounds.left + 340, getBounds.top + 20);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 340, getBounds.top + 20);
      await CommonFunc.sleep(100);
      messageText = await message.getText();
      await CommonFunc.sleep(1000);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_019
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_019
     * @tc.desc   Test RichEditor doubleClick event by double clicking to trigger onSelect and onSelectionChange events
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_019',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_doubleclick_019 START');
      let driver = Driver.create();
      let onSelectionChangeCall = await driver.findComponent(ON.id('onSelectionChangeCall'));
      let onSelectionChangeCallText = await onSelectionChangeCall.getText();
      await CommonFunc.sleep(1000);
      expect(onSelectionChangeCallText).assertContain('onSelectionChangeCall:true');
      let onSelectCall = await driver.findComponent(ON.id('onSelectCall'));
      let onSelectCallText = await onSelectCall.getText();
      await CommonFunc.sleep(1000);
      expect(onSelectCallText).assertContain('onSelectCall:true');
      done();
    });
    
  })
}


