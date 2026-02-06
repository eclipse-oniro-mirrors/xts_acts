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

export default function RelativeGuideLine6() {
  describe('RelativeGuideLine6', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeGuideLine6 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeGuideLine6 state pages:" + JSON.stringify(pages));
        if (!("RelativeGuideLine6" == pages.name)) {
          console.info("get  RelativeGuideLine6 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeGuideLine6"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeGuideLine6 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeGuideLine6 page error:" + err);
      }
      console.info("RelativeGuideLine6 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeGuideLine6 after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0240
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine6_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine6_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeGuideLine6');
      let bt1 = CommonFunc.getComponentRect('RelButton6_1');
      let bt2 = CommonFunc.getComponentRect('RelButton6_2');
      let bt3 = CommonFunc.getComponentRect('RelButton6_3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeGuideLine6_001] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt1.top + 'bt2:' + bt2.top + 'bt3:' + bt3.top);
      console.info("[RelativeGuideLine6_001] RelativeContainer left is: " + rel.left + 'button left:' + bt1.left + 'bt2:' + bt2.left + 'bt3:' + bt3.left);
      expect(Math.abs(Math.round(bt1.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt2.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt3.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt1.top - rel.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt2.top - rel.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt3.top - rel.top)) <= 1).assertTrue();

      console.info('[RelativeGuideLine6_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0250
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine6_002', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine6_002] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeGuideLine6_2');
      let bt1 = CommonFunc.getComponentRect('RelButton6_4');
      let bt2 = CommonFunc.getComponentRect('RelButton6_5');
      let bt3 = CommonFunc.getComponentRect('RelButton6_6');
      await CommonFunc.sleep(2000);

      console.info("[RelativeGuideLine6_002] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt1.top + 'bt2:' + bt2.top + 'bt3:' + bt3.top);
      console.info("[RelativeGuideLine6_002] RelativeContainer left is: " + rel.left + 'button left:' + bt1.left + 'bt2:' + bt2.left + 'bt3:' + bt3.left);
      expect(Math.abs(Math.round(bt1.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt2.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt3.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt1.top - rel.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt2.top - rel.top)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt3.top - rel.top)) <= 1).assertTrue();

      console.info('[RelativeGuideLine6_002] END');
      done();
    });
  })
}
