/*
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { protoTypeChangeTest0, protoTypeChangeTest1,
  protoTypeChangeTest10,
  protoTypeChangeTest11,
  protoTypeChangeTest12,
  protoTypeChangeTest13,
  protoTypeChangeTest14,
  protoTypeChangeTest15,
  protoTypeChangeTest16,
  protoTypeChangeTest17,
  protoTypeChangeTest18,
  protoTypeChangeTest19,
  protoTypeChangeTest2,
  protoTypeChangeTest20,
  protoTypeChangeTest21,
  protoTypeChangeTest22,
  protoTypeChangeTest23,
  protoTypeChangeTest24,
  protoTypeChangeTest25,
  protoTypeChangeTest26,
  protoTypeChangeTest27,
  protoTypeChangeTest28,
  protoTypeChangeTest29,
  protoTypeChangeTest3,
  protoTypeChangeTest30,
  protoTypeChangeTest31,
  protoTypeChangeTest32,
  protoTypeChangeTest33,
  protoTypeChangeTest34,
  protoTypeChangeTest35,
  protoTypeChangeTest36,
  protoTypeChangeTest37,
  protoTypeChangeTest38,
  protoTypeChangeTest39,
  protoTypeChangeTest4,
  protoTypeChangeTest40,
  protoTypeChangeTest41,
  protoTypeChangeTest42,
  protoTypeChangeTest43,
  protoTypeChangeTest44,
  protoTypeChangeTest45,
  protoTypeChangeTest46,
  protoTypeChangeTest47,
  protoTypeChangeTest48,
  protoTypeChangeTest49,
  protoTypeChangeTest5,
  protoTypeChangeTest50,
  protoTypeChangeTest51,
  protoTypeChangeTest52,
  protoTypeChangeTest53,
  protoTypeChangeTest54,
  protoTypeChangeTest55,
  protoTypeChangeTest56,
  protoTypeChangeTest57,
  protoTypeChangeTest6,
  protoTypeChangeTest7,
  protoTypeChangeTest8,
  protoTypeChangeTest9} from './protoTypeChange';
import { protoTypeChange1Test, protoTypeChange1Test1,
  protoTypeChange1Test10,
  protoTypeChange1Test11,
  protoTypeChange1Test12,
  protoTypeChange1Test13,
  protoTypeChange1Test14,
  protoTypeChange1Test15,
  protoTypeChange1Test16,
  protoTypeChange1Test17,
  protoTypeChange1Test18,
  protoTypeChange1Test19,
  protoTypeChange1Test2,
  protoTypeChange1Test20,
  protoTypeChange1Test21,
  protoTypeChange1Test22,
  protoTypeChange1Test23,
  protoTypeChange1Test3,
  protoTypeChange1Test4,
  protoTypeChange1Test5,
  protoTypeChange1Test6,
  protoTypeChange1Test7,
  protoTypeChange1Test8,
  protoTypeChange1Test9 } from './protoTypeChange1';
import {
  protoTypeChange2Test,
  protoTypeChange2Test1,
  protoTypeChange2Test2,
  protoTypeChange2Test3,
  protoTypeChange2Test4,
  protoTypeChange2Test5,
  protoTypeChange2Test6,
  protoTypeChange2Test7,
  protoTypeChange2Test8,
  protoTypeChange2Test9,
  protoTypeChange2Test10,
  protoTypeChange2Test11,
  protoTypeChange2Test12,
  protoTypeChange2Test13,
  protoTypeChange2Test14,
  protoTypeChange2Test15,
  protoTypeChange2Test16,
  protoTypeChange2Test17
} from './protoTypeChange2';
import {
  protoTypeChange3Test,
  protoTypeChange3Test1,
  protoTypeChange3Test2,
  protoTypeChange3Test3,
  protoTypeChange3Test4,
  protoTypeChange3Test5,
  protoTypeChange3Test6,
  protoTypeChange3Test7,
  protoTypeChange3Test8,
  protoTypeChange3Test9,
  protoTypeChange3Test10,
  protoTypeChange3Test11,
  protoTypeChange3Test12,
  protoTypeChange3Test13,
  protoTypeChange3Test14,
  protoTypeChange3Test15,
  protoTypeChange3Test16,
  protoTypeChange3Test17,
  protoTypeChange3Test18,
  protoTypeChange3Test19,
  protoTypeChange3Test20,
  protoTypeChange3Test21,
  protoTypeChange3Test22,
  protoTypeChange3Test23,
  protoTypeChange3Test24,
  protoTypeChange3Test25,
  protoTypeChange3Test26,
  protoTypeChange3Test27,
  protoTypeChange3Test28,
  protoTypeChange3Test29,
  protoTypeChange3Test30,
  protoTypeChange3Test31,
  protoTypeChange3Test32,
  protoTypeChange3Test33,
  protoTypeChange3Test34,
  protoTypeChange3Test35,
  protoTypeChange3Test36,
  protoTypeChange3Test37,
  protoTypeChange3Test38,
  protoTypeChange3Test39,
  protoTypeChange3Test40
} from './protoTypeChange3';
import {
  protoTypeChange4Test,
  protoTypeChange4Test1,
  protoTypeChange4Test2,
  protoTypeChange4Test3,
  protoTypeChange4Test4,
  protoTypeChange4Test5,
  protoTypeChange4Test6,
  protoTypeChange4Test7,
  protoTypeChange4Test8,
  protoTypeChange4Test9,
  protoTypeChange4Test10,
  protoTypeChange4Test11,
  protoTypeChange4Test12,
  protoTypeChange4Test13,
  protoTypeChange4Test14,
  protoTypeChange4Test15,
  protoTypeChange4Test16,
  protoTypeChange4Test17,
  protoTypeChange4Test18,
  protoTypeChange4Test19,
  protoTypeChange4Test20,
  protoTypeChange4Test21,
  protoTypeChange4Test22,
  protoTypeChange4Test23,
  protoTypeChange4Test24,
  protoTypeChange4Test25,
  protoTypeChange4Test26,
  protoTypeChange4Test27,
  protoTypeChange4Test28,
  protoTypeChange4Test29,
  protoTypeChange4Test30,
  protoTypeChange4Test31
} from './protoTypeChange4';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function prototypeChangeTest() {
  describe('prototypeChangeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_0100
     * @tc.name prototypeChangeTest0100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest0() as (string)[];
      expect(result.toString()).assertEqual(['Woof!', 'Meow!', 'undefined is not callable'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_0200
     * @tc.name prototypeChangeTest0200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest1() as string[];
      expect(result.toString()).assertEqual(['Woof!', 'Eating...'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_0300
     * @tc.name prototypeChangeTest0300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest2() as number[];
      expect(result.toString()).assertEqual([6, 30].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_0400
     * @tc.name prototypeChangeTest0400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest3() as string[];
      expect(result.toString()).assertEqual(['Woof!', 'Eating...'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_0500
     * @tc.name prototypeChangeTest0500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest4() as string[];
      expect(result.toString()).assertEqual(['Buddy says woof!', 'Buddy is eating.'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_0600
     * @tc.name prototypeChangeTest0600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest5() as (string | undefined)[];
      expect(result.toString()).assertEqual(['dark',undefined].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_0700
     * @tc.name prototypeChangeTest0700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest6() as boolean[];
      expect(result.toString()).assertEqual([true,false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_0800
     * @tc.name prototypeChangeTest0800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest7();
      expect(result.toString()).assertEqual('2023-02-01');
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_0900
     * @tc.name prototypeChangeTest0900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest8() as string[];
      expect(result.toString()).assertEqual(['[Framework] Framework is ready. Loading plugins...','[Framework] Plugin "LogPlugin" initialized.','[Framework] Tracking event: user_login'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1000
     * @tc.name prototypeChangeTest1000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest9() as string[];
      expect(result.toString()).assertEqual(["SetPrototypeOf: prototype set failed,https://api.example.com", undefined].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1100
     * @tc.name prototypeChangeTest1100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest10() as string[];
      expect(result.toString()).assertEqual(['Hero takes 5 damage. Health: 94', 'Hero takes 3 damage. Health: 90'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1200
     * @tc.name prototypeChangeTest1200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest11() as (string | boolean | number)[];
      expect(result.toString()).assertEqual(['Hello, my name is Alice','Hello, my name is Bob','Regular User','Regular User',true,6,6,1].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1300
     * @tc.name prototypeChangeTest1300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest12() as (string | number | undefined)[];
      expect(result.toString()).assertEqual([1,'Charlie', undefined].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1400
     * @tc.name prototypeChangeTest1400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest13() as (string | number)[];
      expect(result.toString()).assertEqual(['David',30,'David',30].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1500
     * @tc.name prototypeChangeTest1500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest14() as (string | number)[];
      expect(result.toString()).assertEqual([0,'Eve',,1,'Eve Modified','test'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1600
     * @tc.name prototypeChangeTest1600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest15();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1700
     * @tc.name prototypeChangeTest1700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest16() as string[];
      expect(result.toString()).assertEqual(['✅ Form is valid. Processing...',"❌ Validation failed for field 'age': Age must be a number and at least 18.","❌ Validation failed for field 'email': Email is required."].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1800
     * @tc.name prototypeChangeTest1800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest17() as (string | boolean)[];
      expect(result.toString()).assertEqual([false,false,false,'object'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_1900
     * @tc.name prototypeChangeTest1900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest18() as (string | undefined | boolean)[];
      expect(result.toString()).assertEqual(['function toString() { [native code] }','my custom string',,'my custom string','my custom string',,true,false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2000
     * @tc.name prototypeChangeTest2000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest19() as (string | number | undefined)[];
      expect(result.toString()).assertEqual([3,2,1,,'[object Object]','value'].toString());
    });
    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2100
     * @tc.name prototypeChangeTest2100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest20();
      expect(result).assertEqual(`{
  "id": 1,
  "name": "Frank",
  "middleName": null,
  "address": {
    "street": "123 Main St",
    "city": "Anytown",
    "zipCode": null
  }
}`);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2200
     * @tc.name prototypeChangeTest2200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest21() as number[];
      expect(result.toString()).assertEqual([15,0,30].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2300
     * @tc.name prototypeChangeTest2300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest21() as number[];
      expect(result.toString()).assertEqual([15,0,30].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2400
     * @tc.name prototypeChangeTest2400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      // let result = protoTypeChangeTest22() as boolean[];
      // expect(result.toString()).assertEqual([true,false,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2500
     * @tc.name prototypeChangeTest2500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest23() as string[];
      expect(result.toString()).assertEqual(['id','name','id','name','id','name'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2600
     * @tc.name prototypeChangeTest2600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest24();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2700
     * @tc.name prototypeChangeTest2700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest25() as number[];
      expect(result.toString()).assertEqual([14,14].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2800
     * @tc.name prototypeChangeTest2800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest26() as string[];
      expect(result.toString()).assertEqual(["Validation failed for property 'age': Age must be a valid number between 1 and 119.", "Validation failed for property 'email': Email must be a valid email address."].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_2900
     * @tc.name prototypeChangeTest2900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest27() as string[];
      expect(result.toString()).assertEqual(['Original','Hello from Original','Proxy'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3000
     * @tc.name prototypeChangeTest3000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest28() as (string | number | boolean)[];
      expect(result.toString()).assertEqual(['dark','grid',10,1,2,1,2,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3100
     * @tc.name prototypeChangeTest3100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest29() as number[];
      expect(result.toString()).assertEqual([5,9,12].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3200
     * @tc.name prototypeChangeTest3200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest30();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3300
     * @tc.name prototypeChangeTest3300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest31();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3400
     * @tc.name prototypeChangeTest3400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest32() as (string | boolean | undefined)[];
      expect(result.toString()).assertEqual([,false,,,"function toString() { [native code] }","function hasOwnProperty() { [native code] }"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3500
     * @tc.name prototypeChangeTest3500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest33() as string[];
      expect(result.toString()).assertEqual(["Cannot get source code of function","function","function () { [native code] }","function toString() { [native code] }"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3600
     * @tc.name prototypeChangeTest3600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest34() as string[];
      expect(result.toString()).assertContain('false');
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3700
     * @tc.name prototypeChangeTest3700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest35();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3800
     * @tc.name prototypeChangeTest3800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest36();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_3900
     * @tc.name prototypeChangeTest3900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest37() as (string | undefined | boolean)[];
      expect(result.toString()).assertEqual(["Cannot get source code of function",,false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4000
     * @tc.name prototypeChangeTest4000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest38();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4100
     * @tc.name prototypeChangeTest4100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest39() as (string | boolean | undefined)[];
      expect(result.toString()).assertEqual(["object","Cannot get source code of function","[object Object]",false,,"function toString() { [native code] }"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4200
     * @tc.name prototypeChangeTest4200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest40() as (string | boolean)[];
      expect(result.toString()).assertEqual([false,false,false,false,"Cannot read property isPrototypeOf of null"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4300
     * @tc.name prototypeChangeTest4300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest41() as (string | boolean)[];
      expect(result.toString()).assertEqual(["function Function() { [native code] }",false,true,"Cannot get source code of function"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4400
     * @tc.name prototypeChangeTest4400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest42() as boolean[];
      expect(result.toString()).assertEqual([true,true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4500
     * @tc.name prototypeChangeTest4500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest43() as (string | number)[];
      expect(result.toString()).assertContain('I am from f15');
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4600
     * @tc.name prototypeChangeTest4600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest44() as string[];
      expect(result.toString()).assertEqual([`{"b":"hello"}`,"[object Object]",,"hello"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4700
     * @tc.name prototypeChangeTest4700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest45() as (string | undefined)[];
      expect(result.toString()).assertEqual([,'constructor'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4800
     * @tc.name prototypeChangeTest4800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest46() as boolean[];
      expect(result.toString()).assertEqual([false,true,true,false,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_4900
     * @tc.name prototypeChangeTest4900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest47() as string[];
      expect(result.toString()).assertEqual(['b'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5000
     * @tc.name prototypeChangeTest5000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest48() as string[];
      expect(result.toString()).assertEqual(['length','name','prototype','b','c','b'].toString());
    });
    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5100
     * @tc.name prototypeChangeTest5100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest49() as (string | undefined)[];
      expect(result.toString()).assertEqual([undefined,undefined,undefined,undefined].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5200
     * @tc.name prototypeChangeTest5200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest50() as (number | undefined)[];
      expect(result.toString()).assertEqual([undefined,999,undefined,undefined].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5300
     * @tc.name prototypeChangeTest5300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest51() as (string | boolean | undefined)[];
      expect(result.toString()).assertEqual([,true,'Cannot get source code of function',true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5400
     * @tc.name prototypeChangeTest5400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest52() as (string | boolean)[];
      expect(result.toString()).assertEqual([true,'function','function','function'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5500
     * @tc.name prototypeChangeTest5500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest53() as (number | boolean | undefined)[];
      expect(result.toString()).assertEqual([,,,300,false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5600
     * @tc.name prototypeChangeTest5600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest54() as string[];
      expect(result.toString()).assertEqual(['[object Object]','[object Object]','[object Object]'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5700
     * @tc.name prototypeChangeTest5700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest55() as string[];
      expect(result.toString()).assertEqual(["hello","Default value for 'a'","Default value for 'foo'"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5800
     * @tc.name prototypeChangeTest5800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest56() as (string | boolean)[];
      expect(result.toString()).assertEqual(["[object Function]",true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_5900
     * @tc.name prototypeChangeTest5900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest5900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChangeTest57() as (string | number | undefined)[];
      expect(result.toString()).assertEqual(['new value',100,'hello',undefined].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6000
     * @tc.name prototypeChangeTest6000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6100
     * @tc.name prototypeChangeTest6100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test1() as (boolean | string)[];
      expect(result.toString()).assertEqual([true,981205344].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6200
     * @tc.name prototypeChangeTest6200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test2() as (string | boolean | undefined)[];
      expect(result.toString()).assertContain('true');
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6300
     * @tc.name prototypeChangeTest6300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test3();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6400
     * @tc.name prototypeChangeTest6400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test4() as (string | undefined)[];
      expect(result.toString()).assertEqual([,,,'value'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6500
     * @tc.name prototypeChangeTest6500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test5() as (number | boolean | string[])[];
      expect(result.toString()).assertEqual([536870887,true,166,'length','name','prototype'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6600
     * @tc.name prototypeChangeTest6600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test6() as (string | undefined)[];
      expect(result.toString()).assertEqual([,,undefined].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6700
     * @tc.name prototypeChangeTest6700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test7() as boolean[];
      expect(result.toString()).assertEqual([true,true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6800
     * @tc.name prototypeChangeTest6800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test8() as string[];
      expect(result.toString()).assertEqual(['function','[object Object]',true,true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_6900
     * @tc.name prototypeChangeTest6900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest6900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test9() as (string | boolean)[];
      expect(result.toString()).assertEqual([true,true,'Cannot access parent private field directly'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7000
     * @tc.name prototypeChangeTest7000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test10() as number[];
      expect(result.toString()).assertEqual([981205344].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7100
     * @tc.name prototypeChangeTest7100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test11() as (boolean | undefined)[];
      expect(result.toString()).assertEqual([true,,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7200
     * @tc.name prototypeChangeTest7200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test12();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7300
     * @tc.name prototypeChangeTest7300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test13() as number[];
      expect(result.toString()).assertEqual([981205344,981205344,981205344].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7400
     * @tc.name prototypeChangeTest7400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test14() as (string | boolean)[];
      expect(result.toString()).assertEqual(["This is an instance method from C6.prototype","This is a static method from C6",true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7500
     * @tc.name prototypeChangeTest7500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test15() as string[];
      expect(result.toString()).assertEqual(["This is an instance method from C6.prototype (and this is from the child)","This is a static method from C6 (and this is from the child static)"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7600
     * @tc.name prototypeChangeTest7600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test16() as (string | boolean | undefined)[];
      expect(result.toString()).assertEqual([,,'[object Object]',false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7700
     * @tc.name prototypeChangeTest7700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test17() as boolean[];
      expect(result.toString()).assertEqual([true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7800
     * @tc.name prototypeChangeTest7800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test18();
      expect(result).assertEqual(981205344);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_7900
     * @tc.name prototypeChangeTest7900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest7900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test19() as string[];
      expect(result.toString()).assertContain("true");
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8000
     * @tc.name prototypeChangeTest8000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test20() as (string | boolean)[];
      expect(result.toString()).assertEqual([`{"publicField":"I am public"}`,'I am public',false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8100
     * @tc.name prototypeChangeTest8100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test21() as string[];
      expect(result.toString()).assertEqual(["I am static and private (from method)","Instance method cannot access static private field directly"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8200
     * @tc.name prototypeChangeTest8200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test22() as string[];
      expect(result.toString()).assertEqual(["This is a value stored with a Symbol key",,'instanceMethod',"Symbol()"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8300
     * @tc.name prototypeChangeTest8300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange1Test23() as (number | boolean)[];
      expect(result.toString()).assertEqual([true,-23682,-23682].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8400
     * @tc.name prototypeChangeTest8400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8500
     * @tc.name prototypeChangeTest8500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test1() as boolean[];
      expect(result.toString()).assertEqual([true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8600
     * @tc.name prototypeChangeTest8600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test2() as boolean[];
      expect(result.toString()).assertEqual([true,true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8700
     * @tc.name prototypeChangeTest8700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test3() as string[];
      expect(result.toString()).assertEqual([,,"function call() { [native code] }","function apply() { [native code] }","function bind() { [native code] }"].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8800
     * @tc.name prototypeChangeTest8800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test4();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_8900
     * @tc.name prototypeChangeTest8900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest8900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test5();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9000
     * @tc.name prototypeChangeTest9000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test6();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9100
     * @tc.name prototypeChangeTest9100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test7();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9200
     * @tc.name prototypeChangeTest9200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test8();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9300
     * @tc.name prototypeChangeTest9300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test9();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9400
     * @tc.name prototypeChangeTest9400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test10();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9500
     * @tc.name prototypeChangeTest9500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test11() as (string | boolean)[];
      expect(result.toString()).assertEqual(['object',true,'[object Promise]','TypeErrorThen: thisValue is not promise!'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9600
     * @tc.name prototypeChangeTest9600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test12();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9700
     * @tc.name prototypeChangeTest9700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test13();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9800
     * @tc.name prototypeChangeTest9800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test14() as (string | boolean)[];
      expect(result.toString()).assertEqual([true,true,true,true,true,'function',true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_9900
     * @tc.name prototypeChangeTest9900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest9900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test15() as boolean[];
      expect(result.toString()).assertEqual([true,false,true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10000
     * @tc.name prototypeChangeTest10000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test16() as string[];
      expect(result.toString()).assertEqual(['[object C85Promise]','[object Promise]'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10100
     * @tc.name prototypeChangeTest10100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange2Test17() as string[];
      expect(result.toString()).assertContain("function,function,");
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10200
     * @tc.name prototypeChangeTest10200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10300
     * @tc.name prototypeChangeTest10300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test1() as (string | number | boolean | undefined)[];
      expect(result.toString()).assertEqual(['Int8Array.prototype',2,4,6,'Int8Array',,2,4,6,'Int32Array',false,true,false,true,false,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10400
     * @tc.name prototypeChangeTest10400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test2();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10500
     * @tc.name prototypeChangeTest10500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test3();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10600
     * @tc.name prototypeChangeTest10600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test4();
      expect(result.toString()).assertEqual([true,true,false,true,false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10700
     * @tc.name prototypeChangeTest10700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test5();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10800
     * @tc.name prototypeChangeTest10800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test6();
      expect(result.toString()).assertEqual([3,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_10900
     * @tc.name prototypeChangeTest10900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest10900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test7();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11000
     * @tc.name prototypeChangeTest11000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test8();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11100
     * @tc.name prototypeChangeTest11100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test9();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11200
     * @tc.name prototypeChangeTest11200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test10();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11300
     * @tc.name prototypeChangeTest11300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test11();
      expect(result.toString()).assertEqual([4,2,16,4.94e-322,100,0,0,0,100].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11400
     * @tc.name prototypeChangeTest11400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test12();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11500
     * @tc.name prototypeChangeTest11500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test13();
      expect(result.toString()).assertEqual(['Int8Array','Int32Array',true,false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11600
     * @tc.name prototypeChangeTest11600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test14() as string[];
      expect(result.toString()).assertEqual([,'I am a property of y instance','I have been modified','Trying to overwrite','I have been modified'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11700
     * @tc.name prototypeChangeTest11700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test15() as (string | boolean)[];
      expect(result.toString()).assertEqual([true,true,'Int32Array'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11800
     * @tc.name prototypeChangeTest11800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test16();
      expect(result.toString()).assertEqual([true,false,false,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_11900
     * @tc.name prototypeChangeTest11900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest11900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test17();
      expect(result.toString()).assertEqual([true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12000
     * @tc.name prototypeChangeTest12000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test18();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12100
     * @tc.name prototypeChangeTest12100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test19();
      expect(result.toString()).assertEqual([false,false,false,false,false,false,'1, 2, 3'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12200
     * @tc.name prototypeChangeTest12200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test20();
      expect(result.toString()).assertEqual([0,1,2,0,1,2].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12300
     * @tc.name prototypeChangeTest12300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test21();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12400
     * @tc.name prototypeChangeTest12400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test22();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12500
     * @tc.name prototypeChangeTest12500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test23();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12600
     * @tc.name prototypeChangeTest12600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test24();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12700
     * @tc.name prototypeChangeTest12700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test25() as (string | number)[];
      expect(result.toString()).assertEqual([3,'I am from y',3].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12800
     * @tc.name prototypeChangeTest12800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test26();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_12900
     * @tc.name prototypeChangeTest12900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest12900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test27();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13000
     * @tc.name prototypeChangeTest13000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test28();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13100
     * @tc.name prototypeChangeTest13100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test29() as (number | boolean)[];
      expect(result.toString()).assertEqual([3,0,3,false,3,0,3,true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13200
     * @tc.name prototypeChangeTest13200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test30();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13300
     * @tc.name prototypeChangeTest13300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test31() as boolean[];
      expect(result.toString()).assertEqual([true,true,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13400
     * @tc.name prototypeChangeTest13400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test32();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13500
     * @tc.name prototypeChangeTest13500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test33();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13600
     * @tc.name prototypeChangeTest13600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test34();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13700
     * @tc.name prototypeChangeTest13700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test35();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13800
     * @tc.name prototypeChangeTest13800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test36();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_13900
     * @tc.name prototypeChangeTest13900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest13900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test37();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14000
     * @tc.name prototypeChangeTest14000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test38();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14100
     * @tc.name prototypeChangeTest14100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test39();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14200
     * @tc.name prototypeChangeTest14200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange3Test40();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14300
     * @tc.name prototypeChangeTest14300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14400
     * @tc.name prototypeChangeTest14400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test1();
      expect(result.toString()).assertEqual([false,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14500
     * @tc.name prototypeChangeTest14500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test2() as (string | boolean | number)[];
      expect(result.toString()).assertEqual(['undefined',true,2,true,false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14600
     * @tc.name prototypeChangeTest14600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test3() as (string | boolean)[];
      expect(result.toString()).assertEqual([true,true,true,'I am new'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14700
     * @tc.name prototypeChangeTest14700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test4() as (string | boolean)[];
      expect(result.toString()).assertEqual(['This array has 3 elements.','This array has 5 elements.',"Fake includes: I don't know if 2 is present.",true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14800
     * @tc.name prototypeChangeTest14800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test5() as (string | number | boolean)[];
      expect(result.toString()).assertEqual([true,10,Math.PI,'undefined'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_14900
     * @tc.name prototypeChangeTest14900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest14900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test6() as string[];
      expect(result.toString()).assertEqual(['TypeErrorCannot read property __proto__ of null','TypeErrorCannot read property __proto__ of undefined'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15000
     * @tc.name prototypeChangeTest15000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test7();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15100
     * @tc.name prototypeChangeTest15100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test8();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15200
     * @tc.name prototypeChangeTest15200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test9();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15300
     * @tc.name prototypeChangeTest15300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test10();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15400
     * @tc.name prototypeChangeTest15400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test11();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15500
     * @tc.name prototypeChangeTest15500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test12();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15600
     * @tc.name prototypeChangeTest15600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test13();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15700
     * @tc.name prototypeChangeTest15700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test14();
      expect(result.toString()).assertEqual(['[object Object]',['a','b'],'[object Object]',['a','b'],'[object Object]'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15800
     * @tc.name prototypeChangeTest15800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test15();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_15900
     * @tc.name prototypeChangeTest15900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest15900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test16() as string[];
      expect(result.toString()).assertEqual(['I am private,Failed to steal: undefined is not callable','undefined is not callable'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16000
     * @tc.name prototypeChangeTest16000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test17() as (string | undefined | boolean)[];
      expect(result.toString()).assertEqual([,undefined,undefined,true,true,true,undefined,undefined,undefined,undefined].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16100
     * @tc.name prototypeChangeTest16100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test18() as string[];
      expect(result.toString()).assertEqual([true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16200
     * @tc.name prototypeChangeTest16200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test19();
      expect(result.toString()).assertEqual([42,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16300
     * @tc.name prototypeChangeTest16300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test20();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16400
     * @tc.name prototypeChangeTest16400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test21() as string[];
      expect(result.toString()).assertEqual(['Current value is 1','Current value is 2'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16500
     * @tc.name prototypeChangeTest16500
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test22();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16600
     * @tc.name prototypeChangeTest16600
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test23() as string[];
      expect(result.toString()).assertEqual([['value from child1','value from child3','value from child5'],['value from child1','value from child3',
        'value from child5'],['value from child1','value from child3','value from child5'],['value from child1','value from child3',
        'value from child5'],['value from child1','value from child3','value from child5'],['value from child1','value from child3','value from child5']].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16700
     * @tc.name prototypeChangeTest16700
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test24() as (string | boolean | undefined | null)[];
      expect(result.toString()).assertEqual(['Create: O is neither Object nor Null', null, undefined,true,false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16800
     * @tc.name prototypeChangeTest16800
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test25();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_16900
     * @tc.name prototypeChangeTest16900
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest16900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test26();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_17000
     * @tc.name prototypeChangeTest17000
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest17000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test27();
      expect(result.toString()).assertEqual([false,false].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_17100
     * @tc.name prototypeChangeTest17100
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest17100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test28() as string[];
      expect(result.toString()).assertEqual([ '[object Object]','Zog','undefined is not callable','[object Object]'].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_17200
     * @tc.name prototypeChangeTest17200
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest17200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test29();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_17300
     * @tc.name prototypeChangeTest17300
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest17300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test30() as string[];
      expect(result.toString()).assertEqual([true,true,true,false,true,false,false,true].toString());
    });

    /**
     * @tc.number SUB_PROTOTYPE_CHANGE_TEST_17400
     * @tc.name prototypeChangeTest17400
     * @tc.desc change obj proto
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prototypeChangeTest17400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = protoTypeChange4Test31() as (string | boolean | undefined)[];
      expect(result.toString()).assertEqual(['user-123','my-secret-password',false,undefined ].toString());
    });
  });
}