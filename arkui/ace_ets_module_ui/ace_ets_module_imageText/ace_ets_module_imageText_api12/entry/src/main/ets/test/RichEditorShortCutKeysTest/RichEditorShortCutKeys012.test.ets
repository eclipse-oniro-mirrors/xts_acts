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
import Utils from '../../MainAbility/common/Utils';

export default function RichEditorShortCutKeys012() {
  describe('RichEditorShortCutKeys012', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorShortCutKeys012 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorShortCutKeys/RichEditorShortCutKeys012',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorShortCutKeys012 state pages: " + JSON.stringify(pages));
        if (!("RichEditorShortCutKeys012" == pages.name)) {
          console.info("get RichEditorShortCutKeys012 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorShortCutKeys012 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorShortCutKeys012 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number: SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0019
     * @tc.name  : Test the RichEditor shortCutKeys
     * @tc.desc  : CTRL+I does not affect other font styles to test RichEditor shortCutKeys
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0019', 0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDIT0R_SHORTCUTKEYS_0019 START');
      let driver = Driver.create();
      let getSpans = await driver.findComponent(ON.id('getSpans'));
      await getSpans.click();
      await CommonFunc.sleep(500);
      let style = await driver.findComponent(ON.id('style'));
      let styleText = await style.getText();
      await CommonFunc.sleep(500);
      expect(styleText).assertContain('"fontStyle":1');
      let rich = await driver.findComponent(ON.id('RichEditorShortCutKeys012'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.longClick(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      let selectAll = await driver.findComponent(ON.text('全选'));
      await selectAll.click();
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_I);
      await CommonFunc.sleep(2000);
      await getSpans.click();
      await CommonFunc.sleep(500);
      styleText = await style.getText();
      await CommonFunc.sleep(500);
      expect(styleText).assertContain('"fontColor":"#FFFF0000"');
      expect(styleText).assertContain('"fontSize":35');
      expect(styleText).assertContain('"fontStyle":0');
      expect(styleText).assertContain('"fontWeight":11');
      expect(styleText).assertContain('"fontFamily":"' + Utils.FONT_FAMILY + '"');
      expect(styleText).assertContain('"decoration":{"type":0,"color":"#FF000000","style":0}');
      expect(styleText).assertContain('"lineHeight":30');
      expect(styleText).assertContain('"letterSpacing":30');
      expect(styleText).assertContain('"fontFeature":"\'ss01\' 1"');
      done();
    });

  })
}


