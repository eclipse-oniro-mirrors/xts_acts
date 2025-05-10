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

export default function SwiperMirroring0010() {
    describe('SwiperMirroring0010', () => {
      beforeEach(async (done: Function) => {
        console.info("SwiperMirroring0010 beforeEach start");
        try {
          router.clear();
          let pages = router.getState();
          console.info("get SwiperMirroring0010 state pages:" + JSON.stringify(pages));
          if (!("SwiperMirroring0010" == pages.name)) {
            console.info("get Context pages.name:" + JSON.stringify(pages.name));
            let result = await router.pushUrl({
              url: 'MainAbility/pages/Swiper/SwiperMirroring/SwiperMirroring0010'
            })
            await CommonFunc.sleep(2000);
            console.info("push SwiperMirroring0010 page result:" + JSON.stringify(result));
          }
        } catch (err) {
          console.error("push SwiperMirroring0010 page error:" + err);
        }
        console.info("SwiperMirroring0010 foreEach end");
        done();
      });
      afterEach(async () => {
        await CommonFunc.sleep(1000);
        console.info("SwiperMirroring0010 after each called");
      });

    /**
     * @tc.number SWIPER_MIRRORING_0010
     * @tc.name step
     * @tc.desc interval
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MIRRORING_0010', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MIRRORING_0010 START");
      await CommonFunc.sleep(5000);
      let strJson2: string = getInspectorByKey('swiper_mirroring_0010');
      let marq: ESObject =JSON.parse(strJson2).$attrs.content;
      expect(marq).assertEqual("onChange");
      let strJson: string = getInspectorByKey('swipermirroring0010');
      let marq2: ESObject =JSON.parse(strJson).$attrs.interval;
      expect(marq2).assertEqual("1000");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MIRRORING_0010 END');
      done();
    });


    /**
     * @tc.number SWIPER_MIRRORING_0310
     * @tc.name step
     * @tc.desc interval
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MIRRORING_0310', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MIRRORING_0310 START");
      await CommonFunc.sleep(5000);
      let strJson2: string = getInspectorByKey('swiper_mirroring_0310');
      let marq: ESObject =JSON.parse(strJson2).$attrs.content;
      expect(marq).assertEqual("onChange");
      let strJson: string = getInspectorByKey('swipermirroring0310');
      let marq2: ESObject =JSON.parse(strJson).$attrs.interval;
      expect(marq2).assertEqual("1000");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MIRRORING_0310 END');
      done();
    });

  })
}