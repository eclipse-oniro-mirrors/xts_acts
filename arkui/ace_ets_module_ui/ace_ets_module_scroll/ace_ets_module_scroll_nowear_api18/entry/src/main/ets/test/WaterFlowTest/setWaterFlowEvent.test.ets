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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function setWaterFlowEvent() {
  describe('setWaterFlowEvent', () => {
    beforeEach(async (done: Function) => {
      console.info("setWaterFlowEvent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/setWaterFlowEvent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get setWaterFlowEvent state pages:" + JSON.stringify(pages));
        if (!("setWaterFlowEvent" == pages.name)) {
          console.info("get setWaterFlowEvent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push setWaterFlowEvent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push setWaterFlowEvent page error:" + err);
      }
      console.info("setWaterFlowEvent beforeEach end");
      done();
    });

    /**
     * @tc.number    setWaterFlowEvent_001
     * @tc.name      setWaterFlowEvent_0100
     * @tc.desc      Set scrolling events for the WaterFlow component.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('setWaterFlowEvent_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[setWaterFlowEvent_0100] START');
      let driver = await Driver.create()
      let btnEvent: Component = await driver.findComponent(ON.id('WaterFlow_addCommonEvent_04'));
      await btnEvent.click();
      await CommonFunc.sleep(1500)

      let swipeScroll = CommonFunc.getComponentRectOnScreen('key_WaterFlow_set');
      let top = swipeScroll.top;
      let right = swipeScroll.right;
      let left = swipeScroll.left;
      let bottom = swipeScroll.bottom;
      console.info("setWaterFlowEvent_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.8),Math.round(left + width/2),Math.round(top + height*0.2));
      await CommonFunc.sleep(2000);
      let btn: Component = await driver.findComponent(ON.id('WaterFlow_setOnReach_04'));
      await btn.click();
      await CommonFunc.sleep(1500);

      let btn1: Component = await driver.findComponent(ON.id('WaterFlow_setOnWill_04'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('WaterFlow_setOnWill_04');
      console.info("[setWaterFlowEvent_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('setOnWillScroll_setOnDidScroll');

      let btn2: Component = await driver.findComponent(ON.id('WaterFlow_setOnScroll_04'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      let strJson2 = getInspectorByKey('WaterFlow_setOnScroll_04');
      console.info("[setWaterFlowEvent_0100] content3: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('setOnScrollStart_setOnScrollStop');

      let btn3: Component = await driver.findComponent(ON.id('WaterFlow_setOnScrollIndex_04'));
      await btn3.click();
      await CommonFunc.sleep(1500);
      let strJson3 = getInspectorByKey('WaterFlow_setOnScrollIndex_04');
      console.info("[setWaterFlowEvent_0100] content4: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('setOnScrollFrameBegin_setOnScrollIndex');
      console.info('[setWaterFlowEvent_0100] END');
      done();
    });
  })
}
