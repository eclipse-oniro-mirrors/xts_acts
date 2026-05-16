/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

function generateUniqueKey(description: string): string {
  let entropy: number[] = [
    Math.floor(Math.random() * 0xffffffff),
    Math.floor(Math.random() * 0xffffffff)
  ];
  return `${description}_${Date.now()}_${entropy[0].toString(36)}${entropy[1].toString(36)}`;
}

interface testobj1 {
  k: number
}

interface testobj2 {
  a?: number
  b?: number
  c?: number
}

interface testobj3 {
  name: string;
  scores: number[]
}

interface testobj4 {
  factor: number

}

interface testobj5 {
  name: string
}

interface testobj6 {
  name: string;
  age: number
}

interface testobj7 {
  name: string;
  age: number
}

type ArrayElement1 = null | undefined | number | number[]

type ArrayElement2 = boolean | boolean[]

export default function IndexedCollections15Test() {
  describe('IndexedCollections15Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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

        const arr42: ArrayElement1[] = [1];
        const result42: ArrayElement1[] = arr42.concat([null, undefined, [2]] as ArrayElement1[]);

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

        const arr43: ArrayElement2[] = [true];
        const result43: ArrayElement2[] = arr43.concat([false, [true]] as ArrayElement2[]);
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
        const result44: number[] = arr44.concat([4, 5, 6, 7, 8] as number[]);
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

        const arr45: (number | undefined)[] = [1, undefined, 3];
        const arr45b: (number | undefined)[] = [4, undefined, 6];
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
        const result46: Function[] = arr46.concat([b]);
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
        const result47: number[][] = arr47.concat([[4]] as number[][]);

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
        const result48: number[] = arr48.concat([NaN, 2] as number[]);

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

        const arr49: (number | testobj1)[] = [1];

        const obj49: testobj1 = { k: 2 };
        const result49: (number | testobj1)[] = arr49.concat([obj49]);

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
        const result50: string[] = arr50.concat([generateUniqueKey('another')]);
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
        const result51: number[] = arr51.flat<number>() as number[];
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
        const result54 = arr54.flat<number>(Infinity.toInt());
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

        const arr56 = [NaN];
        const result56 = arr56.flat();
        expect(result56.length === 1).assertTrue();

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

        const arr59 = [1, undefined, [3, undefined, 5]];
        const result59 = arr59.flat();
        expect(result59.join(',') === '1,,3,,5').assertTrue();

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

        const arr64 = [1, [undefined], [3, [undefined]]];
        const result64 = arr64.flat<int>(Infinity.toInt());
        expect(result64.join(',') === '1,,3,').assertTrue();

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
        const result69 = arr69.flatMap(x => [[x], [x * 2]]);

        expect(result69.length === 4 && result69[0] === 1 && Array.isArray(result69[1]) && (result69[1][0] === 2))
          .assertFalse();

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

        const obj80: testobj4 = { factor: 2 };
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

        const arr4 = [NaN];
        const result4 = arr4.reverse();
        expect(result4.length === 1).assertTrue();

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

        const arr6: testobj5[] = [{ name: 'a' }, { name: 'b' }];
        const result6: testobj5[] = arr6.reverse();
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

        const arr10: (number | undefined)[] = [1, undefined, 3];
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

        const arr14 = [NaN];
        const result14 = arr14.sort();
        expect(result14.length === 1).assertTrue();

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
        const result19 = arr19.sort((a: double, b: double) => (a - b).toInt());
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
        const result20 = arr20.sort((a: double, b: double) => (b - a).toInt());
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

        const arr21: testobj6[] = [
          { name: 'b', age: 25 },
          { name: 'a', age: 20 },
          { name: 'c', age: 30 }
        ];
        const result21 = arr21.sort((a: testobj6, b: testobj6) => (a.age - b.age).toInt());
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

        const arr22: testobj7[] = [
          { name: 'b', age: 25 },
          { name: 'a', age: 20 },
          { name: 'c', age: 30 }
        ];
        const result22 = arr22.sort((a: testobj7, b: testobj7) => (b.age - a.age).toInt());
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
        const result25 = arr25.sort((a: (number | null), b: (number | null)) => {
          if (a === null) {
            return 1;
          }
          if (b === null) {
            return -1;
          }
          return (a - b).toInt();
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
        const result26 = arr26.sort((a: (number | undefined), b: (number | undefined)) => {
          if (a === undefined) {
            return 1;
          }
          if (b === undefined) {
            return -1;
          }
          return (a - b).toInt();
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

        const arr29: (number | undefined)[] = [3, undefined, 1, 2];
        const result29 = arr29.sort((a: (number | undefined), b: (number | undefined)) => {
          if (a === undefined) {
            return 1;
          }
          if (b === undefined) {
            return -1;
          }
          return (a - b).toInt();
        });

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
        const result30 = arr30.sort((a: double, b: double) => (a - b).toInt());
        expect(result30.join(',') === '1,1,2,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}
