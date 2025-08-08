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

export default function RichEditorTransformation004() {
  describe('RichEditorTransformation004', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorTransformation004 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorTransformation/RichEditorTransformation004',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorTransformation004 state pages: " + JSON.stringify(pages));
        if (!("RichEditorTransformation004" == pages.name)) {
          console.info("get RichEditorTransformation004 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorTransformation004 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorTransformation004 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_006
     * @tc.name  : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_006
     * @tc.desc  : Verify whether setTypingStyle takes effect after setting the zoom/pan/rotate attributes to test RichEditor AffineTransformation
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_006',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AffineTransformation_006 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorTransformation004'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('RichEditorTransformation004');
      let obj: ESObject = JSON.parse(strJson);
      await CommonFunc.sleep(1000);
      expect(JSON.stringify(obj.$attrs.fontColor)).assertContain('000000');
      expect(JSON.stringify(obj.$attrs.fontStyle)).assertEqual('"FontStyle.Normal"');
      let setTypingStyle = await driver.findComponent(ON.id('setTypingStyle'));
      await setTypingStyle.click();
      driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerKey(KeyCode.KEYCODE_F);
      await CommonFunc.sleep(500);
      let getTypingStyle = await driver.findComponent(ON.id('getTypingStyle'));
      await getTypingStyle.click();
      let textStyle = await driver.findComponent(ON.id('textStyle'));
      let textStyleText = await textStyle.getText();
      await CommonFunc.sleep(500);
      expect(textStyleText).assertContain('"fontColor":"#FF008000"');
      expect(textStyleText).assertContain('"fontFamily":"Arial"');
      expect(textStyleText).assertContain('"fontSize":40');
      expect(textStyleText).assertContain('"fontStyle":1');
      expect(textStyleText).assertContain('"fontWeight":12');
      expect(textStyleText).assertContain('"decoration":{"type":2,"color":"#80A91AF6"}');
      expect(textStyleText).assertContain('"fontFeature":""');
      done();
    });

  })
}


