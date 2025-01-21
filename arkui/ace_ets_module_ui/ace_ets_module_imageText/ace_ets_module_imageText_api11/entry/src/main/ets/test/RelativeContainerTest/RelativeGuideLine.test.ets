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

export default function RelativeGuideLine() {
  describe('RelativeGuideLine', () => {
    beforeEach(async (done: Function) => {
      console.info("RelativeGuideLine beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RelativeGuideLine state pages:" + JSON.stringify(pages));
        if (!("RelativeGuideLine" == pages.name)) {
          console.info("get  RelativeGuideLine pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({url:"MainAbility/pages/RelativeContainer/RelativeGuideLine"})
          await CommonFunc.sleep(2000);
          console.info("push RelativeGuideLine page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RelativeGuideLine page error:" + err);
      }
      console.info("RelativeGuideLine foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("RelativeGuideLine after each called");
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0010
     * @tc.desc      set direction to Axis.Horizontal and set start to 50
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('RelativeGuideLine_001', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_001] START');

      await CommonFunc.sleep(1000);
      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);

      console.info("[RelativeGuideLine_001] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_001] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0020
     * @tc.desc      set direction to Axis.Vertical and set start to 50
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('RelativeGuideLine_002', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_002] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeDir'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_002] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_002] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0030
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('RelativeGuideLine_003', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_003] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeId'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_003] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      console.info("[RelativeGuideLine_003] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_003] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0150
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine_004', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_004] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartVp'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_004] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_004] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0160
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine_005', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_005] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartPx'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_005] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(50)) <= 1).assertTrue();

      console.info('[RelativeGuideLine_005] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0170
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('RelativeGuideLine_006', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_006] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartLpx'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_006] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(lpx2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_006] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0180
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('RelativeGuideLine_007', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_007] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartPer'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_007] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(vp2px(150))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_007] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0190
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('RelativeGuideLine_008', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_008] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('setStartRes'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_008] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(vp2px(50))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_008] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0200
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */

    it('RelativeGuideLine_009', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_009] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeWidth'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_009] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top)) <= 1).assertTrue();
      console.info("[RelativeGuideLine_003] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left) - Math.round(vp2px(50))) <= 1).assertTrue();
      console.info('[RelativeGuideLine_009] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0210
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine_010', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_010] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeWidth2'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_010] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top)) <= 1).assertTrue();
      console.info("[RelativeGuideLine_010] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      console.info('[RelativeGuideLine_010] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0220
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine_011', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_011] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeWidth3'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_011] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.top - rel.top)) <= 1).assertTrue();
      console.info("[RelativeGuideLine_011] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      console.info('[RelativeGuideLine_011] END');
      done();
    });

    /**
     * @tc.number    SUB_ACE_UI_RELATIVECONTAINER_COLLABORATION_0270
     * @tc.desc      direction and position test
     * @tc.level     Level 3
     * @tc.type
    * @tc.size
     */

    it('RelativeGuideLine_012', 0, async (done: Function) => {
      console.info('[RelativeGuideLine_012] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button_Bottom = await driver.findComponent(ON.id('changeStart4'));
      await button_Bottom.click();
      await CommonFunc.sleep(2000);

      let rel = CommonFunc.getComponentRect('RelativeGuideLine1');
      let bt = CommonFunc.getComponentRect('RelButton');
      await CommonFunc.sleep(2000);
      console.info("[RelativeGuideLine_012] RelativeContainer left is: " + rel.left + 'buttonLeft:' + bt.left);
      console.info("[RelativeGuideLine_012] RelativeContainerTop is: " + rel.top + 'buttonTop:' + bt.top);
      expect(Math.abs(Math.round(bt.left - rel.left)) <= 1).assertTrue();
      expect(Math.abs(Math.round(bt.top - rel.top) - Math.round(vp2px(80))) <= 1).assertTrue();

      console.info('[RelativeGuideLine_012] END');
      done();
    });


  })
}
