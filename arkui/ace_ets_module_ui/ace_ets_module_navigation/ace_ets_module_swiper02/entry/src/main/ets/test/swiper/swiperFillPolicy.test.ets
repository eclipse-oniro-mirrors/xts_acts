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
import events_emitter from '@ohos.events.emitter';

export default function swiperFillPolicy() {
  describe('swiperFillPolicy', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperFillPolicy beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/swiper/swiperFillPolicy",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperFillPolicy state pages:" + JSON.stringify(pages));
        if (!("swiperFillPolicy" == pages.name)) {
          console.info("get swiperFillPolicy pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperFillPolicy page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperFillPolicy page error:" + err);
      }
      console.info("swiperFillPolicy beforeEach end");
      done();
    });

    /**
     * @tc.name   swiperFillPolicy_0100
     * @tc.number swiperFillPolicy_001
     * @tc.desc   Display 1 column when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperFillPolicy_0100', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperFillPolicy_0100] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('swiper_fillType_0'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('swiper_fillType_text');
      console.info("[swiperFillPolicy_0100] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 0");

      let swiper = CommonFunc.getComponentRectOnScreen('swiper_fillType');
      let swiperW = swiper.right - swiper.left
      console.info('[swiperFillPolicy_0100] swiper width: ' + swiperW);
      let swiper1 = CommonFunc.getComponentRectOnScreen('swiperType_1');
      let swiperW1 = swiper1.right - swiper1.left
      console.info('[swiperFillPolicy_0100] swiper1 width: ' + swiperW1);
      await CommonFunc.sleep(500);
      expect(Math.floor(Math.abs(swiperW - swiperW1)) <= 1 ).assertTrue();
      console.info('[swiperFillPolicy_0100] END');
      done();
    });

    /**
     * @tc.name   swiperFillPolicy_0200
     * @tc.number swiperFillPolicy_002
     * @tc.desc   Display 1 column when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperFillPolicy_0200', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperFillPolicy_0200] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('swiper_fillType_1'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('swiper_fillType_text');
      console.info("[swiperFillPolicy_0200] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 1");

      let swiper = CommonFunc.getComponentRectOnScreen('swiper_fillType');
      let swiperW = swiper.right - swiper.left
      console.info('[swiperFillPolicy_0200] swiper width: ' + swiperW);
      let swiper1 = CommonFunc.getComponentRectOnScreen('swiperType_1');
      let swiperW1 = swiper1.right - swiper1.left
      console.info('[swiperFillPolicy_0200] swiper1 width: ' + swiperW1);
      await CommonFunc.sleep(500);
      expect(Math.floor(Math.abs(swiperW - swiperW1)) <= 1 ).assertTrue();
      console.info('[swiperFillPolicy_0200] END');
      done();
    });

    /**
     * @tc.name   swiperFillPolicy_0300
     * @tc.number swiperFillPolicy_003
     * @tc.desc   Display 2 columns when the width of the component belongs to sm and smaller breakpoint intervals.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('swiperFillPolicy_0300', Level.LEVEL3, async (done: Function) => {
      console.info('[swiperFillPolicy_0300] START');
      await CommonFunc.sleep(1000);
      let driver = await Driver.create()
      let btn: Component = await driver.findComponent(ON.id('swiper_fillType_2'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('swiper_fillType_text');
      console.info("[swiperFillPolicy_0300] content: " + JSON.stringify(JSON.parse(strJson1).$attrs.content));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual("ItemFillPolicy: 2");

      let swiper1 = CommonFunc.getComponentRectOnScreen('swiperType_1');
      console.info('[swiperFillPolicy_0300] swiper1.right: ' + swiper1.right);
      let swiper2 = CommonFunc.getComponentRectOnScreen('swiperType_2');
      console.info('[swiperFillPolicy_0300] swiper2.left: ' + swiper2.left);
      await CommonFunc.sleep(500);
      expect(Math.floor(Math.abs(swiper2.left - swiper1.right)) <= 1 ).assertTrue();
      console.info('[swiperFillPolicy_0300] END');
      done();
    });
  })
}
