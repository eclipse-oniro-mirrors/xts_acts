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
import CommonFunc from '../../MainAbility/common/Common';
import RectValue from '../../MainAbility/common/Rect';
import {UiComponent, UiDriver, Component, Driver, MouseButton, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import text from "@ohos.graphics.text"

export default function RelativeContainerApi1() {
  describe('RelativeContainerApi1', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeContainerApi1 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeContainerApi1 state pages:" + JSON.stringify(pages));
        if (!("RelativeContainerApi1" == pages.name)) {
          console.info("get  Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeContainerApi1"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeContainerApi1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeContainerApi1 page error:" + err);
      }
      console.info("RelativeContainerApi1 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeContainerApi1 after each called");
    });


    /**
     * @tc.name   RelativeContainerApi1_001
     * @tc.number RelativeContainerApi1_001
     * @tc.desc   RelativeContainerApi1_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RelativeContainerApi1_001',  Level.LEVEL0, async (done: Function) => {
      console.info('[RelativeContainerApi1_001] START');
      await CommonFunc.sleep(1000);

      let row: RectValue = CommonFunc.getComponentRectOnScreen('row1');
      let row11: RectValue = CommonFunc.getComponentRectOnScreen('row11');
      let rel: RectValue = CommonFunc.getComponentRectOnScreen('RelativeContainerApi1');
      let rel2: RectValue = CommonFunc.getComponentRectOnScreen('RelativeContainerApi2');
      await CommonFunc.sleep(1000);

      console.info("[RelativeContainerApi1_001] RelativeContainerTop is: " + row.top);
      console.info("[RelativeContainerApi1_001] RelativeContainer left is: " + rel.top);
      console.info("[RelativeContainerApi1_001] RelativeContainerTop is: " + row11.top);
      console.info("[RelativeContainerApi1_001] RelativeContainer left is: " + rel2.top);
      expect(Math.abs(Math.round(row.top - rel.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(row11.top - rel2.top)) <= 1).assertTrue();
      await CommonFunc.sleep(1000);

      console.info('[RelativeContainerApi1_001] END');
      done();
    });







  })
}
