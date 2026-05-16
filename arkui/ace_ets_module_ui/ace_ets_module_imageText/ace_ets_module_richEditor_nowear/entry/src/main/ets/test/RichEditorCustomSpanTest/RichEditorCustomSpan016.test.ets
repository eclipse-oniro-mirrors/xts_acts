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

export default function RichEditorCustomSpan016() {
  describe('RichEditorCustomSpan016', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorCustomSpan016 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorCustomSpan/RichEditorCustomSpan016',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorCustomSpan016 state pages: " + JSON.stringify(pages));
        if (!("RichEditorCustomSpan016" == pages.name)) {
          console.info("get RichEditorCustomSpan016 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorCustomSpan016 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorCustomSpan016 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0026
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0026
     * @tc.desc   Test RichEditor Custom Span by selecting Custom Span
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0026',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0026 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan016'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      let imageTop = await driver.findComponent(ON.id('imageTop'));
      await imageTop.click();
      await CommonFunc.sleep(500);
      let setSelect = await driver.findComponent(ON.id('setSelect'));
      await setSelect.click();
      await CommonFunc.sleep(500);
      let info = await driver.findComponent(ON.id('info'));
      let infoText = await info.getText();
      await CommonFunc.sleep(500);
      expect(infoText).assertContain('info:{"start":5,"end":6}');
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0029
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0029
     * @tc.desc   Testing RichEditor's Custom Span with Copy Paste Not Supported by Custom Span
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0029',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMSPAN_0029 START');
      let driver = Driver.create();
      let getStyles = await driver.findComponent(ON.id('getStyles'));
      await getStyles.click();
      await CommonFunc.sleep(500);
      let info = await driver.findComponent(ON.id('info'));
      let infoText = await info.getText();
      await CommonFunc.sleep(500);
      let str = '{"start":5,"length":1,"styledKey":400,"styledValue":{"type_":"CustomSpan","width":80,"word":"Hello"';
      expect(infoText).assertContain(str);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_C);
      await CommonFunc.sleep(500);
      let rich = await driver.findComponent(ON.id('RichEditorCustomSpan016_1'));
      let getBounds = await rich.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(getBounds.x, getBounds.y );
      await CommonFunc.sleep(500);
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_V);
      await CommonFunc.sleep(500);
      let getOtherStyles = await driver.findComponent(ON.id('getOtherStyles'));
      await getOtherStyles.click();
      await CommonFunc.sleep(500);
      infoText = await info.getText();
      await CommonFunc.sleep(500);
      expect(infoText.indexOf('CustomSpan') < 0).assertEqual(true);
      done();
    });

  })
}


