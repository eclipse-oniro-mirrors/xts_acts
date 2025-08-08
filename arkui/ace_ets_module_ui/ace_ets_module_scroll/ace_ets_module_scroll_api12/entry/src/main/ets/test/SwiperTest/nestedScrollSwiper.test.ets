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
import { Driver, Component, UiWindow, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';
import events_emitter from '@ohos.events.emitter';

export default function nestedScrollSwiper() {
  describe('nestedScrollSwiper', () => {
    beforeEach(async (done: Function) => {
      console.info("nestedScrollSwiper beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/nestedScrollSwiper",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get nestedScrollSwiper state pages:" + JSON.stringify(pages));
        if (!("nestedScrollSwiper" == pages.name)) {
          console.info("get nestedScrollSwiper pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push nestedScrollSwiper page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push nestedScrollSwiper page error:" + err);
      }
      console.info("nestedScrollSwiper beforeEach end");
      done();
    });

    /**
     * @tc.number    nestedScrollSwiper_001
     * @tc.name      nestedScrollSwiper_0100
     * @tc.desc      NestdScroll setting SELF_ONLY.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('nestedScrollSwiper_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[nestedScrollSwiper_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('swiper_nestedScroll_1');
      console.info("[nestedScrollSwiper_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[nestedScrollSwiper_0100] nestedScroll: " + JSON.stringify(JSON.parse(strJson).$attrs.nestedScroll));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      await driver.assertComponentExist(ON.text('2'));
      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('false');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.nestedScroll).assertEqual('SwiperNestedScrollMode.SELF_ONLY');

      let swiperScroll = CommonFunc.getComponentRectOnScreen('swiper_nestedScroll_1');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("nestedScrollSwiper_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.1),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('3'));

      console.info('[nestedScrollSwiper_0100] END');
      done();
    });

    /**
     * @tc.number    nestedScrollSwiper_002
     * @tc.name      nestedScrollSwiper_0200
     * @tc.desc      NestdScroll setting SELF_FIRST.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('nestedScrollSwiper_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[nestedScrollSwiper_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let strJson = getInspectorByKey('swiper_nestedScroll_2');
      console.info("[nestedScrollSwiper_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[nestedScrollSwiper_0200] nestedScroll: " + JSON.stringify(JSON.parse(strJson).$attrs.nestedScroll));
      await CommonFunc.sleep(1000);
      expect(JSON.parse(strJson).$type).assertEqual('Swiper');
      await driver.assertComponentExist(ON.text('2'));
      expect(JSON.parse(strJson).$attrs.autoPlay).assertEqual('false');
      expect(JSON.parse(strJson).$attrs.loop).assertEqual('true');
      expect(JSON.parse(strJson).$attrs.nestedScroll).assertEqual('SwiperNestedScrollMode.SELF_FIRST');

      let swiperScroll = CommonFunc.getComponentRectOnScreen('swiper_nestedScroll_2');
      let top = swiperScroll.top;
      let right = swiperScroll.right;
      let left = swiperScroll.left;
      let bottom = swiperScroll.bottom;
      console.info("nestedScrollSwiper_0200 value is" + left + " --" + right + "--" + top + "--" + bottom);
      let height = bottom -top;
      let width = right - left;
      await CommonFunc.sleep(1000);
      await driver.swipe(Math.round(left + width*0.8),Math.round(top + height/2),Math.round(left + width*0.1),Math.round(top + height/2));
      await CommonFunc.sleep(2000);
      await driver.assertComponentExist(ON.text('3'));

      console.info('[nestedScrollSwiper_0200] END');
      done();
    });
  })
}
