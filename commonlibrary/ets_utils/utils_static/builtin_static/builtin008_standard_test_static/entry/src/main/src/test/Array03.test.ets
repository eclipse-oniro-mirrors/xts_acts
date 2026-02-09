/**
 * Copyright (c) 2025-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';

class parse {
  text: string = ''
}

function isIteratorEmpty<T>(iterator: Iterator<T>): boolean {
  const firstResult = iterator.next();
  return firstResult.done === true;
}

interface Options {
  type: string,
  endings: string,
}

export default function Array_03Test() {
  describe('Array_03Test', (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1000
     * @tc.name    testSort0010
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0010";
      try {
        let arr:FixedArray<boolean>=[false,true,false,true,false];
        sort(arr,0,5);
        const excepted:FixedArray<boolean>=[false,false,false,true,true];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1100
     * @tc.name    testSort0011
     * @tc.desc    Testing sort with startIndex in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0011";
      try {
        let arr:FixedArray<boolean>=[false,true,false,true,false];
        sort(arr,2,5);
        const excepted:FixedArray<boolean>=[false,true,false,false,true];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1600
     * @tc.name    testSort0016
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0016";
      try {
        let arr:FixedArray<boolean>=[true];
        sort(arr,0,1);
        const excepted:FixedArray<boolean>=[true];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_2700
     * @tc.name    testSort0027
     * @tc.desc    Testing sort with unsorted array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0027";
      try {
        let arr:FixedArray<byte>=[127,111,-128,88,99];
        sort(arr,0,5);
        const excepted:FixedArray<byte>=[-128,88,99,111,127];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_2800
     * @tc.name    testSort0028
     * @tc.desc    Testing sort with startIndex in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0028";
      try {
        let arr:FixedArray<byte>=[127,111,-128,88,99];
        sort(arr,2,5);
        const excepted:FixedArray<byte>=[127,111,-128,88,99];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_ARR_END_BYTE_3500
     * @tc.name    testSort0035
     * @tc.desc    Testing sort with duplicate elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0035";
      try {
        let arr:FixedArray<byte>=[127,127,127,10];
        sort(arr,0,4);
        const excepted:FixedArray<byte>=[10,127,127,127];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_6400
     * @tc.name    testSort0064
     * @tc.desc    Testing Type.of with null.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0064";
      try {
        let arr:FixedArray<double>=[8, 1, 0.8e-13, 0.8e-16, 0.006];
        sort(arr,0,5);
        const excepted:FixedArray<double>=[0.8e-16,0.8e-13,0.006,1,8];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_6500
     * @tc.name    testSort0065
     * @tc.desc    Testing sort with Index in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0065";
      try {
        let arr:FixedArray<double>=[3.14, 9.26, 5.56, 2.25, 9.99];
        sort(arr,2,5);
        const excepted:FixedArray<double>=[3.14, 9.26, 2.25, 5.56, 9.99];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_7000
     * @tc.name    testSort0070
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0070";
      try {
        let arr:FixedArray<double>=[0.8e-13];
        sort(arr,0,1);
        const excepted:FixedArray<double>=[0.8e-13];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_7200
     * @tc.name    testSort0072
     * @tc.desc    Testing sort with duplicate elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0072";
      try {
        let arr:FixedArray<double>=[8, 1, 1,1,1,10086.10086];
        sort(arr,0,6);
        const excepted:FixedArray<double>=[1,1,1,1,8,10086.10086];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_8800
     * @tc.name    testSort0088
     * @tc.desc    Testing sort with single element array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0088";
      try {
        let arr:FixedArray<float>=[10086.00];
        sort(arr,0,1);
        const excepted:FixedArray<float>=[10086.00];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1000_01
     * @tc.name    testSort0100
     * @tc.desc    Sort entire arr from 0 to length.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0100";
      try {
        let arr:FixedArray<int>=[2147483647,6,9,1,-2147483648];
        sort(arr,0,5);
        const excepted:FixedArray<int>= [-2147483648,1,6,9,2147483647];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1010
     * @tc.name    testSort0101
     * @tc.desc    Testing sort with Index in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0101";
      try {
        let arr:FixedArray<int>=[2147483647,6,9,1,-2147483648];
        sort(arr,2,4);
        const excepted:FixedArray<int>= [2147483647,6,1,9,-2147483648];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1040
     * @tc.name    testSort0104
     * @tc.desc    Testing StartIndex and EndIndex values are the same
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0104";
      try {
        let arr:FixedArray<int>=[-2,6,9,1,10086];
        sort(arr,2,2);
        const excepted:FixedArray<int>= [-2,6,9,1,10086];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1050
     * @tc.name    testSort0105
     * @tc.desc    Testing sort with empty array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0105";
      try {
        let arr:FixedArray<int>=[];
        sort(arr,0,0);
        const excepted:FixedArray<int>= [];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1060
     * @tc.name    testSort0106
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0106";
      try {
        let arr:FixedArray<int>=[2147483647];
        sort(arr,0,1);
        const excepted:FixedArray<int>= [2147483647];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1080
     * @tc.name    testSort0108
     * @tc.desc    Testing sort with duplicate elements
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0108";
      try {
        let arr:FixedArray<int>=[10086,666,666,666];
        sort(arr,0,3);
        const excepted:FixedArray<int>= [666,666,10086,666];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1180
     * @tc.name    testSort0118
     * @tc.desc    Testing sort with startIndex O on unsorted array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0118";
      try {
        let arr:FixedArray<long> =[9007199254740991,9,6,5];
        sort(arr,0,4);
        const excepted:FixedArray<long>=[5,6,9,9007199254740991];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1190
     * @tc.name    testSort0119
     * @tc.desc    Testing sort with startIndex in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0119";
      try {
        let arr:FixedArray<long> =[9007199254740991,9,6,5,7];
        sort(arr,2,5);
        const excepted:FixedArray<long>=[9007199254740991,9,5,6,7];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1220
     * @tc.name    testSort0122
     * @tc.desc    Testing StartIndex and EndIndex values are the same
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0122";
      try {
        let arr:FixedArray<long> =[864141665,9,6,5,7];
        sort(arr,2,2);
        const excepted:FixedArray<long>=[864141665,9,6,5,7];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1240
     * @tc.name    testSort0124
     * @tc.desc    Testing sort with single element array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0124";
      try {
        let arr:FixedArray<long> =[-9007199254740991];
        sort(arr,0,1);
        const excepted:FixedArray<long>=[-9007199254740991];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1360
     * @tc.name    testSort0136
     * @tc.desc    Testing sort with unsorted array.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0136";
      try {
        let arr:FixedArray<short>=[32767,-32768,1];
        sort(arr,0,3);
        const excepted:FixedArray<short>=[-32768,1,32767];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1370
     * @tc.name    testSort0137
     * @tc.desc    Testing sort with startIndex in the middle.
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0137";
      try {
        let arr:FixedArray<short>=[32767, -32768, 9, 5, 1];
        sort(arr,2,5);
        const excepted:FixedArray<short>=[32767, -32768, 1, 5, 9];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SORT_1440
     * @tc.name    testSort0144
     * @tc.desc    Testing sort with unsorted Index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 1
     */
    it('testSort0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0144";
      try {
        let arr:FixedArray<short>=[6,6,6,5,9];
        sort(arr,0,5);
        const excepted:FixedArray<short>=[5,6,6,6,9];
        expect(arr.toString()).assertEqual(excepted.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1450
     * @tc.name      testSort0145
     * @tc.desc      Testing sort function with various boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0145";
      try {
        let arr1: FixedArray<boolean> = [true, false, true, false];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<boolean> = [false, false, true, true];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1460
     * @tc.name      testSort0146
     * @tc.desc      Testing sort function with empty boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0146";
      try {
        let arr3: FixedArray<boolean> = [];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1470
     * @tc.name      testSort0147
     * @tc.desc      Testing sort function with same boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0147";
      try {
        let arr3: FixedArray<boolean> = [false, false ,false];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [false, false ,false];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });


    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1480
     * @tc.name      testSort0148
     * @tc.desc      Testing sort function with same boolean value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0148";
      try {
        let arr1: FixedArray<boolean> = [true, true, true];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<boolean> = [true, true, true];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1490
     * @tc.name      testSort0149
     * @tc.desc      Testing sort function with a single element boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0149";
      try {
        let arr3: FixedArray<boolean> = [true];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [true];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1500_01
     * @tc.name      testSort0150
     * @tc.desc      Testing sort function with a single element boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0150";
      try {
        let arr3: FixedArray<boolean> = [false];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [false];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1550
     * @tc.name      testSort0155
     * @tc.desc      Testing sort function with byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,(): void => {
      let TAG = "testSort0155";
      try {
        let arr1: FixedArray<byte> = [3, 6, -2, -9,-128];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<byte> = [-128,-9, -2, 3, 6];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1560
     * @tc.name      testSort0156
     * @tc.desc      Testing sort function with an empty byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0156";
      try {
        let arr3: FixedArray<boolean> = [];
        let sortedArr3 = sort(arr3);
        let expected: FixedArray<boolean> = [];
        expect(sortedArr3.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1570
     * @tc.name      testSort0157
     * @tc.desc      Testing sort function with a single element byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0157";
      try {
        let arr1: FixedArray<byte> = [127];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<byte> = [127];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1580
     * @tc.name      testSort0158
     * @tc.desc      Testing sort function with an array containing duplicate elements for byte.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0158";
      try {
        let arr1: FixedArray<byte> = [9,6,6,6,127];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<byte> = [6,6,6,9,127];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1590
     * @tc.name      testSort0159
     * @tc.desc      Testing sort with already sorted byte array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0159";
      try {
        let arr1: FixedArray<byte> = [1,2,3,4,5];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<byte> = [1,2,3,4,5];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1600_01
     * @tc.name      testSort0160
     * @tc.desc      Testing sort function with an empty array for bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0160";
      try {
        let arr1: FixedArray<byte> = [];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected: FixedArray<byte> = [];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1610
     * @tc.name      testSort0161
     * @tc.desc      Testing sort function with boundary value array for bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0161";
      try {
        let arr1: FixedArray<byte> = [-128,0,127];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected: FixedArray<byte> = [-128,0,127];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1620
     * @tc.name      testSort0162
     * @tc.desc      Testing sort function with an array containing a single element for bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0162";
      try {
        let arr1: FixedArray<byte> = [-128];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected: FixedArray<byte> = [-128];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1630
     * @tc.name      testSort0163
     * @tc.desc      Testing sort function with descending order for bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>{
      let TAG = "testSort0163";
      try {
        let arr1: FixedArray<byte> = [-128,0,127];
        let sortedArr = sort(arr1,(a,b) => b-a);
        let expected: FixedArray<byte> = [127,0,-128];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1640
     * @tc.name      testSort0164
     * @tc.desc      Testing sort function with an array containing duplicate elements for bytes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,(): void => {
      let TAG = "testSort0164";
      try {
        let arr1: FixedArray<byte> = [-128,-128];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected: FixedArray<byte> = [-128,-128];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1650
     * @tc.name      testSort0165
     * @tc.desc      Testing sort with byte boundary values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0165";
      try {
        let arr1: FixedArray<byte> = [127, -128, 0, -1, 126];
        let sortedArr = sort(arr1,(a,b) => b-a);
        let expected: FixedArray<byte> = [127,126,0,-1,-128];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1670
     * @tc.name      testSort0167
     * @tc.desc      Testing sort function with character array and comparator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0167";
      try {
        let arr1: FixedArray<short> = [0x0063,0x0061,0x0062];
        let sortedArr = sort(arr1);
        let expected: FixedArray<short> = [0x0061,0x0062,0x0063];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1690
     * @tc.name      testSort0169
     * @tc.desc      Testing sort function with an empty character array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0169";
      try {
        let arr1: FixedArray<char> = [];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<char> = [];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1800
     * @tc.name      testSort0180
     * @tc.desc      Testing sort function with double array and comparator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0180";
      try {
        let arr1: FixedArray<double> = [3.14, 1.41, 2.71];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<double> = [1.41, 2.71, 3.14];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1810
     * @tc.name      testSort0181
     * @tc.desc      Testing sort function with an empty double array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0181";
      try {
        let arr1: FixedArray<double> = [];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<double> = [];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1820
     * @tc.name      testSort0182
     * @tc.desc      Testing sort function with a single element double array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0182";
      try {
        let arr1: FixedArray<double> = [6.35];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<double> = [6.35];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1830
     * @tc.name      testSort0183
     * @tc.desc      Testing sort function with an array containing duplicate elements for Double.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0183";
      try {
        let arr1: FixedArray<double> = [6.66,6.66,6.66];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<double> = [6.66,6.66,6.66];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1840
     * @tc.name      testSort0184
     * @tc.desc      Testing the reverse order data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0184";
      try {
        let arr1: FixedArray<double> = [6,5,4,3,2];
        let sortedArr1 = sort(arr1);
        let arr2: FixedArray<double> = [2,3,4,5,6];
        expect(sortedArr1.toString()).assertEqual(arr2.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1850
     * @tc.name      testSort0185
     * @tc.desc      Testing sort function with empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,(): void => {
      let TAG = "testSort0185";
      try {
        let arr1: FixedArray<double> = [];
        let sortedArr = sort(arr1, (a, b) => (a - b).toInt());
        let expected: FixedArray<double> = [];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1860
     * @tc.name      testSort0186
     * @tc.desc      Testing sort function with ascending order for doubles.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0186";
      try {
        let arr1: FixedArray<double> = [5.65498,9.5456564,6.1848];
        let sortedArr = sort(arr1, (a , b) => (a - b).toInt());
        let expected: FixedArray<double> = [5.65498,6.1848,9.5456564];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1870
     * @tc.name      testSort0187
     * @tc.desc      Testing sort function with descending order for doubles.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0187";
      try {
        let arr1: FixedArray<double> = [2.3, 5.6 ,9.99];
        let sortedArr = sort(arr1, (a, b) => (b - a).toInt());
        let expected: FixedArray<double> = [9.99, 5.6, 2.3];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1880
     * @tc.name      testSort0188
     * @tc.desc      Testing sort function with an array containing duplicate elements for doubles.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0188";
      try {
        let arr1: FixedArray<double> = [79.99, 79.99];
        let sortedArr = sort(arr1, (a, b) => (a - b).toInt());
        let expected: FixedArray<double> = [79.99, 79.99];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1890
     * @tc.name      testSort0189
     * @tc.desc      Testing sort function with an already sorted array for doubles.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0189";
      try {
        let arr1: FixedArray<double> = [1,2,3,4,5,6];
        let sortedArr = sort(arr1, (a, b) => (a - b).toInt());
        let expected: FixedArray<double> = [1,2,3,4,5,6];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1910
     * @tc.name      testSort0191
     * @tc.desc      Testing sort function with an empty float array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0191";
      try {
        let arr1: FixedArray<float> = [];
        let sortedArr = sort(arr1);
        let expected: FixedArray<float> = [];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_FLOAT_1930
     * @tc.name      testSort0193
     * @tc.desc      Testing sort function with an array containing duplicate elements for float.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0193";
      try {
        let arr1: FixedArray<float> = [666,999,666,666];
        let sortedArr = sort(arr1);
        let expected: FixedArray<float> = [666,666,666,999];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1940
     * @tc.name      testSort0194
     * @tc.desc      Test the already sorted data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0194";
      try {
        let arr1: FixedArray<float> = [1.0, 2.0 ,3.0, 4.0];
        let sortedArr = sort(arr1);
        let expected: FixedArray<float> = [1.0, 2.0 ,3.0, 4.0];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_1950
     * @tc.name      testSort0195
     * @tc.desc      Testing Type.of with null.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0195";
      try {
        let arr1: FixedArray<float> = [];
        let sortedArr = sort(arr1, (a, b) => (a - b).toInt());
        let expected: FixedArray<float> = [];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2010
     * @tc.name      testSort0201
     * @tc.desc      Testing sort function with ascending order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0201";
      try {
        let arr1: FixedArray<int> = [8,6,9];
        let sortedArr = sort(arr1);
        let expected: FixedArray<int> = [6, 8, 9];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2020
     * @tc.name      testSort0202
     * @tc.desc      Testing sort function with an empty integer array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0202";
      try {
        let arr1: FixedArray<int> = [];
        let sortedArr = sort(arr1);
        let expected: FixedArray<int> = [];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2030
     * @tc.name      testSort0203
     * @tc.desc      Testing sort function with a single element integer array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0203";
      try {
        let arr1: FixedArray<int> = [10086];
        let sortedArr = sort(arr1);
        let expected: FixedArray<int> = [10086];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2040
     * @tc.name      testSort0204
     * @tc.desc      Testing sort function with an array containing duplicate elements for int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0204";
      try {
        let arr1: FixedArray<int> = [666,666,666,999];
        let sortedArr = sort(arr1);
        let expected: FixedArray<int> = [666,666,666,999];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2050
     * @tc.name      testSort0205
     * @tc.desc      Testing sort function with null.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0205";
      try {
        let arr1: FixedArray<int> = [];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected: FixedArray<int> = [];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2060
     * @tc.name      testSort0206
     * @tc.desc      Testing sort function with ascending order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0206";
      try {
        let arr1: FixedArray<int> = [3, 1, 4, 9, 2];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected = [1, 2, 3, 4, 9];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2070
     * @tc.name      testSort0207
     * @tc.desc      Testing sort function with descending order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0207";
      try {
        let arr1: FixedArray<int> = [3, 1, 4, 9, 2];
        let sortedArr = sort(arr1,(a,b) => b-a);
        const expected = [9, 4, 3, 2, 1];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2080
     * @tc.name      testSort0208
     * @tc.desc      Testing sort function with an array containing a single element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0208";
      try {
        let arr1: FixedArray<int> = [10086];
        let sortedArr = sort(arr1,(a,b) => a-b);
        const expected = [10086];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2090
     * @tc.name      testSort0209
     * @tc.desc      Testing sort function with an array containing duplicate elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0209";
      try {
        let arr1: FixedArray<int> = [1,1,1,1,1,1,2];
        let sortedArr = sort(arr1,(a,b) => b-a);
        const expected = [2,1,1,1,1,1,1];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2110
     * @tc.name      testSort0211
     * @tc.desc      Testing sort function with long integer array and comparator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0211";
      try {
        let arr1: FixedArray<long> = [-999, 0, 999];
        let sortedArr1 = sort(arr1);
        let expected: FixedArray<long> = [-999, 0, 999];
        expect(sortedArr1.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2120
     * @tc.name      testSort0212
     * @tc.desc      Testing sort function with an empty long integer array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0212";
      try {
        let arr1: FixedArray<long> = [];
        let sortedArr1 = sort(arr1);
        let expected: FixedArray<long> = [];
        expect(sortedArr1.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2130
     * @tc.name      testSort0213
     * @tc.desc      Testing sort function with an array containing duplicate elements for longs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0213";
      try {
        let arr1: FixedArray<long> = [666,666,666,666];
        let sortedArr1 = sort(arr1);
        let expected: FixedArray<long> = [666,666,666,666];
        expect(sortedArr1.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2140
     * @tc.name      testSort0214
     * @tc.desc      Testing sort function with an array containing a single element for longs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0214";
      try {
        let arr1: FixedArray<long> = [999];
        let sortedArr1 = sort(arr1);
        let expected: FixedArray<long> = [999];
        expect(sortedArr1.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2150
     * @tc.name      testSort0215
     * @tc.desc      Testing sort function with an empty array for longs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0215";
      try {
        let arr1: FixedArray<long> = [];
        let sortedArr1 = sort(arr1, (a, b) => (a - b).toInt());
        let expected: FixedArray<long> = [];
        expect(sortedArr1.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2160
     * @tc.name      testSort0216
     * @tc.desc      Testing sort function with ascending order for longs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0216";
      try {
        let arr1: FixedArray<long> = [8,3,6];
        let sortedArr1 = sort(arr1, (a, b) => (a - b).toInt());
        let expected: FixedArray<long> = [3,6,8];
        expect(sortedArr1.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2170
     * @tc.name      testSort0217
     * @tc.desc      Testing sort function with descending order for longs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0217";
      try {
        let arr1: FixedArray<long> = [8,3,6];
        let sortedArr1 = sort(arr1, (a, b) => (b - a).toInt());
        let expected: FixedArray<long> = [8,6,3];
        expect(sortedArr1.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2180
     * @tc.name      testSort0218
     * @tc.desc      Testing sort function with an already sorted array for longs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0218";
      try {
        let arr1: FixedArray<long> = [1,2,3];
        let sortedArr1 = sort(arr1, (a, b) => (a - b).toInt());
        let expected: FixedArray<long> = [1,2,3];
        expect(sortedArr1.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2190
     * @tc.name      testSort0219
     * @tc.desc      Testing sort function with an array containing a single element for longs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testSort0219";
      try {
        let arr1: FixedArray<long> = [1008611];
        let sortedArr1 = sort(arr1, (a, b) => (a - b).toInt());
        let expected: FixedArray<long> = [1008611];
        expect(sortedArr1.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2200
     * @tc.name      testSort0220
     * @tc.desc      Testing sort function with short integer array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      let TAG = "testSort0220";
      try {
        let arr1: FixedArray<short> = [-3, 1, -4, 1,32767 ,5, 9, -2, 6];
        let sortedArr = sort(arr1);
        let expected: FixedArray<short> = [-4, -3, -2, 1, 1, 5, 6, 9,32767];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2210
     * @tc.name      testSort0221
     * @tc.desc      Testing sort function with an empty short integer array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,(): void =>  {
      let TAG = "testSort0221";
      try {
        let arr1: FixedArray<short> = [];
        let sortedArr = sort(arr1);
        let expected: FixedArray<short> = [];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2220
     * @tc.name      testSort0222
     * @tc.desc      Testing sort function with a single element short integer array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      let TAG = "testSort0222";
      try {
        let arr1: FixedArray<short> = [-10086];
        let sortedArr = sort(arr1);
        let expected: FixedArray<short> = [-10086];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2230
     * @tc.name      testSort0223
     * @tc.desc      Testing sort function with an array containing duplicate elements for shorts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      let TAG = "testSort0223";
      try {
        let arr1: FixedArray<short> = [1,1,1,1,1];
        let sortedArr = sort(arr1);
        const expected: FixedArray<short> = [1,1,1,1,1];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2240
     * @tc.name      testSort0224
     * @tc.desc      Test sorting with values at the boundaries of short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      let TAG = "testSort0224";
      try {
        let arr1: FixedArray<short> = [32767, -32768, 0, 32767, -32768];
        let sortedArr = sort(arr1);
        const expected: FixedArray<short> = [-32768, -32768, 0, 32767, 32767];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2250
     * @tc.name      testSort0225
     * @tc.desc      Testing sort function with an already sorted array for shorts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      let TAG = "testSort0225";
      try {
        let arr1: FixedArray<short> = [10086,999,110];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected: FixedArray<short> = [110,999,10086];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2260
     * @tc.name      testSort0226
     * @tc.desc      Testing sort function with an array containing duplicate elements for shorts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      let TAG = "testSort0226";
      try {
        let arr1: FixedArray<short> = [999,999,999];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected: FixedArray<short> = [999,999,999];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2270
     * @tc.name      testSort0227
     * @tc.desc      Testing sort function with an empty array for shorts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      let TAG = "testSort0227";
      try {
        let arr1: FixedArray<short> = [];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected: FixedArray<short> = [];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2280
     * @tc.name      testSort0228
     * @tc.desc      Testing sort function with descending order for shorts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      let TAG = "testSort0228";
      try {
        let arr1: FixedArray<short> = [1, 11 ,111, 1111];
        let sortedArr = sort(arr1,(a,b) => b-a);
        let expected: FixedArray<short> = [1111, 111 ,11 ,1];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_BASE_SORT_2290
     * @tc.name      testSort0229
     * @tc.desc      Testing sort with values at the boundaries of short range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSort0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void =>  {
      let TAG = "testSort0229";
      try {
        let arr1: FixedArray<short> = [-32768, 0, 32767,666];
        let sortedArr = sort(arr1,(a,b) => a-b);
        let expected: FixedArray<short> = [-32768,0,666,32767];
        expect(sortedArr.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });
  })
}