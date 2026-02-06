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

export default function SwiperMargin() {
  describe('SwiperDisplayCount', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperDisplayCount beforeEach start");
      try {
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get SwiperDisplayCount state pages:" + JSON.stringify(pages));
        if (!("SwiperDisplayCount" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperDisplayCount"
          })
          console.info("push SwiperDisplayCount page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperDisplayCount page error:" + err);
      }
      console.info("SwiperDisplayCount foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperDisplayCount after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_DISPLAYCOUNT_0160
     * @tc.name       : SwiperDisplayCount_0160
     * @tc.desc       : set autoPlay and loop to true
     * @tc.level      : Level 1
     * @tc.type       : Function
     * @tc.size       :
     */
    it('SwiperDisplayCount_0160', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperDisplayCount_0160] START');

      let strJson = getInspectorByKey('swiperDisplayCount');
      console.info("[SwiperDisplayCount_0160] The autoPlay value is " + JSON.stringify(JSON.parse(strJson).$attrs.autoPlay));
      console.info("[SwiperDisplayCount_0160] The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');

      console.info('[SwiperDisplayCount_0160] END');
      done();
    });

  })
}
