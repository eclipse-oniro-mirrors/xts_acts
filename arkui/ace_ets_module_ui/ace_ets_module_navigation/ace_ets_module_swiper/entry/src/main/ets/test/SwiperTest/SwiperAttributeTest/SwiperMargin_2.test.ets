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

export default function SwiperMargin_2() {
  describe('SwiperMargin_2', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperMargin_2 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperMargin_2 state pages:" + JSON.stringify(pages));
        if (!("SwiperMargin_2" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperMargin_2"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperMargin_2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperMargin_2 page error:" + err);
      }
      console.info("SwiperMargin_2 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperMargin_2 after each called");
    });

    /**
     * @tc.name   SwiperMargin_0040
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARIGN_0040
     * @tc.desc   set ignoreBlank of prevMargin to true when loop is false and displaymode is stretch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMargin_0040', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperMargin_0040] START');

      let strJson = getInspectorByKey('swiperMargin_2');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SwiperMargin_0040] component obj is: " + JSON.stringify(obj));

      console.info("[SwiperMargin_0040] The prevMargin value is " + JSON.stringify(obj.$attrs.prevMargin));
      expect(obj.$attrs.prevMargin).assertEqual('10.00vp');

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_2');
      let swiperRight = swiperRect.right;

      let textRect = CommonFunc.getComponentRect('swiperMargin_2Column01');
      let textRight = textRect.right;

      let spaceMargin = swiperRight - textRight;
      console.info("[SwiperMargin_0040] The spaceMargin value is " + spaceMargin);
      console.info("[SwiperMargin_0040] The vp2px value is " + vp2px(30));
      expect(Math.abs(Math.round(spaceMargin)) - vp2px(30) <= 1).assertTrue();
      console.info('[SwiperMargin_0040] END');
      done();
    });

    /**
     * @tc.name   SwiperMargin_0170
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARIGN_0170
     * @tc.desc   set ignoreBlank of nextMargin to true when loop is false and displaymode is stretch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMargin_0170', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperMargin_0170] START');
      let rect = CommonFunc.getComponentRectOnScreen('swiperMargin_2')
      console.info("SwiperMargin_0170 swiper rect is " + rect.left + " --" + rect.right + "--" + rect.top + "--" +
      rect.bottom);
      let driver = await Driver.create()
      await driver.swipe(
        Number.parseInt(`${(rect.right - rect.left) * 0.8 + rect.left}`),
        Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
        Number.parseInt(`${(rect.right - rect.left) * 0.1 + rect.left}`),
        Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
        1000);
      await CommonFunc.sleep(1000);

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_2');
      let swiperLeft = swiperRect.left;

      let textRect = CommonFunc.getComponentRect('swiperMargin_2Column02');
      let textLeft = textRect.left;

      let spaceMargin = swiperLeft - textLeft;
      console.info("[SwiperMargin_0170] The spaceMargin value is " + spaceMargin);
      expect(Math.abs(Math.round(spaceMargin)) - vp2px(30) <= 1).assertTrue();

      console.info('[SwiperMargin_0170] END');
      done();
    });

  })
}
