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

export default function DigitIndicatorNullUndefined() {
  describe('DigitIndicatorNullUndefined', () => {
    beforeEach(async (done: Function) => {
      console.info("DigitIndicatorNullUndefined beforeEach start");
        let driver: Driver = Driver.create();
    let size = await driver.getDisplaySize();
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SwiperAttributeNullUndefined/DigitIndicatorNullUndefined',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DigitIndicatorNullUndefined state pages:" + JSON.stringify(pages));
        if (!("DigitIndicatorNullUndefined" == pages.name)) {
          console.info("get DigitIndicatorNullUndefined pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push DigitIndicatorNullUndefined page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DigitIndicatorNullUndefined page error:" + err);
      }
      console.info("DigitIndicatorNullUndefined beforeEach end");
      done();
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DigitIndicatorNullUndefined after each called");
    });

    /**
    * @tc.name   DigitIndicatorNullUndefined_0010
    * @tc.number DigitIndicatorNullUndefined_0010
    * @tc.desc   test digitFont
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DigitIndicatorNullUndefined_0010', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DigitIndicatorNullUndefined_0010]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDigit3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 digitFont: ` + obj3.$attrs.digitFont);

        let strJson1 = getInspectorByKey('swiperDigit1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 digitFont: ` + obj1.$attrs.digitFont);

        let strJson2 = getInspectorByKey('swiperDigit2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 digitFont: ` + obj2.$attrs.digitFont);

        expect(obj3.$attrs.digitFont).assertEqual(obj2.$attrs.digitFont);
        expect(obj3.$attrs.digitFont).assertEqual(obj1.$attrs.digitFont);
        console.log(`${testName} end`);
        done();
    });

    /**
    * @tc.name   DigitIndicatorNullUndefined_0020
    * @tc.number DigitIndicatorNullUndefined_0020
    * @tc.desc   test selectedDigitFont
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL1
    */
    it('DigitIndicatorNullUndefined_0020', Level.LEVEL1, async (done: Function) => {
        let testName: string = '[DigitIndicatorNullUndefined_0020]';
        console.log(`${testName} start`);
        let driver: Driver = Driver.create();

        let strJson3 = getInspectorByKey('swiperDigit3');
        let obj3: ESObject = JSON.parse(strJson3);
        console.info(`${testName} 3 selectedDigitFont: ` + obj3.$attrs.selectedDigitFont);

        let strJson1 = getInspectorByKey('swiperDigit1');
        let obj1: ESObject = JSON.parse(strJson1);
        console.info(`${testName} 1 selectedDigitFont: ` + obj1.$attrs.selectedDigitFont);

        let strJson2 = getInspectorByKey('swiperDigit2');
        let obj2: ESObject = JSON.parse(strJson2);
        console.info(`${testName} 2 selectedDigitFont: ` + obj2.$attrs.selectedDigitFont);

        expect(obj3.$attrs.selectedDigitFont).assertEqual(obj2.$attrs.selectedDigitFont);
        expect(obj3.$attrs.selectedDigitFont).assertEqual(obj1.$attrs.selectedDigitFont);
        console.log(`${testName} end`);
        done();
    });
  })

}