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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import router from '@ohos.router';
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/utils/Common';

export default function SwiperDrag0250() {
  describe('SwiperDrag0250', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperDrag0250 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperDrag0250 state pages:" + JSON.stringify(pages));
        if (!("SwiperDrag0250" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperDrag/SwiperDrag0250'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperDrag0250 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperDrag0250 page error:" + err);
      }
      console.info("SwiperDrag0250 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperDrag0250 after each called");
    });

    /**
     * @tc.number SWIPER_DRAG_0250
     * @tc.name step
     * @tc.desc loop
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0250', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0250 START");
      await CommonFunc.sleep(3000)
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('UIComponentScrollSwiperDrag0250_button'));
      await button.click();
      await CommonFunc.sleep(1000);
      let strSwiper: string = getInspectorByKey('UIComponentScrollSwiperDrag0250_swiper')
      let jsonSwiperCure: ESObject =JSON.parse(strSwiper).$attrs.curve;
      let jsonSwiperIndicator: ESObject =JSON.parse(strSwiper).$attrs.indicator;
      expect(jsonSwiperCure).assertEqual('Curves.FastOutSlowIn')
      expect(jsonSwiperIndicator).assertEqual('true')
      await CommonFunc.sleep(1000);
      let strIndex: string = getInspectorByKey('UIComponentScrollSwiperDrag0250_text')
      let jsonIndex: ESObject =JSON.parse(strIndex).$attrs.content;
      expect(jsonIndex).assertEqual('1')
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DRAG_0250 END');
      done();
    });
  })
}