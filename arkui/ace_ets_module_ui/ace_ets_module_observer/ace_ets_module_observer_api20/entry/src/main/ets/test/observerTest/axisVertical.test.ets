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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function axisVertical() {
  describe('axisVertical', () => {
    beforeEach(async (done: Function) => {
      console.info("axisVertical beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/axisVertical",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get axisVertical state pages:" + JSON.stringify(pages));
        if (!("axisVertical" == pages.name)) {
          console.info("get axisVertical pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push axisVertical page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push axisVertical page error:" + err);
      }
      console.info("axisVertical beforeEach end");
      done();
    });

    /**
     * @tc.number    axisVertical_001
     * @tc.name      axisVertical_0100
     * @tc.desc      ScrollEvent info axis.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('axisVertical_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[axisVertical_0100] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('axisVertical_on'));
      await btn1.click();
      await CommonFunc.sleep(1500);

      let swipeScroll = CommonFunc.getComponentRectOnScreen('axisVertical');
      let top = swipeScroll.top;
      let right = swipeScroll.right;
      let left = swipeScroll.left;
      let bottom = swipeScroll.bottom;
      console.info("axisVertical_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.8),Math.round(left + width/2),Math.round(top + height*0.2));
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('scroll_axisVertical_id');
      console.info("[axisVertical_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('id: axisVertical');

      let strJson2 = getInspectorByKey('scroll_axis_vertical');
      console.info("[axisVertical_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      //expect(JSON.parse(strJson2).$attrs.content).assertEqual('axis: Axis.Vertical');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('axis: 0');

      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('axisVertical_off'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      console.info('[axisVertical_0100] END');
      done();
    });
  })
}
