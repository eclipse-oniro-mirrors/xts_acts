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

export default function RichEditorSetStyledString018() {
  describe('RichEditorSetStyledString018', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorSetStyledString018 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorSetStyledString/RichEditorSetStyledString018',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorSetStyledString018 state pages: " + JSON.stringify(pages));
        if (!("RichEditorSetStyledString018" == pages.name)) {
          console.info("get RichEditorSetStyledString018 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorSetStyledString018 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorSetStyledString018 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Validate the textShadow attribute of the attribute string to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorSetStyledString018'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y);
      await CommonFunc.sleep(1000);
      let get_style = await driver.findComponent(ON.id('get_style'));
      await get_style.click();
      await CommonFunc.sleep(500);
      let shadowValues = await driver.findComponent(ON.id('shadowValues'));
      let shadowValuesText = await shadowValues.getText();
      await CommonFunc.sleep(500);
      expect(shadowValuesText).assertContain('shadowValues:{"radius":5,"offsetX":10,"offsetY":-10,"color":"#FFFFFF00","type":0}');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0059
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Validate the baselineOffset attribute of the attribute string to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 2
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0059', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0059 START');
      let driver = Driver.create();
      let baseLineStr = await driver.findComponent(ON.id('baseLineStr'));
      let baseLineStrText = await baseLineStr.getText();
      await CommonFunc.sleep(500);
      expect(baseLineStrText).assertContain('baseLineStr:20');
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0061
     * @tc.name  : Test the RichEditor setStyledString
     * @tc.desc  : Validate the backgroundColor attribute of the attribute string to test RichEditor setStyledString
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0061', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0061 START');
      let strJson1 = getInspectorByKey('RichEditorSetStyledString018');
      let obj1: ESObject = JSON.parse(strJson1);
      await CommonFunc.sleep(1000);
      expect(JSON.stringify(obj1.$attrs.backgroundColor)).assertEqual('"#FFFF0000"');
      done();
    });

  })
}


