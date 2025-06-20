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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/utils/Common';

export default function waterFlow6Jsunit() {
  describe('waterFlow6Jsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("waterFlow6Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/WaterFlow/waterFlow6",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get waterFlow6Jsunit state pages:" + JSON.stringify(pages));
        if (!("waterFlow6" == pages.name)) {
          console.info("get waterFlow6Jsunit pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push waterFlow6Jsunit page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push waterFlow6Jsunit page error:" + err);
      }
      console.info("waterFlow6Jsunit beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("waterFlow6Jsunit after each called");
    });

    /**
     * @tc.number    waterFlow6Jsunit_001
     * @tc.name      waterFlow6Jsunit_001
     * @tc.desc      Add and delete data to waterFlow component
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('waterFlow6Jsunit_001', 0, async (done: Function) => {
      console.info('[waterFlow6Jsunit_001] START');
      let strJson = getInspectorByKey('waterFlow_onReachText');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[waterFlow6Jsunit_001] component obj is: " + JSON.stringify(obj));
      expect(obj.$attrs.content).assertEqual('onReachText: onReachStart:succ');
      await CommonFunc.sleep(1000);

      let swiperFlow = CommonFunc.getComponentRectOnScreen('water_event');
      let top = swiperFlow.top;
      let right = swiperFlow.right;
      let left = swiperFlow.left;
      let bottom = swiperFlow.bottom;
      console.info("waterFlow6Jsunit_001 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width/2),Math.round(top + height*0.9),Math.round(left + width/2),Math.round(top + height*0.1));
      await CommonFunc.sleep(2000);

      let strJson1 = getInspectorByKey('waterFlow_onScrollText');
      let obj1: ESObject = JSON.parse(strJson1);
      console.info("[waterFlow6Jsunit_001] component obj1 is: " + JSON.stringify(obj1));
      console.info("[waterFlow6Jsunit_001] content1: " + JSON.stringify(obj1.$attrs.content));
      expect(obj1.$attrs.content).assertEqual('onScrollText: onScrollStop:succ');

      let strJson2 = getInspectorByKey('waterFlow_onText');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info("[waterFlow6Jsunit_001] component obj2 is: " + JSON.stringify(obj2));
      console.info("[waterFlow6Jsunit_001] content2: " + JSON.stringify(obj2.$attrs.content));
      expect(obj2.$attrs.content).assertEqual('onText: onDidScroll');

      let strJson3 = getInspectorByKey('waterFlow_onFrameBegin');
      let obj3: ESObject = JSON.parse(strJson3);
      console.info("[waterFlow6Jsunit_001] component obj3 is: " + JSON.stringify(obj3));
      console.info("[waterFlow6Jsunit_001] content3: " + JSON.stringify(obj3.$attrs.content));
      expect(obj3.$attrs.content).assertEqual('onScrollFrameBegin: success');

      let btn: Component = await driver.findComponent(ON.id('waterFlow_sctm'));
      await btn.click();
      await CommonFunc.sleep(3000);
      let strJson4 = getInspectorByKey('waterFlow_onReachText');
      let obj4: ESObject = JSON.parse(strJson4);
      console.info("[waterFlow6Jsunit_001] component obj4 is: " + JSON.stringify(obj4));
      expect(obj4.$attrs.content).assertEqual('onReachText: onReachEnd:succ');
      await CommonFunc.sleep(1000);

      let strJson5 = getInspectorByKey('waterFlow_onScrollIndex');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info("[waterFlow6Jsunit_001] component obj5 is: " + JSON.stringify(obj5));
      console.info("[waterFlow6Jsunit_001] content5: " + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual('onScrollIndex: last:99');
      console.info('[waterFlow6Jsunit_001] END');
      done();
    });
  })
}
