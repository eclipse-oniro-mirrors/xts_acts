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

export default function RichEditorOnWillChange011() {
  describe('RichEditorOnWillChange011', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnWillChange011 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange011',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnWillChange011 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange011" == pages.name)) {
          console.info("get RichEditorOnWillChange011 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnWillChange011 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange011 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0010
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0010
     * @tc.desc   Copy multiple span contents from other components and paste them to test RichEditor on WillChange callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0010',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0010 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      await driver.triggerKey(KeyCode.KEYCODE_A);
      await CommonFunc.sleep(500);
      await driver.triggerKey(KeyCode.KEYCODE_B);
      await CommonFunc.sleep(500);

      let text1 = await driver.findComponent(ON.id('text1'));
      await text1.click()
      await CommonFunc.sleep(500);
      await text1.click()
      await CommonFunc.sleep(500);
      let selectAll = await driver.findComponent(ON.text('全选'))
      await selectAll?.click()
      await CommonFunc.sleep(500);

      let copy = await driver.findComponent(ON.text('复制'))
      await copy?.click()
      await CommonFunc.sleep(500);

      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(500);

      let paste = await driver.findComponent(ON.text('粘贴'))
      await paste?.click()
      await CommonFunc.sleep(500);

      let onWillChange = await driver.findComponent(ON.id('onWillChange_callback'));
      let onWillText = await onWillChange.getText();

      let replacedSpans_callback = await driver.findComponent(ON.id('replacedSpans_callback'));
      let replaceText = await replacedSpans_callback.getText();

      let onDidChange = await driver.findComponent(ON.id('onDidChange_callback'));
      let didText = await onDidChange.getText();
      await CommonFunc.sleep(500);

      expect(onWillText).assertEqual('onWillChange_callback:true');
      expect(replaceText).assertEqual('replacedSpans_callback:true');
      expect(didText).assertEqual('onDidChange_callback:true');

      let onWillChange_rangeBefore = await driver.findComponent(ON.id('onWillChange_rangeBefore'));
      let onWillBefore = await onWillChange_rangeBefore.getText();
      await CommonFunc.sleep(500);

      expect(onWillBefore).assertEqual('onWillChange_rangeBefore:{"start":2,"end":2}');

      let onDidChange_rangeBefore = await driver.findComponent(ON.id('onDidChange_rangeBefore'));
      let onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);

      expect(onDidBefore).assertEqual('onDidChange rangeBefore:{"start":2,"end":2}');

      let ondid_rangeAfter = await driver.findComponent(ON.id('ondid_rangeAfter'));
      let ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter).assertEqual('ondid rangeAfter:{"start":2,"end":8}');

      let replace_text = await driver.findComponent(ON.id('replace_text'));
      let replaceSpanText = await replace_text.getText();
      await CommonFunc.sleep(500);
      expect(replaceSpanText).assertEqual('replace_text:ab123abc');
      done();
    });

  })
}


