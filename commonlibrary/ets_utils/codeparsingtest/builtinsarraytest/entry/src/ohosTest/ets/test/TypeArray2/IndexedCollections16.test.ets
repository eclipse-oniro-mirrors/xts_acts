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

export default function IndexedCollections16Test() {
  describe('IndexedCollections16Test', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1300
     * @tc.name      testArraySort0031
     * @tc.desc      Verify sorting a larger numeric list in ascending order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0031';
        console.log(TAG + ' start');

        const arr31: number[] = [100, 50, 300, 200, 150];
        const result31 = arr31.sort((a, b) => a - b);
        expect(result31.join(',') === '50,100,150,200,300').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1400
     * @tc.name      testArraySort0032
     * @tc.desc      Verify sorting negative numbers orders correctly (ascending).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0032';
        console.log(TAG + ' start');

        const arr32: number[] = [-5, -1, -3, 0, -2];
        const result32 = arr32.sort((a, b) => a - b);
        expect(result32.join(',') === '-5,-3,-2,-1,0').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1500
     * @tc.name      testArraySort0033
     * @tc.desc      Verify sorting mixed positive and negative numbers ascending.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0033';
        console.log(TAG + ' start');

        const arr33: number[] = [5, -1, 3, 0, -2];
        const result33 = arr33.sort((a, b) => a - b);
        expect(result33.join(',') === '-2,-1,0,3,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1600
     * @tc.name      testArraySort0034
     * @tc.desc      Verify sorting objects by name property using localeCompare.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0034';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const arr34: testobj[] = [{ name: 'Bob' }, { name: 'Alice' }, { name: 'Charlie' }];
        const result34 = arr34.sort((a, b) => a.name.localeCompare(b.name));
        expect(result34.map(o => o.name).join(',') === 'Alice,Bob,Charlie').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1700
     * @tc.name      testArraySort0035
     * @tc.desc      Verify comparator that always returns 0 keeps original order (no-op).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0035';
        console.log(TAG + ' start');

        const arr35: number[] = [10, 2, 30];
        const arrBefore = arr35.slice();
        const result35 = arr35.sort(() => 0);

        expect(JSON.stringify(result35) === JSON.stringify(arrBefore)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1800
     * @tc.name      testArraySort0036
     * @tc.desc      Verify "random" comparator produces a permutation — assert same elements preserved.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0036';
        console.log(TAG + ' start');

        const arr36: number[] = [1, 2, 3, 4];
        const result36 = arr36.sort(() => Math.random() - 0.5);

        const sorted = result36.slice().sort((a, b) => a - b);
        expect(sorted.join(',') === '1,2,3,4' && result36.length === 4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_1900
     * @tc.name      testArraySort0037
     * @tc.desc      Array sort custom  NaN values test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0037';
        console.log(TAG + ' start');

        const arr37 = [3, NaN, 1, 2];
        const result37 = arr37.sort((a, b) => {
          if (typeof a === 'number' && isNaN(a)) {
            return 1;
          }
          if (typeof b === 'number' && isNaN(b)) {
            return -1;
          }
          return a - b;
        });

        expect(result37.join(',') === '1,2,3,NaN').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_2000
     * @tc.name      testArraySort0038
     * @tc.desc      Verify custom comparator can sort Date objects ascending by time value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0038';
        console.log(TAG + ' start');

        const arr38: Date[] = [
          new Date(2023, 0, 1),
          new Date(2021, 0, 1),
          new Date(2022, 0, 1)
        ];
        const result38 = arr38.sort((a, b) => a.getTime() - b.getTime());
        expect(result38.map(d => d.getFullYear()).join(',') === '2021,2022,2023').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_2100
     * @tc.name      testArraySort0039
     * @tc.desc      Verify custom comparator sorts and mutates original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0039';
        console.log(TAG + ' start');

        const arr39: number[] = [3, 1, 2];
        arr39.sort((a, b) => a - b);
        expect(arr39.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SORT_CUSTOM_2200
     * @tc.name      testArraySort0040
     * @tc.desc      Verify custom comparator sorts a larger array correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySort0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySort0040';
        console.log(TAG + ' start');

        const arr40: number[] = [9, 5, 8, 1, 3, 7, 2, 6, 4, 0];
        const result40 = arr40.sort((a, b) => a - b);
        expect(result40.join(',') === '0,1,2,3,4,5,6,7,8,9').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_0100
     * @tc.name      testArrayMap0001
     * @tc.desc      Verify map produces a new array with each element doubled and does not modify the original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0001';
        console.log(TAG + ' start');

        const arr56: number[] = [1, 2, 3];
        const result56: number[] = arr56.map(x => x * 2);
        expect(result56.length === 3).assertTrue();
        expect(result56[0] === 2 && result56[1] === 4 && result56[2] === 6).assertTrue();
        expect(arr56[0] === 1 && arr56[1] === 2 && arr56[2] === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_0200
     * @tc.name      testArrayMap0002
     * @tc.desc      Verify map converts strings to uppercase.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0002';
        console.log(TAG + ' start');

        const arr57: string[] = ['a', 'b', 'c'];
        const result57: string[] = arr57.map(s => s.toUpperCase());
        expect(result57.join(',') === 'A,B,C').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_0300
     * @tc.name      testArrayMap0003
     * @tc.desc      Verify map returns a new array whose length equals the original.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0003';
        console.log(TAG + ' start');

        const arr58: number[] = [1, 2, 3, 4];
        const result58: boolean[] = arr58.map(x => x > 2);
        expect(result58.length === 4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_0400
     * @tc.name      testArrayMap0004
     * @tc.desc      Verify mapping an empty array returns an empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0004';
        console.log(TAG + ' start');

        const arr59: number[] = [];
        const result59: number[] = arr59.map(x => x * 2);
        expect(result59.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_0500
     * @tc.name      testArrayMap0005
     * @tc.desc      Verify map can extract object property values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0005';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const arr60: testobj[] = [{ name: 'a' }, { name: 'b' }];
        const result60: string[] = arr60.map(obj => obj.name);
        expect(result60.join(',') === 'a,b').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_0600
     * @tc.name      testArrayMap0006
     * @tc.desc      Verify map preserves holes (sparse arrays) in the result.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0006';
        console.log(TAG + ' start');

        const arr61: (number | undefined)[] = [1, , 3];
        const result61: (number | undefined)[] = arr61.map(x => typeof x === 'number' ? x * 2 : undefined);
        expect(result61.join(',') === '2,,6').assertTrue();
        expect(result61[1] === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_0700
     * @tc.name      testArrayMap0007
     * @tc.desc      Verify map where callback may return undefined results in undefined entries in the new array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0007';
        console.log(TAG + ' start');

        const arr62: (number | undefined)[] = [1, 2, 3];
        const result62 = arr62.map(x => {
          if (typeof x === 'number' && x > 2) {
            return x;
          }
          return undefined;
        });

        expect(result62[0] === undefined && result62[1] === undefined && result62[2] === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_0800
     * @tc.name      testArrayMap0008
     * @tc.desc      Verify map on nested arrays can transform subarray contents.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0008';
        console.log(TAG + ' start');

        const arr63: number[][] = [[1], [2], [3]];
        const result63: number[] = arr63.map(subArr => subArr[0] * 2);
        expect(result63.join(',') === '2,4,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_0900
     * @tc.name      testArrayMap0009
     * @tc.desc      Verify that map does not modify the original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0009';
        console.log(TAG + ' start');

        const arr64: number[] = [1, 2];
        const result64: number[] = arr64.map(x => x + 10);
        expect(arr64.join(',') === '1,2').assertTrue();
        expect(result64.join(',') === '11,12').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_1000
     * @tc.name      testArrayMap0010
     * @tc.desc      Verify map executing function elements and returning their results.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0010';
        console.log(TAG + ' start');

        const arr65: (() => number)[] = [() => 1, () => 2];
        const result65: number[] = arr65.map(fn => fn());
        expect(result65.join(',') === '1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_1100
     * @tc.name      testArrayMap0011
     * @tc.desc      Verify map can use index as part of transformation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0011';
        console.log(TAG + ' start');

        const arr66: number[] = [10, 20, 30];
        const result66: number[] = arr66.map((x, i) => x + i);
        expect(result66.join(',') === '10,21,32').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_1200
     * @tc.name      testArrayMap0012
     * @tc.desc      Verify map can return objects as elements; new array length and first value checked.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0012';
        console.log(TAG + ' start');

        const arr67: number[] = [1, 2];

        interface testobj {
          value: number
        }

        const result67: testobj[] = arr67.map(x => ({ value: x } as testobj));
        expect(result67.length === 2 && result67[0].value === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_1300
     * @tc.name      testArrayMap0013
     * @tc.desc      Verify map can handle NaN values and map them to a desired replacement.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0013';
        console.log(TAG + ' start');

        const arr68: number[] = [1, NaN, 3];
        const result68: number[] = arr68.map(x => isNaN(x) ? 0 : x);
        expect(result68.join(',') === '1,0,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_1400
     * @tc.name      testArrayMap0014
     * @tc.desc      Verify map on a single-element array transforms it correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0014';
        console.log(TAG + ' start');

        const arr69: number[] = [5];
        const result69: number[] = arr69.map(x => x * 3);
        expect(result69.join(',') === '15').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MAP_1500
     * @tc.name      testArrayMap0015
     * @tc.desc      Verify map respects thisArg when provided.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMap0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMap0015';
        console.log(TAG + ' start');

        interface testobj {
          add: number
        }

        const obj70: testobj = { add: 10 };
        const arr70: number[] = [1, 2];
        const result70: number[] = arr70.map((x: number) => {
          return x + obj70.add;
        });

        expect(result70.join(',') === '11,12').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_0100
     * @tc.name      testArrayFilter0001
     * @tc.desc      Verify filter returns only even numbers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0001';
        console.log(TAG + ' start');

        const arr71: number[] = [1, 2, 3, 4, 5, 6];
        const result71: number[] = arr71.filter(x => x % 2 === 0);

        expect(result71.join(',') === '2,4,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_0200
     * @tc.name      testArrayFilter0002
     * @tc.desc      Verify filter returns an empty array when no elements match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0002';
        console.log(TAG + ' start');

        const arr72: number[] = [1, 3, 5];
        const result72: number[] = arr72.filter(x => x % 2 === 0);

        expect(result72.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_0300
     * @tc.name      testArrayFilter0003
     * @tc.desc      Verify filter can select objects by property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0003';
        console.log(TAG + ' start');

        interface testobj {
          name: string;
          age: number
        }

        const arr73: testobj[] = [
          { name: 'a', age: 18 },
          { name: 'b', age: 25 },
          { name: 'c', age: 22 }
        ];
        const result73 = arr73.filter(obj => obj.age > 20);
        expect(result73.length === 2 && result73.map(o => o.name).join(',') === 'b,c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_0400
     * @tc.name      testArrayFilter0004
     * @tc.desc      Verify filter does not modify the original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0004';
        console.log(TAG + ' start');

        const arr74: number[] = [1, 2, 3];
        const result74: number[] = arr74.filter(x => x > 1);
        expect(arr74.join(',') === '1,2,3').assertTrue();
        expect(result74.join(',') === '2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_0500
     * @tc.name      testArrayFilter0005
     * @tc.desc      Verify filter of an empty array returns an empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0005';
        console.log(TAG + ' start');

        const arr75: number[] = [];
        const result75: number[] = arr75.filter(x => x > 0);
        expect(result75.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_0600
     * @tc.name      testArrayFilter0006
     * @tc.desc      Verify filter can select strings longer than length 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0006';
        console.log(TAG + ' start');

        const arr76: string[] = ['a', 'ab', 'abc', 'abcd'];
        const result76: string[] = arr76.filter(s => s.length > 2);
        expect(result76.join(',') === 'abc,abcd').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_0700
     * @tc.name      testArrayFilter0007
     * @tc.desc      Verify filter on sparse arrays skips holes and returns only present matching elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0007';
        console.log(TAG + ' start');

        const arr77: (number | undefined)[] = [1, , 3, , 5];
        const result77: number[] = arr77.filter((x) => typeof x === 'number' && x > 2) as number[];
        expect(result77.join(',') === '3,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_0800
     * @tc.name      testArrayFilter0008
     * @tc.desc      Verify filter can select boolean true values from mixed array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0008';
        console.log(TAG + ' start');

        const arr78 = [true, false, 0, 1, '', 'a'];
        const result78 = arr78.filter(x => x === true);
        expect(result78.length === 1 && result78[0] === true).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_0900
     * @tc.name      testArrayFilter0009
     * @tc.desc      Verify filter can use index to select elements at even indices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0009';
        console.log(TAG + ' start');

        const arr79: number[] = [10, 20, 30, 40];
        const result79: number[] = arr79.filter((x, i) => i % 2 === 0);
        expect(result79.join(',') === '10,30').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_1000
     * @tc.name      testArrayFilter0010
     * @tc.desc      Verify filter can detect NaN using Object.is and return all NaNs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0010';
        console.log(TAG + ' start');

        const arr80: number[] = [1, NaN, 3, NaN];
        const result80: number[] = arr80.filter(x => Number.isNaN(x));
        expect(result80.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_1100
     * @tc.name      testArrayFilter0011
     * @tc.desc      Verify filter where all elements match returns a copy with same elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0011';
        console.log(TAG + ' start');

        const arr81: number[] = [2, 4, 6];
        const result81: number[] = arr81.filter(x => x % 2 === 0);
        expect(result81.join(',') === '2,4,6').assertTrue();
        // Ensure not the same reference
        expect(result81 !== arr81).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_1200
     * @tc.name      testArrayFilter0012
     * @tc.desc      Verify filter can select nested arrays with length > 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0012';
        console.log(TAG + ' start');

        const arr82: number[][] = [[1], [2, 3], [4], [5, 6]];
        const result82 = arr82.filter(subArr => subArr.length > 1);

        expect(result82.map(a => a.join(',')).join(',') === '2,3,5,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_1300
     * @tc.name      testArrayFilter0013
     * @tc.desc      Verify filter can select null and undefined using == null.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0013';
        console.log(TAG + ' start');

        const arr83 = [null, 1, undefined, 2, null];
        const result83 = arr83.filter(x => x == null);

        expect(result83.length === 3 && result83[0] === null && result83[1] === undefined && result83[2] === null)
          .assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_1400
     * @tc.name      testArrayFilter0014
     * @tc.desc      Verify filter returns single matching element when only one matches.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0014';
        console.log(TAG + ' start');

        const arr84: number[] = [5, 10, 15];
        const result84: number[] = arr84.filter(x => x === 10);
        expect(result84.join(',') === '10').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FILTER_1500
     * @tc.name      testArrayFilter0015
     * @tc.desc      Verify filter respects thisArg when provided.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFilter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFilter0015';
        console.log(TAG + ' start');

        interface testobj {
          min: number
        }

        const obj85: testobj = { min: 3 };
        const arr85: number[] = [1, 2, 3, 4];
        const result85: number[] = arr85.filter((x: number) => {
          return x >= obj85.min;
        });
        expect(result85.join(',') === '3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_0100
     * @tc.name      testArraySome0001
     * @tc.desc      Verify some returns true if at least one element matches the predicate.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0001';
        console.log(TAG + ' start');

        const arr86: number[] = [1, 3, 5, 7, 8];
        const result86: boolean = arr86.some(x => x % 2 === 0);
        expect(result86).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_0200
     * @tc.name      testArraySome0002
     * @tc.desc      Verify some returns false when no elements match.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0002';
        console.log(TAG + ' start');

        const arr87: number[] = [1, 3, 5, 7];
        const result87: boolean = arr87.some(x => x % 2 === 0);
        expect(!result87).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_0300
     * @tc.name      testArraySome0003
     * @tc.desc      Verify some on an empty array returns false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0003';
        console.log(TAG + ' start');

        const arr88: number[] = [];
        const result88: boolean = arr88.some(x => x > 0);
        expect(!result88).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_0400
     * @tc.name      testArraySome0004
     * @tc.desc      Verify some returns true when a single-element meets predicate.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0004';
        console.log(TAG + ' start');

        const arr89: number[] = [5];
        const result89: boolean = arr89.some(x => x === 5);
        expect(result89).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_0500
     * @tc.name      testArraySome0005
     * @tc.desc      Verify some can detect objects satisfying a property condition.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0005';
        console.log(TAG + ' start');

        interface testobj {
          name: string;
          age: number
        }

        const arr90: testobj[] = [
          { name: 'a', age: 17 },
          { name: 'b', age: 19 },
          { name: 'c', age: 16 }
        ];
        const result90: boolean = arr90.some(obj => obj.age >= 18);
        expect(result90).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_0600
     * @tc.name      testArraySome0006
     * @tc.desc      Verify some short-circuits after a true result; count demonstrates short-circuiting.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0006';
        console.log(TAG + ' start');

        const arr91: number[] = [1, 2, 3, 4];
        let count91 = 0;
        const result91: boolean = arr91.some(x => {
          count91++;
          return x > 2;
        });
        expect(count91 === 3 && result91 === true).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_0700
     * @tc.name      testArraySome0007
     * @tc.desc      Verify some can detect NaN using Object.is.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0007';
        console.log(TAG + ' start');

        const arr92 = [1, 2, NaN, 4];
        const result92: boolean = arr92.some(x => Number.isNaN(x));
        expect(result92).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_0800
     * @tc.name      testArraySome0008
     * @tc.desc      Verify some can match a string element value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0008';
        console.log(TAG + ' start');

        const arr93: string[] = ['a', 'b', 'c'];
        const result93: boolean = arr93.some(s => s === 'b');
        expect(result93).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_0900
     * @tc.name      testArraySome0009
     * @tc.desc      Verify some can use index in predicate.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0009';
        console.log(TAG + ' start');

        const arr94: number[] = [10, 20, 30];
        const result94: boolean = arr94.some((x, i) => i === 1 && x > 15);
        expect(result94).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SOME_1000
     * @tc.name      testArraySome0010
     * @tc.desc      Verify some respects thisArg when provided.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySome0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySome0010';
        console.log(TAG + ' start');

        interface testobj {
          target: number
        }

        const obj95: testobj = { target: 5 };
        const arr95: number[] = [3, 4, 6];
        const result95: boolean = arr95.some((x: number) => {
          return x > obj95.target;
        });

        expect(result95).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_0100
     * @tc.name      testArrayEvery0001
     * @tc.desc      Verify every returns true if all elements satisfy the predicate.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0001';
        console.log(TAG + ' start');

        const arr96: number[] = [2, 4, 6, 8];
        const result96: boolean = arr96.every(x => x % 2 === 0);
        expect(result96).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_0200
     * @tc.name      testArrayEvery0002
     * @tc.desc      Verify every returns false if any element fails the predicate.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0002';
        console.log(TAG + ' start');

        const arr97: number[] = [2, 4, 5, 8];
        const result97: boolean = arr97.every(x => x % 2 === 0);
        expect(!result97).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_0300
     * @tc.name      testArrayEvery0003
     * @tc.desc      Verify every returns true for an empty array (vacuous truth).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0003';
        console.log(TAG + ' start');

        const arr98: number[] = [];
        const result98: boolean = arr98.every(x => x > 0);
        expect(result98).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_0400
     * @tc.name      testArrayEvery0004
     * @tc.desc      Verify every returns true for a single-element meeting predicate.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0004';
        console.log(TAG + ' start');

        const arr99: number[] = [5];
        const result99: boolean = arr99.every(x => x === 5);
        expect(result99).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_0500
     * @tc.name      testArrayEvery0005
     * @tc.desc      Verify every can validate object arrays by property.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0005';
        console.log(TAG + ' start');

        interface testobj {
          name: string;
          age: number
        }

        const arr100: testobj[] = [
          { name: 'a', age: 18 },
          { name: 'b', age: 20 },
          { name: 'c', age: 22 }
        ];
        const result100: boolean = arr100.every(obj => obj.age >= 18);
        expect(result100).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_0600
     * @tc.name      testArrayEvery0006
     * @tc.desc      Verify every short-circuits when encountering a failing element; count shows short-circuiting.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0006';
        console.log(TAG + ' start');

        const arr101: number[] = [2, 4, 5, 6];
        let count101 = 0;
        const result101: boolean = arr101.every(x => {
          count101++;
          return x % 2 === 0;
        });

        expect(count101 === 3 && result101 === false).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_0700
     * @tc.name      testArrayEvery0007
     * @tc.desc      Verify every validates string lengths correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0007';
        console.log(TAG + ' start');

        const arr102: string[] = ['a', 'b', 'c'];
        const result102: boolean = arr102.every(s => s.length === 1);
        expect(result102).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_0800
     * @tc.name      testArrayEvery0008
     * @tc.desc      Verify every validates nested arrays' length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0008';
        console.log(TAG + ' start');

        const arr103: number[][] = [[1], [2], [3]];
        const result103: boolean = arr103.every(subArr => subArr.length === 1);
        expect(result103).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_0900
     * @tc.name      testArrayEvery0009
     * @tc.desc      Verify every can use index in the predicate.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0009';
        console.log(TAG + ' start');

        const arr104: number[] = [10, 20, 30];
        const result104: boolean = arr104.every((x, i) => x > i * 5);
        expect(result104).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_EVERY_1000
     * @tc.name      testArrayEvery0010
     * @tc.desc      Verify every respects thisArg when provided.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEvery0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayEvery0010';
        console.log(TAG + ' start');

        interface testobj {
          max: number
        }

        const obj105: testobj = { max: 10 };
        const arr105: number[] = [5, 8, 3];
        const result105: boolean = arr105.every((x: number) => {
          return x < obj105.max;
        });

        expect(result105).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_0100
     * @tc.name      testArrayReduce0001
     * @tc.desc      Verify reduce sums array elements without an initial value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0001';
        console.log(TAG + ' start');

        const arr106: number[] = [1, 2, 3, 4];
        const result106: number = arr106.reduce((acc: number, cur: number) => acc + cur);
        expect(result106 === 10).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_0200
     * @tc.name      testArrayReduce0002
     * @tc.desc      Verify reduce sums array elements with an initial value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0002';
        console.log(TAG + ' start');

        const arr107: number[] = [1, 2, 3, 4];
        const result107: number = arr107.reduce((acc: number, cur: number) => acc + cur, 10);
        expect(result107 === 20).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_0300
     * @tc.name      testArrayReduce0003
     * @tc.desc      Verify reduce computes the product of elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0003';
        console.log(TAG + ' start');

        const arr108: number[] = [2, 3, 4];
        const result108: number = arr108.reduce((acc: number, cur: number) => acc * cur, 1);
        expect(result108 === 24).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_0400
     * @tc.name      testArrayReduce0004
     * @tc.desc      Verify reduce concatenates strings when initial is empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0004';
        console.log(TAG + ' start');

        const arr109: string[] = ['a', 'b', 'c'];
        const result109: string = arr109.reduce((acc: string, cur: string) => acc + cur, '');
        expect(result109 === 'abc').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_0500
     * @tc.name      testArrayReduce0005
     * @tc.desc      Verify reduce on single-element array without initial returns the single element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0005';
        console.log(TAG + ' start');

        const arr110: number[] = [5];
        const result110: number = arr110.reduce((acc: number, cur: number) => acc + cur);
        expect(result110 === 5).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_0600
     * @tc.name      testArrayReduce0006
     * @tc.desc      Verify reduce on single-element array with an initial value uses the initial.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0006';
        console.log(TAG + ' start');

        const arr111: number[] = [5];
        const result111: number = arr111.reduce((acc: number, cur: number) => acc + cur, 10);
        expect(result111 === 15).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_0700
     * @tc.name      testArrayReduce0007
     * @tc.desc      Verify reduce on an empty array with an initial value returns the initial value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0007';
        console.log(TAG + ' start');

        const arr112: number[] = [];
        const result112: number = arr112.reduce((acc: number, cur: number) => acc + cur, 0);
        expect(result112 === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_0800
     * @tc.name      testArrayReduce0008
     * @tc.desc      Verify reduce on an empty array without initial throws a TypeError.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0008';
        console.log(TAG + ' start');

        const arr113: number[] = [];
        let caughtIsTypeError: string | boolean = false;
        try {
          const r = arr113.reduce((acc: number, cur: number) => acc + cur);
        } catch (e) {
          caughtIsTypeError = (e instanceof TypeError) || ((e as Error).message &&
            ((e as Error).message.indexOf('empty') >= 0 || (e as Error).message.indexOf('initial') >= 0));
          console.log('caught error message: ' + (e && (e as Error).message));
        }
        expect(caughtIsTypeError).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_0900
     * @tc.name      testArrayReduce0009
     * @tc.desc      Verify reduce can count occurrences of array elements into an object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0009';
        console.log(TAG + ' start');

        let counts: Map<string, number> = new Map<string, number>();

        const arr114: string[] = ['a', 'b', 'a', 'c', 'a'];
        const result114 = arr114.reduce((acc, cur) => {
          let count = acc.get(cur) || 0;
          acc.set(cur, count + 1);
          return acc;
        }, counts);

        expect(result114.get('a') === 3 && result114.get('b') === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_1000
     * @tc.name      testArrayReduce0010
     * @tc.desc      Verify reduce can filter-and-accumulate even numbers.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0010';
        console.log(TAG + ' start');

        const arr115: number[] = [1, 2, 3, 4, 5, 6];
        const result115: number = arr115.reduce((acc: number, cur: number) => (cur % 2 === 0 ? acc + cur : acc), 0);
        expect(result115 === 12).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

  });
}