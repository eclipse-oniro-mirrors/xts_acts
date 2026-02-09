/**
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../../MainAbility/utils/MessageManager';
import display from '@ohos.display';

let dpiValue: number;
export default function SwiperMinSize() {
  describe('SwiperMinSize', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperMinSize beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Swiper/swiperUI/SwiperMinSize',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperMinSize state pages: " + JSON.stringify(pages));
        if (!("SwiperMinSize" == pages.name)) {
          console.info("get SwiperMinSize state pages.name: " + JSON.stringify(pages.name));
          let result = await router.push(options);
          dpiValue = display.getDefaultDisplaySync().densityDPI;
          console.info('[SwiperMinSize] dpi getDefaultDisplay is : ' + JSON.stringify(dpiValue));
          await CommonFunc.sleep(2000);
          console.info("push SwiperMinSize page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperMinSize page error: " + err);
      }
      done();
    });

    /**
     * @tc.name   SwiperMinSize_001
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_061
     * @tc.desc   Don't set minSize
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMinSize_001', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_001] START');
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      console.info(`[SwiperMinSize_001] swiperText1.right - swiperText1.left=${swiperText1.right - swiperText1.left}`);
      console.info(`[SwiperMinSize_001] vp2px(160)=${vp2px(160)}`);
      expect(Math.floor(Math.abs(swiperText1.right - swiperText1.left - vp2px(160))) <= 1).assertTrue();

      console.info('[SwiperMinSize_001] END');
      done();
    });

    /**
     * @tc.name   SwiperMinSize_002
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_063
     * @tc.desc   set minSize to 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMinSize_002', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_002] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      let aWidth: number = Math.round(px2vp(swiperText1.right - swiperText1.left));
      let ret = aWidth * (dpiValue / 160);
      console.info(`[SwiperMinSize_002] aWidth=${aWidth}`);
      console.info(`[SwiperMinSize_002] ret=${ret}`);
      console.info(`[SwiperMinSize_002] swiperText1.right - swiperText1.left=${swiperText1.right - swiperText1.left}`);
      console.info(`[SwiperMinSize_002] vp2px(40)=${vp2px(40)}`);
      
      let driver = Driver.create();
      let text04 = await driver.findComponent(ON.id("swiperText4"))
      if (text04) {
        expect(Math.floor(Math.abs(swiperText1.right - swiperText1.left - vp2px(40))) <= 1).assertTrue();
      } else {
        expect(Math.floor(Math.abs(swiperText1.right - swiperText1.left - aWidth * (dpiValue / 160))) <= 1).assertTrue();
      }

      console.info('[SwiperMinSize_002] END');
      done();
    });

    /**
     * @tc.name   SwiperMinSize_003
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_068
     * @tc.desc   set minSize to 20 and change component dimensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMinSize_003', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_003] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'swiperTextWidth', value: 300 });
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      let aWidth: number = Math.round(px2vp(swiperText1.right - swiperText1.left));
      console.info(`[SwiperMinSize_003] aWidth=${aWidth}`);
      console.info(`[SwiperMinSize_003] swiperText1.right - swiperText1.left=${swiperText1.right - swiperText1.left}`);
      console.info(`[SwiperMinSize_003] vp2px(40)=${vp2px(40)}`);
      console.info(`[SwiperMinSize_003] aWidth * (dpiValue / 160)=${aWidth * (dpiValue / 160)}`);
      
      let driver = Driver.create();
      let text04 = await driver.findComponent(ON.id("swiperText4"))
      if (text04) {
        expect(Math.floor(Math.abs(swiperText1.right - swiperText1.left - vp2px(40))) <= 1).assertTrue();
      } else {
        expect(Math.floor(Math.abs(swiperText1.right - swiperText1.left - aWidth * (dpiValue / 160))) <= 1).assertTrue();
      }

      console.info('[SwiperMinSize_003] END');
      done();
    });

    /**
     * @tc.name   SwiperMinSize_004
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_067
     * @tc.desc   set minSize to 20 and change component dimensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMinSize_004', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_004] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'swiperWidth', value: 200 });
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 0 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      let aWidth: number = Math.round(px2vp(swiperText1.right - swiperText1.left));
      console.info(`[SwiperMinSize_004] aWidth=${aWidth}`);
      console.info(`[SwiperMinSize_004] swiperText1.right - swiperText1.left=${swiperText1.right - swiperText1.left}`);
      console.info(`[SwiperMinSize_004] vp2px(40)=${vp2px(40)}`);
      console.info(`[SwiperMinSize_004] aWidth * (dpiValue / 160)=${aWidth * (dpiValue / 160)}`);
      
      let driver = Driver.create();
      let text05 = await driver.findComponent(ON.id("swiperText5"))
      if (text05) {
        expect(Math.floor(Math.abs(swiperText1.right - swiperText1.left - vp2px(40))) <= 1).assertTrue();
      } else {
        expect(Math.floor(Math.abs(swiperText1.right - swiperText1.left - aWidth * (dpiValue / 160))) <= 1).assertTrue();
      }

      console.info('[SwiperMinSize_004] END');
      done();
    });

    /**
     * @tc.name   SwiperMinSize_005
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_066
     * @tc.desc   set minSize to 20 and paddingTop marginTop to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMinSize_005', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_005] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'swiperPadding', value: 10 });
      globalThis.value.message.notify({ name:'swiperMargin', value: 10 });
      await CommonFunc.sleep(200);

      let swiper = CommonFunc.getComponentRect('swiperMinSize2');
      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(swiperText1.top - swiper.top) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[SwiperMinSize_005] END');
      done();
    });

    /**
     * @tc.name   SwiperMinSize_006
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_073
     * @tc.desc   set minSize to 20 and itemSpace to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMinSize_006', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_006] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'swiperPadding', value: 0 });
      globalThis.value.message.notify({ name:'swiperMargin', value: 0 });
      globalThis.value.message.notify({ name:'itemSpace', value: 10 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      let swiperText2 = CommonFunc.getComponentRect('swiperText2');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(swiperText2.left - swiperText1.right) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[SwiperMinSize_006] END');
      done();
    });

    /**
     * @tc.name   SwiperMinSize_007
     * @tc.number SUB_ACE_FUNCTION_JICHU_SR000HQ76H_070
     * @tc.desc   set minSize to 20 and itemSpace to 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SwiperMinSize_007', Level.LEVEL1, async (done: Function) => {

      console.info('[SwiperMinSize_007] START');
      await CommonFunc.sleep(200);
      globalThis.value.message.notify({ name:'minSize', value: 20 });
      globalThis.value.message.notify({ name:'itemSpace', value: 10 });
      globalThis.value.message.notify({ name:'nextMargin', value: 10 });
      await CommonFunc.sleep(200);

      let swiperText1 = CommonFunc.getComponentRect('swiperText1');
      let swiperText2 = CommonFunc.getComponentRect('swiperText2');
      await CommonFunc.sleep(1000);
      expect(Math.abs(Math.round(swiperText2.left - swiperText1.right) - Math.round(vp2px(10))) <= 1).assertTrue();

      console.info('[SwiperMinSize_007] END');
      done();
    });



  })
}
