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

interface TestObject01 {
  x: number;
}
export default function IndexedCollections08Test() {
  describe('IndexedCollections08Test', () => {
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
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_EXISTING_0100
     * @tc.name      testArrayIndexOfExistingElement0001
     * @tc.desc      IndexOf: find existing element (return first occurrence index)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfExistingElement0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfExistingElement0001";
        console.log(TAG + ' start');

        let arr1 = [1, 2, 3, 2, 1];
        let result1 = arr1.indexOf(2);
        expect(result1 === 1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_NOT_EXISTING_0200
     * @tc.name      testArrayIndexOfNotExistingElement0002
     * @tc.desc      IndexOf: find non-existing element (return -1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfNotExistingElement0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfNotExistingElement0002";
        console.log(TAG + ' start');

        let arr2 = [10, 20, 30];
        let result2 = arr2.indexOf(40);
        expect(result2 === -1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_START_INDEX_0300
     * @tc.name      testArrayIndexOfStartIndex0003
     * @tc.desc      IndexOf: specify start index (search from index 2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfStartIndex0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfStartIndex0003";
        console.log(TAG + ' start');

        let arr3 = [1, 2, 3, 2, 1];
        let result3 = arr3.indexOf(2, 2);
        expect(result3 === 3).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_START_EQUAL_LENGTH_0400
     * @tc.name      testArrayIndexOfStartEqualLength0004
     * @tc.desc      IndexOf: start index equals array length (return -1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfStartEqualLength0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfStartEqualLength0004";
        console.log(TAG + ' start');

        let arr4 = [1, 2, 3];
        let result4 = arr4.indexOf(1, 3);
        expect(result4 === -1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_START_EXCEED_LENGTH_0500
     * @tc.name      testArrayIndexOfStartExceedLength0005
     * @tc.desc      IndexOf: start index exceeds array length (return -1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfStartExceedLength0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfStartExceedLength0005";
        console.log(TAG + ' start');

        let arr5 = [10, 20];
        let result5 = arr5.indexOf(10, 5);
        expect(result5 === -1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_NEGATIVE_START_0600
     * @tc.name      testArrayIndexOfNegativeStart0006
     * @tc.desc      IndexOf: start index is negative (converted to 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfNegativeStart0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfNegativeStart0006";
        console.log(TAG + ' start');

        let arr6 = [1, 2, 3];
        let result6 = arr6.indexOf(2, -1);
        expect(result6 === -1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_NULL_0700
     * @tc.name      testArrayIndexOfNull0007
     * @tc.desc      IndexOf: find null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfNull0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfNull0007";
        console.log(TAG + ' start');

        let arr7 = [null, 1, null];
        let result7 = arr7.indexOf(null);
        expect(result7 === 0).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_UNDEFINED_0800
     * @tc.name      testArrayIndexOfUndefined0008
     * @tc.desc      IndexOf: find undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfUndefined0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfUndefined0008";
        console.log(TAG + ' start');

        let arr8 = [1, undefined, 3];
        let result8 = arr8.indexOf(undefined);
        expect(result8 === 1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_STRING_0900
     * @tc.name      testArrayIndexOfString0009
     * @tc.desc      IndexOf: find string (exact match)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfString0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfString0009";
        console.log(TAG + ' start');

        let arr9 = ["a", "A", "a"];
        let result9 = arr9.indexOf("A");
        expect(result9 === 1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_NAN_1000
     * @tc.name      testArrayIndexOfNaN0010
     * @tc.desc      IndexOf: array contains NaN (return -1, because === not match NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfNaN0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfNaN0010";
        console.log(TAG + ' start');

        let arr10 = [1, NaN, 3];
        let result10 = arr10.indexOf(NaN);
        expect(result10 === -1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_EXISTING_1100
     * @tc.name      testArrayLastIndexOfExisting0011
     * @tc.desc      LastIndexOf: search from end (return last occurrence index)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfExisting0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfExisting0011";
        console.log(TAG + ' start');

        let arr11 = [1, 2, 3, 2, 1];
        let result11 = arr11.lastIndexOf(2);
        expect(result11 === 3).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_NOT_EXISTING_1200
     * @tc.name      testArrayLastIndexOfNotExisting0012
     * @tc.desc      LastIndexOf: find non-existing element (return -1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfNotExisting0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfNotExisting0012";
        console.log(TAG + ' start');

        let arr12 = [10, 20, 30];
        let result12 = arr12.lastIndexOf(40);
        expect(result12 === -1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_END_INDEX_1300
     * @tc.name      testArrayLastIndexOfEndIndex0013
     * @tc.desc      LastIndexOf: specify end index (search before index 3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfEndIndex0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfEndIndex0013";
        console.log(TAG + ' start');

        let arr13 = [1, 2, 3, 2, 1];
        let result13 = arr13.lastIndexOf(2, 3);
        expect(result13 === 3).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_END_ZERO_1400
     * @tc.name      testArrayLastIndexOfEndZero0014
     * @tc.desc      LastIndexOf: end index is 0 (only check index 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfEndZero0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfEndZero0014";
        console.log(TAG + ' start');

        let arr14 = [1, 2, 1];
        let result14 = arr14.lastIndexOf(1, 0);
        expect(result14 === 0).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_END_NEGATIVE_1500
     * @tc.name      testArrayLastIndexOfEndNegative0015
     * @tc.desc      LastIndexOf: end index is negative (converted to 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfEndNegative0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfEndNegative0015";
        console.log(TAG + ' start');

        let arr15 = [1, 2, 3, 2];
        let result15 = arr15.lastIndexOf(2, -1);
        expect(result15 === 3).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_END_EXCEED_1600
     * @tc.name      testArrayLastIndexOfEndExceed0016
     * @tc.desc      LastIndexOf: end index exceeds array length (treated as array length - 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfEndExceed0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfEndExceed0016";
        console.log(TAG + ' start');

        let arr16 = [10, 20, 10];
        let result16 = arr16.lastIndexOf(10, 5);
        expect(result16 === 2).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_OBJECT_1700
     * @tc.name      testArrayLastIndexOfObject0017
     * @tc.desc      LastIndexOf: find object (reference match)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfObject0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfObject0017";
        console.log(TAG + ' start');

        let obj: TestObject01 = {x: 1};
        let arr17: TestObject01[] = [obj, {x: 1}, obj];
        let result17 = arr17.lastIndexOf(obj);
        expect(result17 === 2).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_SINGLE_1800
     * @tc.name      testArrayLastIndexOfSingle0018
     * @tc.desc      LastIndexOf: single element array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfSingle0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfSingle0018";
        console.log(TAG + ' start');

        let arr18 = ["test"];
        let result18 = arr18.lastIndexOf("test");
        expect(result18 === 0).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_EMPTY_1900
     * @tc.name      testArrayLastIndexOfEmpty0019
     * @tc.desc      LastIndexOf: empty array (return -1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfEmpty0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfEmpty0019";
        console.log(TAG + ' start');

        let arr19: number[] = [];
        let result19 = arr19.lastIndexOf(1);
        expect(result19 === -1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_BOOLEAN_2000
     * @tc.name      testArrayLastIndexOfBoolean0020
     * @tc.desc      LastIndexOf: find boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfBoolean0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfBoolean0020";
        console.log(TAG + ' start');

        let arr20 = [true, false, true];
        let result20 = arr20.lastIndexOf(true);
        expect(result20 === 2).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_EXISTING_2100
     * @tc.name      testArrayIncludesExisting0021
     * @tc.desc      Includes: element exists (return true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesExisting0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesExisting0021";
        console.log(TAG + ' start');

        let arr21 = [1, 2, 3];
        let result21 = arr21.includes(2);
        expect(result21).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_NOT_EXISTING_2200
     * @tc.name      testArrayIncludesNotExisting0022
     * @tc.desc      Includes: element not exists (return false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesNotExisting0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesNotExisting0022";
        console.log(TAG + ' start');

        let arr22 = [10, 20, 30];
        let result22 = arr22.includes(40);
        expect(result22).assertFalse();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_NAN_2300
     * @tc.name      testArrayIncludesNaN0023
     * @tc.desc      Includes: special handling for NaN (return true)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesNaN0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesNaN0023";
        console.log(TAG + ' start');

        let arr23 = [1, NaN, 3];
        let result23 = arr23.includes(NaN);
        expect(result23).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_START_INDEX_2400
     * @tc.name      testArrayIncludesStartIndex0024
     * @tc.desc      Includes: specify start index (search from index 2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesStartIndex0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesStartIndex0024";
        console.log(TAG + ' start');

        let arr24 = [1, 2, 3, 4];
        let result24 = arr24.includes(2, 2);
        expect(result24).assertFalse();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_NEGATIVE_START_2500
     * @tc.name      testArrayIncludesNegativeStart0025
     * @tc.desc      Includes: start index is negative (calculated from end)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesNegativeStart0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesNegativeStart0025";
        console.log(TAG + ' start');

        let arr25 = [1, 2, 3, 4, 5];
        let result25 = arr25.includes(4, -2);
        expect(result25).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_NEGATIVE_EXCEED_2600
     * @tc.name      testArrayIncludesNegativeExceed0026
     * @tc.desc      Includes: start index negative and absolute value exceeds length (start from 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesNegativeExceed0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesNegativeExceed0026";
        console.log(TAG + ' start');

        let arr26 = [1, 2];
        let result26 = arr26.includes(1, -5);
        expect(result26).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_NULL_2700
     * @tc.name      testArrayIncludesNull0027
     * @tc.desc      Includes: find null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesNull0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesNull0027";
        console.log(TAG + ' start');

        let arr27 = [null, 1, 2];
        let result27 = arr27.includes(null);
        expect(result27).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_UNDEFINED_2800
     * @tc.name      testArrayIncludesUndefined0028
     * @tc.desc      Includes: find undefined (array contains undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesUndefined0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesUndefined0028";
        console.log(TAG + ' start');

        let arr28 = [1, undefined, 3];
        let result28 = arr28.includes(undefined);
        expect(result28).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_EMPTY_2900
     * @tc.name      testArrayIncludesEmpty0029
     * @tc.desc      Includes: empty array (return false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesEmpty0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesEmpty0029";
        console.log(TAG + ' start');

        let arr29: number[] = [];
        let result29 = arr29.includes(0);
        expect(result29).assertFalse();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_OBJECT_3000
     * @tc.name      testArrayIncludesObject0030
     * @tc.desc      Includes: find object (reference match)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesObject0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesObject0030";
        console.log(TAG + ' start');

        let obj: TestObject01 = {x: 1};
        let arr30: TestObject01[] = [obj, {x: 1}];
        let result30 = arr30.includes(obj);
        expect(result30).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_VS_INCLUDES_NAN_3100
     * @tc.name      testArrayIndexOfVsIncludesNaN0031
     * @tc.desc      IndexOf vs includes: handling NaN difference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfVsIncludesNaN0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfVsIncludesNaN0031";
        console.log(TAG + ' start');

        let arr31 = [NaN];
        let idx = arr31.indexOf(NaN);
        let inc = arr31.includes(NaN);
        expect(idx === -1).assertTrue();
        expect(inc).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_DUPLICATE_3200
     * @tc.name      testArrayIndexOfDuplicate0032
     * @tc.desc      IndexOf: first index of duplicate element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfDuplicate0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfDuplicate0032";
        console.log(TAG + ' start');

        let arr32 = ["a", "b", "a", "b"];
        let result32 = arr32.indexOf("a");
        expect(result32 === 0).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_DUPLICATE_3300
     * @tc.name      testArrayLastIndexOfDuplicate0033
     * @tc.desc      LastIndexOf: last index of duplicate element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfDuplicate0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfDuplicate0033";
        console.log(TAG + ' start');

        let arr33 = ["a", "b", "a", "b"];
        let result33 = arr33.lastIndexOf("b");
        expect(result33 === 3).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_START_EQUAL_LENGTH_3400
     * @tc.name      testArrayIncludesStartEqualLength0034
     * @tc.desc      Includes: start index equals length (return false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesStartEqualLength0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesStartEqualLength0034";
        console.log(TAG + ' start');

        let arr34 = [1, 2];
        let result34 = arr34.includes(2, 2);
        expect(result34).assertFalse();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_NESTED_3500
     * @tc.name      testArrayIndexOfNested0035
     * @tc.desc      IndexOf: find nested array (reference match)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfNested0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfNested0035";
        console.log(TAG + ' start');

        let sub: number[] = [1, 2];
        let arr35: number[][] = [sub, [3, 4], sub];
        let result35 = arr35.indexOf(sub);
        expect(result35 === 0).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_END_NEGATIVE_3600
     * @tc.name      testArrayLastIndexOfEndNegative0036
     * @tc.desc      LastIndexOf: specify end index as -1 (return -1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfEndNegative0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfEndNegative0036";
        console.log(TAG + ' start');

        let arr36 = [1, 2, 3];
        let result36 = arr36.lastIndexOf(2, -1);
        expect(result36 === 1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_BOOLEAN_3700
     * @tc.name      testArrayIncludesBoolean0037
     * @tc.desc      Includes: find boolean true (distinguish from 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesBoolean0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesBoolean0037";
        console.log(TAG + ' start');

        let arr37 = [true, 1, false];
        let result37 = arr37.includes(true);
        expect(result37).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INDEXOF_ZERO_3800
     * @tc.name      testArrayIndexOfZero0038
     * @tc.desc      IndexOf: find 0 (distinguish from false)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIndexOfZero0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIndexOfZero0038";
        console.log(TAG + ' start');

        let arr38 = [0, false, 0];
        let result38 = arr38.indexOf(0);
        expect(result38 === 0).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_LASTINDEXOF_EMPTY_3900
     * @tc.name      testArrayLastIndexOfEmpty0039
     * @tc.desc      LastIndexOf: empty array (return -1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayLastIndexOfEmpty0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayLastIndexOfEmpty0039";
        console.log(TAG + ' start');

        let arr39: string[] = [];
        let result39 = arr39.lastIndexOf("test");
        expect(result39 === -1).assertTrue();

        console.log(TAG + ' end');
        done();
      });

    /**
     * @tc.number    SUB_BASEDATA_ARRAY_INCLUDES_SINGLE_4000
     * @tc.name      testArrayIncludesSingle0040
     * @tc.desc      Includes: single element array (element exists)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("testArrayIncludesSingle0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void) => {
        let TAG = "testArrayIncludesSingle0040";
        console.log(TAG + ' start');

        let arr40 = [5];
        let result40 = arr40.includes(5);
        expect(result40).assertTrue();

        console.log(TAG + ' end');
        done();
      });
  })
}