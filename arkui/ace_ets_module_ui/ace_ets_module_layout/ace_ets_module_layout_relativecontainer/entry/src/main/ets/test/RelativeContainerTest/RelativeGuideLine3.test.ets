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

export default function RelativeGuideLine3() {
  describe('RelativeGuideLine3', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeGuideLine3 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeGuideLine3 state pages:" + JSON.stringify(pages));
        if (!("RelativeGuideLine3" == pages.name)) {
          console.info("get  RelativeGuideLine3 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeGuideLine3"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeGuideLine3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeGuideLine3 page error:" + err);
      }
      console.info("RelativeGuideLine3 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeGuideLine3 after each called");
    });


    /**
     * @tc.name   RelativeGuideLine3_001
     * @tc.number RelativeGuideLine3_001
     * @tc.desc   RelativeGuideLine3_001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeGuideLine3_001', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine3_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeGuideLine3');
      let bt = CommonFunc.getComponentRect('RelButton3');
      await CommonFunc.sleep(2000);

      console.info("[RelativeGuideLine3_001] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      console.info("[RelativeGuideLine3_001] RelativeContainer left is: " + rel.left + 'button left:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine3_001] END');
      done();
    });


    /**
     * @tc.name   RelativeGuideLine3_002
     * @tc.number RelativeGuideLine3_002
     * @tc.desc   RelativeGuideLine3_002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeGuideLine3_002', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine3_002] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeVer'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine3');
      let bt = CommonFunc.getComponentRect('RelButton3');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine3_002] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine3_002] END');
      done();
    });


    /**
     * @tc.name   RelativeGuideLine3_003
     * @tc.number RelativeGuideLine3_003
     * @tc.desc   RelativeGuideLine3_003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeGuideLine3_003', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine3_003] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('delPos'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine3');
      let bt = CommonFunc.getComponentRect('RelButton3');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine3_003] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();

      console.info('[RelativeGuideLine3_003] END');
      done();
    });


    /**
     * @tc.name   RelativeGuideLine3_004
     * @tc.number RelativeGuideLine3_004
     * @tc.desc   RelativeGuideLine3_004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('RelativeGuideLine3_004', Level.LEVEL3, async (done: Function) => {
      console.info('[RelativeGuideLine3_004] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeHor'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine3');
      let bt = CommonFunc.getComponentRect('RelButton3');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine3_004] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      console.info("[RelativeGuideLine3_004] RelativeContainer top is: " + rel.top + 'button top:' + bt.top);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top)) <= 1).assertTrue();

      console.info('[RelativeGuideLine3_004] END');
      done();
    });




  })
}
