/**
 * Copyright (c) 2026 iSoftStone Information Technology (Group) Co.,Ltd.
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
import CommonFunc from '../../MainAbility/common/Common';
import { Driver, } from '@ohos.UiTest';

export default function SwiperAttributeNullUndefined() {
  describe('SwiperAttributeNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("SwiperAttributeNullUndefined beforeEach start");
        let driver: Driver = Driver.create();
    let size = await driver.getDisplaySize();
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwiperAttributeNullUndefined/SwiperAttributeNullUndefined',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SwiperAttributeNullUndefined state pages:" + JSON.stringify(pages));
        if (!("SwiperAttributeNullUndefined" == pages.name)) {
          console.info("get SwiperAttributeNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push SwiperAttributeNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push SwiperAttributeNullUndefined page error:" + err);
      }
      console.info("SwiperAttributeNullUndefined beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("SwiperAttributeNullUndefined after each called");
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0010
    * @tc.number SwiperAttributeNullUndefined_0010
    * @tc.desc   test indicatorStyle
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0010', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0010]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 indicatorStyle: ` + obj3.$attrs.indicatorStyle);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 indicatorStyle: ` + obj1.$attrs.indicatorStyle);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 indicatorStyle: ` + obj2.$attrs.indicatorStyle);

        expect(obj3.$attrs.indicatorStyle).assertEqual(obj2.$attrs.indicatorStyle);
        expect(obj3.$attrs.indicatorStyle).assertEqual(obj1.$attrs.indicatorStyle);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0020
    * @tc.number SwiperAttributeNullUndefined_0020
    * @tc.desc   test cachedCount
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0020', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0020]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 cachedCount: ` + obj3.$attrs.cachedCount);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 cachedCount: ` + obj1.$attrs.cachedCount);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 cachedCount: ` + obj2.$attrs.cachedCount);

        expect(obj3.$attrs.cachedCount).assertEqual(obj2.$attrs.cachedCount);
        expect(obj3.$attrs.cachedCount).assertEqual(obj1.$attrs.cachedCount);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0030
    * @tc.number SwiperAttributeNullUndefined_0030
    * @tc.desc   test indicator
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0030', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0030]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 indicator: ` + obj3.$attrs.indicator);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 indicator: ` + obj1.$attrs.indicator);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 indicator: ` + obj2.$attrs.indicator);

        expect(obj3.$attrs.indicator).assertEqual(obj2.$attrs.indicator);
        expect(obj3.$attrs.indicator).assertEqual(obj1.$attrs.indicator);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0040
    * @tc.number SwiperAttributeNullUndefined_0040
    * @tc.desc   test displayArrow
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0040', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0040]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 displayArrow: ` + obj3.$attrs.displayArrow);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 displayArrow: ` + obj1.$attrs.displayArrow);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 displayArrow: ` + obj2.$attrs.displayArrow);

        expect(obj3.$attrs.displayArrow).assertEqual(obj2.$attrs.displayArrow);
        expect(obj3.$attrs.displayArrow).assertEqual(obj1.$attrs.displayArrow);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0050
    * @tc.number SwiperAttributeNullUndefined_0050
    * @tc.desc   test displayCount
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0050', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0050]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 displayCount: ` + JSON.stringify(obj3.$attrs.displayCount));

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 displayCount: ` + JSON.stringify(obj1.$attrs.displayCount));

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 displayCount: ` + JSON.stringify(obj2.$attrs.displayCount));

        expect(obj3.$attrs.displayCount).assertEqual(obj2.$attrs.displayCount);
        expect(obj3.$attrs.displayCount).assertEqual(obj1.$attrs.displayCount);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0060
    * @tc.number SwiperAttributeNullUndefined_0060
    * @tc.desc   test indicatorStyle
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0060', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0060]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 indicatorStyle: ` + obj3.$attrs.indicatorStyle);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 indicatorStyle: ` + obj1.$attrs.indicatorStyle);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 indicatorStyle: ` + obj2.$attrs.indicatorStyle);

        expect(obj3.$attrs.indicatorStyle).assertEqual(obj2.$attrs.indicatorStyle);
        expect(obj3.$attrs.indicatorStyle).assertEqual(obj1.$attrs.indicatorStyle);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0070
    * @tc.number SwiperAttributeNullUndefined_0070
    * @tc.desc   test prevMargin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0070', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0070]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 prevMargin: ` + obj3.$attrs.prevMargin);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 prevMargin: ` + obj1.$attrs.prevMargin);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 prevMargin: ` + obj2.$attrs.prevMargin);

        expect(obj1.$attrs.prevMargin).assertEqual(obj2.$attrs.prevMargin);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0080
    * @tc.number SwiperAttributeNullUndefined_0080
    * @tc.desc   test nextMargin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0080', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0080]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 nextMargin: ` + obj3.$attrs.nextMargin);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 nextMargin: ` + obj1.$attrs.nextMargin);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 nextMargin: ` + obj2.$attrs.nextMargin);

        expect(obj1.$attrs.nextMargin).assertEqual(obj2.$attrs.nextMargin);
        console.log(`${testName} end`);
        done();
    });

        /**
    * @tc.name   SwiperAttributeNullUndefined_0110
    * @tc.number SwiperAttributeNullUndefined_0110
    * @tc.desc   test nextMargin
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0110', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0110]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 nextMargin: ` + obj3.$attrs.nextMargin);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 nextMargin: ` + obj1.$attrs.nextMargin);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 nextMargin: ` + obj2.$attrs.nextMargin);

        expect(obj1.$attrs.nextMargin).assertEqual(obj2.$attrs.nextMargin);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0120
    * @tc.number SwiperAttributeNullUndefined_0120
    * @tc.desc   test customContentTransition
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0120', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0120]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 customContentTransition: ` + obj3.$attrs.customContentTransition);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 customContentTransition: ` + obj1.$attrs.customContentTransition);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 customContentTransition: ` + obj2.$attrs.customContentTransition);

        expect(obj3.$attrs.customContentTransition).assertEqual(obj2.$attrs.customContentTransition);
        expect(obj3.$attrs.customContentTransition).assertEqual(obj1.$attrs.customContentTransition);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0090
    * @tc.number SwiperAttributeNullUndefined_0090
    * @tc.desc   test customContentTransition
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0090', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0090]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 pageFlipMode: ` + obj3.$attrs.pageFlipMode);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 pageFlipMode: ` + obj1.$attrs.pageFlipMode);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 pageFlipMode: ` + obj2.$attrs.pageFlipMode);

        expect(obj3.$attrs.pageFlipMode).assertEqual(obj2.$attrs.pageFlipMode);
        expect(obj3.$attrs.pageFlipMode).assertEqual(obj1.$attrs.pageFlipMode);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   SwiperAttributeNullUndefined_0100
    * @tc.number SwiperAttributeNullUndefined_0100
    * @tc.desc   test autoPlay
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('SwiperAttributeNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[SwiperAttributeNullUndefined_0100]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiper3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 autoPlay: ` + obj3.$attrs.autoPlay);

        let strJson1 = getInspectorByKey('swiper1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 autoPlay: ` + obj1.$attrs.autoPlay);

        let strJson2 = getInspectorByKey('swiper2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 autoPlay: ` + obj2.$attrs.autoPlay);

        expect(obj3.$attrs.autoPlay).assertEqual(obj2.$attrs.autoPlay);
        expect(obj3.$attrs.autoPlay).assertEqual(obj1.$attrs.autoPlay);
        console.log(`${testName} end`);
        done();
    });
  })

}