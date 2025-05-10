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

export default function RelativeGuideLine4() {
  describe('RelativeGuideLine4', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeGuideLine4 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeGuideLine4 state pages:" + JSON.stringify(pages));
        if (!("RelativeGuideLine4" == pages.name)) {
          console.info("get  RelativeGuideLine4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeGuideLine4"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeGuideLine4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeGuideLine4 page error:" + err);
      }
      console.info("RelativeGuideLine4 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeGuideLine4 after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0090
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine4_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine4_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeGuideLine4');
      let bt = CommonFunc.getComponentRect('RelButton4');
      await CommonFunc.sleep(2000);

      console.info("[RelativeGuideLine4_001] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      console.info("[RelativeGuideLine4_001] RelativeContainer left is: " + rel.left + 'button left:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine4_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0120
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('RelativeGuideLine4_002', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine4_002] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('noSet'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine4');
      let bt = CommonFunc.getComponentRect('RelButton4');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine4_002] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      console.info("[RelativeGuideLine4_002] RelativeContainer top is: " + rel.top + 'button top:' + bt.top);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top)) <= 1).assertTrue();

      console.info('[RelativeGuideLine4_002] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0130
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('RelativeGuideLine4_003', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine4_003] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStart'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine4');
      let bt = CommonFunc.getComponentRect('RelButton4');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine4_003] RelativeContainer top is: " + rel.top + 'button top:' + bt.top);
      expect(Math.abs(Math.round(rel.top - bt.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine4_003] END');
      done();
    });





  })
}
