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

export default function SwiperAttribute_8() {
  describe('SwiperAttribute_8', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperAttribute_8 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperAttribute_8 state pages:" + JSON.stringify(pages));
        if (!("SwiperAttribute_8" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperAttribute_8"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperAttribute_8 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperAttribute_8 page error:" + err);
      }
      console.info("SwiperAttribute_8 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAttribute_8 after each called");
    });

    /**
     * @tc.name   SwiperAttribute_0030
     * @tc.number SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_ATTRIBUTE_0030
     * @tc.desc   change parent attribute and set parent margin to 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperAttribute_0030', Level.LEVEL1, async (done: Function) => {
      console.info('[SwiperAttribute_0030] START');

      let rect = CommonFunc.getComponentRectOnScreen('swiperAttribute_8')
      console.info("SwiperAttribute_0030 swiper rect is " + rect.left + " --" + rect.right + "--" + rect.top + "--" +
      rect.bottom);

      let firstColumnRect = CommonFunc.getComponentRectOnScreen('swiperAttribute_801');
      let fTop = firstColumnRect.top;
      let fRight = firstColumnRect.right;
      let fLeft = firstColumnRect.left;
      let fBottom = firstColumnRect.bottom;
      console.info("SwiperAttribute_0030 first column rect is " + fLeft + " --" + fRight + "--" + fTop + "--" + fBottom);

      let firstTextRect = CommonFunc.getComponentRectOnScreen('swiperAttribute_8Text01');
      let ftTop = firstTextRect.top;
      let ftRight = firstTextRect.right;
      let ftLeft = firstTextRect.left;
      let ftBottom = firstTextRect.bottom;
      console.info("SwiperAttribute_0030 first column text rect is " + ftLeft + " --" + ftRight + "--" + ftTop + "--" +
        ftBottom);

      expect(px2vp(Math.abs(Math.round(ftTop - fTop))) - 20 <= 1).assertTrue();
      expect(px2vp(Math.abs(Math.round(ftRight - fRight))) - 20 <= 1).assertTrue();
      expect(px2vp(Math.abs(Math.round(ftLeft - fLeft))) - 20 <= 1).assertTrue();
      expect(px2vp(Math.abs(Math.round(ftBottom - fBottom))) - 20 <= 1).assertTrue();

      let driver = await Driver.create()
      for (let i = 2; i <= 6; i++) {
        await driver.swipe(
          Number.parseInt(`${(rect.right - rect.left) * 0.8 + rect.left}`),
          Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
          Number.parseInt(`${(rect.right - rect.left) * 0.1 + rect.left}`),
          Number.parseInt(`${(rect.bottom - rect.top) * 0.5 + rect.top}`),
          1000);
        await CommonFunc.sleep(1000);
        let columnRect = CommonFunc.getComponentRectOnScreen('swiperAttribute_80' + i);
        console.info("SwiperAttribute_0030 column rect is " + columnRect.left + " --" + columnRect.right + "--" +
        columnRect.top + "--" + columnRect.bottom);
        expect(Math.abs(Math.round(columnRect.top - rect.top)) <= 1).assertTrue();
        expect(Math.abs(Math.round(columnRect.left - rect.left)) <= 1).assertTrue();
      }

      console.info('[SwiperAttribute_0030] END');
      done();
    });

  })
}
