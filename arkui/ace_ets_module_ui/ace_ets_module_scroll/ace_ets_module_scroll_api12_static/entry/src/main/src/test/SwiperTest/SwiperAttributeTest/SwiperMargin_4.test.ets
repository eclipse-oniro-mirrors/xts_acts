'use static';
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, afterAll, Level } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { Driver, ON, Component } from '@ohos.UiTest';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test'

let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function SwiperMargin_4() {
  describe('SwiperMargin_4', () => {
    beforeAll(() => {
      await UtilsTest.startAbility("com.arkui.ace.scroll12.static", "EntryAbility")
      
    });
    beforeEach(async (): Promise<void> => {
      console.info("SwiperMargin_4 beforeEach start");
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get SwiperMargin_4 state pages:" + JSON.stringify(pages));
        if (!("SwiperMargin_4" == pages.name)) {
          console.info("get Context pages.name:" + JSON.stringify(pages.name));
          router.pushUrl({
            url: "MainAbility/pages/Swiper/SwiperAttribute/SwiperMargin_4"
          })
        }
      } catch (err) {
        console.error("push SwiperMargin_4 page error:" + err);
      }
      console.info("SwiperMargin_4 foreEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperMargin_4 after each called");
    });



    
    /**
     * @tc.number   testSwiperPrevMargin_static_0100
     * @tc.name     testSwiperPrevMargin_static_0100
     * @tc.desc     testSwiperPrevMargin_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testSwiperPrevMargin_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testSwiperPrevMargin_static_0100] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);

      const oldSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const oldPrevMargin: number = oldSwiper.right

      let scrollColumn = await driver.findComponent(ON.type('Scroll'));
      let buttonAdd = await (scrollColumn?.scrollSearch(ON.id('prevMarginAdd')) as Promise<Component | null>);
      await CommonFunc.sleep(1000);

      await (buttonAdd?.doubleClick() as Promise<void>);
      await CommonFunc.sleep(1000);

      const newSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const newPrevMargin: number = newSwiper.right

      console.info("[testSwiperPrevMargin_static_0100] prevMarginAdd");
      expect(oldPrevMargin !== newPrevMargin).assertTrue();
      console.info("[testChipDirection_static_0100] END");
      done();
    });


    
    /**
     * @tc.number   testSwiperPrevMargin_static_0200
     * @tc.name     testSwiperPrevMargin_static_0200
     * @tc.desc     testSwiperPrevMargin_static_0200
     * @tc.level    Level.LEVEL0
     */
it('testSwiperPrevMargin_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testSwiperPrevMargin_static_0200] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);

      const oldSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const oldPrevMargin: number = oldSwiper.left

      let scrollColumn = await driver.findComponent(ON.type('Scroll'));
      let buttonAdd = await (scrollColumn?.scrollSearch(ON.id('prevMarginDec')) as Promise<Component | null>);
      await (buttonAdd?.doubleClick() as Promise<void>);
      await CommonFunc.sleep(1000);

      const newSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const newPrevMargin: number = newSwiper.left

      console.info("[testSwiperPrevMargin_static_0200] prevMarginDec");
      expect(oldPrevMargin !== newPrevMargin).assertTrue();
      console.info("[testSwiperPrevMargin_static_0200] END");
      done();
    });


    
    /**
     * @tc.number   testSwiperNextMargin_static_0100
     * @tc.name     testSwiperNextMargin_static_0100
     * @tc.desc     testSwiperNextMargin_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testSwiperNextMargin_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testSwiperNextMargin_static_0100] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);

      const oldSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const oldNextMarginAdd: number = oldSwiper.right

      let scrollColumn = await driver.findComponent(ON.type('Scroll'));
      let buttonAdd = await (scrollColumn?.scrollSearch(ON.id('nextMarginAdd')) as Promise<Component | null>);
      await (buttonAdd?.doubleClick() as Promise<void>);
      await CommonFunc.sleep(1000);

      const newSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const newNextMarginAdd: number = newSwiper.right

      console.info("[testSwiperNextMargin_static_0100] nextMarginAdd");
      expect(oldNextMarginAdd !== newNextMarginAdd).assertTrue();
      console.info("[testSwiperNextMargin_static_0100] END");
      done();
    });


    
    /**
     * @tc.number   testSwiperNextMargin_static_0200
     * @tc.name     testSwiperNextMargin_static_0200
     * @tc.desc     testSwiperNextMargin_static_0200
     * @tc.level    Level.LEVEL0
     */
it('testSwiperNextMargin_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testSwiperNextMargin_static_0200] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);

      const oldSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const oldPrevMargin: number = oldSwiper.left

      let scrollColumn = await driver.findComponent(ON.type('Scroll'));
      let buttonAdd = await (scrollColumn?.scrollSearch(ON.id('nextMarginDec')) as Promise<Component | null>);
      await CommonFunc.sleep(1000);

      await (buttonAdd?.doubleClick() as Promise<void>);
      await CommonFunc.sleep(1000);

      const newSwiper = CommonFunc.getComponentRectOnScreen('swiper');
      await CommonFunc.sleep(1000);
      const newPrevMargin: number = newSwiper.left

      console.info("[testSwiperNextMargin_static_0200] nextMarginDec");
      expect(oldPrevMargin !== newPrevMargin).assertTrue();
      console.info("[testSwiperNextMargin_static_0200] END");
      done();
    });


    
    /**
     * @tc.number   testSwiperShowNext_static_0100
     * @tc.name     testSwiperShowNext_static_0100
     * @tc.desc     testSwiperShowNext_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testSwiperShowNext_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testSwiperShowNext_static_0100] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);

      let scrollColumn = await driver.findComponent(ON.type('Scroll'));
      let oldSwiper = await (scrollColumn?.scrollSearch(ON.id('showNext')) as Promise<Component | null>);
      await CommonFunc.sleep(1000);
      await (oldSwiper?.click() as Promise<void>)

      let swiperText_3 = await driver.findComponent(ON.id("swiperText_3"));
      await CommonFunc.sleep(1000);
      let text = await (swiperText_3?.getText() as Promise<string>)

      console.info("[testSwiperShowNext_static_0100] text", text);
      expect(text === '3').assertTrue();
      console.info("[testSwiperShowNext_static_0100] END");
      done();
    });


    
    /**
     * @tc.number   testSwiperShowPrevious_static_0100
     * @tc.name     testSwiperShowPrevious_static_0100
     * @tc.desc     testSwiperShowPrevious_static_0100
     * @tc.level    Level.LEVEL0
     */
it('testSwiperShowPrevious_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("[testSwiperShowPrevious_static_0100] START");
      const driver = Driver.create();
      await CommonFunc.sleep(1000);

      let scrollColumn = await driver.findComponent(ON.type('Scroll'));
      let oldSwiper = await (scrollColumn?.scrollSearch(ON.id('showPrevious')) as Promise<Component | null>);
      await CommonFunc.sleep(1000);
      await (oldSwiper?.click() as Promise<void>)

      let swiperText_2 = await driver.findComponent(ON.id("swiperText_2"));
      await CommonFunc.sleep(1000);
      let text = await (swiperText_2?.getText() as Promise<string>)

      console.info("[testSwiperShowPrevious_static_0100] text", text);
      expect(text === '2').assertTrue();
      console.info("[testSwiperShowPrevious_static_0100] END");
      done();
    });
  })
}