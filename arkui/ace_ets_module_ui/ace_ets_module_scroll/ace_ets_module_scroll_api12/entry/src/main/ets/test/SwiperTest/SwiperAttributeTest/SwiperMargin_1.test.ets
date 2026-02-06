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

export default function SwiperMargin_1() {
  describe('SwiperMargin_1', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperMargin_1 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperMargin_1 state pages:" + JSON.stringify(pages));
        if (!("SwiperMargin_1" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperMargin_1"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperMargin_1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperMargin_1 page error:" + err);
      }
      console.info("SwiperMargin_1 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperMargin_1 after each called");
    });

    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARIGN_0070
     * @tc.name       : SwiperMargin_0070
     * @tc.desc       : set ignoreBlank of prevMargin to false when loop is false and displaymode is stretch
     * @tc.level      : Level 1
     * @tc.type       : Function
     * @tc.size       :
     */
    it('SwiperMargin_0070', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperMargin_0070] START');

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_1');
      let swiperLeft = swiperRect.left;

      let textRect = CommonFunc.getComponentRect('swiperMargin_1Column01');
      let textLeft = textRect.left;

      let spaceMargin = swiperLeft - textLeft;
      console.info("[SwiperMargin_0070] The spaceMargin value is " + spaceMargin);
      expect(Math.abs(Math.round(swiperLeft - textLeft)) - vp2px(10) <= 1).assertTrue();
      console.info('[SwiperMargin_0070] END');
      done();
    });

    /*
    * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARIGN_0200
    * @tc.name       : SwiperMargin_0200
    * @tc.desc       : set ignoreBlank of nextMargin to false when loop is false and displaymode is stretch
    * @tc.level      : Level 1
    * @tc.type       : Function
    * @tc.size       :
    */
    it('SwiperMargin_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperMargin_0200] START');

      let rect = CommonFunc.getComponentRectOnScreen('swiperMargin_1')
      console.info("SwiperMargin_0200 swiper rect is " + rect.left + " --" + rect.right + "--" + rect.top + "--" +
      rect.bottom);
      let driver = await Driver.create()
      await driver.swipe(
        Number.parseInt(`${(rect.right - rect.left) * 0.8 + rect.left}`),
        Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
        Number.parseInt(`${(rect.right - rect.left) * 0.1 + rect.left}`),
        Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
        1000);
      await CommonFunc.sleep(1000);

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_1');
      let swiperRight = swiperRect.right;

      let columnRect = CommonFunc.getComponentRect('swiperMargin_1Column02');
      let columnLeft = columnRect.right;

      let spaceMargin = swiperRight - columnLeft;
      console.info("[SwiperMargin_0200] The spaceMargin value is " + JSON.stringify(spaceMargin));
      expect(Math.abs(Math.round(spaceMargin)) - vp2px(20) <= 1).assertTrue();

      console.info('[SwiperMargin_0200] END');
      done();
    });

  })
}
