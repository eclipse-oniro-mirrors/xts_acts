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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';

export default function columnMonopolize() {
  describe('columnMonopolize', () => {
    beforeEach(async (done: Function) => {
      console.log("columnMonopolize beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.log("get columnMonopolize state pages:" + JSON.stringify(pages));
        if (!("columnMonopolize" == pages.name)) {
          console.log("get  columnMonopolize pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/customGestureTest/columnMonopolize"
          })
          await CommonFunc.sleep(2000);
          console.log("push columnMonopolize page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push columnMonopolize page error:" + err);
      }
      console.log("columnMonopolize foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.log("columnMonopolize after each called");
    });

    /**
     * @tc.number SUB_ACE_ACTION_GESTURE_MONOPOLIZE_0150_columnMonopolize_001
     * @tc.desc columnMonopolize true->false test
     * @tc.level Level 0
     * @tc.type
     */

    it('columnMonopolize_001', 0, async (done: Function) => {
      console.log('[columnMonopolize_001] START');
      // get column left and top on screen
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let scrollBar = await driver.findComponent(ON.type('Scroll'));
      let column2 = await scrollBar.scrollSearch(ON.id('column2'));
      let column1 = await scrollBar.scrollSearch(ON.id('column1'));
      
      await CommonFunc.sleep(200);
      await column1.longClick();
      await CommonFunc.sleep(1000);
      await column2.click();
      let strJson1 = getInspectorByKey('columnText');
      console.log("[columnMonopolize_001] component obj is: " , JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('LongPressGesture onAction success;');
      await CommonFunc.sleep(1000);
      let button = await scrollBar.scrollSearch(ON.id('buttonBoolean'));
      let button_clean = await scrollBar.scrollSearch(ON.id('button_clean'));

      await button_clean.click();
      await CommonFunc.sleep(500);
      // change the status of monopolize Attribute
      await button.click();
      await CommonFunc.sleep(1000);
      await column1.longClick();
      await CommonFunc.sleep(1000);
      await column2.click();
      await CommonFunc.sleep(500);
      let strJson2 = getInspectorByKey('columnText');
      console.log("[columnMonopolize_001] component obj2 is: " , JSON.stringify(JSON.parse(strJson2)));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('LongPressGesture onAction success;TapGesture success');
      await CommonFunc.sleep(3000);
      await button_clean.click();
      console.log('[columnMonopolize_001] END');
      done();
    });
  })
}
