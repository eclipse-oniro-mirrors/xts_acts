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


export default function RichEditorThreeStrikes005() {
  describe('RichEditorThreeStrikes005', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditor beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorThreeStrikes/RichEditorThreeStrikes005',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorThreeStrikes005 state pages: " + JSON.stringify(pages));
        if (!("RichEditorThreeStrikes005" == pages.name)) {
          console.info("get RichEditorThreeStrikes005 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorThreeStrikes005 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorThreeStrikes005 page error: " + err);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0013
     * @tc.name  : Test the RichEditor ThreeStrikes
     * @tc.desc  : Three click support for onSolutionChange callback to test RichEditor ThreeStripes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0013',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0013 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorThreeStrikes005'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 50, getBounds.top + 20);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      await driver.click(getBounds.left + 110, getBounds.top + 20);
      await CommonFunc.sleep(100);
      let message = await driver.findComponent(ON.id('message'));
      let messageText = await message.getText();
      await CommonFunc.sleep(500);
      expect(messageText).assertContain('"start"');
      expect(messageText).assertContain('"end"');
      let onSelectionChangeCall = await driver.findComponent(ON.id('onSelectionChangeCall'));
      let onSelectionChangeCallText = await onSelectionChangeCall.getText();
      await CommonFunc.sleep(500);
      expect(onSelectionChangeCallText).assertContain('onSelectionChangeCall:true');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0014
     * @tc.name  : Test the RichEditor ThreeStrikes
     * @tc.desc  : Three click support for onSelect callback to test RichEditor ThreeStripes
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0014',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_THREESTRIKES_0014 START');
      let driver = Driver.create();
      let onSelectCall = await driver.findComponent(ON.id('onSelectCall'));
      let onSelectCallText = await onSelectCall.getText();
      await CommonFunc.sleep(500);
      expect(onSelectCallText).assertContain('onSelectCall:true');
      done();
    });
    
  })
}


