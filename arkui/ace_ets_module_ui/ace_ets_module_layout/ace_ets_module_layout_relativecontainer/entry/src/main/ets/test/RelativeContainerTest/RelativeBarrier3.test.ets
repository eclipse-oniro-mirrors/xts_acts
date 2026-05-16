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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium";
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RelativeBarrier3() {
  describe('RelativeBarrier3', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeBarrier3 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeBarrier3 state pages:" + JSON.stringify(pages));
        if (!("RelativeBarrier3" == pages.name)) {
          console.info("get  RelativeBarrier3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeBarrier3"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeBarrier3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeBarrier3 page error:" + err);
      }
      console.info("RelativeBarrier3 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeBarrier3 after each called");
    });

    /**
     * @tc.name   RelativeBarrier3_001
     * @tc.number SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0300
     * @tc.desc   chainMode test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeBarrier3_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeBarrier3_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeBarrier3');
      let row1 = CommonFunc.getComponentRect('RelativeBarrier3Bt1');
      let row2 = CommonFunc.getComponentRect('RelativeBarrier3Bt2');
      let row3 = CommonFunc.getComponentRect('RelativeBarrier3Bt3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeBarrier3_001] RelativeContainer is: " + JSON.stringify(rel) + 'row1:' + JSON.stringify(row1) + 'row2:' + JSON.stringify(row2) + 'row3:' + JSON.stringify(row3));
      expect(Math.abs(Math.round(rel.right - row3.right) - Math.round(vp2px(150))) <= 1).assertTrue();

      console.info('[RelativeBarrier3_001] END');
      done();
    });
  })
}
