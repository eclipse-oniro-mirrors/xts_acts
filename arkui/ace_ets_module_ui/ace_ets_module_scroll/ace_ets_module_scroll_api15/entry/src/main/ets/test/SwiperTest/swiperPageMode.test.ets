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

export default function swiperPageMode() {
  describe('swiperPageMode', () => {
    beforeEach(async (done: Function) => {
      console.info("swiperPageMode beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Swiper/swiperPageMode",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get swiperPageMode state pages:" + JSON.stringify(pages));
        if (!("swiperPageMode" == pages.name)) {
          console.info("get swiperPageMode pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push swiperPageMode page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push swiperPageMode page error:" + err);
      }
      console.info("swiperPageMode beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('swiper_PageMode_onChange'));
      await btn.click();
      await CommonFunc.sleep(1500);
      console.info("swiperPageMode after each called");
    });

    /**
     * @tc.number    swiperPageMode_001
     * @tc.name      swiperPageMode_0100
     * @tc.desc      Set mouse scroll wheel single page flipping mode.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('swiperPageMode_0100', Level.LEVEL1, async (done: Function) => {
      console.info('[swiperPageMode_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('swiper_PageMode_single'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('swiper_pageFlipMode');
      console.info("[swiperPageMode_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[swiperPageMode_0100] pageFlipMode1: " + JSON.stringify(JSON.parse(strJson1).$attrs.pageFlipMode));
      await CommonFunc.sleep(1000);
      //expect(JSON.parse(strJson1).$attrs.pageFlipMode).assertEqual("PageFlipMode.SINGLE");

      let swiperList = CommonFunc.getComponentRectOnScreen('swiper_pageFlipMode');
      let left = swiperList.left;
      let right = swiperList.right;
      let top = swiperList.top;
      let bottom = swiperList.bottom;
      let width = right - left;
      let height = bottom - top;
      console.info("swiperPageMode_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.mouseScroll({x:Math.round(left + width/2), y: Math.round(top + height/2)}, true, 1)
      await CommonFunc.sleep(1000);
      let strJson2 = getInspectorByKey('swiper_PageMode_onChange');
      console.info("[swiperPageMode_0100] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[swiperPageMode_0100]: content: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      let num1: number = Math.round(Number(JSON.parse(strJson2).$attrs.content))
      expect(num1 <= 2).assertTrue();
      console.info('[swiperPageMode_0100] END');
      done();
    });

    /**
     * @tc.number    swiperPageMode_002
     * @tc.name      swiperPageMode_0200
     * @tc.desc      Set mouse scroll wheel continuous page flipping mode.
     * @tc.level     Level 3
     * @tc.type
     * @tc.size
     */
    it('swiperPageMode_0200', Level.LEVEL1, async (done: Function) => {
      console.info('[swiperPageMode_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn: Component = await driver.findComponent(ON.id('swiper_PageMode_continuous'));
      await btn.click();
      await CommonFunc.sleep(1500);
      let strJson1 = getInspectorByKey('swiper_pageFlipMode');
      console.info("[swiperPageMode_0200] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      console.info("[swiperPageMode_0200] pageFlipMode2: " + JSON.stringify(JSON.parse(strJson1).$attrs.pageFlipMode));
      await CommonFunc.sleep(1000);
      //expect(JSON.parse(strJson1).$attrs.pageFlipMode).assertEqual("PageFlipMode.CONTINUOUS");

      let swiperList = CommonFunc.getComponentRectOnScreen('swiper_pageFlipMode');
      let left = swiperList.left;
      let right = swiperList.right;
      let top = swiperList.top;
      let bottom = swiperList.bottom;
      let width = right - left;
      let height = bottom - top;
      console.info("swiperPageMode_0100 value is" + left + " --" + right + "--" + top + "--" + bottom);
      await driver.mouseScroll({x:Math.round(left + width/2), y: Math.round(top + height/2)}, true, 3)
      await CommonFunc.sleep(5000);

      let strJson2 = getInspectorByKey('swiper_PageMode_onChange');
      console.info("[swiperPageMode_0200] component obj is: " + JSON.stringify(JSON.parse(strJson2)));
      console.info("[swiperPageMode_0200]: content: " + JSON.stringify(JSON.parse(strJson2).$attrs.content));
      let num1: number = Math.round(Number(JSON.parse(strJson2).$attrs.content))
      expect(num1 > 2).assertTrue();
      console.info('[swiperPageMode_0200] END');
      done();
    });
  })
}