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

export default function finishTransSwiper() {
  describe('finishTransSwiper', () => {
    beforeEach(async (done: Function) => {
      console.info("finishTransSwiper beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/finishTransSwiper",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get finishTransSwiper state pages:" + JSON.stringify(pages));
        if (!("finishTransSwiper" == pages.name)) {
          console.info("get finishTransSwiper pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push finishTransSwiper page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push finishTransSwiper page error:" + err);
      }
      console.info("finishTransSwiper beforeEach end");
      done();
    });

    /**
     * @tc.number    finishTransSwiper_001
     * @tc.name      finishTransSwiper_0100
     * @tc.desc      Customize the Swiper page transition animation.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('finishTransSwiper_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[finishTransSwiper_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let swiperScroll = CommonFunc.getComponentRectOnScreen('finishTransition_swiper');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("finishTransSwiper_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.2),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let strJson1 = getInspectorByKey('finishTransitionSwiper_text');
      console.info("[scrollSourceDrag_0100] component obj1 is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[scrollSourceDrag_0100] content1: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('ContentDidScroll');

      let strJson2 = getInspectorByKey('selectedIndexSwiper_text');
      console.info("[scrollSourceDrag_0100] component obj2 is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[scrollSourceDrag_0100] content2: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      expect(JSON.parse(strJson2).$attrs.content).assertEqual('selectedIndex: 0');
      console.info('[finishTransSwiper_0100] END');
      done();
    });
  })
}
