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

export default function SwiperAttribute_5() {
  describe('SwiperAttribute_5', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperAttribute_5 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperAttribute_5 state pages:" + JSON.stringify(pages));
        if (!("SwiperAttribute_5" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperAttribute_5"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperAttribute_5 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperAttribute_5 page error:" + err);
      }
      console.info("SwiperAttribute_5 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAttribute_5 after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ATTRIBUTE_0050
     * @tc.name       : SwiperAttribute_0050
     * @tc.desc       : change parent attribute and set parent margin to 20
     * @tc.level      : Level 1
     * @tc.type       : Function
     * @tc.size       :
     */
    it('SwiperAttribute_0050', 0, async (done: Function) => {
      console.info('[SwiperAttribute_0050] START');

      let driver = await Driver.create()
      await driver.assertComponentExist(ON.text('1'))

      let rect = CommonFunc.getComponentRectOnScreen('swiperAttribute_5')
      console.info("SwiperAttribute_0050 swiper rect is " + rect.left + " --" + rect.right + "--" + rect.top + "--" +
      rect.bottom);
      for (let i = 1; i <= 6; i++) {
        if (i > 1) {
          await driver.swipe(
            Number.parseInt(`${(rect.right - rect.left) * 0.8 + rect.left}`),
            Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
            Number.parseInt(`${(rect.right - rect.left) * 0.1 + rect.left}`),
            Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
            1000);
          await CommonFunc.sleep(1000);
        }
        let columnRect = CommonFunc.getComponentRectOnScreen('swiperAttribute_50' + i);
        console.info("SwiperAttribute_0050 column rect is " + columnRect.left + " --" + columnRect.right + "--" +
        columnRect.top + "--" + columnRect.bottom);

        expect(Math.abs(Math.round(columnRect.top - rect.top)) <= 1).assertTrue();
        expect(Math.abs(Math.round(columnRect.right - rect.right)) <= 1).assertTrue();
        expect(Math.abs(Math.round(columnRect.left - rect.left)) <= 1).assertTrue();
        expect(Math.abs(Math.round(columnRect.bottom - rect.bottom)) <= 1).assertTrue();
      }

      console.info('[SwiperAttribute_0050] END');
      done();
    });

  })
}
