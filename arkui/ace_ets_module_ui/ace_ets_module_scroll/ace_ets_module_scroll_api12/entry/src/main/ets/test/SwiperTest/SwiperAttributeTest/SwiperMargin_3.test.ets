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

export default function SwiperMargin_3() {
  describe('SwiperMargin_3', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperMargin_3 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperMargin_3 state pages:" + JSON.stringify(pages));
        if (!("SwiperMargin_3" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperMargin_3"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperMargin_3 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperMargin_3 page error:" + err);
      }
      console.info("SwiperMargin_3 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperMargin_3 after each called");
    });

    /**
     * @tc.name   SwiperMargin_0060
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARIGN_0060
     * @tc.desc   set ignoreBlank of prevMargin to true when loop is true and displaymode is stretch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMargin_0060', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperMargin_0060] START');

      let strJson = getInspectorByKey('swiperMargin_3');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SwiperMargin_0060] component obj is: " + JSON.stringify(obj));

      console.info("[SwiperMargin_0060] The prevMargin value is " + JSON.stringify(obj.$attrs.prevMargin));
      console.info("[SwiperMargin_0060] The nextMargin value is " + JSON.stringify(obj.$attrs.nextMargin));
      expect(obj.$attrs.prevMargin).assertEqual('10.00vp');
      expect(obj.$attrs.nextMargin).assertEqual('20.00vp');

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_3');
      let swiperLeft = swiperRect.left;
      let swiperRight = swiperRect.right;

      let textRect = CommonFunc.getComponentRect('swiperMargin_3Column01');
      let textLeft = textRect.left;
      let textRight = textRect.right;

      let leftSpaceMargin = swiperLeft - textLeft;
      let rightSpaceMargin = swiperRight - textRight;
      console.info("[SwiperMargin_0060] The leftSpaceMargin value is " + leftSpaceMargin);
      console.info("[SwiperMargin_0060] The rightSpaceMargin value is " + rightSpaceMargin);
      expect(Math.abs(Math.round(leftSpaceMargin)) - vp2px(10) <= 1).assertTrue();
      expect(Math.abs(Math.round(rightSpaceMargin)) - vp2px(20) <= 1).assertTrue();
      console.info('[SwiperMargin_0060] END');
      done();
    });

    /**
     * @tc.name   SwiperMargin_0190
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_MARIGN_0190
     * @tc.desc   set ignoreBlank of nextMargin to true when loop is true and displaymode is stretch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMargin_0190', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperMargin_0190] START');

      let strJson = getInspectorByKey('swiperMargin_3');
      let obj: ESObject = JSON.parse(strJson);

      console.info("[SwiperMargin_0190] The prevMargin value is " + JSON.stringify(obj.$attrs.prevMargin));
      console.info("[SwiperMargin_0190] The nextMargin value is " + JSON.stringify(obj.$attrs.nextMargin));
      expect(obj.$attrs.prevMargin).assertEqual('10.00vp');
      expect(obj.$attrs.nextMargin).assertEqual('20.00vp');

      let rect = CommonFunc.getComponentRectOnScreen('swiperMargin_3')
      console.info("SwiperAttribute_0080 swiper rect is " + rect.left + " --" + rect.right + "--" + rect.top + "--" +
      rect.bottom);
      let driver = await Driver.create()
      await driver.swipe(
        Number.parseInt(`${(rect.right - rect.left) * 0.8 + rect.left}`),
        Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
        Number.parseInt(`${(rect.right - rect.left) * 0.1 + rect.left}`),
        Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
        1000);
      await CommonFunc.sleep(1000);

      let swiperRect = CommonFunc.getComponentRect('swiperMargin_3');
      let swiperRight = swiperRect.right;

      let textRect = CommonFunc.getComponentRect('swiperMargin_3Column02');
      let textRight = textRect.right;

      let spaceMargin = swiperRight - textRight;
      console.info("[SwiperMargin_0190] The spaceMargin value is " + JSON.stringify(spaceMargin));
      expect(Math.abs(Math.round(spaceMargin)) - vp2px(20) <= 1).assertTrue();

      console.info('[SwiperMargin_0190] END');
      done();
    });
  })
}
