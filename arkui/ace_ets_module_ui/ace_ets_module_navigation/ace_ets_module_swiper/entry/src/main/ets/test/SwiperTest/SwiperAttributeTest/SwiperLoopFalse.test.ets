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

export default function SwiperLoopFalse() {
  describe('SwiperLoopFalse', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperLoopFalse beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperLoopFalse state pages:" + JSON.stringify(pages));
        if (!("SwiperLoopFalse" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperLoopFalse"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperLoopFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperLoopFalse page error:" + err);
      }
      console.info("SwiperLoopFalse foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperLoopFalse after each called");
    });

    /**
     * @tc.name   SwiperLoopFalse_3400
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_INTERFACE_3400
     * @tc.desc   set autoPlay and loop to true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperLoopFalse_3400', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperLoopFalse_3400] START');

      let strJson = getInspectorByKey('swiperLoopFalse');
      console.info("[SwiperLoopFalse_3400] The loop value is " + JSON.stringify(JSON.parse(strJson).$attrs.loop));
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('false');

      console.info('[SwiperLoopFalse_3400] END');
      done();
    });

  })
}
