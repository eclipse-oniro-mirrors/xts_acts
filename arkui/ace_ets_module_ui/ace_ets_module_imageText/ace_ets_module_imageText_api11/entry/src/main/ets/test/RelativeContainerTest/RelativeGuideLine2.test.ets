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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function RelativeGuideLine2() {
  describe('RelativeGuideLine2', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeGuideLine2 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeGuideLine2 state pages:" + JSON.stringify(pages));
        if (!("RelativeGuideLine2" == pages.name)) {
          console.info("get  RelativeGuideLine2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeGuideLine2"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeGuideLine2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeGuideLine2 page error:" + err);
      }
      console.info("RelativeGuideLine2 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeGuideLine2 after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0040
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine2_001', 0, async (done: Function) => {
      console.info('[RelativeGuideLine2_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeGuideLine2');
      let bt = CommonFunc.getComponentRect('RelButton2');
      await CommonFunc.sleep(2000);

      console.info("[RelativeGuideLine2_001] RelativeContainer bottom is: " + rel.bottom + 'button bottom:' + bt.bottom);
      expect(Math.abs(Math.round(rel.bottom - bt.bottom) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine2_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0050
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine2_002', 0, async (done: Function) => {
      console.info('[RelativeGuideLine2_002] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeDir2'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine2');
      let bt = CommonFunc.getComponentRect('RelButton2');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine2_002] RelativeContainerRight is: " + rel.right + 'button right:' + bt.right);
      expect(Math.abs(Math.round(rel.right - bt.right) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine2_002] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0060
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine2_003', 0, async (done: Function) => {
      console.info('[RelativeGuideLine2_003] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeId2'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine2');
      let bt = CommonFunc.getComponentRect('RelButton2');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine2_002] RelativeContainerRight is: " + rel.right + 'button right:' + bt.right);
      expect(Math.abs(Math.round(rel.right - bt.right) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info("[RelativeGuideLine2_001] RelativeContainer bottom is: " + rel.bottom + 'button bottom:' + bt.bottom);
      expect(Math.abs(Math.round(rel.bottom - bt.bottom) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine2_003] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0140
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine2_004', 0, async (done: Function) => {
      console.info('[RelativeGuideLine2_004] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setEnd'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine2');
      let bt = CommonFunc.getComponentRect('RelButton2');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine2_004] RelativeContainerRight is: " + rel.right + 'button right:' + bt.right);
      expect(Math.abs(Math.round(bt.right - rel.right) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info("[RelativeGuideLine2_004] RelativeContainer bottom is: " + rel.bottom + 'button bottom:' + bt.bottom);
      expect(Math.abs(Math.round(bt.bottom - rel.bottom) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine2_004] END');
      done();
    });


  })
}
