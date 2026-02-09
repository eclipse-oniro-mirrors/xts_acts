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
import events_emitter from '@ohos.events.emitter';

export default function waterFlowStopDrag() {
  describe('waterFlowStopDrag', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlowStopDrag beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlowStopDrag",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlowStopDrag state pages:" + JSON.stringify(pages));
        if (!("waterFlowStopDrag" == pages.name)) {
          console.info("get waterFlowStopDrag pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlowStopDrag page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlowStopDrag page error:" + err);
      }
      console.info("waterFlowStopDrag beforeEach end");
      done();
    });

    /**
     * @tc.name   waterFlowStopDrag_0100
     * @tc.number waterFlowStopDrag_001
     * @tc.desc   Triggering onWillStopDragging when the WaterFlow component moves horizontally and leaves the hand.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowStopDrag_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[waterFlowStopDrag_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let swipeRect = CommonFunc.getComponentRectOnScreen('waterFlow_stopDrag_vh');
      let top = swipeRect.top;
      let right = swipeRect.right;
      let left = swipeRect.left;
      let bottom = swipeRect.bottom;
      console.info("waterFlowStopDrag_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('waterFlow_stopDrag_velocity');
      console.info("[waterFlowStopDrag_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[waterFlowStopDrag_0100] content1: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(Number(JSON.parse(strJson).$attrs.content) < 0).assertTrue();

      await driver.swipe(Math.round(left + width*0.4),Math.round(top + height/2),Math.round(left + width*0.8),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('waterFlow_stopDrag_velocity');
      console.info("[waterFlowStopDrag_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(Number(JSON.parse(strJson2).$attrs.content) > 0).assertTrue();
      console.info('[waterFlowStopDrag_0100] END');
      done();
    });

    /**
     * @tc.name   waterFlowStopDrag_0200
     * @tc.number waterFlowStopDrag_002
     * @tc.desc   Triggering onWillStopDragging when WaterFlow component moves vertically away from hand.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('waterFlowStopDrag_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[waterFlowStopDrag_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn1: Component = await driver.findComponent(ON.id('waterFlow_stopDrag_change'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let swipeRect = CommonFunc.getComponentRectOnScreen('waterFlow_stopDrag_vh');
      let top = swipeRect.top;
      let right = swipeRect.right;
      let left = swipeRect.left;
      let bottom = swipeRect.bottom;
      console.info("waterFlowStopDrag_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.8),Math.round(left + width/2),Math.round(top + height*0.2));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('waterFlow_stopDrag_velocity');
      console.info("[waterFlowStopDrag_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[waterFlowStopDrag_0200] content1: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(Number(JSON.parse(strJson).$attrs.content) < 0).assertTrue();

      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.2),Math.round(left + width/2),Math.round(top + height*0.6));
      await CommonFunc.sleep(2000);
      let strJson2 = getInspectorByKey('waterFlow_stopDrag_velocity');
      console.info("[waterFlowStopDrag_0200] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(Number(JSON.parse(strJson2).$attrs.content) > 0).assertTrue();
      console.info('[waterFlowStopDrag_0200] END');
      done();
    });
  })
}
