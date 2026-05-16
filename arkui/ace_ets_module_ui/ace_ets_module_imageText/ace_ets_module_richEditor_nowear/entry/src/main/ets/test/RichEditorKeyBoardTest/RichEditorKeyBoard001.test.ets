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

export default function RichEditorKeyBoard001() {
  describe('RichEditorKeyBoard001', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorKeyBoard001 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorKeyBoard/RichEditorKeyBoard001',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorKeyBoard001 state pages: " + JSON.stringify(pages));
        if (!("RichEditorKeyBoard001" == pages.name)) {
          console.info("get RichEditorKeyBoard001 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          await CommonFunc.sleep(3000);
          console.info("push RichEditorKeyBoard001 success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorKeyBoard001 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_KEYBOARDREINFORCING_0011
     * @tc.number SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_KEYBOARDREINFORCING_0011
     * @tc.desc   When enterKeyType is NEW_LINE to test RichEditor Text Line
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_KEYBOARDREINFORCING_0011',  Level.LEVEL0, async (done: Function) => {
      console.info('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_KEYBOARDREINFORCING_0011 START');
      let driver = Driver.create();
      let rich = await driver.findComponent(ON.id('RichEditorKeyBoard001'));
      let pointCenter = await rich.getBoundsCenter();
      await driver.click(pointCenter.x, pointCenter.y);
      await CommonFunc.sleep(1000);

      driver.triggerKey(KeyCode.KEYCODE_ENTER);
      await CommonFunc.sleep(1000);

      let isEditingFlag = await driver.findComponent(ON.id('isEditingFlag'));
      let isEditingFlagText = await isEditingFlag.getText();
      await CommonFunc.sleep(500);
      expect(isEditingFlagText).assertEqual('isEditingFlag:true');
      done();
    });

  })
}


