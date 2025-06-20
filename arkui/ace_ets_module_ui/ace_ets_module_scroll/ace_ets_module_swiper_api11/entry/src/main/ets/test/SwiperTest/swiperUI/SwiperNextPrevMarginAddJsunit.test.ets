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
import ohosrouter from '@ohos.router';
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../MainAbility/common/Common';
import {MessageManager,Callback} from '../../../MainAbility/utils/MessageManager';
import { BusinessError } from '@ohos.base';
const waitUiReadyMs = 1000;

export default function SwiperNextPrevMarginAddJsunit() {
  describe('SwiperNextPrevMarginAddJsunit', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperNextPrevMarginAddJsunit beforeEach start");
      try {
        ohosrouter.clear();
        let pages = ohosrouter.getState();
        console.info("ApiCommponentAddJsunit " + JSON.stringify(pages));
        if (!("swiperNextPrevMargin" == pages.name)) {
          console.info("ApiCommponentAddJsunit state success " + JSON.stringify(pages.name));
          ohosrouter.pushUrl({
            url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin',
            params: {
              data1: 'message',
              data2: {
                data3: [123, 456, 789]
              }
            }
          }).then(() => {
            // success
          })
            .catch((err: BusinessError) => {
              console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
            })
          await CommonFunc.sleep(2000);
          console.info("push circle page success ");
        }
      } catch (err) {
        console.error("push circle page error: " + err);
      }
      done();

    });

    it('SwiperNextPrevMarginAddJsunit_0100', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0100'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_036
    * @tc.name  : SwiperNextPrevMarginAddJsunit_0036
    * @tc.desc  : test swiper width = padding + subcomponentwidth
    * @tc.level : Level 2
    */
    it('SwiperNextPrevMarginAddJsunit_0036', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0036 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: null })
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SwiperNextPrevMarginAddJsunit_0036'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_023
    * @tc.name  : SwiperNextPrevMarginAddJsunit_0300
    * @tc.desc  : test swiper width = padding + subcomponentwidth
    * @tc.level : Level 2
    */
    it('SwiperNextPrevMarginAddJsunit_0300', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0300 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: -30 })
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0300'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00px');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0300'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left) * 0.9)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    /* *
   * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_021
   * @tc.name  : SwiperNextPrevMarginAddJsunit_0400
   * @tc.desc  : test swiper width = padding + subcomponentwidth
   * @tc.level : Level 2
   */
    it('SwiperNextPrevMarginAddJsunit_0400', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0400 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: 30})
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0400'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right1 = columnSwiper.right;
      let left1  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight1 = swiperMargin.right;
      let swiperLeft1 = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0400'] component value is: " + right1 + "," + left1 + ","
      + swiperRight1 + "," + swiperLeft1);
      expect(Math.abs(Math.round((right1 - left1)- (swiperRight1 - swiperLeft1))) <= 1).assertTrue();
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_022
    * @tc.name  : SwiperNextPrevMarginAddJsunit_022
    * @tc.desc  : test swiper width = padding + subcomponentwidth
    * @tc.level : Level 2
    */
    it('SwiperNextPrevMarginAddJsunit_022', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_022 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: 0})
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[SwiperNextPrevMarginAddJsunit_022'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right1 = columnSwiper.right;
      let left1  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight1 = swiperMargin.right;
      let swiperLeft1 = swiperMargin.left;
      console.info("[SwiperNextPrevMarginAddJsunit_022'] component value is: " + right1 + "," + left1 + ","
      + swiperRight1 + "," + swiperLeft1);
      expect(Math.abs(Math.round(((right1 - left1)*0.9)- (swiperRight1 - swiperLeft1))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_0500', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0500 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: undefined });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0500'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00px');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right2 = columnSwiper.right;
      let left2  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight2 = swiperMargin.right;
      let swiperLeft2 = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0500'] component value is: " + right2 + "," + left2 + ","
      + swiperRight2 + "," + swiperLeft2);
      expect(Math.abs(Math.round(((right2 - left2)*0.9)- (swiperRight2 - swiperLeft2))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_0600', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0600 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: $r("app.string.nextMargin")});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0600'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('20.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft  = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0600'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_0700', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0700 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value: null });
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 0 });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0700'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00px');
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_0800', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0800 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value: -30 });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0800'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0800'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left) * 0.9)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_0900', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0900 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value: 30 });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_0900'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('30.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_0400'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1000', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1000 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value: undefined });
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1000'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1000'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left)*0.9)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1100', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1100 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: $r("app.string.prevMargin")});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: $r("app.string.nextMargin")});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1100'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('20.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('20.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1100'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1200', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1100 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: 30});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: 40});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1200'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('40.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1100'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1300', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1300 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: -30});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: -40});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1300'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1300'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left) * 0.9)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1400', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1400 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: 1000});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: 1000});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMargin');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1400'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00px');
      expect(obj.$attrs.prevMargin).assertEqual('0.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiper');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1400'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1500', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1500 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginDuplicate',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('swiperNextPrevMarginDuplicate');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1500'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('4.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('4.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperDuplicate');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('ColumnSwiperDuplicate');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1500'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1600', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1600 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1600'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00%');
      expect(obj.$attrs.prevMargin).assertEqual('30.00%');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1600'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left)*0.9)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1700', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1700 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      globalThis.value.message.notify({name:'nextMargin',value: '10000%'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '10000%'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1700'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('10000.00%');
      expect(obj.$attrs.prevMargin).assertEqual('10000.00%');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1700'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left)*0.9)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1800', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1800 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: '20%'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '20%'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1800'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('20.00%');
      expect(obj.$attrs.prevMargin).assertEqual('20.00%');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1800'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left)*0.9)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_1900', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_1900 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: 'abc'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: 'abc'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_1900'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_1900'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left)*0.9)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_2000', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_2000 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: '30px'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '30px'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2000'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00px');
      expect(obj.$attrs.prevMargin).assertEqual('30.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2000'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_2100', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_2100 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: '30fp'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '30fp'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2100'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00fp');
      expect(obj.$attrs.prevMargin).assertEqual('30.00fp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2100'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_2200', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_2200 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: '30lpx'});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: '30lpx'});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2200'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00lpx');
      expect(obj.$attrs.prevMargin).assertEqual('30.00lpx');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2200'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_2300', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_2300 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: $r("app.string.nextMarginString")});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: $r("app.string.prevMarginString")});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2300'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('20.00px');
      expect(obj.$attrs.prevMargin).assertEqual('20.00px');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2300'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_020
     * @tc.name  : SwiperNextPrevMarginAddJsunit_020
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_020', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_2400 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginNoMargin',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let strJson = getInspectorByKey('swiperNextPrevMarginNo');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2200'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('0.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('0.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperNo');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginNo');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2400'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round(((right - left)*0.9)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    it('SwiperNextPrevMarginAddJsunit_2500', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_2500 START');
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMarginString',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymanic chage the value
      globalThis.value.message.notify({name:'nextMargin',value: $r("app.float.nextMargin")});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'prevMargin',value: $r("app.float.prevMargin")});
      await CommonFunc.sleep(500);
      let strJson = getInspectorByKey('swiperNextPrevMarginString');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[apiCommponentAddJsunit_2300'] component obj is: " + obj.$attrs.nextMargin);
      expect(obj.$attrs.nextMargin).assertEqual('30.00vp');
      expect(obj.$attrs.prevMargin).assertEqual('30.00vp');
      // calculate the gap
      let columnSwiper = CommonFunc.getComponentRect('ColumnSwiperString');
      let right = columnSwiper.right;
      let left  = columnSwiper.left;
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMarginString');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      console.info("[apiCommponentAddJsunit_2300'] component value is: " + right + "," + left + ","
      + swiperRight + "," + swiperLeft);
      expect(Math.abs(Math.round((right - left)- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    /* *
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_076
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0076
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */

    it('SwiperNextPrevMarginAddJsunit_0076', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0076 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin76',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // calculate
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin76');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin76');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0076] component obj is: " + obj.$attrs.padding);
      expect(obj.$attrs.padding).assertEqual('10.00vp');
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");
      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      expect(Math.floor(Math.abs((swiperRight - swiperLeft)- (right-left + vp2px(4 + 2 + 2*10)))) <= 1).assertTrue();
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_078
    * @tc.name  : SwiperNextPrevMarginAddJsunit_0078
    * @tc.desc  : test swiper width = padding + subcomponentwidth
    * @tc.level : Level 2
    */

    it('SwiperNextPrevMarginAddJsunit_0078', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0078 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin78',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // calculate
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin78');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin78');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0078] component obj is: " + obj.$attrs.padding);
      expect(obj.$attrs.padding).assertEqual('10.00vp');
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      expect(Math.abs(Math.floor((right - left + vp2px(4 + 2 + 2*10))- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_077
    * @tc.name  : SwiperNextPrevMarginAddJsunit_0077
    * @tc.desc  : test swiper width = padding + subcomponentwidth
    * @tc.level : Level 2
    */

    it('SwiperNextPrevMarginAddJsunit_0077', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0077 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin78',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymnaic change the value
      globalThis.value.message.notify({name:'displayCount',value: 2 });
      await CommonFunc.sleep(500);
      // calculate
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin78');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin78');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0077] component obj is: " + obj.$attrs.padding);
      expect(obj.$attrs.padding).assertEqual('10.00vp');
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      expect(Math.floor(Math.abs((2*(right - left) + vp2px(4 + 2 + 2*10))- (swiperRight - swiperLeft))) <= 1).assertTrue();
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_081
    * @tc.name  : SwiperNextPrevMarginAddJsunit_0081
    * @tc.desc  : test swiper width = padding + subcomponentwidth
    * @tc.level : Level 2
    */

    it('SwiperNextPrevMarginAddJsunit_0081', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0081 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin81',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin81');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0081] component obj is: " + obj.$attrs.padding);
      expect(obj.$attrs.padding).assertEqual('10.00vp');
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin81');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      expect(Math.abs(Math.floor((right - left + vp2px(4 + 2 + 2*10))- (swiperRight -swiperLeft))) <= 1).assertTrue();
      done();
    });

    /* *
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_080
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0080
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */

    it('SwiperNextPrevMarginAddJsunit_0080', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0080 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin81',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // dymnaic change the value
      globalThis.value.message.notify({name:'displayCount',value: 2 });
      await CommonFunc.sleep(500);
      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin81');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0081] component obj is: " + obj.$attrs.padding);
      expect(obj.$attrs.padding).assertEqual('10.00vp');

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin81');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");

      expect(Math.abs(Math.floor((2 *(right - left) + vp2px(4 + 2 + 2*10))- (swiperRight  - swiperLeft))) <= 1).assertTrue();
      done();
    });

    /* *
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_079
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0079
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */

    it('SwiperNextPrevMarginAddJsunit_0079', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0079 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin79',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin79');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0079] component obj is: " + obj.$attrs.padding);

      expect(obj.$attrs.padding).assertEqual('10.00vp');

      // calculate the gap
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin79');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("4.00vp");
      expect(prevMargin).assertEqual("2.00vp");

      expect(Math.abs(Math.floor((right - left)- (swiperRight -  swiperLeft - vp2px(2 * 10 + 2 + 4)))) <= 1).assertTrue();
      done();
    });

    /* *
   * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_082
   * @tc.name  : SwiperNextPrevMarginAddJsunit_0082
   * @tc.desc  : test swiper width = padding + subcomponentwidth
   * @tc.level : Level 2
   */

    it('SwiperNextPrevMarginAddJsunit_0082', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0082 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin82',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin82');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;



      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate
      let strJson = getInspectorByKey('1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0082] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;


      expect(padding).assertEqual('10.00vp');
      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left + vp2px(20 + 40)))) <= 1).assertTrue();
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_083
    * @tc.name  : SwiperNextPrevMarginAddJsunit_0083
    * @tc.desc  : test swiper width = padding + subcomponentwidth
    * @tc.level : Level 2
    */

    it('SwiperNextPrevMarginAddJsunit_0083', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0083 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin83',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin83');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate

      let strJson = getInspectorByKey('swiperNextPrevMargin83');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0083] component obj is: " + obj.$attrs.padding);
      expect(obj.$attrs.padding).assertEqual('3.00vp');
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("30.00vp");
      expect(prevMargin).assertEqual("30.00vp");

      expect(Math.floor(Math.abs((swiperRight - swiperLeft)- (right - left + vp2px(2*3 + 2 *30)))) <= 1).assertTrue();
      done();
    });

    /* *
   * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_084
   * @tc.name  : SwiperNextPrevMarginAddJsunit_0084
   * @tc.desc  : test swiper width = padding + subcomponentwidth
   * @tc.level : Level 2
   */

    it('SwiperNextPrevMarginAddJsunit_0084', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0084 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin84',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin84');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate
      let strJson = getInspectorByKey('1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0084] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left))) <= 1).assertTrue();
      done();
    });

    /* *
    * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_085
    * @tc.name  : SwiperNextPrevMarginAddJsunit_0085
    * @tc.desc  : test swiper width = padding + subcomponentwidth
    * @tc.level : Level 2
    */
    it('SwiperNextPrevMarginAddJsunit_0085', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0085 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin85',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin85');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate
      let strJson = getInspectorByKey('1');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0085] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_063
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0063
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0063', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0063 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin63',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin63');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate

      let strJson = getInspectorByKey('swiperNextPrevMargin63');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left + vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_062
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0062
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0062', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0062 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin62',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin62');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin62');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0062] component obj is: " + obj.$attrs.padding);


      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (top - bottom -vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_061
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0061
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0061', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0061 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin61',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin61');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin61');
      let obj: ESObject = JSON.parse(strJson);

      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(Math.floor(Math.abs((swiperRight - swiperLeft) -  (3 *(right - left) + vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_060
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0060
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0060', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0060 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin60',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);
      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin60');
      let obj: ESObject = JSON.parse(strJson);

      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin60');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;
      let subcomponment2 = CommonFunc.getComponentRect('2');
      let top2 =  subcomponment2.top;
      let bottom2  =  subcomponment2.bottom;
      let subcomponment3 = CommonFunc.getComponentRect('3');
      let top3 =  subcomponment3.top;
      let bottom3  =  subcomponment3.bottom;
      console.info(`[SwiperNextPrevMarginAddJsunit_0060] swiperTop - swiperbottom=
      ${(swiperTop - swiperbottom)}`);
      console.info(`[SwiperNextPrevMarginAddJsunit_0060] ((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - vp2px(15 + 6))=
      ${((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - vp2px(15 + 6))}`);  
      expect(Math.abs(Math.floor((swiperTop - swiperbottom) -  ((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_067
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0067
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0067', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0061 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin67',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin67');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin67');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0067] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string = obj.$attrs.prevMargin;
      let itemspace: string = obj.$attrs.itemSpace;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left + vp2px(15 + 6 + 2*10)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_066
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0066
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0066', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0066 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin66',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin66');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin66');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0066] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string = obj.$attrs.nextMargin;
      let prevMargin: string = obj.$attrs.prevMargin;
      let itemspace: string = obj.$attrs.itemSpace;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (top - bottom - vp2px(2*10 + 15 + 6)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_065
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0065
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0065', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0065 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin65',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin65');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin65');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0065] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string = obj.$attrs.prevMargin;
      let itemspace: string = obj.$attrs.itemSpace;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (3 *(right - left) + vp2px(15 + 6 + 4 * 10)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_064
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0064
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0064', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0064 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin64',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin64');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin64');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0064] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string = obj.$attrs.nextMargin;
      let prevMargin: string = obj.$attrs.prevMargin;
      let itemspace: string = obj.$attrs.itemSpace;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round(swiperTop - swiperbottom) -  Math.round(3 *(top - bottom) - vp2px(4*10 + 15 + 6))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_055
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0055
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0055', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0055 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin55',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin55');
      let swiperLeft = swiperMargin.left;
      let swiperRight = swiperMargin.right;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let left =  subcomponment.left;
      let right  =  subcomponment.right;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin55');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0055] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string = obj.$attrs.nextMargin;
      let prevMargin: string = obj.$attrs.prevMargin;
      let itemspace: string = obj.$attrs.itemSpace;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("0.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left + vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_054
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0054
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0054', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0054 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin54',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin54');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin54');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0054] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");

      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (top - bottom - vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_053
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0053
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0053', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0053 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin53',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin53');
      let swiperLeft = swiperMargin.left;
      let swiperRight = swiperMargin.right;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let left =  subcomponment.left;
      let right  =  subcomponment.right;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin53');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0053] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string = obj.$attrs.nextMargin;
      let prevMargin: string = obj.$attrs.prevMargin;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");

      expect(Math.floor(Math.abs((swiperRight - swiperLeft) -  (3 *(right - left) + vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_052
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0052
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0052', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0052 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin52',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin52');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;
      let subcomponment2 = CommonFunc.getComponentRect('2');
      let top2 =  subcomponment2.top;
      let bottom2  =  subcomponment2.bottom;
      let subcomponment3 = CommonFunc.getComponentRect('3');
      let top3 =  subcomponment3.top;
      let bottom3  =  subcomponment3.bottom;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin52');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0052] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");

      console.info(`[SwiperNextPrevMarginAddJsunit_0052] swiperTop - swiperbottom=
      ${(swiperTop - swiperbottom)}`);
      console.info(`[SwiperNextPrevMarginAddJsunit_0052] ((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - vp2px(15 + 6))=
      ${((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - vp2px(15 + 6))}`);  
      expect(Math.abs(Math.floor((swiperTop - swiperbottom) -  ((top - bottom) + (top2 - bottom2) + (top3 - bottom3) - vp2px(15 + 6)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_059
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0059
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0059', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0059 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin59',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin59');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin59');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0059] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string = obj.$attrs.nextMargin;
      let prevMargin: string = obj.$attrs.prevMargin;
      let itemspace: string = obj.$attrs.itemSpace;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left + vp2px(15 + 6 + 2 * 10)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_058
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0058
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0058', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0058 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin58',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin58');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin58');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0058] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string =   obj.$attrs.prevMargin;
      let itemspace: string = obj.$attrs.itemSpace;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (top - bottom - vp2px(15  + 6 + 2 * 10)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_057
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0057
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0057', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0057 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin57',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin57');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;


      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin57');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0057] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string =  obj.$attrs.nextMargin;
      let prevMargin: string = obj.$attrs.prevMargin;
      let itemspace: string = obj.$attrs.itemSpace;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (3*(right - left)+ vp2px(15 + 6 + 4 * 10)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_056
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0056
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0056', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0058 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin56',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin56');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      // calculate
      let strJson = getInspectorByKey('swiperNextPrevMargin56');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0056] component obj is: " + obj.$attrs.padding);

      let padding: string = obj.$attrs.padding;
      let nextMargin: string = obj.$attrs.nextMargin;
      let prevMargin: string = obj.$attrs.prevMargin;
      let itemspace: string = obj.$attrs.itemSpace;

      expect(nextMargin).assertEqual("15.00vp");
      expect(prevMargin).assertEqual("6.00vp");
      expect(itemspace).assertEqual("10.00vp");

      expect(Math.abs(Math.round(swiperTop - swiperbottom) -  Math.round(3 *(top - bottom) - vp2px(15 + 6 + 4 * 10))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_050
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0050
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0050', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0050 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:450});
      await CommonFunc.sleep(500);
      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      console.info("[wiperNextPrevMarginAddJsunit_0050] component obj is: " + obj.$attrs.padding);

      let borderWidth: string = obj.$attrs.borderWidth;
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperRight- swiperLeft)- (right - left))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_051
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0051
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0051', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0051 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:450});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let borderWidth: string = obj.$attrs.borderWidth;
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (top - bottom))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_042
     * @tc.name  : SwiperNextPrevMarginAddJsunit_042
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0042', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0051 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:-3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:false});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value:-3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let borderWidth: string = obj.$attrs.borderWidth;
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_043
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0043
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0043', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0043 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:-3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value:-3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let borderWidth: string = obj.$attrs.borderWidth;
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (top - bottom))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_044
     * @tc.name  : SwiperNextPrevMarginAddJsunit_044
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0044', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0051 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:-3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:false});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value:-3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 10});
      await CommonFunc.sleep(500);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;
      let strJson = getInspectorByKey('swiperNextPrevMargin50');

      let obj: ESObject = JSON.parse(strJson);
      let borderWidth: string = obj.$attrs.borderWidth;
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_045
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0045
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0045', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0045 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:-3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value:-3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 10});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let borderWidth: string = obj.$attrs.borderWidth;
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (top - bottom))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_046
     * @tc.name  : SwiperNextPrevMarginAddJsunit_046
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0046', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0046 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:false});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      let subcomponment2 = CommonFunc.getComponentRect('2');
      let right2 =  subcomponment2.right;
      let left2  =  subcomponment2.left;

      let subcomponment3 = CommonFunc.getComponentRect('3');
      let right3 =  subcomponment3.right;
      let left3  =  subcomponment3.left;


      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let borderWidth: string = obj.$attrs.borderWidth;
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.floor((swiperRight - swiperLeft)- ((right - left) + (right2 - left2) + (right3 - left3)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_047
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0047
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0047', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0047 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let borderWidth: string = obj.$attrs.borderWidth;
      expect(borderWidth).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (3*(top - bottom)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_048
     * @tc.name  : SwiperNextPrevMarginAddJsunit_048
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0048', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0048 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      // dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:false});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 10});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);

      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');

      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let itemspace: string = obj.$attrs.itemSpace;
      expect(itemspace).assertEqual('10.00vp');

      expect(Math.abs(Math.floor((swiperRight - swiperLeft)- (3*(right - left) + vp2px(2 * 10)))) <= 1).assertTrue();
      done();
    });


    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_049
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0049
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0049', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0049 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let itemspace: string = obj.$attrs.itemSpace;
      expect(itemspace).assertEqual('0.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (3*(top - bottom)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_072
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0072
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0072', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0072 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:false});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 1});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: false});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left + vp2px(5)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_073
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0073
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0073', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0073 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 1});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: false});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');
      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (top - bottom -vp2px(5)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_074
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0074
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0074', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0074 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:false});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 1});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: true});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');
      expect(Math.abs(Math.round((swiperRight - swiperLeft)- (right - left + vp2px(5)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_075
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0075
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0075', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0075 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 1});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: true});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.abs(Math.round((swiperTop - swiperbottom)- (top - bottom - vp2px(5)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_068
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0068
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0068', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0068 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:false});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: false});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.floor(Math.abs((swiperRight - swiperLeft) -  (3 *(right - left) + vp2px(5)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_069
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0069
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0069', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0069 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: false});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.abs(Math.round(swiperTop - swiperbottom) -  Math.round(3 *(top - bottom) - vp2px(5))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_070
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0070
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0070', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0070 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:false});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: true});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperRight = swiperMargin.right;
      let swiperLeft = swiperMargin.left;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let right =  subcomponment.right;
      let left  =  subcomponment.left;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.floor(Math.abs((swiperRight - swiperLeft) -  (3 *(right - left) + vp2px(5)))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_071
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0071
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0071', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0071 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: true});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');

      expect(Math.abs(Math.round(swiperTop - swiperbottom) -  Math.round(3 *(top - bottom) - vp2px(5))) <= 1).assertTrue();
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_041
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0041
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0041', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0041 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: true});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');
      expect(Math.abs(Math.round(swiperTop - swiperbottom) -  Math.round(3 *(top - bottom) - vp2px(5))) <= 1).assertTrue();

      CommonFunc.setScreenOrientation(1);
      await CommonFunc.sleep(3000);
      expect(Math.abs(Math.round(swiperTop - swiperbottom) -  Math.round(3 *(top - bottom) - vp2px(5))) <= 1).assertTrue();
      await CommonFunc.sleep(3000);
      done();
    });

    /**
     * @tc.number: SUB_ACE_TS_COMPONENT_SR000HTP2I_040
     * @tc.name  : SwiperNextPrevMarginAddJsunit_0040
     * @tc.desc  : test swiper width = padding + subcomponentwidth
     * @tc.level : Level 2
     */
    it('SwiperNextPrevMarginAddJsunit_0040', Level.LEVEL1, async (done: Function) => {
      console.info('SwiperNextPrevMarginAddJsunit_0040 START');
      await CommonFunc.sleep(1000);
      ohosrouter.clear();
      ohosrouter.pushUrl({
        url: 'MainAbility/pages/Swiper/swiperUI/swiperNextPrevMargin50',
        params: {
          data1: 'message',
          data2: {
            data3: [123, 456, 789]
          }
        }
      }).then(() => {
        // success
      })
        .catch((err: BusinessError) => {
          console.error(`pushUrl failed, code is ${err.code}, message is ${err.message}`);
        })
      await CommonFunc.sleep(1000);

      //dymanic chage the value
      globalThis.value.message.notify({name:'prevMargin',value:0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'vertical',value:true});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'nextMargin',value: 5});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'itemSpace',value: 0});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'displayCount',value: 3});
      await CommonFunc.sleep(500);
      globalThis.value.message.notify({name:'loop',value: true});
      await CommonFunc.sleep(500);


      let swiperMargin = CommonFunc.getComponentRect('swiperNextPrevMargin50');
      let swiperTop = swiperMargin.top;
      let swiperbottom = swiperMargin.bottom;

      // calculate the gap
      let subcomponment = CommonFunc.getComponentRect('1');
      let top =  subcomponment.top;
      let bottom  =  subcomponment.bottom;

      let strJson = getInspectorByKey('swiperNextPrevMargin50');
      let obj: ESObject = JSON.parse(strJson);
      let nextMargin: string =  obj.$attrs.nextMargin;
      expect(nextMargin).assertEqual('5.00vp');
      expect(Math.abs(Math.round(swiperTop - swiperbottom) -  Math.round(3 *(top - bottom) - vp2px(5))) <= 1).assertTrue();

      CommonFunc.setScreenOrientation(2);
      await CommonFunc.sleep(3000);
      expect(Math.abs(Math.round(swiperTop - swiperbottom) -  Math.round(3 *(top - bottom) - vp2px(5))) <= 1).assertTrue();
      await CommonFunc.sleep(3000);
      done();


    });



  })

}