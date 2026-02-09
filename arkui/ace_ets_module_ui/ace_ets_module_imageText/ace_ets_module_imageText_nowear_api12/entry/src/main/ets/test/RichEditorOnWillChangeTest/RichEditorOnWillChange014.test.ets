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

export default function RichEditorOnWillChange014() {
  describe('RichEditorOnWillChange014', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnWillChange014 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorOnWillChange/RichEditorOnWillChange014',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnWillChange014 state pages: " + JSON.stringify(pages));
        if (!("RichEditorOnWillChange014" == pages.name)) {
          console.info("get RichEditorOnWillChange014 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorOnWillChange014 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnWillChange014 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0007
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0007
     * @tc.desc   Revoke deleted text content and then restore to test RichEditor on WillChange callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0007',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONWILLCHANGE_0007 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('rich_struct'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

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


      await driver.triggerKey(KeyCode.KEYCODE_DEL);
      await CommonFunc.sleep(500);

      let onDidChange_rangeBefore = await driver.findComponent(ON.id('onDidChange_rangeBefore'));
      let onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      expect(onDidBefore).assertEqual('onDidChange rangeBefore:{"start":5,"end":6}');

      let ondid_rangeAfter = await driver.findComponent(ON.id('ondid_rangeAfter'));
      let ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter).assertEqual('ondid rangeAfter:{"start":5,"end":5}');

      let replacedSpansCallback = await driver.findComponent(ON.id('replacedSpansCallback'));
      let replaceCall = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);
      expect(replaceCall).assertEqual('replacedSpans Callback:[]');

      //撤销删除
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_Z);
      await CommonFunc.sleep(500);

      onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      expect(onDidBefore).assertEqual('onDidChange rangeBefore:{"start":5,"end":5}');

      ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter).assertEqual('ondid rangeAfter:{"start":5,"end":6}');

      replaceCall = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);
      expect(replaceCall.indexOf('"value":"ab"') > 0).assertEqual(true);
      //还原删除
      driver.triggerCombineKeys(KeyCode.KEYCODE_CTRL_LEFT, KeyCode.KEYCODE_Y);
      await CommonFunc.sleep(500);

      let int_callback_status = await driver.findComponent(ON.id('int_callback_status'));
      await int_callback_status.click();
      await CommonFunc.sleep(500);

      onDidBefore = await onDidChange_rangeBefore.getText();
      await CommonFunc.sleep(500);
      expect(onDidBefore).assertEqual('onDidChange rangeBefore:{"start":5,"end":6}');

      ondidRangeAfter = await ondid_rangeAfter.getText();
      await CommonFunc.sleep(500);
      expect(ondidRangeAfter).assertEqual('ondid rangeAfter:{"start":5,"end":5}');

      replaceCall = await replacedSpansCallback.getText();
      await CommonFunc.sleep(500);
      expect(replaceCall).assertEqual('replacedSpans Callback:[]');

      done();
    });

  })
}


