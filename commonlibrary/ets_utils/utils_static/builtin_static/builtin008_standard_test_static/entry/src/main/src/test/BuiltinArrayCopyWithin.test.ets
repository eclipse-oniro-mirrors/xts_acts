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
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function BuiltinArrayCopyWithinTest() {
  describe("BuiltinArrayCopyWithinTest", (): void => {
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

    console.log(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0100_01
     * @tc.name    testBuiltinArraycopyWithin0018
     * @tc.desc    Testing basic copyWithin functionality with target position
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArraycopyWithin0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0018";
      try {
        let originalArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
        let expectedResult: FixedArray<float> = [1.1f, 2.2f, 1.1f, 2.2f, 3.3f];
        let result = copyWithin(originalArray, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0100_02
     * @tc.name    testCopyWithin0032BasicFunction_01
     * @tc.desc    Testing basic functionality of copyWithin method
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testCopyWithin0032BasicFunction_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithin0032BasicFunction_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_01
     * @tc.name    testCopyWithinFullRange
     * @tc.desc    Test copying the full range of array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testCopyWithinFullRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullRange";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 0, 5);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_6
     * @tc.name    testCopyWithinMiddleToStart_01
     * @tc.desc    Test copying middle elements to start
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testCopyWithinMiddleToStart_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinMiddleToStart_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [3, 4, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0900_01
     * @tc.name    testCopyWithinTargetOutOfBounds_01
     * @tc.desc    Test copying with target index out of bounds
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testCopyWithinTargetOutOfBounds_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetOutOfBounds_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 10, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1000_01
     * @tc.name    testCopyWithinEmptyRange_01
     * @tc.desc    Test copying with empty range (start equals end)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testCopyWithinEmptyRange_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEmptyRange_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_02
     * @tc.name    testBuiltinArrayCopyWithin20018
     * @tc.desc    Test copying with negative target index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin20018";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, -3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500
     * @tc.name    testBuiltinArrayCopyWithin30018
     * @tc.desc    Test copying with negative start index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin30018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin30018";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 5, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, -2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0600_01
     * @tc.name    testBuiltinArrayCopyWithin40018
     * @tc.desc    Test copying with float values in array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin40018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin40018";
      try {
        const originalArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
        const expectedResult: FixedArray<float> = [1.1f, 2.2f, 3.3f, 1.1f, 2.2f];
        const result = copyWithin(originalArray, 3, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0700_01
     * @tc.name    testBuiltinArrayCopyWithin50018
     * @tc.desc    Test copying when target equals array length
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin50018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin50018";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 5, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0800_01
     * @tc.name    testBuiltinArrayCopyWithin60018
     * @tc.desc    Test copying when start is greater than end
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin60018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin60018";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1100_01
     * @tc.name    testBuiltinArrayCopyWithin70018
     * @tc.desc    Test copying a single element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin70018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin70018";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 2, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 1, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1300_01
     * @tc.name    testBuiltinArrayCopyWithin90018
     * @tc.desc    Test copying with overlapping source and target regions
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin90018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin90018";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1400_01
     * @tc.name    testBuiltinArrayCopyWithin100018
     * @tc.desc    Test copying in a zero-length array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin100018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin100018";
      try {
        const originalArray: FixedArray<short> = [] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 0, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1500_01
     * @tc.name    testBuiltinArrayCopyWithin110018
     * @tc.desc    Test copying with all parameters negative
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin110018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin110018";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, -2, -4, -2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1600_03
     * @tc.name    testBuiltinArrayCopyWithin120018
     * @tc.desc    Test copying when target is greater than start
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin120018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin120018";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 4, 2, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1700_01
     * @tc.name    testBuiltinArrayCopyWithin130018
     * @tc.desc    Test copying with string values in array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin130018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin130018";
      try {
        const originalArray: string[] = ["a", "b", "c", "d", "e"];
        const expectedResult: string[] = ["a", "b", "a", "b", "c"];
        const result = originalArray.copyWithin(2, 0, 3);
        expect(JSON.stringify(result as Array<string>)).assertEqual(JSON.stringify(expectedResult as Array<string>));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1800_01
     * @tc.name    testBuiltinArrayCopyWithin140018
     * @tc.desc    Test copying with boolean values in array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin140018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin140018";
      try {
        const originalArray: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
        const expectedResult: FixedArray<boolean> = [true, false, true, true, false] as FixedArray<boolean>;
        const result = copyWithin(originalArray, 3, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_200
     * @tc.name    testBuiltinArrayCopyWithin150018
     * @tc.desc    Test copying that partially overwrites existing elements
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayCopyWithin150018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayCopyWithin150018";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5, 6, 7, 8] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 1, 2, 7, 8] as FixedArray<short>;
        const result = copyWithin(originalArray, 4, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(8);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    });
}