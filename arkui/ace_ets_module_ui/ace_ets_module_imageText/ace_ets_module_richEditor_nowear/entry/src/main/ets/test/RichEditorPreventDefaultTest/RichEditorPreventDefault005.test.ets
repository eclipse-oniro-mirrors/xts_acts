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

export default function RichEditorPreventDefault005() {
  describe('RichEditorPreventDefault005', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorPreventDefault005 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorPreventDefault/RichEditorPreventDefault005',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorPreventDefault005 state pages: " + JSON.stringify(pages));
        if (!("RichEditorPreventDefault005" == pages.name)) {
          console.info("get RichEditorPreventDefault005 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorPreventDefault005 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorPreventDefault005 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0006
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0006
     * @tc.desc   Add multiple spans to set the onClick event separately, call preventDefault to test RichEditor PreventDefault
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0006',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_PREVENTDEFAULT_0006 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorPreventDefault005'));
      let getBounds = await rich.getBounds();
      await CommonFunc.sleep(500);

      await driver.click(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(1000);

      await driver.longClick(getBounds.left + 30, getBounds.top + 30);
      await CommonFunc.sleep(1000);

      let callOnClick = await driver.findComponent(ON.id('callOnClick'));
      let callOnClickText = await callOnClick.getText();
      await CommonFunc.sleep(500);
      expect(callOnClickText).assertContain('callOnClick');

      done();
    });

  })
}


