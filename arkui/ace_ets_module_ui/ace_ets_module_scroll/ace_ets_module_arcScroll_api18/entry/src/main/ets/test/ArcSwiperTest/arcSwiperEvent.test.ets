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

export default function arcSwiperEvent() {
  describe('arcSwiperEvent', () => {
    beforeEach(async (done: Function) => {
      console.info("arcSwiperEvent beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ArcSwiper/arcSwiperEvent",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get arcSwiperEvent state pages:" + JSON.stringify(pages));
        if (!("arcSwiperEvent" == pages.name)) {
          console.info("get arcSwiperEvent pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push arcSwiperEvent page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push arcSwiperEvent page error:" + err);
      }
      console.info("arcSwiperEvent beforeEach end");
      done();
    });

    /**
     * @tc.number    arcSwiperEvent_001
     * @tc.name      arcSwiperEvent_0100
     * @tc.desc      Set the sliding switch function of disabled components.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('arcSwiperEvent_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[arcSwiperEvent_0100] START');
      let driver = await Driver.create()
      let swipeTabs = CommonFunc.getComponentRectOnScreen('arcSwiper_eventChange');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("arcSwiperEvent value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson = getInspectorByKey('arcSwiper_onChange');
      console.info("[arcSwiperEvent_0100] content: " + JSON.stringify(JSON.parse(strJson).$attrs.content));
      expect(JSON.parse(strJson).$attrs.content).assertEqual('onChange: -1');

      let strJson1 = getInspectorByKey('arcSwiper_onAnimationStart');
      console.info("[arcSwiperEvent_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onAnimationStart: -1');

      let strJson2 = getInspectorByKey('arcSwiper_onAnimationEnd');
      console.info("[arcSwiperEvent_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onAnimationEnd: -1');

      let strJson3 = getInspectorByKey('arcSwiper_finishAnimation');
      console.info("[arcSwiperEvent_0100] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('finishText: 0');
      console.info('[arcSwiperEvent_0100] END');
      done();
    });

    /**
     * @tc.number    arcSwiperEvent_002
     * @tc.name      arcSwiperEvent_0200
     * @tc.desc      During the sliding process of the page, trigger callback events.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('arcSwiperEvent_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[arcSwiperEvent_0200] START');
      let driver = await Driver.create()
      let btn1: Component = await driver.findComponent(ON.id('arcSwiper_disableSwipe'));
      await btn1.click();
      await CommonFunc.sleep(1500);
      let swipeTabs = CommonFunc.getComponentRectOnScreen('arcSwiper_eventChange');
      let top = swipeTabs.top;
      let right = swipeTabs.right;
      let left = swipeTabs.left;
      let bottom = swipeTabs.bottom;
      console.info("arcSwiperEvent value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await driver.drag(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('arcSwiper_onGestureSwipe');
      console.info("[arcSwiperEvent_0200] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[arcSwiperEvent_0200] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('onGestureSwipe success');

      let strJson2 = getInspectorByKey('arcSwiper_onChange');
      console.info("[arcSwiperEvent_0200] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('onChange: 1');

      let strJson3 = getInspectorByKey('arcSwiper_onAnimationStart');
      console.info("[arcSwiperEvent_0200] content3: " + JSON.stringify(JSON.parse(strJson3).$attrs.content));
      expect(JSON.parse(strJson3).$attrs.content).assertEqual('onAnimationStart: 0');

      let strJson4 = getInspectorByKey('arcSwiper_onAnimationEnd');
      console.info("[arcSwiperEvent_0200] content4: " + JSON.stringify(JSON.parse(strJson4).$attrs.content));
      expect(JSON.parse(strJson4).$attrs.content).assertEqual('onAnimationEnd: 1');

      let strJson5 = getInspectorByKey('arcSwiper_finishAnimation');
      console.info("[arcSwiperEvent_0200] content5: " + JSON.stringify(JSON.parse(strJson5).$attrs.content));
      expect(JSON.parse(strJson5).$attrs.content).assertEqual('finishText: 1');
      console.info('[arcSwiperEvent_0200] END');
      done();
    });
  })
}
