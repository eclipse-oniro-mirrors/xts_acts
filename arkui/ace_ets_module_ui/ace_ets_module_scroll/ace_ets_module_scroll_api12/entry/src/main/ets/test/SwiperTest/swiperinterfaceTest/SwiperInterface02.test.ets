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

export default function SwiperInterface02() {
  describe('SwiperInterface02', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperInterface02 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperInterface02 state pages:" + JSON.stringify(pages));
        if (!("SwiperInterface02" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperInterface/SwiperInterface02'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperInterface02 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperInterface02 page error:" + err);
      }
      console.info("SwiperInterface02 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperInterface02 after each called");
    });

    /**
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1300
     * @tc.name SWIPER_INTERFACE_1300
     * @tc.desc show Curves.springCurve
     * @tc.level Level 3
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1300', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1300 START");
      await CommonFunc.sleep(6000);
      let strJson: string = getInspectorByKey('SWIPER_INTERFACE_1300');
      let marq: ESObject =JSON.parse(strJson).$attrs.curve;
      expect(marq).assertEqual("spring(100.000000,1.000000,228.000000,30.000000)");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1300 END');
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1310
     * @tc.name SWIPER_INTERFACE_1310
     * @tc.desc show responsive-spring-motion
     * @tc.level Level 3
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1310', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1310 START");
      await CommonFunc.sleep(6000);
      let strJson: string = getInspectorByKey('SWIPER_INTERFACE_1310');
      let marq: ESObject =JSON.parse(strJson).$attrs.curve;
      expect(marq).assertEqual("responsive-spring-motion(0.500000,0.600000,0.000000)");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1310 END');
      done();
    });
    /**
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1320
     * @tc.name SWIPER_INTERFACE_1320
     * @tc.desc show steps
     * @tc.level Level 3
     * @tc.type Function
     * @tc.size MediumTest
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1320', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1320 START");
      await CommonFunc.sleep(6000);
      let strJson: string = getInspectorByKey('SWIPER_INTERFACE_1320');
      let marq: ESObject =JSON.parse(strJson).$attrs.curve;
      expect(marq).assertEqual("steps(9,end)");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1320 END');
      done();
    });


  })
}