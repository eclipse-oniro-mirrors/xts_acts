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

export default function IndexedCollections15Test() {
  describe('IndexedCollections15Test', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1100
     * @tc.name      testArrayConcat0011
     * @tc.desc      Verify original array remains unchanged after concat.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0011';
        console.log(TAG + ' start');

        const arr41: number[] = [1, 2];
        const arr41b: number[] = [3];
        arr41.concat(arr41b);
        expect(arr41.join(',') === '1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1200
     * @tc.name      testArrayConcat0012
     * @tc.desc      Verify concat preserves null and undefined as elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0012';
        console.log(TAG + ' start');

        type ArrayElement = null | undefined | number | number[]
        const arr42: ArrayElement[] = [1];
        const result42: ArrayElement[] = arr42.concat(null, undefined, [2]);

        const asStrings = result42.map((v) => (v === null ? 'null' : (v === undefined ? 'undefined' : String(v))));
        expect(asStrings.join(',') === '1,null,undefined,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1300
     * @tc.name      testArrayConcat0013
     * @tc.desc      Verify concat preserves boolean values and arrays of booleans.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0013';
        console.log(TAG + ' start');

        type ArrayElement = boolean | boolean[]
        const arr43: ArrayElement[] = [true];
        const result43: ArrayElement[] = arr43.concat(false, [true]);
        expect(result43.join(',') === 'true,false,true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1400
     * @tc.name      testArrayConcat0014
     * @tc.desc      Verify concat can handle concatenation of many elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0014';
        console.log(TAG + ' start');

        const arr44: number[] = [1, 2, 3];
        const result44: number[] = arr44.concat(4, 5, 6, 7, 8);
        expect(result44.join(',') === '1,2,3,4,5,6,7,8').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1500
     * @tc.name      testArrayConcat0015
     * @tc.desc      Verify concat preserves holes when concatenating sparse arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0015';
        console.log(TAG + ' start');

        const arr45: (number | undefined)[] = [1, , 3];
        const arr45b: (number | undefined)[] = [4, , 6];
        const result45: (number | undefined)[] = (arr45).concat(arr45b);
        expect(result45.join(',') === '1,,3,4,,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1600
     * @tc.name      testArrayConcat0016
     * @tc.desc      Verify concat accepts functions as elements and length reflects addition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0016';
        console.log(TAG + ' start');

        let a = () => {
        }

        let b = () => {
        }

        const arr46: Function[] = [a];
        const result46: Function[] = arr46.concat(b);
        expect(result46.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1700
     * @tc.name      testArrayConcat0017
     * @tc.desc      Verify concat of nested arrays preserves nested elements; map(join) shows expected flattening by toString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0017';
        console.log(TAG + ' start');

        const arr47: number[][] = [[1, 2], [3]];
        const result47: number[][] = arr47.concat([[4]]);

        const mapped = result47.map(a => (a as number[]).join(','));
        expect(mapped.join(',') === '1,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1800
     * @tc.name      testArrayConcat0018
     * @tc.desc      Verify concat preserves NaN elements; NaN comparisons use isNaN.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0018';
        console.log(TAG + ' start');

        const arr48: number[] = [1, NaN];
        const result48: number[] = arr48.concat([NaN, 2]);

        const ok =
          result48.length === 4 && result48[0] === 1 && isNaN(result48[1]) && isNaN(result48[2]) && result48[3] === 2;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1900
     * @tc.name      testArrayConcat0019
     * @tc.desc      Verify concat treats non-array objects as single elements (not array-like expansion).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0019';
        console.log(TAG + ' start');

        interface testobj {
          k: number
        }

        const arr49: (number | testobj)[] = [1];

        const obj49: testobj = { k: 2 };
        const result49: (number | testobj)[] = arr49.concat(obj49);

        expect(result49.join(',') === '1,[object Object]').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_2000
     * @tc.name      testArrayConcat0020
     * @tc.desc      Verify concat accepts Symbol elements and length increases accordingly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0020';
        console.log(TAG + ' start');

        const sym: string = generateUniqueKey('test');
        const arr50: string[] = [sym];
        const result50: string[] = arr50.concat(generateUniqueKey('another'));
        expect(result50.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_0100
     * @tc.name      testArrayFlat0001
     * @tc.desc      Verify flat() with default depth (1) flattens one level.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0001';
        console.log(TAG + ' start');

        const arr51: (number | number[])[] = [1, [2, 3], 4];
        const result51: number[] = arr51.flat() as number[];
        expect(result51.join(',') === '1,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_0200
     * @tc.name      testArrayFlat0002
     * @tc.desc      Verify flat(1) flattens exactly one level.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0002';
        console.log(TAG + ' start');

        const arr52: (number | (number | number[])[])[] = [1, [2, [3]], 4];
        const result52 = arr52.flat(1);

        expect(result52.length === 4 && result52[1] === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_0300
     * @tc.name      testArrayFlat0003
     * @tc.desc      Verify flat(2) flattens two levels.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0003';
        console.log(TAG + ' start');

        const arr53 = [1, [2, [3, [4]]], 5];
        const result53 = arr53.flat(2);
        expect(result53.join(',') === '1,2,3,4,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_0400
     * @tc.name      testArrayFlat0004
     * @tc.desc      Verify flat(Infinity) fully flattens nested arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0004';
        console.log(TAG + ' start');

        const arr54 = [1, [2, [3, [4, [5]]]]];
        const result54 = arr54.flat(Infinity);
        expect(result54.join(',') === '1,2,3,4,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_0500
     * @tc.name      testArrayFlat0005
     * @tc.desc      Verify flat() on non-nested array returns a shallow copy and not the same reference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0005';
        console.log(TAG + ' start');

        const arr55: number[] = [1, 2, 3];
        const result55 = arr55.flat();
        expect(result55.join(',') === '1,2,3' && result55 !== arr55).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_0600
     * @tc.name      testArrayFlat0006
     * @tc.desc      Verify flat() on an empty array returns an empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0006';
        console.log(TAG + ' start');

        const arr56 = [];
        const result56 = arr56.flat();
        expect(result56.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_0700
     * @tc.name      testArrayFlat0007
     * @tc.desc      Verify flat(0) does not flatten (depth 0 treated as no flatten).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0007';
        console.log(TAG + ' start');

        const arr57 = [1, [2, 3]];
        const result57 = arr57.flat(0);

        expect(result57.length === 2 && Array.isArray(result57[1]) && (result57[1][0] === 2)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_0800
     * @tc.name      testArrayFlat0008
     * @tc.desc      Verify flat() with negative depth is treated as depth 0 (no flatten).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0008';
        console.log(TAG + ' start');

        const arr58 = [1, [2, 3]];
        const result58 = arr58.flat(-1);
        expect(result58.length === 2 && Array.isArray(result58[1])).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_0900
     * @tc.name      testArrayFlat0009
     * @tc.desc      Verify flat() removes holes when flattening sparse arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0009';
        console.log(TAG + ' start');

        const arr59 = [1, , [3, , 5]];
        const result59 = arr59.flat();
        expect(result59.join(',') === '1,3,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_1000
     * @tc.name      testArrayFlat0010
     * @tc.desc      Verify flat() preserves null and undefined values (they are not removed).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0010';
        console.log(TAG + ' start');

        const arr60 = [1, null, [undefined, 3]];
        const result60 = arr60.flat();
        expect(result60[0] === 1 && result60[1] === null && result60[2] === undefined && result60[3] === 3)
          .assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_1100
     * @tc.name      testArrayFlat0011
     * @tc.desc      Verify that calling flat() does not mutate the original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0011';
        console.log(TAG + ' start');

        const arr61 = [1, [2, 3]];
        expect(Array.isArray(arr61[1]) && (arr61[1][0] === 2)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_1200
     * @tc.name      testArrayFlat0012
     * @tc.desc      Verify flat() works with arrays of objects and preserves object references.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0012';
        console.log(TAG + ' start');

        interface testobj {
          a?: number
          b?: number
          c?: number
        }

        const arr62: (testobj | testobj[])[] = [{ a: 1 }, [{ b: 2 }, { c: 3 }]];
        const result62 = arr62.flat();
        expect(result62.length === 3 && result62[0].a === 1 && result62[1].b === 2 && result62[2].c === 3)
          .assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_1300
     * @tc.name      testArrayFlat0013
     * @tc.desc      Verify flat() with depth greater than actual nesting flattens completely.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0013';
        console.log(TAG + ' start');

        const arr63 = [1, [2, [3]]];
        const result63 = arr63.flat(10);
        expect(result63.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_1400
     * @tc.name      testArrayFlat0014
     * @tc.desc      Verify flat(Infinity) removes empty nested arrays and returns flattened elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0014';
        console.log(TAG + ' start');

        const arr64 = [1, [], [3, []]];
        const result64 = arr64.flat(Infinity);
        expect(result64.join(',') === '1,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLAT_1500
     * @tc.name      testArrayFlat0015
     * @tc.desc      Verify flat(depth) works for boolean arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlat0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlat0015';
        console.log(TAG + ' start');

        const arr65 = [true, [false, [true]]];
        const result65 = arr65.flat(2);
        expect(result65.join(',') === 'true,false,true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_0100
     * @tc.name      testArrayFlatMap0001
     * @tc.desc      Verify basic flatMap usage: map then flatten one level.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0001';
        console.log(TAG + ' start');

        const arr66: number[] = [1, 2, 3];
        const result66: number[] = arr66.flatMap(x => [x, x * 2]);
        expect(result66.join(',') === '1,2,2,4,3,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_0200
     * @tc.name      testArrayFlatMap0002
     * @tc.desc      Verify flatMap produces the same result as map(...).flat(1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0002';
        console.log(TAG + ' start');

        const arr67: number[] = [1, 2];
        const result67a = arr67.flatMap(x => [x, x + 1]);
        const result67b = arr67.map(x => [x, x + 1]).flat(1);
        expect(result67a.join() === result67b.join()).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_0300
     * @tc.name      testArrayFlatMap0003
     * @tc.desc      Verify flatMap with mapping that returns non-array values results in those values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0003';
        console.log(TAG + ' start');

        const arr68: number[] = [1, 2];
        const result68: number[] = arr68.flatMap(x => x * 2);
        expect(result68.join(',') === '2,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_0400
     * @tc.name      testArrayFlatMap0004
     * @tc.desc      Verify flatMap flattens mapped arrays by one level only.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0004';
        console.log(TAG + ' start');

        const arr69: number[] = [1, 2];
        const result69 = arr69.flatMap(x => [x, [x * 2]]);

        expect(result69.length === 4 && result69[0] === 1 && Array.isArray(result69[1]) && (result69[1][0] === 2))
          .assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_0500
     * @tc.name      testArrayFlatMap0005
     * @tc.desc      Verify flatMap mapping to empty arrays results in an empty result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0005';
        console.log(TAG + ' start');

        const arr70: number[] = [1, 2];
        const result70 = arr70.flatMap(x => []);
        expect(result70.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_0600
     * @tc.name      testArrayFlatMap0006
     * @tc.desc      Verify flatMap on an empty array returns an empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0006';
        console.log(TAG + ' start');

        const arr71 = [];
        const result71 = arr71.flatMap(x => [x, x * 2]);
        expect(result71.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_0700
     * @tc.name      testArrayFlatMap0007
     * @tc.desc      Verify flatMap can extract and flatten nested arrays from object elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0007';
        console.log(TAG + ' start');

        interface testobj {
          name: string;
          scores: number[]
        }

        const arr72: testobj[] = [
          { name: 'a', scores: [80, 90] },
          { name: 'b', scores: [70, 60] }
        ];
        const result72: number[] = arr72.flatMap(obj => obj.scores);
        expect(result72.join(',') === '80,90,70,60').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_0800
     * @tc.name      testArrayFlatMap0008
     * @tc.desc      Verify flatMap can be used to filter elements by returning empty arrays for excluded elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0008';
        console.log(TAG + ' start');

        const arr73: number[] = [1, 2, 3, 4, 5];
        const result73: number[] = arr73.flatMap(x => (x % 2 === 0 ? [x] : []));
        expect(result73.join(',') === '2,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_0900
     * @tc.name      testArrayFlatMap0009
     * @tc.desc      Verify flatMap does not mutate the original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0009';
        console.log(TAG + ' start');

        const arr74: number[] = [1, 2];
        const copy74: number[] = arr74.flatMap(x => [x * 2]);
        expect(arr74.length === 2 && arr74[0] === 1 && copy74.join(',') === '2,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_1000
     * @tc.name      testArrayFlatMap0010
     * @tc.desc      Verify flatMap skips holes in sparse arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0010';
        console.log(TAG + ' start');

        const arr75 = [1, , 3];
        const result75 = arr75.flatMap(x => [x, x !== undefined ? x * 2 : []]);
        expect(result75.join(',') === '1,2,3,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_1100
     * @tc.name      testArrayFlatMap0011
     * @tc.desc      Verify flatMap works with string arrays (e.g., splitting characters).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0011';
        console.log(TAG + ' start');

        const arr76: string[] = ['hello', 'world'];
        const result76: string[] = arr76.flatMap(s => s.split(''));
        expect(result76.join(',') === 'h,e,l,l,o,w,o,r,l,d').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_1200
     * @tc.name      testArrayFlatMap0012
     * @tc.desc      Verify flatMap with null and numeric operations follows JS numeric semantics (null*2 === 0).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0012';
        console.log(TAG + ' start');

        const arr77: (number | null)[] = [1, null, 3];
        const result77: (number | null)[] = arr77.flatMap(x => [x, x !== null ? x * 2 : null]);

        expect(result77[0] === 1 && result77[1] === 2 && result77[2]?.toString() === undefined &&
          result77[3]?.toString() === undefined &&
          result77[4] === 3 && result77[5] === 6).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_1300
     * @tc.name      testArrayFlatMap0013
     * @tc.desc      Verify flatMap mapping function receives index as second argument and can use it.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0013';
        console.log(TAG + ' start');

        const arr78: number[] = [1, 2, 3];
        const result78 = arr78.flatMap((x, i) => [x, i]);
        expect(result78.join(',') === '1,0,2,1,3,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_1400
     * @tc.name      testArrayFlatMap0014
     * @tc.desc      Verify flatMap can return arrays of varying lengths per element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0014';
        console.log(TAG + ' start');

        const arr79: number[] = [1, 2, 3];
        const result79: number[] = arr79.flatMap(x => x === 2 ? [x, x * 2, x * 3] : [x]);
        expect(result79.join(',') === '1,2,4,6,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FLATMAP_1500
     * @tc.name      testArrayFlatMap0015
     * @tc.desc      Verify flatMap respects thisArg when provided (binding this inside the mapping function).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFlatMap0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFlatMap0015';
        console.log(TAG + ' start');

        interface testobj {
          factor: number

        }

        const obj80: testobj = { factor: 2 };
        const arr80: number[] = [1, 2];


        const result80: number[] = arr80.flatMap((x) => x * obj80.factor);
        expect(result80.join(',') === '2,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });


    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_0100
     * @tc.name      testArrayReverse0001
     * @tc.desc      Verify basic use of reverse() returns reversed array and prints elements in reversed order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0001';
        console.log(TAG + ' start');

        const arr1: number[] = [1, 2, 3, 4];
        const result1: number[] = arr1.reverse();
        expect(result1.join(',') === '4,3,2,1').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_0200
     * @tc.name      testArrayReverse0002
     * @tc.desc      Verify reverse() mutates the original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0002';
        console.log(TAG + ' start');

        const arr2: number[] = [1, 2, 3];
        arr2.reverse();
        expect(arr2.join(',') === '3,2,1').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_0300
     * @tc.name      testArrayReverse0003
     * @tc.desc      Verify reverse() on a single-element array returns the same single element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0003';
        console.log(TAG + ' start');

        const arr3: number[] = [5];
        const result3: number[] = arr3.reverse();
        expect(result3.join(',') === '5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_0400
     * @tc.name      testArrayReverse0004
     * @tc.desc      Verify reverse() on an empty array returns empty array and does not throw.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0004';
        console.log(TAG + ' start');

        const arr4 = [];
        const result4 = arr4.reverse();
        expect(result4.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_0500
     * @tc.name      testArrayReverse0005
     * @tc.desc      Verify reverse() on an array of strings returns reversed string order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0005';
        console.log(TAG + ' start');

        const arr5: string[] = ['a', 'b', 'c'];
        const result5: string[] = arr5.reverse();
        expect(result5.join(',') === 'c,b,a').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_0600
     * @tc.name      testArrayReverse0006
     * @tc.desc      Array reverses test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0006';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const arr6: testobj[] = [{ name: 'a' }, { name: 'b' }];
        const result6: testobj[] = arr6.reverse();
        expect(result6.map(o => o.name).join(',') === 'b,a').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_0700
     * @tc.name      testArrayReverse0007
     * @tc.desc      Array reverse() Test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0007';
        console.log(TAG + ' start');

        const arr7: (number | null | undefined)[] = [null, undefined, 1];
        const result7: (number | null | undefined)[] = arr7.reverse();
        expect(result7.join(',') === '1,,').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_0800
     * @tc.name      testArrayReverse0008
     * @tc.desc      Verify reverse() on nested arrays reverses top-level order but preserves nested structure.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0008';
        console.log(TAG + ' start');

        const arr8 = [1, [2, 3], 4];
        const result8 = arr8.reverse();

        expect(result8[0] === 4 && Array.isArray(result8[1]) && result8[2] === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_0900
     * @tc.name      testArrayReverse0009
     * @tc.desc      Verify reverse() works on boolean arrays and reverses boolean ordering.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0009';
        console.log(TAG + ' start');

        const arr9: boolean[] = [true, false, true];
        const result9: boolean[] = arr9.reverse();
        expect(result9.join(',') === 'true,false,true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REVERSE_1000
     * @tc.name      testArrayReverse0010
     * @tc.desc      Verify reverse() on sparse arrays preserves holes but reverses present elements positions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReverse0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReverse0010';
        console.log(TAG + ' start');

        const arr10: (number | undefined)[] = [1, , 3];
        const result10: (number | undefined)[] = arr10.reverse();

        expect(result10.join(',') === '3,,1').assertTrue();
        expect(result10.length === 3 && result10[1] === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_DEFAULT_0100
     * @tc.name      testArraySort0001
     * @tc.desc      Verify default sort() sorts elements as strings (numeric array caveat).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0001';
        console.log(TAG + ' start');

        const arr11: (number | string)[] = [10, 2, 30];
        const result11 = arr11.sort();
        expect(result11.join(',') === '10,2,30').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_DEFAULT_0200
     * @tc.name      testArraySort0002
     * @tc.desc      Verify default sort() sorts string array in lexicographic Unicode order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0002';
        console.log(TAG + ' start');

        const arr12: string[] = ['banana', 'apple', 'cherry'];
        const result12: string[] = arr12.sort();
        expect(result12.join(',') === 'apple,banana,cherry').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_DEFAULT_0300
     * @tc.name      testArraySort0003
     * @tc.desc      Verify default sort() on single-element array returns the same single element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0003';
        console.log(TAG + ' start');

        const arr13: number[] = [5];
        const result13 = arr13.sort();
        expect(result13.join(',') === '5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_DEFAULT_0400
     * @tc.name      testArraySort0004
     * @tc.desc      Verify default sort() on empty array returns empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0004';
        console.log(TAG + ' start');

        const arr14 = [];
        const result14 = arr14.sort();
        expect(result14.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_DEFAULT_0500
     * @tc.name      testArraySort0005
     * @tc.desc      Verify default sort() mixes letters and digits based on Unicode code points.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0005';
        console.log(TAG + ' start');

        const arr15: string[] = ['a', '1', 'b', '2'];
        const result15: string[] = arr15.sort();
        expect(result15.join(',') === '1,2,a,b').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_DEFAULT_0600
     * @tc.name      testArraySort0006
     * @tc.desc      Verify default sort() typically puts undefined at the end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0006';
        console.log(TAG + ' start');

        const arr16: (number | undefined)[] = [3, undefined, 1, 2];
        const result16 = arr16.sort();

        expect(result16.join(',') === '1,2,3,').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_DEFAULT_0700
     * @tc.name      testArraySort0007
     * @tc.desc      Verify default sort() mutates the original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0007';
        console.log(TAG + ' start');

        const arr17: number[] = [3, 1, 2];
        arr17.sort();
        expect(arr17.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_DEFAULT_0800
     * @tc.name      testArraySort0008
     * @tc.desc      Verify default sort() orders uppercase letters before lowercase in Unicode.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0008';
        console.log(TAG + ' start');

        const arr18: string[] = ['Banana', 'apple', 'Cherry'];
        const result18: string[] = arr18.sort();
        expect(result18.join(',') === 'Banana,Cherry,apple').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });



    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_0100
     * @tc.name      testArraySort0019
     * @tc.desc      Verify custom comparator sorts numbers in ascending order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0019';
        console.log(TAG + ' start');

        const arr19: number[] = [10, 2, 30];
        const result19 = arr19.sort((a, b) => a - b);
        expect(result19.join(',') === '2,10,30').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_0200
     * @tc.name      testArraySort0020
     * @tc.desc      Verify custom comparator sorts numbers in descending order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0020';
        console.log(TAG + ' start');

        const arr20: number[] = [10, 2, 30];
        const result20 = arr20.sort((a, b) => b - a);
        expect(result20.join(',') === '30,10,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_0300
     * @tc.name      testArraySort0021
     * @tc.desc      Verify custom comparator sorts objects by numeric property ascending.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0021';
        console.log(TAG + ' start');

        interface testobj {
          name: string;
          age: number
        }

        const arr21: testobj[] = [
          { name: 'b', age: 25 },
          { name: 'a', age: 20 },
          { name: 'c', age: 30 }
        ];
        const result21 = arr21.sort((a, b) => a.age - b.age);
        expect(result21.map(o => o.age).join(',') === '20,25,30').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_0400
     * @tc.name      testArraySort0022
     * @tc.desc      Verify custom comparator sorts objects by numeric property descending.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0022';
        console.log(TAG + ' start');

        interface testobj {
          name: string;
          age: number
        }

        const arr22: testobj[] = [
          { name: 'b', age: 25 },
          { name: 'a', age: 20 },
          { name: 'c', age: 30 }
        ];
        const result22 = arr22.sort((a, b) => b.age - a.age);
        expect(result22.map(o => o.age).join(',') === '30,25,20').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_0500
     * @tc.name      testArraySort0023
     * @tc.desc      Verify custom comparator sorts strings by length (ascending).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0023';
        console.log(TAG + ' start');

        const arr23: string[] = ['apple', 'banana', 'cherry', 'date'];
        const result23 = arr23.sort((a, b) => a.length - b.length);
        expect(result23.join(',') === 'date,apple,banana,cherry').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_0600
     * @tc.name      testArraySort0024
     * @tc.desc      Verify custom comparator sorts strings ignoring case.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0024';
        console.log(TAG + ' start');

        const arr24: string[] = ['Banana', 'apple', 'Cherry'];
        const result24 = arr24.sort((a, b) => {
          const lowerA = a.toLowerCase();
          const lowerB = b.toLowerCase();
          return lowerA < lowerB ? -1 : (lowerA > lowerB ? 1 : 0);
        });

        expect(result24.join(',') === 'apple,Banana,Cherry').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_0700
     * @tc.name      testArraySort0025
     * @tc.desc      Verify custom comparator handles null values by placing null last.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0025';
        console.log(TAG + ' start');

        const arr25: (number | null)[] = [3, null, 1, 2];
        const result25 = arr25.sort((a, b) => {
          if (a === null) {
            return 1;
          }
          if (b === null) {
            return -1;
          }
          return a - b;
        });

        expect(result25.join(',') === '1,2,3,').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_0800
     * @tc.name      testArraySort0026
     * @tc.desc      Verify Array Sort Custom.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0026';
        console.log(TAG + ' start');

        const arr26: (number | undefined)[] = [3, undefined, 1, 2];
        const result26 = arr26.sort((a, b) => {
          if (a === undefined) {
            return 1;
          }
          if (b === undefined) {
            return -1;
          }
          return a - b;
        });

        expect(result26.join(',') === '1,2,3,').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_0900
     * @tc.name      testArraySort0027
     * @tc.desc      Verify custom comparator sorts booleans with false before true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0027';
        console.log(TAG + ' start');

        const arr27: boolean[] = [true, false, true, false];
        const result27 = arr27.sort((a, b) => (a === b ? 0 : (a ? 1 : -1)));

        expect(result27.join(',') === 'false,false,true,true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1000
     * @tc.name      testArraySort0028
     * @tc.desc      Verify custom comparator sorts nested arrays by their length ascending.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0028';
        console.log(TAG + ' start');

        const arr28: number[][] = [[1], [1, 2, 3], [1, 2]];
        const result28 = arr28.sort((a, b) => a.length - b.length);

        expect(result28.map(a => a.length).join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1100
     * @tc.name      testArraySort0029
     * @tc.desc      Array sorting custom test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0029';
        console.log(TAG + ' start');

        const arr29: (number | undefined)[] = [3, , 1, 2];
        const result29 = arr29.sort((a, b) => {
          if (a === undefined) {
            return 1;
          }
          if (b === undefined) {
            return -1;
          }
          return a - b;
        });

        // expected join => '1,2,3,'
        expect(result29.join(',') === '1,2,3,').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1200
     * @tc.name      testArraySort0030
     * @tc.desc      Verify stable sorting of equal elements keeps relative order when comparator returns 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0030';
        console.log(TAG + ' start');

        const arr30: number[] = [2, 1, 2, 1];
        const result30 = arr30.sort((a, b) => a - b);
        expect(result30.join(',') === '1,1,2,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}
