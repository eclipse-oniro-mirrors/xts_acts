/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function interceptSwiperTest() {
  describe('interceptSwiperTest', () => {
    beforeEach(async (done: Function) => {
      console.info("interceptSwiperTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/interceptSwiper",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get interceptSwiperTest state pages:" + JSON.stringify(pages));
        if (!("interceptSwiper" == pages.name)) {
          console.info("get interceptSwiperTest pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push interceptSwiperTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push interceptSwiperTest page error:" + err);
      }
      console.info("interceptSwiperTest beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("interceptSwiperTest after each called");
    });

    /**
     * @tc.name   interceptSwiperTest_0100
     * @tc.number interceptSwiperTest_001
     * @tc.desc   Intercept the behavior of sliding and flipping pages backwards.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('interceptSwiperTest_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[interceptSwiperTest_0100] START');
      await CommonFunc.sleep(1000);
      let swiperList = CommonFunc.getComponentRectOnScreen('swiper_intercept');
      let top = swiperList.top;
      let right = swiperList.right;
      let left = swiperList.left;
      let bottom = swiperList.bottom;
      let height = bottom -top;
      console.info("interceptSwiperTest_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let driver = await Driver.create()
      await driver.swipe(Math.round(right - vp2px(20)),Math.round(top + height/2),Math.round(left + vp2px(20)),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let swiperContent = await driver.findComponent(ON.id('swiper_intercept_text'));
      let text1 = await swiperContent.getText();
      expect(text1).assertEqual('2');
      console.info('[interceptSwiperTest_0100] END');
      done();
    });

    /**
     * @tc.name   interceptSwiperTest_0200
     * @tc.number interceptSwiperTest_002
     * @tc.desc   Do not intercept the behavior of sliding forward to flip pages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('interceptSwiperTest_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[interceptSwiperTest_0200] START');
      await CommonFunc.sleep(1000);
      let swiperList = CommonFunc.getComponentRectOnScreen('swiper_intercept');
      let top = swiperList.top;
      let right = swiperList.right;
      let left = swiperList.left;
      let bottom = swiperList.bottom;
      let height = bottom -top;
      let width = right - left;
      console.info("interceptSwiperTest_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let driver = await Driver.create()
      await driver.swipe(Math.round(left + width*0.3),Math.round(top + height/2),Math.round(right - vp2px(20)),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      let swiperContent = await driver.findComponent(ON.id('swiper_intercept_text'));
      let text1 = await swiperContent.getText();
      expect(text1).assertEqual('1');
      console.info('[interceptSwiperTest_0200] END');
      done();
    });
  })
}