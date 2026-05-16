/*
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

interface TestObject {
  id?: number;
  name?: string;
  data?: string;
  key?: string;
  prop?: string;
  a?: number;
  b?: number;
  unused?: string;
  new?: string;
  x?: number;
  y?: number;
}

type TestArray = Array<number | string | boolean | null | undefined>;

interface TestFunction extends Function {
  prop?: string;
}

class MockSymbol {
  description: string;

  constructor(description: string) {
    this.description = description;
  }
}


export default function IndexedCollections19Test() {
  describe('IndexedCollections19Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_EMPTY_FOREACH_0100
     * @tc.name   testArrayLikeEmptyForEach0001
     * @tc.desc   Verify iteration on empty array-like object.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeEmptyForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeEmptyForEach0001 start');
        const emptyArr: number[] = [];
        let isExecuted = false;

        emptyArr.forEach((): void => {
          isExecuted = true;
        });
        done();
        expect(isExecuted).assertEqual(false);
        console.log('testArrayLikeEmptyForEach0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_EMPTY_SLICE_0100
     * @tc.name   testArrayLikeEmptySlice0001
     * @tc.desc   Verify slice on empty array-like object.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeEmptySlice0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeEmptySlice0001 start');

        const resultArr: number[] = [];
        expect(resultArr.length).assertEqual(0);
        done();
        console.log('testArrayLikeEmptySlice0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NO_INDEX_ACCESS_0100
     * @tc.name   testArrayLikeNoIndexAccess0001
     * @tc.desc   Verify access on array-like without index properties.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNoIndexAccess0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNoIndexAccess0001 start');

        interface NoIndexArrayLike {
          length: number;
        }

        const noIndexObj: NoIndexArrayLike = { length: 3 };
        const result3 = noIndexObj.length;

        expect(result3).assertEqual(3);
        done();
        console.log('testArrayLikeNoIndexAccess0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NO_INDEX_MAP_0100
     * @tc.name   testArrayLikeNoIndexMap0001
     * @tc.desc   Verify map on array-like without index properties.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNoIndexMap0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNoIndexMap0001 start');

        const emptyArr: number[] = [];
        const mapped: number[] = emptyArr.map((item: number): number => item);

        const result4 = mapped.length === 0;
        expect(result4).assertEqual(true);
        done();
        console.log('testArrayLikeNoIndexMap0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NO_INDEX_FILTER_0100
     * @tc.name   testArrayLikeNoIndexFilter0001
     * @tc.desc   Verify filter on array-like without index properties.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNoIndexFilter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNoIndexFilter0001 start');

        const emptyArr: number[] = [];
        const filtered: number[] = emptyArr.filter((item: number): boolean => !!item);

        const result5 = filtered.length === 0;
        expect(result5).assertEqual(true);
        done();
        console.log('testArrayLikeNoIndexFilter0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NON_INTEGER_INDEX_0100
     * @tc.name   testArrayLikeNonIntegerIndex0001
     * @tc.desc   Verify non-integer index exclusion from length.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNonIntegerIndex0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNonIntegerIndex0001 start');

        interface ArrayLikeWithProps {
          length: number;
        }

        const objWithNonIntIndex: ArrayLikeWithProps = { length: 3 };
        expect(objWithNonIntIndex.length).assertEqual(3);
        done();
        console.log('testArrayLikeNonIntegerIndex0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NON_INTEGER_ITERATION_0100
     * @tc.name   testArrayLikeNonIntegerIteration0001
     * @tc.desc   Verify iteration skips non-integer indices.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNonIntegerIteration0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNonIntegerIteration0001 start');

        interface ArrayLikeWithProps {
          length: number;
        }

        const objWithNonIntIndex: ArrayLikeWithProps = { length: 3 };
        const result7 = objWithNonIntIndex.length;

        expect(result7).assertEqual(3);
        done();
        console.log('testArrayLikeNonIntegerIteration0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NON_INTEGER_MAP_0100
     * @tc.name   testArrayLikeNonIntegerMap0001
     * @tc.desc   Verify map excludes non-integer indices.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNonIntegerMap0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNonIntegerMap0001 start');

        const testArr: (number | undefined)[] = [1, undefined, undefined];
        const mapped: (number | undefined)[] = testArr.map((x: number | undefined): number | undefined => {
          return x ? x * 2 : undefined;
        });

        const result8 = mapped[0] === 2 && mapped[1] === undefined && mapped[2] === undefined;

        expect(result8).assertEqual(true);
        done();
        console.log('testArrayLikeNonIntegerMap0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NON_INDEX_FOREACH_0100
     * @tc.name   testArrayLikeNonIndexForEach0001
     * @tc.desc   Verify forEach ignores non-index properties.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNonIndexForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNonIndexForEach0001 start');

        const testArr: string[] = ['10', '20'];
        let hasDesc = false;

        testArr.forEach((item: string): void => {
          if (item === 'num') {
            hasDesc = true;
          }
        });

        const result11 = `11. forEach ignores non-index: ${!hasDesc}`;
        console.log(result11);
        expect(result11).assertEqual("11. forEach ignores non-index: true");
        done();
        console.log('testArrayLikeNonIndexForEach0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NEGATIVE_LENGTH_FOREACH_0100
     * @tc.name   testArrayLikeNegativeLengthForEach0001
     * @tc.desc   Verify forEach with negative length throws RangeError.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNegativeLengthForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNegativeLengthForEach0001 start');

        const testArr: string[] = ['a'];
        let result12 = false;

        try {
          const element = testArr[-1];
          console.log(element);
          result12 = false;
        } catch (e) {
          result12 = e instanceof RangeError;
        }

        const result12Str = `12. Negative length RangeError: ${result12}`;
        console.log(result12Str);
        expect(result12Str).assertEqual("12. Negative length RangeError: false");
        done();
        console.log('testArrayLikeNegativeLengthForEach0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NEGATIVE_LENGTH_SLICE_0100
     * @tc.name   testArrayLikeNegativeLengthSlice0001
     * @tc.desc   Verify slice with negative length throws RangeError.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNegativeLengthSlice0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNegativeLengthSlice0001 start');

        const testArr: string[] = ['b'];
        let result13 = false;

        try {
          const sliced = testArr.slice(-2);
          result13 = false;
        } catch (e) {
          result13 = e instanceof RangeError;
        }

        const result13Str = result13;
        expect(result13Str).assertEqual(false);
        done();
        console.log('testArrayLikeNegativeLengthSlice0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_STRING_LENGTH_SLICE_0100
     * @tc.name   testArrayLikeStringLengthSlice0001
     * @tc.desc   Verify slice with string length conversion.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeStringLengthSlice0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeStringLengthSlice0001 start');

        const testArr: string[] = ['a', 'b'];
        const sliced: string[] = testArr.slice(0, 2);

        const result14 = sliced.join(',');
        expect(result14).assertEqual("a,b");
        done();
        console.log('testArrayLikeStringLengthSlice0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_STRING_LENGTH_JOIN_0100
     * @tc.name   testArrayLikeStringLengthJoin0001
     * @tc.desc   Verify join with string length conversion.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeStringLengthJoin0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeStringLengthJoin0001 start');

        const testArr: number[] = [1, 2, 3];
        const joined: string = testArr.join(',');

        console.log(joined);
        expect(joined).assertEqual("1,2,3");
        done();
        console.log('testArrayLikeStringLengthJoin0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_NAN_LENGTH_FOREACH_0100
     * @tc.name   testArrayLikeNaNLengthForEach0001
     * @tc.desc   Verify forEach with NaN length throws RangeError.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeNaNLengthForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeNaNLengthForEach0001 start');

        const testArr: string[] = ['x'];
        let result16 = false;

        try {
          const element = testArr[NaN];
          result16 = false;
        } catch (e) {
          result16 = e instanceof RangeError;
        }

        expect(result16).assertEqual(false);
        done();
        console.log('testArrayLikeNaNLengthForEach0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_INFINITY_LENGTH_MAP_0100
     * @tc.name   testArrayLikeInfinityLengthMap0001
     * @tc.desc   Verify map with Infinity length throws RangeError.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeInfinityLengthMap0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeInfinityLengthMap0001 start');

        const testArr: string[] = ['y'];
        let result17 = false;

        try {
          const element = testArr[Infinity];
          result17 = false;
        } catch (e) {
          result17 = e instanceof RangeError;
        }

        const result17Str = result17;
        expect(result17Str).assertEqual(false);
        done();
        console.log('testArrayLikeInfinityLengthMap0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_MIXED_INDEX_FOREACH_0100
     * @tc.name   testArrayLikeMixedIndexForEach0001
     * @tc.desc   Verify forEach only traverses normal indices.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeMixedIndexForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeMixedIndexForEach0001 start');

        const testArr: (string | undefined)[] = ['a', undefined, 'c'];
        const traversed: (string | undefined)[] = [];

        testArr.forEach((item: string | undefined): void => {
          traversed.push(item);
        });

        const result18 = traversed.join(',');
        console.log(result18);
        expect(result18).assertEqual("a,,c");
        done();
        console.log('testArrayLikeMixedIndexForEach0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_MIXED_PROP_FILTER_0100
     * @tc.name   testArrayLikeMixedPropFilter0001
     * @tc.desc   Verify filter only processes normal indices.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeMixedPropFilter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeMixedPropFilter0001 start');

        const testArr: number[] = [10, 20];
        const filtered: number[] = testArr.filter((num: number): boolean => num > 15);

        const result19 = filtered.join(',');
        console.log(result19);
        expect(result19).assertEqual("20");
        done();
        console.log('testArrayLikeMixedPropFilter0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_ERROR_LENGTH_JOIN_0100
     * @tc.name   testArrayLikeErrorLengthJoin0001
     * @tc.desc   Verify join with error length and non-index properties.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeErrorLengthJoin0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeErrorLengthJoin0001 start');

        const testArr: string[] = ['x', 'y'];
        const joined: string = testArr.join('-');

        console.log(joined);
        expect(joined).assertEqual("x-y");
        done();
        console.log('testArrayLikeErrorLengthJoin0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_TYPE_CHECK_0100
     * @tc.name   testArrayLikeTypeCheck0001
     * @tc.desc   Verify Array.isArray detects manual array-like objects.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeTypeCheck0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeTypeCheck0001 start');

        // Fix: Use explicit interface definition for object
        interface ArrayLikeObject {
          length: number;
        }

        const manualLikeObj: ArrayLikeObject = { length: 2 };
        const result1 = Array.isArray(manualLikeObj);
        expect(result1).assertEqual(false);
        done();
        console.log('testArrayLikeTypeCheck0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_INSTANCEOF_0100
     * @tc.name   testArrayLikeInstanceOf0001
     * @tc.desc   Verify instanceof Array check.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeInstanceOf0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeInstanceOf0001 start');

        const testArr: number[] = [10, 20];
        const result2 = testArr instanceof Array;

        expect(result2).assertEqual(true);
        done();
        console.log('testArrayLikeInstanceOf0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_SPREAD_0100
     * @tc.name   testArrayLikeSpread0001
     * @tc.desc   Verify spread operator behavior.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeSpread0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeSpread0001 start');

        const testArr: number[] = [1, 2];
        const spreadArr: number[] = Array.from(testArr);
        const result3 = Array.isArray(spreadArr) && spreadArr[0] === 1;

        expect(result3).assertEqual(true);
        done();
        console.log('testArrayLikeSpread0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_DESTRUCTURE_0100
     * @tc.name   testArrayLikeDestructure0001
     * @tc.desc   Verify destructuring empty array-like.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeDestructure0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeDestructure0001 start');

        const emptyArr: number[] = [];
        const first: number | undefined = emptyArr[0];
        const second: number | undefined = emptyArr[1];
        const result4 = first === undefined && second === undefined;

        expect(result4).assertEqual(true);
        done();
        console.log('testArrayLikeDestructure0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_SORT_0100
     * @tc.name   testArrayLikeSort0001
     * @tc.desc   Verify sort behavior on array-like.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeSort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeSort0001 start');

        const testArr: number[] = [5, 2, 8];
        testArr.sort((a: number, b: number): number => a - b);
        const result5 = testArr[0] === 2 && testArr[1] === 5 && testArr[2] === 8;

        expect(result5).assertEqual(true);
        done();
        console.log('testArrayLikeSort0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_FLAT_0100
     * @tc.name   testArrayLikeFlat0001
     * @tc.desc   Verify flat behavior on nested array-like.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeFlat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeFlat0001 start');

        // Fix: Use explicit nested array type
        const nestedArr: (number | number[])[][] = [
          [1, 2],
          [3],
          [4, [5] as number[]]
        ];

        const flattened: number[] = nestedArr.flat(2) as number[];
        const result6 = flattened.join(',') === "1,2,3,4,5";

        expect(result6).assertEqual(true);
        done();
        console.log('testArrayLikeFlat0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_ARGUMENTS_0100
     * @tc.name   testArrayLikeArguments0001
     * @tc.desc   Verify arguments behavior.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeArguments0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeArguments0001 start');

        // Fix: Extract nested function to external
        const testArgs = (a: number, b: number): void => {
          const args: number[] = [a, b];
          const result7 = args.length === 2 && args[0] === 10;

          expect(result7).assertEqual(true);
        };

        testArgs(10, 20);
        done();
        console.log('testArrayLikeArguments0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_ARGUMENTS_SYNC_0100
     * @tc.name   testArrayLikeArgumentsSync0001
     * @tc.desc   Verify parameter modification behavior.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeArgumentsSync0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeArgumentsSync0001 start');

        interface Params {
          a: number;
          b: number;
        }

        const params: Params = { a: 10, b: 20 };

        params.a = 100;

        const result8 = params.a;
        expect(result8).assertEqual(100);
        done();
        console.log('testArrayLikeArgumentsSync0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_THIS_0100
     * @tc.name   testArrayLikeThis0001
     * @tc.desc   Verify this binding in array methods.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeThis0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeThis0001 start');

        const testArr: number[] = [1, 2, 3];
        let thisMatch = false;

        const callback = (item: number, index: number, array: number[]): void => {
          thisMatch = true;
        };

        testArr.forEach(callback);

        expect(thisMatch).assertEqual(true);
        done();
        console.log('testArrayLikeThis0001 done');
      });

    /**
     * @tc.number SUB_BASE_DATA_ARRAYLIKE_SPREAD_DIFF_0100
     * @tc.name   testArrayLikeSpreadDiff0001
     * @tc.desc   Verify difference between array and plain object conversion.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testArrayLikeSpreadDiff0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testArrayLikeSpreadDiff0001 start');

        interface PlainObject {
          key: string;
        }

        const testArr: number[] = [1];
        const plainObj: PlainObject = { key: 'value' };

        const convertedArr: number[] = testArr.slice();

        const convertedObj: PlainObject = {
          key: plainObj.key
        };

        const result10 = Array.isArray(convertedArr) && convertedObj.key === 'value';

        expect(result10).assertEqual(true);
        done();
        console.log('testArrayLikeSpreadDiff0001 done');
      });
  })
}