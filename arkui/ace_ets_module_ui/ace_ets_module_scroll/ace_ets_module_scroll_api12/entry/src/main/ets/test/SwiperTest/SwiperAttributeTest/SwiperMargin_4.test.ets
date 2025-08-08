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
import { describe, beforeEach, afterEach, it, expect } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/utils/Common';
import {
  Driver,
  ON,
  Component
} from '@ohos.UiTest';

export default function SwiperMargin_4() {
  describe('SwiperMargin_4', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperMargin_4 beforeEach start");
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperMargin_4 state pages:" + JSON.stringify(pages));
        if (!("SwiperMargin_4" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperMargin_4"
          })
          await CommonFunc.sleep(2000);
          console.info("push SwiperMargin_4 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperMargin_4 page error:" + err);
      }
      console.info("SwiperMargin_4 foreEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperMargin_4 after each called");
    });

    /*
      * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_PREMARIGN_0100
      * @tc.name       : testSwiperPrevMargin_0100
      * @tc.desc       : Increase the front margin of the swiper
      * @tc.level      : Level 0
      * @tc.type       : Function
      * @tc.size       : MediumTest
      */
    it('testSwiperPrevMargin_0100', 0, async (done: Function) => {
      console.info("[testSwiperPrevMargin_0100] START");
      const driver = await Driver.create();
      await CommonFunc.sleep(1000);

      const oldSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const oldPrevMargin:number = oldSwiper.right

      let scrollColumn: Component = await driver.findComponent(ON.type('Scroll'));
      let buttonAdd = await scrollColumn.scrollSearch(ON.id('prevMarginAdd'));
      await CommonFunc.sleep(1000);

      await buttonAdd.doubleClick();
      await CommonFunc.sleep(1000);

      const newSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const newPrevMargin:number = newSwiper.right

      console.info("[testSwiperPrevMargin_0100] prevMarginAdd");
      expect(oldPrevMargin !== newPrevMargin).assertTrue();
      console.info("[testChipDirection_0100] END");
      done();
    });
    /*
      * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_PREMARIGN_0200
      * @tc.name       : testSwiperPrevMargin_0200
      * @tc.desc       : Increase the front margin of the swiper
      * @tc.level      : Level 0
      * @tc.type       : Function
      * @tc.size       : MediumTest
      */
    it('testSwiperPrevMargin_0200', 0, async (done: Function) => {
      console.info("[testSwiperPrevMargin_0200] START");
      const driver = await Driver.create();
      await CommonFunc.sleep(1000);

      const oldSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const oldPrevMargin:number = oldSwiper.left

      let scrollColumn: Component = await driver.findComponent(ON.type('Scroll'));
      let buttonAdd = await scrollColumn.scrollSearch(ON.id('prevMarginDec'));
      await buttonAdd.doubleClick();
      await CommonFunc.sleep(1000);

      const newSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const newPrevMargin:number = newSwiper.left

      console.info("[testSwiperPrevMargin_0200] prevMarginDec");
      expect(oldPrevMargin !== newPrevMargin).assertTrue();
      console.info("[testSwiperPrevMargin_0200] END");
      done();
    });
    /*
      * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_NEXTMARIGN_0100
      * @tc.name       : testSwiperNextMargin_0100
      * @tc.desc       : Increase the front margin of the swiper
      * @tc.level      : Level 0
      * @tc.type       : Function
      * @tc.size       : MediumTest
      */
    it('testSwiperNextMargin_0100', 0, async (done: Function) => {
      console.info("[testSwiperNextMargin_0100] START");
      const driver = await Driver.create();
      await CommonFunc.sleep(1000);

      const oldSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const oldNextMarginAdd:number = oldSwiper.right

      let scrollColumn: Component = await driver.findComponent(ON.type('Scroll'));
      let buttonAdd = await scrollColumn.scrollSearch(ON.id('nextMarginAdd'));
      await buttonAdd.doubleClick();
      await CommonFunc.sleep(1000);

      const newSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const newNextMarginAdd:number = newSwiper.right

      console.info("[testSwiperNextMargin_0100] nextMarginAdd");
      expect(oldNextMarginAdd !== newNextMarginAdd).assertTrue();
      console.info("[testSwiperNextMargin_0100] END");
      done();
    });
    /*
      * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_NEXTMARIGN_0200
      * @tc.name       : testSwiperNextMargin_0200
      * @tc.desc       : Increase the front margin of the swiper
      * @tc.level      : Level 0
      * @tc.type       : Function
      * @tc.size       : MediumTest
      */
    it('testSwiperNextMargin_0200', 0, async (done: Function) => {
      console.info("[testSwiperNextMargin_0200] START");
      const driver = await Driver.create();
      await CommonFunc.sleep(1000);

      const oldSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const oldPrevMargin:number = oldSwiper.left

      let scrollColumn: Component = await driver.findComponent(ON.type('Scroll'));
      let buttonAdd = await scrollColumn.scrollSearch(ON.id('nextMarginDec'));
      await CommonFunc.sleep(1000);

      await buttonAdd.doubleClick();
      await CommonFunc.sleep(1000);

      const newSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const newPrevMargin:number = newSwiper.left

      console.info("[testSwiperNextMargin_0200] nextMarginDec");
      expect(oldPrevMargin !== newPrevMargin).assertTrue();
      console.info("[testSwiperNextMargin_0200] END");
      done();
    });
    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_SHOWNEXT_0100
     * @tc.name       : testSwiperShowNext_0100
     * @tc.desc       : showNext of the swiper
     * @tc.level      : Level 0
     * @tc.type       : Function
     * @tc.size       : MediumTest
     */
    it('testSwiperShowNext_0100', 0, async (done: Function) => {
      console.info("[testSwiperShowNext_0100] START");
      const driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let scrollColumn: Component = await driver.findComponent(ON.type('Scroll'));
      let oldSwiper = await scrollColumn.scrollSearch(ON.id('showNext'));
      await CommonFunc.sleep(1000);
      await oldSwiper.click()

      let swiperText_3 = await driver.findComponent(ON.id("swiperText_3"));
      await CommonFunc.sleep(1000);
      let text = await swiperText_3.getText()

      console.info("[testSwiperShowNext_0100] text", text);
      expect(text === '3').assertTrue();
      console.info("[testSwiperShowNext_0100] END");
      done();
    });
    /*
     * @tc.number     : SUB_ACE_UI_COMPONENT_SCROLL_SWIPER_SHOWPREVIOUS_0100
     * @tc.name       : testSwiperShowPrevious_0100
     * @tc.desc       : showPrevious of the swiper
     * @tc.level      : Level 0
     * @tc.type       : Function
     * @tc.size       : MediumTest
     */
    it('testSwiperShowPrevious_0100', 0, async (done: Function) => {
      console.info("[testSwiperShowPrevious_0100] START");
      const driver = await Driver.create();
      await CommonFunc.sleep(1000);

      let scrollColumn: Component = await driver.findComponent(ON.type('Scroll'));
      let oldSwiper = await scrollColumn.scrollSearch(ON.id('showPrevious'));
      await CommonFunc.sleep(1000);
      await oldSwiper.click()

      let swiperText_2 = await driver.findComponent(ON.id("swiperText_2"));
      await CommonFunc.sleep(1000);
      let text = await swiperText_2.getText()

      console.info("[testSwiperShowPrevious_0100] text", text);
      expect(text === '2').assertTrue();
      console.info("[testSwiperShowPrevious_0100] END");
      done();
    });
  })
}