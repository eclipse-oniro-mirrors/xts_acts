/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function RichEditorOnWillChangeTest() {
  describe('RichEditorOnWillChangeTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RichEditorOnWillChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/RichEditorApi14/onWillChange',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RichEditorOnWillChangeTest state pages: " + JSON.stringify(pages));
        if (!("onWillChange" == pages.name)) {
          console.info("get RichEditorOnWillChangeTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RichEditorOnWillChangeTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RichEditorOnWillChangeTest page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_RichEditorOnWillChange_0010
     * @tc.number SUB_ACE_RichEditorOnWillChange_0010
     * @tc.desc   test OnWillChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_ACE_RichEditorOnWillChange_0010', Level.LEVEL2, async (done: Function) => {
      console.info('SUB_ACE_RichEditorOnWillChange_0010 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(500);
      let button = await driver.findComponent(ON.id('setCaretOffset'));
      let point = await button.getBoundsCenter();
      await CommonFunc.sleep(500);
      await driver.click(point.x, point.y);
      await CommonFunc.sleep(1000);
      await driver.triggerKey(2054);
      let onWillChangeRange = await driver.findComponent(ON.id('onWillChange_range'));
      let range = await onWillChangeRange.getText();
      expect(range).assertEqual('[0, 0]');
      console.info('[SUB_ACE_RichEditorOnWillChange_0010] END');
      done();
    });
  })
}
