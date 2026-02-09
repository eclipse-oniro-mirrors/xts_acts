/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

export default function Array_08Test() {
  describe('Array_08Test', (): void => {
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
   * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2280
   * @tc.name    testSliceLongNumber2280
   * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
   * @tc.size    MediumTest
   * @tc.type    Function
   * @tc.level   Level 1
   */
    it('testSliceLongNumber2280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2280";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart : number = 3;
        const asIntOrDefaultend : number = 1;
        const result = slice(array, 3, 1);
        const expected : FixedArray<long> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2290
    * @tc.name    testSliceLongNumber2290
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2290";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart : number = -2;
        const asIntOrDefaultend : number = 5;
        const result = slice(array, -2, 5);
        const expected : FixedArray<long> = [40000000000, 50000000000];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2300
    * @tc.name    testSliceLongNumber2300
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2300";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart : number = 1;
        const asIntOrDefaultend : number =-1;
        const result = slice(array, 1, -1);
        const expected : FixedArray<long> = [20000000000, 30000000000, 40000000000];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2310
    * @tc.name    testSliceLongNumber2310
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2310";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart : number = -3;
        const asIntOrDefaultend : number =-1;
        const result = slice(array, -3, -1);
        const expected : FixedArray<long> = [30000000000, 40000000000];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2320
    * @tc.name    testSliceLongNumber2320
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2320";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart : number = 0;
        const asIntOrDefaultend : number = 10;
        const result = slice(array, 0, 10);
        const expected : FixedArray<long> = [10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2330
    * @tc.name    testSliceLongNumber2330
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2330";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart : number = -10;
        const asIntOrDefaultend : number = 3;
        const result = slice(array, -10, 3);
        const expected : FixedArray<long> = [10000000000, 20000000000, 30000000000];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2340
    * @tc.name    testSliceLongNumber2340
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2340";
      try {
        const array: FixedArray<long> =[];
        const asIntOrDefaultstart : number = 0;
        const asIntOrDefaultend : number = 0;
        const result = slice(array, 0, 0);
        const expected : FixedArray<long> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2350
    * @tc.name    testSliceLongNumber2350
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2350";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart : number = 5;
        const asIntOrDefaultend : number = 10;
        const result = slice(array, 5, 10);
        const expected : FixedArray<long> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2400
    * @tc.name    testSliceLongNumber2400
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2400";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart: number | undefined = undefined;
        const asIntOrDefaultend : number = 4;
        const result = slice(array, undefined, 4);
        const expected : FixedArray<long> = [10000000000, 20000000000, 30000000000, 40000000000];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2410
    * @tc.name    testSliceLongNumber2410
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2410";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 9223372036854775807];
        const asIntOrDefaultstart: number = 1;
        const asIntOrDefaultend : number = 5;
        const result = slice(array, 1, 5);
        const expected : FixedArray<long> = [20000000000, 30000000000, 40000000000, 9223372036854775807];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2420
    * @tc.name    testSliceLongNumber2420
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2420";
      try {
        const array: FixedArray<long> =[-9223372036854775808, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart: number = 0;
        const asIntOrDefaultend : number = 4;
        const result = slice(array, 0, 4);
        const expected : FixedArray<long> = [-9223372036854775808, 20000000000, 30000000000, 40000000000];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2430
    * @tc.name    testSliceLongNumber2430
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceLongNumber2430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceLongNumber2430";
      try {
        const array: FixedArray<long> =[10000000000, 20000000000, 30000000000, 40000000000, 50000000000];
        const asIntOrDefaultstart : number = 10;
        const asIntOrDefaultend : number = 15;
        const result = slice(array, 10, 15);
        const expected : FixedArray<long> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2440
    * @tc.name    testSliceShort2440
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2440";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const start = 0;
        const result = slice(array, 0);
        const expected : FixedArray<short> = [100, 200, 300, 400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2450
    * @tc.name    testSliceShort2450
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2450";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const start = 2;
        const result = slice(array, 2);
        const expected : FixedArray<short> = [300, 400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2460
    * @tc.name    testSliceShort2460
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2460";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const start = 4;
        const result = slice(array, 4);
        const expected : FixedArray<short> = [500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2470
    * @tc.name    testSliceShort2470
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2470";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const start = 5;
        const result = slice(array, 5);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2480
    * @tc.name    testSliceShort2480
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2480";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const start = 8;
        const result = slice(array, 8);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2490
    * @tc.name    testSliceShort2490
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2490";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const start = -1;
        const result = slice(array, -1);
        const expected : FixedArray<short> = [500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2500
    * @tc.name    testSliceShort2500
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2500";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const start = -3;
        const result = slice(array, -3);
        const expected : FixedArray<short> = [300, 400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });


    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2510
    * @tc.name    testSliceShort2510
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2510";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const start = -10;
        const result = slice(array, -10);
        const expected : FixedArray<short> = [100, 200, 300, 400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2520
    * @tc.name    testSliceShort2520
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2520";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const start = undefined;
        const result = slice(array, undefined);
        const expected : FixedArray<short> = [100, 200, 300, 400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2540
    * @tc.name    testSliceShort2540
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2540";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 32767];
        const start = 1;
        const result = slice(array, 1);
        const expected : FixedArray<short> = [200, 300, 400, 32767];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2550
    * @tc.name    testSliceShort2550
    * @tc.desc    Testing involves extracting a subarray from an array and returning a new array that includes elements from the specified start index to the end index.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShort2550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShort2550";
      try {
        const array: FixedArray<short> =[];
        const start = 0;
        const result = slice(array, 0);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2560
    * @tc.name    testSliceShortInt2560
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2560";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = 0;
        const relEnd : int = 4;
        const result = slice(array, 0, 4);
        const expected : FixedArray<short> = [100, 200, 300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2570
    * @tc.name    testSliceShortInt2570
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2570";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = 2;
        const relEnd : int = 4;
        const result = slice(array, 2, 4);
        const expected : FixedArray<short> = [300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2580
    * @tc.name    testSliceShortInt2580
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2580";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = 2;
        const relEnd : int = 5;
        const result = slice(array, 2, 5);
        const expected : FixedArray<short> = [300, 400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2590
    * @tc.name    testSliceShortInt2590
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2590";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = 2;
        const relEnd : int = 2;
        const result = slice(array, 2, 2);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2600
    * @tc.name    testSliceShortInt2600
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2600";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = 3;
        const relEnd : int = 1;
        const result = slice(array, 3, 1);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2610
    * @tc.name    testSliceShortInt2610
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2610";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = -2;
        const relEnd : int = 5;
        const result = slice(array, -2, 5);
        const expected : FixedArray<short> = [400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2620
    * @tc.name    testSliceShortInt2620
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2620";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = 1;
        const relEnd : int = -1;
        const result = slice(array, 1, -1);
        const expected : FixedArray<short> = [200, 300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2630
    * @tc.name    testSliceShortInt2630
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2630";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = -3;
        const relEnd : int = -1;
        const result = slice(array, -3, -1);
        const expected : FixedArray<short> = [300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2640
    * @tc.name    testSliceShortInt2640
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2640";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = 0;
        const relEnd : int = 10;
        const result = slice(array, 0, 10);
        const expected : FixedArray<short> = [100, 200, 300, 400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2650
    * @tc.name    testSliceShortInt2650
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2650";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = -10;
        const relEnd : int = 3;
        const result = slice(array, -10, 3);
        const expected : FixedArray<short> = [100, 200, 300];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2660
    * @tc.name    testSliceShortInt2660
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2660";
      try {
        const array: FixedArray<short> =[];
        const relStart : int = 0;
        const relEnd : int = 0;
        const result = slice(array, 0, 0);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2670
    * @tc.name    testSliceShortInt2670
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2670";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int = 5;
        const relEnd : int = 10;
        const result = slice(array, 5, 10);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2710
    * @tc.name    testSliceShortInt2710
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2710";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const relStart : int | undefined = undefined;
        const relEnd : int = 4;
        const result = slice(array, undefined, 4);
        const expected : FixedArray<short> = [100, 200, 300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2720
    * @tc.name    testSliceShortInt2720
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortInt2720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortInt2720";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 32767];
        const relStart : int = 1;
        const relEnd : int = 5;
        const result = slice(array, 1, 5);
        const expected : FixedArray<short> = [200, 300, 400, 32767];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2730
    * @tc.name    testSliceShortNumber2730
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2730";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 0;
        const asIntOrDefaultend : number =4;
        const result = slice(array, 0, 4);
        const expected : FixedArray<short> = [100, 200, 300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2740
    * @tc.name    testSliceShortNumber2740
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2740";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 2;
        const asIntOrDefaultend : number =4;
        const result = slice(array, 2, 4);
        const expected : FixedArray<short> = [300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2750
    * @tc.name    testSliceShortNumber2750
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2750";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 2;
        const asIntOrDefaultend : number =5;
        const result = slice(array, 2, 5);
        const expected : FixedArray<short> = [300, 400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2760
    * @tc.name    testSliceShortNumber2760
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2760";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 2;
        const asIntOrDefaultend : number = 2;
        const result = slice(array, 2, 2);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2770
    * @tc.name    testSliceShortNumber2770
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2770";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 3;
        const asIntOrDefaultend : number = 1;
        const result = slice(array, 3, 1);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2780
    * @tc.name    testSliceShortNumber2780
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2780";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = -2;
        const asIntOrDefaultend : number = 5;
        const result = slice(array, -2, 5);
        const expected : FixedArray<short> = [400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2790
    * @tc.name    testSliceShortNumber2790
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2790";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 1;
        const asIntOrDefaultend : number =-1;
        const result = slice(array, 1, -1);
        const expected : FixedArray<short> = [200, 300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2800
    * @tc.name    testSliceShortNumber2800
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2800";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = -3;
        const asIntOrDefaultend : number =-1;
        const result = slice(array, -3, -1);
        const expected : FixedArray<short> = [300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2810
    * @tc.name    testSliceShortNumber2810
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2810";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 0;
        const asIntOrDefaultend : number = 10;
        const result = slice(array, 0, 10);
        const expected : FixedArray<short> = [100, 200, 300, 400, 500];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2820
    * @tc.name    testSliceShortNumber2820
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2820";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = -10;
        const asIntOrDefaultend : number = 3;
        const result = slice(array, -10, 3);
        const expected : FixedArray<short> = [100, 200, 300];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2830
    * @tc.name    testSliceShortNumber2830
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2830";
      try {
        const array: FixedArray<short> =[];
        const asIntOrDefaultstart : number = 0;
        const asIntOrDefaultend : number = 0;
        const result = slice(array, 0, 0);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2840
    * @tc.name    testSliceShortNumber2840
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2840";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 5;
        const asIntOrDefaultend : number = 10;
        const result = slice(array, 5, 10);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2890
    * @tc.name    testSliceShortNumber2890
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2890";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart: number | undefined = undefined;
        const asIntOrDefaultend : number = 4;
        const result = slice(array, undefined, 4);
        const expected : FixedArray<short> = [100, 200, 300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2900
    * @tc.name    testSliceShortNumber2900
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2900";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 32767];
        const asIntOrDefaultstart: number = 1;
        const asIntOrDefaultend : number = 5;
        const result = slice(array, 1, 5);
        const expected : FixedArray<short> = [200, 300, 400, 32767];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2910
    * @tc.name    testSliceShortNumber2910
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2910";
      try {
        const array: FixedArray<short> =[-32768, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 0;
        const asIntOrDefaultend : number = 4;
        const result = slice(array, 0, 4);
        const expected : FixedArray<short> = [-32768, 200, 300, 400];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
    * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_SLICE_2920
    * @tc.name    testSliceShortNumber2920
    * @tc.desc    Testing that a portion of elements is extracted from an existing array to create and return a new array without modifying the original array.
    * @tc.size    MediumTest
    * @tc.type    Function
    * @tc.level   Level 1
    */
    it('testSliceShortNumber2920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let TAG = "testSliceShortNumber2920";
      try {
        const array: FixedArray<short> =[100, 200, 300, 400, 500];
        const asIntOrDefaultstart : number = 10;
        const asIntOrDefaultend : number = 15;
        const result = slice(array, 10, 15);
        const expected : FixedArray<short> = [];
        expect(result.toString()).assertEqual(expected.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });
  });
}