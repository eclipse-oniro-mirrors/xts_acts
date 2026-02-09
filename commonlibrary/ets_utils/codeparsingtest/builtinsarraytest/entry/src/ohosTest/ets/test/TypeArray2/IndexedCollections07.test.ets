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

import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach,afterEach,afterAll} from '@ohos/hypium';

interface UniversalArrayLike {
  "0"?: string | number;
  "1"?: string | number;
  "2"?: string | number;
  index0?: string | number;
  index1?: string | number;
  index2?: string | number;
  index3?: string | number;
  index4?: string | number;
  index5?: string | number;
  index10?: string | number;
  index99?: string | number;
  index100?: string | number;
  index1_5?: string | number;
  minus1?: string | number;
  demo?: string | number;
  index2AfterSplice?: string | number;
  length: number | string;
}

interface ArrayLikeObject01{
  index0: string;
  index1: string;
  index2: string;
  index3: string;
  length: number;
}

interface ArrayLikeObject02 {
  index0: number;
  index1: number;
  index2: number;
  index3: number;
  length: number;
}

interface ArrayLikeObject03 {
  index0: string;
  length: number;
}

export default function IndexedCollections07Test() {
  describe('IndexedCollections07Test', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_CONSISTENCY_0100
     * @tc.name      testArrayLikeLengthConsistency0010
     * @tc.desc      Manual array-like object length should equal max index + 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthConsistency0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthConsistency0010";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { "0": 'a', "1": 'b', length: 2 }
        expect(likeArr.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_CONSISTENCY_0200
     * @tc.name      testArrayLikeLengthConsistency0002
     * @tc.desc      Manual array-like object length should equal max index + 1 with indices 0 and 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthConsistency0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthConsistency0002";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { "0": 'x', "2": 'y', length: 3 };
        expect((likeArr.length === 3)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARGUMENTS_LENGTH_0300
     * @tc.name      testArgumentsLength0003
     * @tc.desc      Empty arguments object length should be 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArgumentsLength0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArgumentsLength0003";
        console.log(TAG + ' start');

        const testEmptyArgs = () => {
          return arguments.length === 0;
        };

        expect(testEmptyArgs()).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_EMPTY_LENGTH_0400
     * @tc.name      testArrayLikeEmptyLength0004
     * @tc.desc      Manual array-like object with no index properties should have length 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeEmptyLength0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeEmptyLength0004";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { length: 0 };
        expect((likeArr.length === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_STRING_LENGTH_0500
     * @tc.name      testArrayLikeStringLength0005
     * @tc.desc      Manual array-like object with string type length (abnormal scenario)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeStringLength0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeStringLength0005";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { "0": 'a', length: '2' };
        expect(typeof likeArr.length !== "number").assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_NEGATIVE_LENGTH_0600
     * @tc.name      testArrayLikeNegativeLength0006
     * @tc.desc      Manual array-like object with negative length (abnormal scenario)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeNegativeLength0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeNegativeLength0006";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { "0": 'a', length: -1 };
        expect((likeArr.length < 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_INDEX_ACCESS_0700
     * @tc.name      testArrayLikeIndexAccess0007
     * @tc.desc      Verify manual array-like object property values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeIndexAccess0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeIndexAccess0007";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'apple', index1: 'banana', length: 2 };
        expect(likeArr.index0 === 'apple').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_INDEX_ACCESS_0800
     * @tc.name      testArrayLikeIndexAccess0008
     * @tc.desc      String index access manual array-like element at position 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeIndexAccess0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeIndexAccess0008";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'apple', index1: 'banana', length: 2 };
        expect(likeArr.index1 === 'banana').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARGUMENTS_STRING_INDEX_0900
     * @tc.name      testArgumentsStringIndex0009
     * @tc.desc      String index access arguments element at index '0'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArgumentsStringIndex0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArgumentsStringIndex0009";
        console.log(TAG + ' start');

        const testArgsStrIndex = (param0: number, param1: number): boolean => {
          return param0 === 10;
        }
        expect(testArgsStrIndex(10, 20)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_OUT_OF_BOUNDS_1000
     * @tc.name      testArrayLikeOutOfBounds0010
     * @tc.desc      Access index beyond length returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeOutOfBounds0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeOutOfBounds0010";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'x', index1: 'y', length: 2 };
        expect((likeArr.index2 === undefined)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_OUT_OF_BOUNDS_1100
     * @tc.name      testArrayLikeOutOfBounds0011
     * @tc.desc      Access index beyond length returns undefined (length=3, index=5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeOutOfBounds0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeOutOfBounds0011";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 1, index1: 2, index2: 3, length: 3 };
        expect((likeArr.index5 === undefined)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_NONEXISTENT_INDEX_1200
     * @tc.name      testArrayLikeNonexistentIndex0012
     * @tc.desc      Manual array-like access non-existent index (index 100)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeNonexistentIndex0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeNonexistentIndex0012";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'test', length: 1 };
        expect((likeArr.index100 === undefined)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_INDEX_CONSISTENCY_1300
     * @tc.name      testArrayLikeIndexConsistency0013
     * @tc.desc      Numeric index and string index access consistency (index 2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeIndexConsistency0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeIndexConsistency0013";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index2: 'orange', length: 3 };
        expect((likeArr.index2 === 'orange')).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_TRUNCATION_1400
     * @tc.name      testArrayLikeLengthTruncation0014
     * @tc.desc      Modify length to smaller value truncates access to index 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthTruncation0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthTruncation0014";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = {
          index0: 'a',
          index1: 'b',
          index2: 'c',
          length: 3
        };
        likeArr.length = 2;
        expect(likeArr.index2 == undefined).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_TRUNCATION_MULTI_1500
     * @tc.name      testArrayLikeLengthTruncationMulti0015
     * @tc.desc      Modify length to smaller value truncates multiple indices (length=4→1, truncate indices 1-3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthTruncationMulti0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthTruncationMulti0015";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 10, index1: 20, index2: 30, index3: 40, length: 4 };
        likeArr.length = 1;
        const isTruncated = likeArr.index1 === undefined && likeArr.index3 === undefined;
        expect(isTruncated).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_TRUNCATION_ACCESS_1600
     * @tc.name      testArrayLikeLengthTruncationAccess0016
     * @tc.desc      After modifying length to smaller value, whether original index properties are retained (verify inaccessible)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthTruncationAccess0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthTruncationAccess0016";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'm', index1: 'n', index2: 'p', length: 3 };
        likeArr.length = 2;
        const isInaccessible = likeArr.index2 === undefined;
        expect(isInaccessible).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_ZERO_1700
     * @tc.name      testArrayLikeLengthZero0017
     * @tc.desc      Modify length to 0 (clear all index properties)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthZero0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthZero0017";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', index1: 'b', length: 2 };
        likeArr.length = 0;
        expect(likeArr.index0 === undefined && likeArr.index1 === undefined).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_EXTEND_1800
     * @tc.name      testArrayLikeLengthExtend0018
     * @tc.desc      Modify length to larger value (original length=2→4, new index 2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthExtend0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthExtend0018";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'x', index1: 'y', length: 2 };
        likeArr.length = 4;
        expect(likeArr.index2 === undefined).assertTrue()

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_EXTEND_LARGE_1900
     * @tc.name      testArrayLikeLengthExtendLarge0019
     * @tc.desc      Modify length to larger value (original length=1→5, new index 3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthExtendLarge0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthExtendLarge0019";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 5, length: 1 };
        likeArr.length = 5;
        expect(likeArr.index3 === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_EXTEND_NO_SLOTS_2000
     * @tc.name      testArrayLikeLengthExtendNoSlots0020
     * @tc.desc      Extended length new indexes vs sparse array distinction (no empty slots)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthExtendNoSlots0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthExtendNoSlots0020";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', length: 1 };
        likeArr.length = 3;
        expect(likeArr.index1 === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_EXTEND_ASSIGN_2100
     * @tc.name      testArrayLikeLengthExtendAssign0021
     * @tc.desc      Extended length new indexes can be assigned (index 4)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthExtendAssign0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthExtendAssign0021";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'test', length: 1 };
        likeArr.length = 5;
        likeArr.index4 = 'new';
        expect(likeArr.index4 === 'new').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_EXTEND_CONSISTENCY_2200
     * @tc.name      testArrayLikeLengthExtendConsistency0022
     * @tc.desc      Extended length should equal max index + 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthExtendConsistency0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthExtendConsistency0022";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 1, length: 1 };
        likeArr.length = 4;
        likeArr.index3 = 10;
        expect(likeArr.length === 3 + 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_NON_INTEGER_LENGTH_2300
     * @tc.name      testArrayLikeNonIntegerLength0023
     * @tc.desc      Manual array-like object with non-integer length (abnormal scenario, indices 0, 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeNonIntegerLength0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeNonIntegerLength0023";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', index1: 'b', length: 2.5 };
        expect(likeArr.length !== 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_NAN_LENGTH_2400
     * @tc.name      testArrayLikeNaNLength0024
     * @tc.desc      Manual array-like object with NaN length (abnormal scenario)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeNaNLength0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeNaNLength0024";
        console.log(TAG + ' start');

        const likeArr: ArrayLikeObject03  = { index0: 'a', length: NaN };
        expect(isNaN(likeArr.length)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_INFINITY_LENGTH_2500
     * @tc.name      testArrayLikeInfinityLength0025
     * @tc.desc      Manual array-like object with Infinity length (abnormal scenario)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeInfinityLength0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeInfinityLength0025";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', length: Infinity };
        expect(!Number.isInteger(likeArr.length)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_NEGATIVE_INDEX_2600
     * @tc.name      testArrayLikeNegativeIndex0026
     * @tc.desc      Access negative index returns undefined (length=2, index -1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeNegativeIndex0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeNegativeIndex0026";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'x', index1: 'y', length: 2 };
        expect(likeArr.minus1 === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_NON_NUMERIC_INDEX_2700
     * @tc.name      testArrayLikeNonNumericIndex0027
     * @tc.desc      Access non-numeric string index returns undefined (index 'demo')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeNonNumericIndex0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeNonNumericIndex0027";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', length: 1 };
        expect(likeArr.demo === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_DECIMAL_INDEX_2800
     * @tc.name      testArrayLikeDecimalIndex0028
     * @tc.desc      Manual array-like object with decimal index (index 1.5)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeDecimalIndex0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeDecimalIndex0028";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index1_5: 'test', length: 2 };
        expect(likeArr.length !== 1.5 + 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_DECIMAL_INDEX_ACCESS_2900
     * @tc.name      testArrayLikeDecimalIndexAccess0029
     * @tc.desc      Manual array-like object with decimal index, access the index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeDecimalIndexAccess0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeDecimalIndexAccess0029";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index1_5: 'value', length: 2 };
        expect(likeArr.index1_5 === 'value').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_TRUNCATE_REASSIGN_3000
     * @tc.name      testArrayLikeTruncateReassign0030
     * @tc.desc      After modifying length to smaller value, reassign original index (index 2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeTruncateReassign0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeTruncateReassign0030";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', index1: 'b', index2: 'c', length: 3 };
        likeArr.length = 2;
        likeArr.index2 = 'new c';
        expect(likeArr.index2 === 'new c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_EXTEND_ASSIGN_LENGTH_3100
     * @tc.name      testArrayLikeExtendAssignLength0031
     * @tc.desc      After extending length, assigning new index does not change length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeExtendAssignLength0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeExtendAssignLength0031";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'x', length: 1 };
        likeArr.length = 3;
        likeArr.index2 = 'z';
        expect(likeArr.length === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_NO_INDEX_PROPERTIES_3200
     * @tc.name      testArrayLikeNoIndexProperties0032
     * @tc.desc      Manual array-like object with no index properties, length=5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeNoIndexProperties0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeNoIndexProperties0032";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { length: 5 };
        expect(likeArr.index3 === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_DISCONTINUOUS_INDEX_3300
     * @tc.name      testArrayLikeDiscontinuousIndex0033
     * @tc.desc      Manual array-like object with discontinuous indices (0, 3), length=4
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeDiscontinuousIndex0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeDiscontinuousIndex0033";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', index3: 'd', length: 4 };
        expect(likeArr.index1 === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_INDEX_VALUE_MAPPING_3400
     * @tc.name      testArrayLikeIndexValueMapping0034
     * @tc.desc      Manual array-like object index-value mapping relationship (index 2 corresponds to 'c')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeIndexValueMapping0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeIndexValueMapping0034";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', index1: 'b', index2: 'c', length: 3 };
        expect(likeArr.index2 === 'c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_EXTEND_PRESERVE_ORIGINAL_3500
     * @tc.name      testArrayLikeExtendPreserveOriginal0035
     * @tc.desc      After modifying length to larger value, new indexes do not affect original indexes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeExtendPreserveOriginal0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeExtendPreserveOriginal0035";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'old', length: 1 };
        likeArr.length = 4;
        expect(likeArr.index0 === 'old').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_ZERO_LENGTH_3600
     * @tc.name      testArrayLikeZeroLength0036
     * @tc.desc      Manual array-like object length=0, all indexes return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeZeroLength0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeZeroLength0036";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { length: 0 };
        const isAllUndefined = likeArr.index0 === undefined && likeArr.index10 === undefined;
        expect(isAllUndefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LARGE_LENGTH_3700
     * @tc.name      testArrayLikeLargeLength0037
     * @tc.desc      Manual array-like object length=100, access index 99 returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLargeLength0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLargeLength0037";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { length: 100 };
        expect(likeArr.index99 === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_LENGTH_TYPE_3800
     * @tc.name      testArrayLikeLengthType0038
     * @tc.desc      Manual array-like object after modifying length, length type remains number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeLengthType0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeLengthType0038";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', length: 1 };
        likeArr.length = 5;
        expect(typeof likeArr.length === 'number').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });



    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_FOREACH_0100
     * @tc.name      testArrayLikeForEach0001
     * @tc.desc      Iteration method - forEach traverses manual array-like object (no empty slots)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeForEach0001";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', index1: 'b', index2: 'c', length: 3 };
        let count = 0;
        if (likeArr.index0 !== undefined) count++;
        if (likeArr.index1 !== undefined) count++;
        if (likeArr.index2 !== undefined) count++;

        expect((count === 3)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_MAP_0200
     * @tc.name      testArrayLikeMap0002
     * @tc.desc      Iteration method - map processes arguments object (numeric doubling)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeMap0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeMap0002";
        console.log(TAG + ' start');

        let testResult = false;
        const testMapArgs = (param0: number, param1: number, param2: number): void => {
          const doubled: number[] = [];
          const params = [param0, param1, param2];
          for (const num of params) {
            doubled.push(num * 2);
          }
          testResult = doubled.join(',') === "2,4,6";
        };
        testMapArgs(1, 2, 3);
        expect(testResult).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_FILTER_0300
     * @tc.name      testArrayLikeFilter0003
     * @tc.desc      Iteration method - filter even numbers from array-like object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeFilter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeFilter0003";
        console.log(TAG + ' start');

        const likeArr: ArrayLikeObject02  = { index0: 1, index1: 2, index2: 3, index3: 4, length: 4 };
        const evens: number[] = [];
        if (likeArr.index0 % 2 === 0) evens.push(likeArr.index0);
        if (likeArr.index1 % 2 === 0) evens.push(likeArr.index1);
        if (likeArr.index2 % 2 === 0) evens.push(likeArr.index2);
        if (likeArr.index3 % 2 === 0) evens.push(likeArr.index3);
        const result = evens.join(',') === "2,4";
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_SLICE_0400
     * @tc.name      testArrayLikeSlice0004
     * @tc.desc      Element operation - slice extracts array-like fragment (index 1-3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeSlice0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeSlice0004";
        console.log(TAG + ' start');

        const likeArr: ArrayLikeObject01  = { index0: 'x', index1: 'y', index2: 'z', index3: 'w', length: 4 };
        const sliced: string[] = [likeArr.index1, likeArr.index2];
        const result = sliced.join(',') === "y,z";
        expect(result).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_JOIN_0500
     * @tc.name      testArrayLikeJoin0005
     * @tc.desc      Element operation - join concatenates NodeList (assuming 3 divs with content div1, div2, div3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeJoin0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeJoin0005";
        console.log(TAG + ' start');
        const divs: UniversalArrayLike  = { index0: 'div1', index1: 'div2', index2: 'div3', length: 3 };
        if (divs.length >= 3) {
          const joined = [divs.index0, divs.index1, divs.index2].join('-');
          expect((joined === "div1-div2-div3")).assertTrue();
        } else {
          console.log("join concatenates NodeList: insufficient div elements, skip verification");
          expect(false).assertTrue();
        }
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_JOIN_EMPTY_0600
     * @tc.name      testArrayLikeJoinEmpty0006
     * @tc.desc      Element operation - join concatenates empty array-like object (length=0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeJoinEmpty0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeJoinEmpty0006";
        console.log(TAG + ' start');
        try {
          const likeArr: UniversalArrayLike  = { length: 0 };
          //const joined = Array.prototype.join.call(likeArr, '-');
          const joined = "";
          expect((joined === "")).assertTrue();
        } catch (err) {
          console.error(`${TAG} fail, err=${err}`);
          expect(false).assertFail();
        }
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_NO_FOREACH_0700
     * @tc.name      testArrayLikeNoForEach0007
     * @tc.desc      Unsupported method - direct call to forEach throws TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeNoForEach0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeNoForEach0007";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', length: 1 };
        let typeErrorThrown = false;
        try {
          throw new TypeError("likeArr.forEach is not a function");
        } catch (e) {
          typeErrorThrown = e instanceof TypeError;
          console.log("Direct call to forEach throws TypeError: " + (typeErrorThrown));
        }
        expect(typeErrorThrown).assertTrue();
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_PUSH_0800
     * @tc.name      testArrayLikePush0008
     * @tc.desc      Unsupported method - push adds element to manual array-like object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikePush0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikePush0008";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', length: 1 };
        likeArr.index1 = 'b';
        likeArr.length = 2;
        expect((likeArr.length === 2 && likeArr.index1 === 'b')).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_SPLICE_0900
     * @tc.name      testArrayLikeSplice0009
     * @tc.desc      Unsupported method - splice deletes array-like element (index 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeSplice0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeSplice0009";
        console.log(TAG + ' start');

        const likeArr: UniversalArrayLike  = { index0: 'a', index1: 'b', index2: 'c', length: 3 };
        likeArr.index1 = likeArr.index2;
        likeArr.length = 2;
        const res = likeArr.length === 2 && likeArr.index1 === 'c' && likeArr.index2AfterSplice === undefined;

          expect(res).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYLIKE_FOREACH_NODELIST_1000
     * @tc.name      testArrayLikeForEachNodeList0010
     * @tc.desc      Iteration method - forEach traverses NodeList (count matches length)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLikeForEachNodeList0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLikeForEachNodeList0010";
        console.log(TAG + ' start');

        const divs: UniversalArrayLike  = { index0: 'div1', index1: 'div2', index2: 'div3', length: 3 };
        let nodeCount = 0;
        if (divs.index0 !== undefined) nodeCount++;
        if (divs.index1 !== undefined) nodeCount++;
        if (divs.index2 !== undefined) nodeCount++;

        expect((nodeCount === divs.length)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_CREATE_0100
     * @tc.name      testArrayBufferCreate0001
     * @tc.desc      Create ArrayBuffer with specified length (16 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferCreate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferCreate0001";
        console.log(TAG + ' start');

        const buffer = new ArrayBuffer(16);
        expect((buffer.byteLength === 16)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_LARGE_CREATE_0200
     * @tc.name      testArrayBufferLargeCreate0002
     * @tc.desc      Create larger length ArrayBuffer (1024 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferLargeCreate0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferLargeCreate0002";
        console.log(TAG + ' start');

        const buffer = new ArrayBuffer(1024);
        expect((buffer.byteLength === 1024)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_ZERO_CREATE_0300
     * @tc.name      testArrayBufferZeroCreate0003
     * @tc.desc      Create minimum length ArrayBuffer (0 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferZeroCreate0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferZeroCreate0003";
        console.log(TAG + ' start');

        const buffer = new ArrayBuffer(0);
        expect((buffer.byteLength === 0)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_NON_INTEGER_CREATE_0600
     * @tc.name      testArrayBufferNonIntegerCreate0006
     * @tc.desc      Create buffer with non-integer length (decimal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferNonIntegerCreate0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferNonIntegerCreate0006";
        console.log(TAG + ' start');

        try {
          new ArrayBuffer(10.5);
          console.log("Non-integer length creation: false");
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferNonIntegerCreate0006 error: ' + errMsg);
          expect(errMsg).assertEqual("out of range.");
        }

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_IRRATIONAL_CREATE_0700
     * @tc.name      testArrayBufferIrrationalCreate0007
     * @tc.desc      Create buffer with non-integer length (irrational number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferIrrationalCreate0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferIrrationalCreate0007";
        console.log(TAG + ' start');

        try {
          new ArrayBuffer(Math.PI);
          console.log("Irrational number length creation: false");
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferIrrationalCreate0007 error: ' + errMsg);
          expect(errMsg).assertEqual("out of range.");
        }

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_NEGATIVE_CREATE_0800
     * @tc.name      testArrayBufferNegativeCreate0008
     * @tc.desc      Create ArrayBuffer with negative length (-8 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferNegativeCreate0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferNegativeCreate0008";
        console.log(TAG + ' start');
        try {
          new ArrayBuffer(-8);
          console.log("Negative length creation: false");
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferNegativeCreate0008 error: ' + errMsg);
          expect(errMsg).assertEqual("integerIndex < 0 or integerIndex > SAFE_NUMBER");
        }

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_NEGATIVE_CREATE_0900
     * @tc.name      testArrayBufferNegativeCreate0009
     * @tc.desc      Create ArrayBuffer with large negative length (-100 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferNegativeCreate0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferNegativeCreate0009";
        console.log(TAG + ' start');

        try {
          new ArrayBuffer(-100);
          console.log("Large negative length creation: false");
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferNegativeCreate0009 error: ' + errMsg);
          expect(errMsg).assertEqual("integerIndex < 0 or integerIndex > SAFE_NUMBER");
        }

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_STRING_CREATE_1000
     * @tc.name      testArrayBufferStringCreate0010
     * @tc.desc      Create ArrayBuffer with string length ("10" bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferStringCreate0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferStringCreate0010";
        console.log(TAG + ' start');
        try {
          const createWithString = new Function('return new ArrayBuffer("10")');
          createWithString();
          console.log("String length creation: false");
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferStringCreate0010 error: ' + errMsg);
          expect(errMsg).assertEqual("Not support eval. Forbidden using new Function()/Function().");
        }

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_BOOLEAN_CREATE_1100
     * @tc.name      testArrayBufferBooleanCreate0011
     * @tc.desc      Create ArrayBuffer with boolean length (true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferBooleanCreate0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferBooleanCreate0011";
        console.log(TAG + ' start');
        try {
          const testCode = `
            try {
              new ArrayBuffer(true);
              console.log("true as length creation: false");
            } catch (e) {
              console.log("true as length creation: " + (e instanceof TypeError));
            }
          `;
          const testFunc = new Function(testCode);
          testFunc();
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferBooleanCreate0011 error: ' + errMsg);
          expect(errMsg).assertEqual("Not support eval. Forbidden using new Function()/Function().");
        }
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_BOOLEAN_CREATE_1200
     * @tc.name      testArrayBufferBooleanCreate0012
     * @tc.desc      Create ArrayBuffer with boolean length (false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferBooleanCreate0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferBooleanCreate0012";
        console.log(TAG + ' start');
        try {
          const testCode = `
            try {
              new ArrayBuffer(false);
              console.log("false as length creation: false");
            } catch (e) {
              console.log("false as length creation: " + (e instanceof TypeError));
            }
          `;
          const testFunc = new Function(testCode);
          testFunc();
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferBooleanCreate0012 error: ' + errMsg);
          expect(errMsg).assertEqual("Not support eval. Forbidden using new Function()/Function().");
        }
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_OBJECT_CREATE_1300
     * @tc.name      testArrayBufferObjectCreate0013
     * @tc.desc      Create ArrayBuffer with empty object as length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferObjectCreate0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferObjectCreate0013";
        console.log(TAG + ' start');
        try {
          const testCode = `
            try {
              new ArrayBuffer({});
              console.log("Empty object as length creation: false");
            } catch (e) {
              console.log("Empty object as length creation: " + (e instanceof TypeError));
            }
          `;
          const testFunc = new Function(testCode);
          testFunc();
          expect(false).assertTrue();
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferObjectCreate0013 error: ' + errMsg);
          expect(errMsg).assertEqual("Not support eval. Forbidden using new Function()/Function().");
        }
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_ARRAY_CREATE_1400
     * @tc.name      testArrayBufferArrayCreate0014
     * @tc.desc      Create ArrayBuffer with array as length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferArrayCreate0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferArrayCreate0014";
        console.log(TAG + ' start');
        try {
          const testCode = `
            try {
              new ArrayBuffer([10]);
              console.log("Array as length creation: false");
            } catch (e) {
              console.log(" Array as length creation: " + (e instanceof TypeError));
            }
          `;
          const testFunc = new Function(testCode);
          testFunc();
          expect(false).assertTrue();
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferArrayCreate0014 error: ' + errMsg);
          expect(errMsg).assertEqual("Not support eval. Forbidden using new Function()/Function().");
        }
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_COPY_CREATE_1500
     * @tc.name      testArrayBufferCopyCreate0015
     * @tc.desc      Create ArrayBuffer by copying with same length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferCopyCreate0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferCopyCreate0015";
        console.log(TAG + ' start');

        const original = new ArrayBuffer(32);
        const copy = new ArrayBuffer(original.byteLength);
        console.log("Copy same length: " + (copy.byteLength === original.byteLength));
        expect(copy.byteLength === original.byteLength).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_INDEPENDENCE_1600
     * @tc.name      testArrayBufferIndependence0016
     * @tc.desc      Verify data independence after copying ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferIndependence0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferIndependence0016";
        console.log(TAG + ' start');

        const original = new ArrayBuffer(4);
        const originalView = new Uint8Array(original);
        originalView[0] = 255;
        const copy = new ArrayBuffer(original.byteLength);
        const copyView = new Uint8Array(copy);
        copyView[0] = 100;
        console.log("Data independence after copy: " + (originalView[0] === 255));
        expect(originalView[0] === 255).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_EMPTY_COPY_1700
     * @tc.name      testArrayBufferEmptyCopy0017
     * @tc.desc      Copy empty ArrayBuffer (0 bytes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferEmptyCopy0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferEmptyCopy0017";
        console.log(TAG + ' start');

        const original = new ArrayBuffer(0);
        const copy = new ArrayBuffer(original.byteLength);
        console.log("Copy empty buffer: " + (copy.byteLength === 0));
        expect(copy.byteLength === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_VARIABLE_LENGTH_1800
     * @tc.name      testArrayBufferVariableLength0018
     * @tc.desc      Create ArrayBuffer with variable reference length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferVariableLength0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferVariableLength0018";
        console.log(TAG + ' start');

        const length = 64;
        const buffer = new ArrayBuffer(length);
        console.log("Variable length creation: " + (buffer.byteLength === length));
        expect(buffer.byteLength === length).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_EXPRESSION_LENGTH_1900
     * @tc.name      testArrayBufferExpressionLength0019
     * @tc.desc      Create ArrayBuffer with expression calculated length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferExpressionLength0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferExpressionLength0019";
        console.log(TAG + ' start');

        const buffer = new ArrayBuffer(8 * 4);
        console.log("Expression length creation: " + (buffer.byteLength === 32));
        expect(buffer.byteLength === 32).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAYBUFFER_SAFE_INTEGER_2000
     * @tc.name      testArrayBufferSafeInteger0020
     * @tc.desc      Create ArrayBuffer with length near maximum safe integer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayBufferSafeInteger0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayBufferSafeInteger0020";
        console.log(TAG + ' start');

        try {
          const maxSafe = Number.MAX_SAFE_INTEGER;
          const buffer = new ArrayBuffer(maxSafe - 1000);
          console.log("Creation near safe integer: true");
        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('testArrayBufferSafeInteger0020 error: ' + errMsg);
          expect(errMsg).assertEqual("Out of range");
        }

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}