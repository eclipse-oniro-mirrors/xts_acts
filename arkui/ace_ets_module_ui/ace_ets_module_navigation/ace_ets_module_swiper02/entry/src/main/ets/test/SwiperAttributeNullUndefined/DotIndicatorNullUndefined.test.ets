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

export default function DotIndicatorNullUndefined() {
  describe('DotIndicatorNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("DotIndicatorNullUndefined beforeEach start");
        let driver: Driver = Driver.create();
    let size = await driver.getDisplaySize();
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwiperAttributeNullUndefined/DotIndicatorNullUndefined',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DotIndicatorNullUndefined state pages:" + JSON.stringify(pages));
        if (!("DotIndicatorNullUndefined" == pages.name)) {
          console.info("get DotIndicatorNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DotIndicatorNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DotIndicatorNullUndefined page error:" + err);
      }
      console.info("DotIndicatorNullUndefined beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DotIndicatorNullUndefined after each called");
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0010
    * @tc.number DotIndicatorNullUndefined_0010
    * @tc.desc   test left
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0010', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0010]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 left: ` + obj3.$attrs.left);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 left: ` + obj1.$attrs.left);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 left: ` + obj2.$attrs.left);

        expect(obj3.$attrs.left).assertEqual(obj2.$attrs.left);
        expect(obj3.$attrs.left).assertEqual(obj1.$attrs.left);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0020
    * @tc.number DotIndicatorNullUndefined_0020
    * @tc.desc   test top
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0020', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0020]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 top: ` + obj3.$attrs.top);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 top: ` + obj1.$attrs.top);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 top: ` + obj2.$attrs.top);

        expect(obj3.$attrs.top).assertEqual(obj2.$attrs.top);
        expect(obj3.$attrs.top).assertEqual(obj1.$attrs.top);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0030
    * @tc.number DotIndicatorNullUndefined_0030
    * @tc.desc   test right
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0030', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0030]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 right: ` + obj3.$attrs.right);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 right: ` + obj1.$attrs.right);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 right: ` + obj2.$attrs.right);

        expect(obj3.$attrs.right).assertEqual(obj2.$attrs.right);
        expect(obj3.$attrs.right).assertEqual(obj1.$attrs.right);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0040
    * @tc.number DotIndicatorNullUndefined_0040
    * @tc.desc   test bottom
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0040', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0040]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 bottom: ` + obj3.$attrs.bottom);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 bottom: ` + obj1.$attrs.bottom);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 bottom: ` + obj2.$attrs.bottom);

        expect(obj3.$attrs.bottom).assertEqual(obj2.$attrs.bottom);
        expect(obj3.$attrs.bottom).assertEqual(obj1.$attrs.bottom);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0050
    * @tc.number DotIndicatorNullUndefined_0050
    * @tc.desc   test start
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0050', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0050]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 start: ` + JSON.stringify(obj3.$attrs.start));

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 start: ` + JSON.stringify(obj1.$attrs.start));

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 start: ` + JSON.stringify(obj2.$attrs.start));

        expect(obj3.$attrs.start).assertEqual(obj2.$attrs.start);
        expect(obj3.$attrs.start).assertEqual(obj1.$attrs.start);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0060
    * @tc.number DotIndicatorNullUndefined_0060
    * @tc.desc   test end
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0060', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0060]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 end: ` + obj3.$attrs.end);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 end: ` + obj1.$attrs.end);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 end: ` + obj2.$attrs.end);

        expect(obj3.$attrs.end).assertEqual(obj2.$attrs.end);
        expect(obj3.$attrs.end).assertEqual(obj1.$attrs.end);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0070
    * @tc.number DotIndicatorNullUndefined_0070
    * @tc.desc   test itemWidth
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0070', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0070]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 itemWidth: ` + obj3.$attrs.itemWidth);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 itemWidth: ` + obj1.$attrs.itemWidth);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 itemWidth: ` + obj2.$attrs.itemWidth);

        expect(obj3.$attrs.itemWidth).assertEqual(obj1.$attrs.itemWidth);
        expect(obj3.$attrs.itemWidth).assertEqual(obj2.$attrs.itemWidth);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0080
    * @tc.number DotIndicatorNullUndefined_0080
    * @tc.desc   test itemHeight
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0080', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0080]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 itemHeight: ` + obj3.$attrs.itemHeight);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 itemHeight: ` + obj1.$attrs.itemHeight);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 itemHeight: ` + obj2.$attrs.itemHeight);

        expect(obj3.$attrs.itemHeight).assertEqual(obj1.$attrs.itemHeight);
        expect(obj3.$attrs.itemHeight).assertEqual(obj2.$attrs.itemHeight);
        console.log(`${testName} end`);
        done();
    });

        /**
    * @tc.name   DotIndicatorNullUndefined_0110
    * @tc.number DotIndicatorNullUndefined_0110
    * @tc.desc   test selectedItemWidth
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0110', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0110]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 selectedItemWidth: ` + obj3.$attrs.selectedItemWidth);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 selectedItemWidth: ` + obj1.$attrs.selectedItemWidth);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 selectedItemWidth: ` + obj2.$attrs.selectedItemWidth);

        expect(obj3.$attrs.selectedItemWidth).assertEqual(obj1.$attrs.selectedItemWidth);
        expect(obj3.$attrs.selectedItemWidth).assertEqual(obj2.$attrs.selectedItemWidth);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0120
    * @tc.number DotIndicatorNullUndefined_0120
    * @tc.desc   test selectedItemHeight
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0120', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0120]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 selectedItemHeight: ` + obj3.$attrs.selectedItemHeight);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 selectedItemHeight: ` + obj1.$attrs.selectedItemHeight);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 selectedItemHeight: ` + obj2.$attrs.selectedItemHeight);

        expect(obj3.$attrs.selectedItemHeight).assertEqual(obj2.$attrs.selectedItemHeight);
        expect(obj3.$attrs.selectedItemHeight).assertEqual(obj1.$attrs.selectedItemHeight);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0090
    * @tc.number DotIndicatorNullUndefined_0090
    * @tc.desc   test color
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0090', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0090]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 color: ` + obj3.$attrs.color);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 color: ` + obj1.$attrs.color);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 color: ` + obj2.$attrs.color);

        expect(obj3.$attrs.color).assertEqual(obj2.$attrs.color);
        expect(obj3.$attrs.color).assertEqual(obj1.$attrs.color);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0100
    * @tc.number DotIndicatorNullUndefined_0100
    * @tc.desc   test selectedColor
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0100', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0100]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 selectedColor: ` + obj3.$attrs.selectedColor);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 selectedColor: ` + obj1.$attrs.selectedColor);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 selectedColor: ` + obj2.$attrs.selectedColor);

        expect(obj3.$attrs.selectedColor).assertEqual(obj2.$attrs.selectedColor);
        expect(obj3.$attrs.selectedColor).assertEqual(obj1.$attrs.selectedColor);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DotIndicatorNullUndefined_0130
    * @tc.number DotIndicatorNullUndefined_0130
    * @tc.desc   test space
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DotIndicatorNullUndefined_0130', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DotIndicatorNullUndefined_0130]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDot3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 space: ` + obj3.$attrs.space);

        let strJson1 = getInspectorByKey('swiperDot1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 space: ` + obj1.$attrs.space);

        let strJson2 = getInspectorByKey('swiperDot2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 space: ` + obj2.$attrs.space);

        expect(obj3.$attrs.space).assertEqual(obj2.$attrs.space);
        expect(obj3.$attrs.space).assertEqual(obj1.$attrs.space);
        console.log(`${testName} end`);
        done();
    });
  })

}