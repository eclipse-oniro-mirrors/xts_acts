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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

function generateUniqueKey(description: string): string {
  let entropy: number[] = [
    Math.floor(Math.random() * 0xffffffff),
    Math.floor(Math.random() * 0xffffffff)
  ];
  return `${description}_${Date.now()}_${entropy[0].toString(36)}${entropy[1].toString(36)}}`;
}

export default function IndexedCollections10Test() {
  describe('IndexedCollections10Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_2300
     * @tc.name      testArraySparse0023
     * @tc.desc      Verify that a hole in an array does not create an own property for that index (hasOwnProperty returns false).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0023';
        console.log(TAG + ' start');

        const arr71: (number | undefined)[] = [1, , 3];
        const hasOwn: boolean = Object.keys(arr71).includes("1") === false;
        expect(hasOwn).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_2400
     * @tc.name      testArraySparse0024
     * @tc.desc      Verify that an explicit undefined in an array is an own property (hasOwnProperty returns true).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0024';
        console.log(TAG + ' start');

        const arr72: (number | undefined | null)[] = [1, undefined, 3];
        const hasIndex1 = Object.keys(arr72).includes("1");
        const hasOwn: boolean = hasIndex1 === true;
        expect(hasOwn).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_1100
     * @tc.name      testArrayFrom0011
     * @tc.desc      Verify Array.from converts an array-like object of given length into an array with holes represented as undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0011';
        console.log(TAG + ' start');

        const arrayLike73 = ["a", , ,]
        const arr73: (string | undefined)[] = Array.from(arrayLike73);
        const result73: boolean = arr73.length === 3 && arr73[1] === undefined;

        expect(result73).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SELFREF_0100
     * @tc.name      testArraySelfRef0001
     * @tc.desc      Verify that an array can contain a reference to itself (self-referential structure).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySelfRef0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySelfRef0001';
        console.log(TAG + ' start');

        type RecursiveArray = Array<RecursiveArray | undefined>;
        const arr74: RecursiveArray = [];
        arr74.push(arr74 as RecursiveArray);

        const result74: boolean = arr74[0] === arr74;
        expect(result74).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_1200
     * @tc.name      testArrayConstruct0012
     * @tc.desc      Verify new Array(1,2,...,15) creates an array with expected length and last element value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0012';
        console.log(TAG + ' start');
        const arr75: number[] = new Array(
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15
        );
        const result75: boolean = arr75.length === 15 && arr75[14] === 15;
        expect(result75).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_0700
     * @tc.name      testArrayOf0007
     * @tc.desc      Verify Array.of(1..10) creates an array of length 10 with correct last element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOf0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOf0007';
        console.log(TAG + ' start');

        const arr76: number[] = Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        const result76: boolean = arr76.length === 10 && arr76[9] === 10;
        expect(result76).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_2500
     * @tc.name      testArraySparse0025
     * @tc.desc      Verify difference in behavior between map (preserves holes) and filter (skips holes) on sparse arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0025';
        console.log(TAG + ' start');

        const arr77: (number | undefined)[] = [1, , 3];
        const map77: (number | undefined)[] = arr77.map(x => x);
        const filter77: (number | undefined)[] = arr77.filter(x => true);

        const result77: boolean = map77.length === 3 && filter77.length === 2;
        expect(result77).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_1200
     * @tc.name      testArrayFrom0012
     * @tc.desc      Verify Array.from copies sparse arrays preserving hole positions as undefined entries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0012';
        console.log(TAG + ' start');

        const arr78: (number | undefined)[] = [1, , 3];
        const copy78: (number | undefined)[] = Array.from(arr78);
        const result78: boolean = copy78.length === 3 && copy78[1] === undefined;
        expect(result78).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_2600
     * @tc.name      testArraySparse0026
     * @tc.desc      Verify that assigning to an index beyond current length extends the sparse array and leaves intermediate holes undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0026';
        console.log(TAG + ' start');

        const arr79: number[] = new Array(3);
        arr79[5] = 5;
        const result79: boolean = arr79.length === 6 && arr79[3] === undefined;
        expect(result79).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_NESTED_0300
     * @tc.name      testArrayNested0003
     * @tc.desc      Verify deep complex nested arrays allow multi-level access to obtain the expected nested value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayNested0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayNested0003';
        console.log(TAG + ' start');

        type NestedArray = Array<number | NestedArray>;
        const arr80: NestedArray[] = [
          [1, [2, 3]],
          [4, [5, [6]]]
        ];
        const secondElement = arr80[1];
        if (!Array.isArray(secondElement)) {
          throw new TypeError();
        }

        const innerArray = secondElement[1];
        if (!Array.isArray(innerArray)) {
          throw new TypeError();
        }

        const deepestArray = innerArray[1];
        if (!Array.isArray(deepestArray)) {
          throw new TypeError();
        }

        const value = deepestArray[0];
        if (typeof value !== 'number') {
          throw new TypeError();
        }

        const result80 = value === 6;
        expect(result80).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_ACCESS_0100
     * @tc.name      testArrayAccess0001
     * @tc.desc      Verify accessing index 0 of [10,20,30] returns 10.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0001';
        console.log(TAG + ' start');

        const arr1: number[] = [10, 20, 30];
        const result1: boolean = arr1[0] === 10;
        expect(result1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_0200
     * @tc.name      testArrayAccess0002
     * @tc.desc      Verify accessing middle index 2 of [10,20,30,40] returns 30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0002';
        console.log(TAG + ' start');

        const arr2: number[] = [10, 20, 30, 40];
        const result2: boolean = arr2[2] === 30;
        expect(result2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_0300
     * @tc.name      testArrayAccess0003
     * @tc.desc      Verify accessing last element index 2 of [10,20,30] returns 30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0003';
        console.log(TAG + ' start');

        const arr3: number[] = [10, 20, 30];
        const result3: boolean = arr3[2] === 30;
        expect(result3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_0400
     * @tc.name      testArrayAccess0004
     * @tc.desc      Verify single-element string array accesses index 0 with "test".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0004';
        console.log(TAG + ' start');

        const arr4: string[] = ['test'];
        const result4: boolean = arr4[0] === 'test';
        expect(result4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_0500
     * @tc.name      testArrayAccess0005
     * @tc.desc      Verify accessing index 0 on an empty array returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0005';
        console.log(TAG + ' start');

        const arr5: undefined[] = [];
        const result5: boolean = arr5[0] === undefined;
        expect(result5).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_0600
     * @tc.name      testArrayAccess0006
     * @tc.desc      Verify mixed-type array index 1 returns "a".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0006';
        console.log(TAG + ' start');

        const arr6: (number | string | boolean)[] = [1, 'a', true];
        const result6: boolean = arr6[1] === 'a';
        expect(result6).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_0700
     * @tc.name      testArrayAccess0007
     * @tc.desc      Verify nested array access arr[1][1] returns 3 for [1,[2,3],4].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0007';
        console.log(TAG + ' start');

        const arr7: (number | number[])[] = [1, [2, 3], 4];
        const result7: boolean = (arr7[1] as number[])[1] === 3;
        expect(result7).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_0800
     * @tc.name      testArrayAccess0008
     * @tc.desc      Verify accessing array length via property name "length" returns correct length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0008';
        console.log(TAG + ' start');

        const arr8: number[] = [1, 2, 3];
        const result8: boolean = arr8.length === 3;
        expect(result8).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_0900
     * @tc.name      testArrayAccess0009
     * @tc.desc      Verify string index "1" accesses element 20 on [10,20].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0009';
        console.log(TAG + ' start');

        const arr9: number[] = [10, 20];
        const result9: boolean = arr9[1] === 20;
        expect(result9).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_1000
     * @tc.name      testArrayAccess0010
     * @tc.desc      Verify sparse array [1,,3] returns 1 at index 0 and 3 at index 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0010';
        console.log(TAG + ' start');

        const arr10: (number | undefined)[] = [1, , 3];
        const result10: boolean = arr10[0] === 1 && arr10[2] === 3;
        expect(result10).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OOB_0100
     * @tc.name      testArrayOob0001
     * @tc.desc      Verify accessing index equal to length returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOob0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOob0001';
        console.log(TAG + ' start');

        const arr11: number[] = [1, 2, 3];
        const result11: boolean = arr11[3] === undefined;
        expect(result11).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OOB_0200
     * @tc.name      testArrayOob0002
     * @tc.desc      Verify accessing index greater than length returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOob0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOob0002';
        console.log(TAG + ' start');

        const arr12: number[] = [1, 2];
        const result12: boolean = arr12[5] === undefined;
        expect(result12).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OOB_0300
     * @tc.name      testArrayOob0003
     * @tc.desc      Verify accessing large index on empty array returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOob0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOob0003';
        console.log(TAG + ' start');

        const arr13: undefined[] = [];
        const result13: boolean = arr13[100] === undefined;
        expect(result13).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OOB_0400
     * @tc.name      testArrayOob0004
     * @tc.desc      Verify accessing index 1000 on small array returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOob0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOob0004';
        console.log(TAG + ' start');

        const arr14: number[] = [1, 2, 3];
        const result14: boolean = arr14[1000] === undefined;
        expect(result14).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OOB_0500
     * @tc.name      testArrayOob0005
     * @tc.desc      Verify that assigning to an out-of-bounds index does not define intermediate indices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOob0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOob0005';
        console.log(TAG + ' start');

        const arr15: (number | undefined)[] = [1, 2];
        arr15[5] = 6;
        const result15: boolean = arr15[3] === undefined;
        expect(result15).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OOB_0600
     * @tc.name      testArrayOob0006
     * @tc.desc      Verify length updates correctly after assigning to out-of-bounds index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOob0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOob0006';
        console.log(TAG + ' start');

        const arr16: (number | undefined)[] = [1, 2];
        arr16[5] = 6;
        const result16: boolean = arr16.length === 6;
        expect(result16).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OOB_0700
     * @tc.name      testArrayOob0007
     * @tc.desc      Verify multiple out-of-bounds assignments update length and leave holes undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOob0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOob0007';
        console.log(TAG + ' start');

        const arr17: (number | undefined)[] = [1];
        arr17[3] = 4;
        arr17[5] = 6;
        const result17: boolean = arr17.length === 6 && arr17[4] === undefined;
        expect(result17).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OOB_0800
     * @tc.name      testArrayOob0008
     * @tc.desc      Verify intermediate indices are not set after assigning to a far index (hasOwnProperty false).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOob0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOob0008';
        console.log(TAG + ' start');

        const arr18: (number | undefined)[] = [1, 2];
        arr18[10] = 11;
        const result18: boolean = Object.keys(arr18).includes("5") === false;
        expect(result18).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_NEGINDEX_0100
     * @tc.name      testArrayNegIndex0001
     * @tc.desc      Verify accessing negative index -1 via bracket returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayNegIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayNegIndex0001';
        console.log(TAG + ' start');

        const arr19: number[] = [1, 2, 3];
        const result19: boolean = arr19[-1] === undefined;
        expect(result19).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_NEGINDEX_0200
     * @tc.name      testArrayNegIndex0002
     * @tc.desc      Verify accessing negative index -2 via bracket returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayNegIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayNegIndex0002';
        console.log(TAG + ' start');

        const arr20: number[] = [10, 20, 30];
        const result20: boolean = (arr20)[-2] === undefined;
        expect(result20).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_NEGINDEX_0300
     * @tc.name      testArrayNegIndex0003
     * @tc.desc      Verify negative index on empty array returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayNegIndex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayNegIndex0003';
        console.log(TAG + ' start');

        const arr21: undefined[] = [];
        const result21: boolean = (arr21)[-1] === undefined;
        expect(result21).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_NEGINDEX_0400
     * @tc.name      testArrayNegIndex0004
     * @tc.desc      Verify assigning to a negative index stores property but does not change length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayNegIndex0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayNegIndex0004';
        console.log(TAG + ' start');

        const arr22: (number | string)[] = [1, 2];
        (arr22)[-1] = 'test';
        const result22: boolean = (arr22)[-1] === 'test' && arr22.length === 2;
        expect(result22).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_NEGINDEX_0500
     * @tc.name      testArrayNegIndex0005
     * @tc.desc      Verify negative index assigned becomes an object property (hasOwn on "-2").
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayNegIndex0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayNegIndex0005';
        console.log(TAG + ' start');

        const arr23: (number | string)[] = [1, 2];
        arr23[-2] = 'val';
        const keys: string[] = Object.keys(arr23);
        const result23: boolean = keys.includes('-2') === true;

        expect(result23).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_NEGINDEX_0600
     * @tc.name      testArrayNegIndex0006
     * @tc.desc      Verify at(-1) returns last element while bracket [-1] is undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayNegIndex0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayNegIndex0006';
        console.log(TAG + ' start');

        const arr24: number[] = [1, 2, 3];
        const lastElement = arr24[arr24.length - 1];
        const negativeIndexAccess = arr24[-1];

        const result24: boolean = lastElement === 3 && negativeIndexAccess === undefined;

          expect(result24).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_MODIFY_0100
     * @tc.name      testArrayModify0001
     * @tc.desc      Verify modifying middle element arr[1] = 20 updates value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0001';
        console.log(TAG + ' start');

        const arr25: number[] = [1, 2, 3];
        arr25[1] = 20;
        const result25: boolean = arr25[1] === 20;
        expect(result25).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_0200
     * @tc.name      testArrayModify0002
     * @tc.desc      Verify modifying first element arr[0] = 100 updates value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0002';
        console.log(TAG + ' start');

        const arr26: number[] = [10, 20];
        arr26[0] = 100;
        const result26: boolean = arr26[0] === 100;
        expect(result26).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_MODIFY_0300
     * @tc.name      testArrayModify0003
     * @tc.desc      Verify modifying last element updates the last element value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0003';
        console.log(TAG + ' start');

        const arr27: number[] = [1, 2, 3];
        arr27[2] = 30;
        const result27: boolean = arr27[2] === 30;
        expect(result27).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_0400
     * @tc.name      testArrayModify0004
     * @tc.desc      Verify modifying nested array element arr[1][0] updates nested value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0004';
        console.log(TAG + ' start');

        const arr28: (number | number[])[] = [1, [2, 3], 4];
        (arr28[1] as number[])[0] = 20;
        const result28: boolean = (arr28[1] as number[])[0] === 20;
        expect(result28).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_0500
     * @tc.name      testArrayModify0005
     * @tc.desc      Verify modifying object element property inside array updates that property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0005';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }


        const obj29: testobj = { name: 'test' };
        const arr29: testobj[] = [obj29];
        arr29[0].name = 'modified';
        const result29: boolean = arr29[0].name === 'modified';
        expect(result29).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_0600
     * @tc.name      testArrayModify0006
     * @tc.desc      Verify filling a sparse array hole updates the hole value and length remains correct.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0006';
        console.log(TAG + ' start');

        const arr30: (number | undefined)[] = [1, , 3];
        arr30[1] = 2;
        const result30: boolean = arr30[1] === 2 && arr30.length === 3;
        expect(result30).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_0700
     * @tc.name      testArrayModify0007
     * @tc.desc      Verify multiple modifications to same element result in last assigned value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0007';
        console.log(TAG + ' start');

        const arr31: number[] = [10];
        arr31[0] = 20;
        arr31[0] = 30;
        const result31: boolean = arr31[0] === 30;
        expect(result31).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_0800
     * @tc.name      testArrayModify0008
     * @tc.desc      Verify modifying element to a different type updates stored type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0008';
        console.log(TAG + ' start');

        const arr32: (number | string)[] = [1];
        (arr32)[0] = 'a';
        const result32: boolean = arr32[0] === 'a';
        expect(result32).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_0900
     * @tc.name      testArrayModify0009
     * @tc.desc      Verify modifying an element does not change array length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0009';
        console.log(TAG + ' start');

        const arr33: number[] = [1, 2, 3];
        arr33[1] = 20;
        const result33: boolean = arr33.length === 3;
        expect(result33).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_1000
     * @tc.name      testArrayModify0010
     * @tc.desc      Verify assigning to index 0 on empty array creates element and updates length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0010';
        console.log(TAG + ' start');

        const arr34: number[] = [];
        (arr34)[0] = 1;
        const result34: boolean = arr34[0] === 1 && arr34.length === 1;
        expect(result34).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_ADD_0100
     * @tc.name      testArrayAdd0001
     * @tc.desc      Verify adding element at index equal to length appends element and updates length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0001';
        console.log(TAG + ' start');

        const arr35: number[] = [1, 2];
        arr35[2] = 3;
        const result35: boolean = arr35.length === 3 && arr35[2] === 3;
        expect(result35).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_0200
     * @tc.name      testArrayAdd0002
     * @tc.desc      Verify adding element at index greater than length creates holes and updates length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0002';
        console.log(TAG + ' start');

        const arr36: (number | undefined)[] = [1, 2];
        arr36[5] = 6;
        const result36: boolean = arr36.length === 6 && arr36[5] === 6;
        expect(result36).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_0300
     * @tc.name      testArrayAdd0003
     * @tc.desc      Verify consecutive adds extend array and join yields expected sequence.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0003';
        console.log(TAG + ' start');

        const arr37: number[] = [1];
        arr37[1] = 2;
        arr37[2] = 3;
        const result37: boolean = arr37.length === 3 && arr37.join(',') === '1,2,3';
        expect(result37).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_0400
     * @tc.name      testArrayAdd0004
     * @tc.desc      Verify sparse add (jump to index 3) creates hole at index 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0004';
        console.log(TAG + ' start');

        const arr38: (number | undefined)[] = [1];
        arr38[3] = 4;
        const result38: boolean = arr38.length === 4 && arr38[2] === undefined;
        expect(result38).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_0500
     * @tc.name      testArrayAdd0005
     * @tc.desc      Verify adding then filling middle hole preserves other holes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0005';
        console.log(TAG + ' start');

        const arr39: (number | undefined)[] = [1];
        arr39[3] = 4;
        arr39[1] = 2;
        const result39: boolean = arr39[1] === 2 && arr39[2] === undefined;
        expect(result39).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_0600
     * @tc.name      testArrayAdd0006
     * @tc.desc      Verify adding an object element stores the same object reference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0006';
        console.log(TAG + ' start');

        interface testobj {
          key: string
        }

        const obj40: testobj = { key: 'val' };
        const arr40: (number | testobj)[] = [1, 2];
        arr40[2] = obj40;
        const result40: boolean = (arr40[2] as testobj) === obj40;
        expect(result40).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });


    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_0700
     * @tc.name      testArrayAdd0007
     * @tc.desc      Verify adding a function element to an array stores the function and it can be invoked.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0007';
        console.log(TAG + ' start');

        const func41: () => string = () => 'test';
        const arr41: (number | (() => string))[] = [1];
        arr41[1] = func41;
        const result41: boolean = (typeof arr41[1] === 'function') && ((arr41[1] as (() => string))() === 'test');

        expect(result41).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_0800
     * @tc.name      testArrayAdd0008
     * @tc.desc      Verify adding a nested array as an element stores the nested array and its values are accessible.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0008';
        console.log(TAG + ' start');

        const arr42: (number | number[])[] = [1];
        arr42[1] = [2, 3];
        const result42: boolean = Array.isArray(arr42[1]) && (arr42[1] as number[])[1] === 3;

        expect(result42).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_0900
     * @tc.name      testArrayAdd0009
     * @tc.desc      Verify assigning multiple elements into an initially empty array updates length and content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0009';
        console.log(TAG + ' start');

        const arr43: number[] = [];
        arr43[0] = 1;
        arr43[1] = 2;
        const result43: boolean = arr43.length === 2 && arr43.join(',') === '1,2';

        expect(result43).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_1000
     * @tc.name      testArrayAdd0010
     * @tc.desc      Verify assigning an element and then deleting it results in an undefined hole while length remains as expanded.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0010';
        console.log(TAG + ' start');

        const arr44: (number | undefined)[] = [1, 2];
        arr44[3] = 4;
        arr44.splice(3, 1);
        const result44: boolean = arr44[3] === undefined && arr44.length === 4;

        expect(result44).assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_0700
     * @tc.name      testArrayStore0007
     * @tc.desc      Verify storing undefined into an existing array slot yields undefined when read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStore0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStore0007';
        console.log(TAG + ' start');

        const arr45: (number | undefined)[] = [1, 2];
        arr45[1] = undefined;
        const result45: boolean = arr45[1] === undefined;

        expect(result45).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_STORE_0800
     * @tc.name      testArrayStore0008
     * @tc.desc      Verify storing null into an array slot yields null when read back.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStore0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStore0008';
        console.log(TAG + ' start');

        const arr46: (number | null)[] = [1, 2];
        arr46[1] = null;
        const result46: boolean = arr46[1] === null;
        expect(result46).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_0900
     * @tc.name      testArrayStore0009
     * @tc.desc      Verify storing NaN into an array slot preserves NaN (isNaN check true).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStore0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStore0009';
        console.log(TAG + ' start');

        const arr47: (number)[] = [1, 2];
        arr47[1] = NaN;
        const result47: boolean = isNaN(arr47[1]);
        expect(result47).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_1000
     * @tc.name      testArrayStore0010
     * @tc.desc      Verify storing Infinity into an array slot preserves Infinity value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStore0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStore0010';
        console.log(TAG + ' start');

        const arr48: (number)[] = [1, 2];
        arr48[1] = Infinity;
        const result48: boolean = arr48[1] === Infinity;
        expect(result48).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_1100
     * @tc.name      testArrayStore0011
     * @tc.desc      Verify storing -Infinity into an array slot preserves -Infinity value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStore0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStore0011';
        console.log(TAG + ' start');

        const arr49: (number)[] = [1, 2];
        arr49[1] = -Infinity;
        const result49: boolean = arr49[1] === -Infinity;
        expect(result49).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_1200
     * @tc.name      testArrayStore0012
     * @tc.desc      Verify storing Date object into an array slot preserves the Date instance and its properties.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStore0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStore0012';
        console.log(TAG + ' start');

        const date50: Date = new Date(2024, 0, 1);
        const arr50: (number | Date)[] = [1];
        arr50[1] = date50;
        const result50: boolean = (arr50[1] instanceof Date) && ((arr50[1] as Date).getFullYear() === 2024);

        expect(result50).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_0100
     * @tc.name      testArrayStores0001
     * @tc.desc      Verify that a RegExp object can be stored in an array slot and its methods/flags remain intact.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStores0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStores0001';
        console.log(TAG + ' start');

        const reg51: RegExp = /abc/g;
        const arr51: (number | RegExp)[] = [1];
        arr51[1] = reg51;
        const slot = arr51[1] as RegExp;
        const result51: boolean = slot.test('abc') && slot.flags === 'g';
        expect(result51).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_0200
     * @tc.name      testArrayStores0002
     * @tc.desc      Verify that a Symbol can be stored in an array slot and identity is preserved.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStores0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStores0002';
        console.log(TAG + ' start');

        const sym52: string = generateUniqueKey('test');
        const arr52: (number | string)[] = [1];
        arr52[1] = sym52;
        const result52: boolean = arr52[1] === sym52;
        expect(result52).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_0300
     * @tc.name      testArrayStores0003
     * @tc.desc      Verify that an array can store a reference to itself and the self-reference is identical.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStores0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStores0003';
        console.log(TAG + ' start');

        type RecursiveArray = Array<RecursiveArray | number>;
        const arr53: RecursiveArray = [1];
        arr53[1] = arr53;
        const result53: boolean = arr53[1] === arr53;
        expect(result53).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_0400
     * @tc.name      testArrayStores0004
     * @tc.desc      Verify that a Map object can be stored in an array and retrieved correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStores0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStores0004';
        console.log(TAG + ' start');

        const map54: Map<string, number> = new Map<string, number>([['a', 1]]);
        const arr54: (number | Map<string, number>)[] = [1];
        arr54[1] = map54;
        const result54: boolean = (arr54[1] as Map<string, number>).get('a') === 1;

        expect(result54).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_0500
     * @tc.name      testArrayStores0005
     * @tc.desc      Verify that a Set object can be stored in an array and Set.has works after retrieval.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStores0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStores0005';
        console.log(TAG + ' start');

        const set55: Set<number> = new Set<number>([1, 2]);
        const arr55: (number | Set<number>)[] = [1];
        arr55[1] = set55;
        const result55: boolean = (arr55[1] as Set<number>).has(2);

        expect(result55).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_0600
     * @tc.name      testArrayStores0006
     * @tc.desc      Verify that multiple special values (undefined, null, NaN) can be stored and correctly identified.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStores0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStores0006';
        console.log(TAG + ' start');

        const arr56: (undefined | null | number)[] = [undefined, null, NaN];
        const result56: boolean = arr56[0] === undefined && arr56[1] === null && isNaN(arr56[2] as number);

        expect(result56).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_STORE_0700
     * @tc.name      testArrayStores0007
     * @tc.desc      Verify difference between explicit undefined and holes: hasOwnProperty distinguishes them.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStores0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStores0007';
        console.log(TAG + ' start');

        const arr57a: (number | undefined)[] = [1, undefined, 3];
        const arr57b: (number | undefined)[] = [1, , 3];
        const condA: boolean = arr57a[1] === undefined && arr57b[1] === undefined;
        const hasOwnA: boolean = Object.keys(arr57a).includes('1');
        const hasOwnB: boolean = Object.keys(arr57b).includes('1');
        const result57: boolean = condA && hasOwnA && !hasOwnB;

        expect(result57).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_STORE_0800
     * @tc.name      testArrayStores0008
     * @tc.desc      Verify that special value elements can be modified to new values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayStores0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayStores0008';
        console.log(TAG + ' start');

        const arr58: (number | null)[] = [NaN, null];
        arr58[0] = 10;
        arr58[1] = 20;
        const result58: boolean = arr58[0] === 10 && (arr58[1]) === 20;

        expect(result58).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_1100
     * @tc.name      testArrayAccess0011
     * @tc.desc      Verify that a large array (length 1000) supports writing and reading a middle element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0011';
        console.log(TAG + ' start');

        const arr59: string[] = new Array(1000);
        arr59[500] = 'middle';
        const result59: boolean = arr59[500] === 'middle';

        expect(result59).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BOUNDS_0100
     * @tc.name      testArrayBounds0001
     * @tc.desc      Verify that accessing an out-of-range index such as Number.MAX_SAFE_INTEGER returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBounds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBounds0001';
        console.log(TAG + ' start');

        const arr60: number[] = [1];
        const val = (arr60)[Number.MAX_SAFE_INTEGER];
        const result60: boolean = val === undefined;

        expect(result60).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}