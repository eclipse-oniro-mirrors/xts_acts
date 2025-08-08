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
import CommonFunc from '../../../MainAbility/utils/Common';
import {
  Component,
  Driver,
  MouseButton,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import text from "@ohos.graphics.text"

export default function SwiperAutoPlay_2() {
  describe('SwiperAutoPlay_2', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperAutoPlay_2 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperAutoPlay_2 state pages:" + JSON.stringify(pages));
        if (!("SwiperAutoPlay_2" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperAutoPlay_2"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperAutoPlay_2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperAutoPlay_2 page error:" + err);
      }
      console.info("SwiperAutoPlay_2 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAutoPlay_2 after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_1130
     * @tc.name       : SwiperAutoPlay_1130
     * @tc.desc       : set autoPlay to false
     * @tc.level      : Level 0
     * @tc.type       : Function
     * @tc.size       :
     */
    it('SwiperAutoPlay_1130', 0, async (done: Function) => {
      console.info('[SwiperAutoPlay_1130] START');

      let strJson = getInspectorByKey('swiperAutoPlay_2');
      console.info("[SwiperAutoPlay_1130] The autoPlay value is " + JSON.stringify(JSON.parse(strJson).$attrs.autoPlay));
      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('true');

      console.info('[SwiperAutoPlay_1130] END');
      done();
    });
  })
}
