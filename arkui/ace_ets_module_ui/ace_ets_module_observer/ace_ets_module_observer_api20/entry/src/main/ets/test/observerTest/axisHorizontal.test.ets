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

export default function axisHorizontal() {
  describe('axisHorizontal', () => {
    beforeEach(async (done: Function) => {
      console.info("axisHorizontal beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/observer/axisHorizontal",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get axisHorizontal state pages:" + JSON.stringify(pages));
        if (!("axisHorizontal" == pages.name)) {
          console.info("get axisHorizontal pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push axisHorizontal page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push axisHorizontal page error:" + err);
      }
      console.info("axisHorizontal beforeEach end");
      done();
    });

    /**
     * @tc.name   axisHorizontal_0100
     * @tc.number axisHorizontal_001
     * @tc.desc   ScrollEvent info axis.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('axisHorizontal_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[axisHorizontal_0100] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('axisHorizontal_on'));
      await btn1.click();
      await CommonFunc.sleep(1500);

      let swipeScroll = CommonFunc.getComponentRectOnScreen('axisHorizontal');
      let top = swipeScroll.top;
      let right = swipeScroll.right;
      let left = swipeScroll.left;
      let bottom = swipeScroll.bottom;
      console.info("axisHorizontal_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('scroll_axisHorizontal_id');
      console.info("[axisHorizontal_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('id: axisHorizontal');

      let strJson2 = getInspectorByKey('scroll_axis_horizontal');
      console.info("[axisHorizontal_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      // expect(JSON.parse(strJson2).$attrs.content).assertEqual('axis: Axis.Horizontal');
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('axis: 1');

      await CommonFunc.sleep(1000);
      let btn2: Component = await driver.findComponent(ON.id('axisHorizontal_off'));
      await btn2.click();
      await CommonFunc.sleep(1500);
      console.info('[axisHorizontal_0100] END');
      done();
    });
  })
}
