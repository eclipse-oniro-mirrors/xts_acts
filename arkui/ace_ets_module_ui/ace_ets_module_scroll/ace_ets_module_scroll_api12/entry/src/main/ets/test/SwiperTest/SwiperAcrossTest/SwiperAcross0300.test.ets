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

export default function SwiperAcross0300() {
  describe('SwiperAcross0300', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperAcross0300 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperAcross0300 state pages:" + JSON.stringify(pages));
        if (!("SwiperAcross0300" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAcross/SwiperAcross0300"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperAcross0300 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperAcross0300 page error:" + err);
      }
      console.info("SwiperAcross0300 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAcross0300 after each called");
    });

    /**
     * @tc.number SWIPER_ACROSS_0300
     * @tc.name step
     * @tc.desc change
     * @tc.level Level 1
     * @tc.type
     * @tc.size
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0300', 0, async (done: Function) => {
      console.info("SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0300 START");
      await CommonFunc.sleep(3000);
      let driver: Driver = Driver.create();
      let btn = await driver.findComponent(ON.id('btnswiper_across0030'));
      await btn.click();
      let swiperArrow = await driver.findComponent(ON.id("swiperacr_0030"));
      let point2 = await swiperArrow.getBoundsCenter();
      await driver.fling({
        x: point2.x + 200, y: point2.y
      }, {
        x: point2.x - 210, y: point2.y
      }, 5, 5000);
      await CommonFunc.sleep(1000);
      let strJson2: string = getInspectorByKey('swiper_across_0300');
      let marq2: ESObject = JSON.parse(strJson2).$attrs.content;
      expect(marq2).assertEqual("6");
      await CommonFunc.sleep(1000);
      console.info('SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ACROSS_0300 END');
      done();
    });

  })
}