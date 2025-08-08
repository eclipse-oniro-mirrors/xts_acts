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
import {
  UiComponent,
  Driver,
  Component,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/utils/Common';

export default function SwiperInterface01() {
  describe('SwiperInterface01', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperInterface01 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperInterface01 state pages:" + JSON.stringify(pages));
        if (!("SwiperInterface01" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: 'MainAbility/pages/Swiper/SwiperInterface/SwiperInterface'
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperInterface01 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperInterface01 page error:" + err);
      }
      console.info("SwiperInterface01 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperInterface01 after each called");
    });

    /**
     * @tc.number SWIPER_INTERFACE_1070
     * @tc.name step
     * @tc.desc interval
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1070', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1070 START");
      await CommonFunc.sleep(5000);
      let strJson2: string = getInspectorByKey('swiperinterface1070');
      let marq: ESObject = JSON.parse(strJson2).$attrs.interval;
      expect(marq).assertEqual("3000");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1070 END');
      done();
    });


    /**
     * @tc.number SWIPER_INTERFACE_1090
     * @tc.name step
     * @tc.desc interval
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1090', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1090 START");
      await CommonFunc.sleep(5000);
      let strJson2: string = getInspectorByKey('swiperinterface1090');
      let marq: ESObject = JSON.parse(strJson2).$attrs.interval;
      expect(marq).assertEqual("3000");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1090 END');
      done();
    });

    /**
     * @tc.number SWIPER_INTERFACE_1110
     * @tc.name step
     * @tc.desc interval
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1110', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1110 START");
      await CommonFunc.sleep(6000);
      let strJson2: string = getInspectorByKey('swiperinterface1110');
      let marq: ESObject = JSON.parse(strJson2).$attrs.interval;
      expect(marq).assertEqual("5000");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1110 END');
      done();
    });


  })
}