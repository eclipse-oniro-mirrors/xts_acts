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

export default function RichEditorAttributeStrings002() {
  describe('RichEditorAttributeStrings002', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorAttributeStrings002 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorAttributeStrings/RichEditorAttributeStrings002',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorAttributeStrings002 state pages: " + JSON.stringify(pages));
        if (!("RichEditorAttributeStrings002" == pages.name)) {
          console.info("get RichEditorAttributeStrings002 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorAttributeStrings002 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorAttributeStrings002 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0006
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0006
     * @tc.desc   String attribute string to each other from the two attribute string components to test the RichEditor property string display result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0006',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_COPY_PASTE_ATTRIBUTE_STRINGS_0006 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorAttributeStrings002'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_X);
      await CommonFunc.sleep(500);
      let richOther = await driver.findComponent(ON.id('RichEditorAttributeStrings002_1'));
      let getBoundsOther = await richOther.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBoundsOther.x, getBoundsOther.y );
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      let getOtherStyles = await driver.findComponent(ON.id('getOtherStyles'));
      await getOtherStyles.click();
      await CommonFunc.sleep(500);
      let styledString = await driver.findComponent(ON.id('StyledString'));
      let styledStringText = await styledString.getText();
      await CommonFunc.sleep(500);
      expect(styledStringText).assertContain('StyledString:helloabcd');
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      let getStyles = await driver.findComponent(ON.id('getStyles'));
      await getStyles.click();
      await CommonFunc.sleep(500);
      styledStringText = await styledString.getText();
      await CommonFunc.sleep(500);
      expect(styledStringText).assertContain('StyledString:helloabcd');
      done();
    });

  })
}


