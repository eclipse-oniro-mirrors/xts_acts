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
import {UiComponent, Driver, Component, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/utils/Common';

export default function SwiperInterface1570() {
  describe('SwiperInterface1570', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperInterface1570 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperInterface1570 state pages:" + JSON.stringify(pages));
        if (!("SwiperInterface1570" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperInterface/SwiperInterface1570'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperInterface1570 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperInterface1570 page error:" + err);
      }
      console.info("SwiperInterface1570 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperInterface1570 after each called");
    });

    /**
     * @tc.number SWIPER_INTERFACE_1570
     * @tc.name step
     * @tc.desc interval
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1570', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1070 START");
      await CommonFunc.sleep(6000);
      let strJson2: string = getInspectorByKey('swiperinterface1570');
      let marq: ESObject =JSON.parse(strJson2).$attrs.duration;
      expect(marq).assertEqual("400");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1070 END');
      done();
    });

    /**
     * @tc.number SWIPER_INTERFACE_1580
     * @tc.name step
     * @tc.desc interval
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1580', Level.LEVEL1, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1580 START");
      await CommonFunc.sleep(6000);
      let strJson2: string = getInspectorByKey('swiperinterface1580');
      let marq: ESObject =JSON.parse(strJson2).$attrs.duration;
      expect(marq).assertEqual("0");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1580 END');
      done();
    });

  })
}