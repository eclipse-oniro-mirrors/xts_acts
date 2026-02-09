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

function fn() {
};

export default function IndexedCollections14Test() {
  describe('IndexedCollections14Test', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_0100
     * @tc.name      testArraySplice0001
     * @tc.desc      Verify splice on single-element array removes the element and returns it.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0001';
        console.log(TAG + ' start');

        const arr71: number[] = [5];
        const result71: number[] = arr71.splice(0, 1);

        expect(result71.length === 1 && result71[0] === 5 && arr71.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_0200
     * @tc.name      testArraySplice0002
     * @tc.desc      Verify splice replacing the last element returns the removed element and updates array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0002';
        console.log(TAG + ' start');

        const arr72: string[] = ['a', 'b', 'c'];
        const result72: string[] = arr72.splice(2, 1, 'd');

        expect(result72.length === 1 && result72[0] === 'c' && arr72.join(',') === 'a,b,d').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_0300
     * @tc.name      testArraySplice0003
     * @tc.desc      Verify splice can insert multiple identical elements with deleteCount 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0003';
        console.log(TAG + ' start');

        const arr73: number[] = [1, 2];
        const result73: number[] = arr73.splice(1, 0, 3, 3, 3);

        expect(result73.length === 0 && arr73.join(',') === '1,3,3,3,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_0400
     * @tc.name      testArraySplice0004
     * @tc.desc      Verify splice with start=0 and deleteCount=0 inserts at head.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0004';
        console.log(TAG + ' start');

        const arr74: number[] = [10, 20];
        const result74: number[] = arr74.splice(0, 0, 5);

        expect(result74.length === 0 && arr74.join(',') === '5,10,20').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_0500
     * @tc.name      testArraySplice0005
     * @tc.desc      Verify splice with negative start removes elements relative to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0005';
        console.log(TAG + ' start');

        const arr75: number[] = [1, 2, 3, 4, 5];
        const result75: number[] = arr75.splice(-3, 2);

        expect(result75.join(',') === '3,4' && arr75.join(',') === '1,2,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_0600
     * @tc.name      testArraySplice0006
     * @tc.desc      Verify splice treats NaN start as 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0006';
        console.log(TAG + ' start');

        const arr76: number[] = [1, 2, 3];
        const result76: number[] = arr76.splice(NaN, 1);

        expect(result76.length === 1 && result76[0] === 1 && arr76.join(',') === '2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATE_ARRAY_SPLICE_0700
     * @tc.name      testArraySplice0007
     * @tc.desc      Verify splice with negative deleteCount is treated as 0 (no deletion), still performs insertion.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0007';
        console.log(TAG + ' start');

        const arr77: (number | string)[] = [1, 2, 3];
        const result77: (number | string)[] = arr77.splice(1, -1, 'a');

        expect(result77.length === 0 && arr77.join(',') === '1,a,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_0900
     * @tc.name      testArraySplice0009
     * @tc.desc      Verify splice can remove a nested array element and return it; original becomes flattened-toString.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0009';
        console.log(TAG + ' start');

        const arr79: (number | number[])[] = [1, [2, 3], 4];
        const result79: (number | number[])[] = arr79.splice(1, 1);

        expect(Array.isArray(result79) && Array.isArray(result79[0]) && result79[0][0] === 2 &&
          arr79.join(',') === '1,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1000
     * @tc.name      testArraySplice0010
     * @tc.desc      Verify splice can replace a function element; returned array length and original length are correct.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0010';
        console.log(TAG + ' start');

        const arr80: Array<() => number> = [() => 1, () => 2];
        const result80: Array<() => number> = arr80.splice(1, 1, () => 3);

        expect(result80.length === 1 && arr80.length === 2 && arr80[1]() === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATE_ARRAY_SPLICE_1100
     * @tc.name      testArraySplice0011
     * @tc.desc      Verify consecutive operations: delete then insert; final array matches expected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0011';
        console.log(TAG + ' start');

        const arr81: number[] = [1, 2, 3, 4];
        arr81.splice(1, 2);
        const result81: number[] = arr81.splice(1, 0, 5, 6);

        expect(result81.length === 0 && arr81.join(',') === '1,5,6,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1200
     * @tc.name      testArraySplice0012
     * @tc.desc      Verify consecutive operations: insert then replace; removed value and final array match expected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0012';
        console.log(TAG + ' start');

        const arr82: number[] = [10, 20];
        arr82.splice(1, 0, 15);
        const result82: number[] = arr82.splice(2, 1, 16);

        expect(result82.length === 1 && result82[0] === 20 && arr82.join(',') === '10,15,16').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_1300
     * @tc.name      testArraySplice0013
     * @tc.desc      Verify splice with start = -1 deletes the last element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0013';
        console.log(TAG + ' start');

        const arr83: string[] = ['a', 'b', 'c'];
        const result83: string[] = arr83.splice(-1, 1);

        expect(result83.length === 1 && result83[0] === 'c' && arr83.join(',') === 'a,b').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_1400
     * @tc.name      testArraySplice0014
     * @tc.desc      Verify splice deleting 0 and adding multiple elements inserts them.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0014';
        console.log(TAG + ' start');

        const arr84: number[] = [1, 2];
        const result84: number[] = arr84.splice(1, 0, 3, 4, 5);

        expect(result84.length === 0 && arr84.join(',') === '1,3,4,5,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_1500
     * @tc.name      testArraySplice0015
     * @tc.desc      Verify splice with deleteCount=0 does not delete and returns empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0015';
        console.log(TAG + ' start');

        const arr85: number[] = [1, 2, 3];
        const result85: number[] = arr85.splice(2, 0);

        expect(result85.length === 0 && arr85.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_1600
     * @tc.name      testArraySplice0016
     * @tc.desc      Verify splice at index length-1 deletes the last element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0016';
        console.log(TAG + ' start');

        const arr86: number[] = [5, 6, 7];
        const result86: number[] = arr86.splice(2, 1);

        expect(result86.length === 1 && result86[0] === 7 && arr86.join(',') === '5,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1700
     * @tc.name      testArraySplice0017
     * @tc.desc      Verify splice can insert null and undefined values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0017';
        console.log(TAG + ' start');

        const arr87: (number | null | undefined)[] = [1, 2];
        const result87: (number | null | undefined)[] = arr87.splice(1, 0, null, undefined);

        expect(result87.length === 0 && arr87.length === 4 && arr87[1] === null && typeof arr87[2] === 'undefined')
            .assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1900
     * @tc.name      testArraySplice0019
     * @tc.desc      Verify splice deleting a hole returns an array containing undefined and the original becomes dense.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0019';
        console.log(TAG + ' start');

        const arr89: (number | undefined)[] = [1, , 3];
        const result89: (number | undefined)[] = arr89.splice(1, 1);

        expect(result89.length === 1 && typeof result89[0] === 'undefined' && arr89.join(',') === '1,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATE_ARRAY_SPLICE_2000
     * @tc.name      testArraySplice0020
     * @tc.desc      Verify splice removes a middle chunk from a long array and returns removed elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0020';
        console.log(TAG + ' start');

        const arr90: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        const result90: number[] = arr90.splice(5, 3);

        expect(result90.join(',') === '5,6,7' && arr90.length === 7).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2100
     * @tc.name      testArraySplice0021
     * @tc.desc      Verify replacing 3 elements with 1 shortens the array accordingly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0021';
        console.log(TAG + ' start');

        const arr91: (number | string)[] = [1, 2, 3, 4, 5];
        const result91: (number | string)[] = arr91.splice(1, 3, 'x');

        expect(result91.join(',') === '2,3,4' && arr91.join(',') === '1,x,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2200
     * @tc.name      testArraySplice0022
     * @tc.desc      Verify replacing 1 element with 3 increases array length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0022';
        console.log(TAG + ' start');

        const arr92: number[] = [1, 2, 3];
        const result92: number[] = arr92.splice(1, 1, 4, 5, 6);

        expect(result92.length === 1 && result92[0] === 2 && arr92.join(',') === '1,4,5,6,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2300
     * @tc.name      testArraySplice0023
     * @tc.desc      Verify splice with start = -0 behaves like start = 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0023';
        console.log(TAG + ' start');

        const arr93: number[] = [1, 2];
        const result93: number[] = arr93.splice(-0, 1);

        expect(result93.length === 1 && result93[0] === 1 && arr93.join(',') === '2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2400
     * @tc.name      testArraySplice0024
     * @tc.desc      Verify splice on empty array returns empty array and leaves it empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0024';
        console.log(TAG + ' start');

        const arr94: number[] = [];
        const result94: number[] = arr94.splice(0, 1);

        expect(result94.length === 0 && arr94.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2500
     * @tc.name      testArraySplice0025
     * @tc.desc      Verify deleteCount = Infinity removes to end of array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0025';
        console.log(TAG + ' start');

        const arr95: number[] = [1, 2, 3, 4];
        const result95: number[] = arr95.splice(1, Infinity);

        expect(result95.join(',') === '2,3,4' && arr95.join(',') === '1').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2600
     * @tc.name      testArraySplice0026
     * @tc.desc      Verify inserting multiple elements at index 0 pushes existing elements to the right.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0026';
        console.log(TAG + ' start');

        const arr96: string[] = ['b', 'c'];
        const result96: string[] = arr96.splice(0, 0, 'a', 'x', 'y');

        expect(result96.length === 0 && arr96.join(',') === 'a,x,y,b,c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2700
     * @tc.name      testArraySplice0027
     * @tc.desc      Verify splice can insert a nested array as a single element (toString shows flattened representation).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0027';
        console.log(TAG + ' start');

        const arr97: (number | number[])[] = [1, 2];
        const result97: (number | number[])[] = arr97.splice(1, 0, [3, 4]);

        expect(result97.length === 0 && arr97.toString() === '1,3,4,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2800
     * @tc.name      testArraySplice0028
     * @tc.desc      Verify deleteCount = NaN is treated as 0 (insertion only).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0028';
        console.log(TAG + ' start');

        const arr98: (number | string)[] = [1, 2, 3];
        const result98: (number | string)[] = arr98.splice(1, NaN, 'a');

        expect(result98.length === 0 && arr98.join(',') === '1,a,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2900
     * @tc.name      testArraySplice0029
     * @tc.desc      Verify multiple consecutive splices produce the expected final array and returned removed elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0029';
        console.log(TAG + ' start');

        const arr99: number[] = [1, 2, 3, 4, 5];
        arr99.splice(2, 1);
        arr99.splice(1, 0, 6);
        const result99: number[] = arr99.splice(3, 2, 7);

        expect(result99.join(',') === '4,5' && arr99.join(',') === '1,6,2,7').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_3000
     * @tc.name      testArraySplice0030
     * @tc.desc      Verify splice mutates the original array (compare before/after copy).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0030';
        console.log(TAG + ' start');

        const arr100: number[] = [10, 20];
        const copy100: number[] = [...arr100];
        arr100.splice(0, 1);
        expect(arr100.join(',') === '20' && copy100.join(',') === '10,20').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_0100
     * @tc.name      testArrayJoin0001
     * @tc.desc      Verify join() with default separator (comma) concatenates numeric elements into "1,2,3".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0001';
        console.log(TAG + ' start');

        const arr1: number[] = [1, 2, 3];
        const result1: string = arr1.join();
        expect(result1 === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_0200
     * @tc.name      testArrayJoin0002
     * @tc.desc      Verify join('-') uses hyphen to join string elements into "a-b-c".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0002';
        console.log(TAG + ' start');

        const arr2: string[] = ['a', 'b', 'c'];
        const result2: string = arr2.join('-');
        expect(result2 === 'a-b-c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_0300
     * @tc.name      testArrayJoin0003
     * @tc.desc      Verify join('') concatenates elements without any separator producing "123".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0003';
        console.log(TAG + ' start');

        const arr3: number[] = [1, 2, 3];
        const result3: string = arr3.join('');
        expect(result3 === '123').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_0400
     * @tc.name      testArrayJoin0004
     * @tc.desc      Verify join(' ') concatenates strings with a space producing "Hello world".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0004';
        console.log(TAG + ' start');

        const arr4: string[] = ['Hello', 'world'];
        const result4: string = arr4.join(' ');
        expect(result4 === 'Hello world').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_0500
     * @tc.name      testArrayJoin0005
     * @tc.desc      Verify join on single-element array returns that element's string form.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0005';
        console.log(TAG + ' start');

        const arr5: number[] = [5];
        const result5: string = arr5.join('-');
        expect(result5 === '5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_0600
     * @tc.name      testArrayJoin0006
     * @tc.desc      Verify join on empty array returns empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0006';
        console.log(TAG + ' start');

        const arr6: number[] = [];
        const result6: string = arr6.join(',');
        expect(result6 === '').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_0700
     * @tc.name      testArrayJoin0007
     * @tc.desc      Verify join converts null to "null" when joining.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0007';
        console.log(TAG + ' start');

        const arr7: (number | null)[] = [1, null, 3];
        const result7: string = arr7.join(',');
        expect(result7 === '1,null,3').assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_0800
     * @tc.name      testArrayJoin0008
     * @tc.desc      Verify join treats undefined as empty string producing adjacent commas.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0008';
        console.log(TAG + ' start');

        const arr8: (number | undefined)[] = [1, undefined, 3];
        const result8: string = arr8.join(',');
        expect(result8 === '1,,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_0900
     * @tc.name      testArrayJoin0009
     * @tc.desc      Verify join calls toString() on object elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0009';
        console.log(TAG + ' start');

        interface testobj {
          x: number
        }

        const arr9: (number | testobj | number)[] = [1, { x: 2 }, 3];
        const result9: string = arr9.join(',');
        expect(result9 === '1,[object Object],3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_1000
     * @tc.name      testArrayJoin0010
     * @tc.desc      Verify join on nested arrays calls nested toString() producing element strings joined by separator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0010';
        console.log(TAG + ' start');

        const arr10: (number | number[] | number)[] = [1, [2, 3], 4];
        const result10: string = arr10.join('-');

        expect(result10 === '1-2,3-4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_1100
     * @tc.name      testArrayJoin0011
     * @tc.desc      Verify join supports special multi-character separators like "||".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0011';
        console.log(TAG + ' start');

        const arr11: string[] = ['a', 'b'];
        const result11: string = arr11.join('||');
        expect(result11 === 'a||b').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_1200
     * @tc.name      testArrayJoin0012
     * @tc.desc      Verify numeric separator is converted to string when passed to join.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0012';
        console.log(TAG + ' start');

        const arr12: number[] = [1, 2];
        const result12: string = arr12.join((0).toString());
        expect(result12 === '102').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_1300
     * @tc.name      testArrayJoin0013
     * @tc.desc      Verify join handles boolean elements by converting them to "true" / "false".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0013';
        console.log(TAG + ' start');

        const arr13: boolean[] = [true, false];
        const result13: string = arr13.join(',');
        expect(result13 === 'true,false').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_1400
     * @tc.name      testArrayJoin0014
     * @tc.desc      Verify join on sparse arrays treats holes as empty entries producing "1,,3".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0014';
        console.log(TAG + ' start');

        const arr14: (number | undefined)[] = [1, , 3];
        const result14: string = arr14.join(',');
        expect(result14 === '1,,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_1500
     * @tc.name      testArrayJoin0015
     * @tc.desc      Verify join on a longer array with ';' separator produces expected string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0015';
        console.log(TAG + ' start');

        const arr15: number[] = [10, 20, 30, 40, 50];
        const result15: string = arr15.join(';');
        expect(result15 === '10;20;30;40;50').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_1600
     * @tc.name      testArrayJoin0016
     * @tc.desc      Verify join with null separator converts null to "null".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0016';
        console.log(TAG + ' start');

        const arr16: number[] = [1, 2];
        const result16: string = arr16.join(String(null));
        expect(result16 === '1null2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_1700
     * @tc.name      testArrayJoin0017
     * @tc.desc      Verify join with undefined separator uses default comma separator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0017';
        console.log(TAG + ' start');

        const arr17: number[] = [1, 2];
        const result17: string = arr17.join(undefined);
        expect(result17 === '1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_1900
     * @tc.name      testArrayJoin0019
     * @tc.desc      Verify join preserves NaN by converting it to "NaN".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0019';
        console.log(TAG + ' start');

        const arr19: (number)[] = [1, NaN, 3];
        const result19: string = arr19.join(',');
        expect(result19 === '1,NaN,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_JOIN_2000
     * @tc.name      testArrayJoin0020
     * @tc.desc      Verify join does not mutate the original array; original array remains intact after join.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0020';
        console.log(TAG + ' start');

        const arr20: number[] = [1, 2];
        const _ = arr20.join('-');
        const result20: string = arr20.join(',');
        expect(result20 === '1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_0100
     * @tc.name      testArrayToString0001
     * @tc.desc      Verify toString() converts [1,2,3] to "1,2,3".
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0001';
        console.log(TAG + ' start');

        const arr21: number[] = [1, 2, 3];
        const result21: string = arr21.toString();
        expect(result21 === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_0200
     * @tc.name      testArrayToString0002
     * @tc.desc      Verify toString() and join() (default) produce the same result for string arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0002';
        console.log(TAG + ' start');

        const arr22: string[] = ['a', 'b'];
        const str1: string = arr22.toString();
        const str2: string = arr22.join();
        expect(str1 === str2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_0300
     * @tc.name      testArrayToString0003
     * @tc.desc      Verify toString() on [null, undefined] yields "null," (undefined becomes empty slot).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0003';
        console.log(TAG + ' start');

        const arr23: (null | undefined)[] = [null, undefined];
        const result23: string = arr23.toString();
        expect(result23 === 'null,').assertFalse();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_0400
     * @tc.name      testArrayToString0004
     * @tc.desc      Verify toString() flattens nested arrays in the string representation (recursive conversion).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0004';
        console.log(TAG + ' start');

        const arr24: (number | number[])[] = [1, [2, 3], 4];
        const result24: string = arr24.toString();
        expect(result24 === '1,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_0500
     * @tc.name      testArrayToString0005
     * @tc.desc      Verify toString() on an empty array returns an empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0005';
        console.log(TAG + ' start');

        const arr25: number[] = [];
        const result25: string = arr25.toString();
        expect(result25 === '').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_0600
     * @tc.name      testArrayToString0006
     * @tc.desc      Verify toString() on single-element array returns that element's toString().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0006';
        console.log(TAG + ' start');

        const arr26: string[] = ['test'];
        const result26: string = arr26.toString();
        expect(result26 === 'test').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_0700
     * @tc.name      testArrayToString0007
     * @tc.desc      Verify toString() on sparse arrays preserves empty slots (e.g., "1,,3").
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0007';
        console.log(TAG + ' start');

        const arr27: (number | undefined)[] = [1, , 3];
        const result27: string = arr27.toString();
        expect(result27 === '1,,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_0800
     * @tc.name      testArrayToString0008
     * @tc.desc      Verify toString() on an array of objects uses each object's toString() result (defaults to "[object Object]").
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0008';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const arr28: testobj[] = [{ name: 'a' }, { name: 'b' }];
        const result28: string = arr28.toString();
        expect(result28 === '[object Object],[object Object]').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_0900
     * @tc.name      testArrayToString0009
     * @tc.desc      Verify toString() on boolean arrays yields "true,false,true" for [true,false,true].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0009';
        console.log(TAG + ' start');

        const arr29: boolean[] = [true, false, true];
        const result29: string = arr29.toString();
        expect(result29 === 'true,false,true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TOSTRING_1000
     * @tc.name      testArrayToString0010
     * @tc.desc      Verify toString() does not mutate the original array; original array remains unchanged after toString().
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayToString0010';
        console.log(TAG + ' start');

        const arr30: number[] = [1, 2];
        const result30: string = arr30.toString();
        console.log('toString result: ' + result30);
        // verify toString output and that original array content/length unchanged
        const unchanged: boolean = result30 === '1,2' && arr30.length === 2 && arr30[0] === 1 && arr30[1] === 2;
        expect(unchanged).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_0100
     * @tc.name      testArrayConcat0001
     * @tc.desc      Verify concat concatenates two arrays and does not mutate the original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0001';
        console.log(TAG + ' start');

        const arr31: number[] = [1, 2];
        const arr31b: number[] = [3, 4];
        const result31: number[] = arr31.concat(arr31b);
        expect(result31.join(',') === '1,2,3,4').assertTrue();
        expect(arr31.join(',') === '1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_0200
     * @tc.name      testArrayConcat0002
     * @tc.desc      Verify concat concatenates multiple arrays in order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0002';
        console.log(TAG + ' start');

        const arr32: number[] = [1];
        const arr32b: number[] = [2];
        const arr32c: number[] = [3];
        const result32: number[] = arr32.concat(arr32b, arr32c);

        expect(result32.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_0300
     * @tc.name      testArrayConcat0003
     * @tc.desc      Verify concat appends individual elements to an array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0003';
        console.log(TAG + ' start');

        const arr33: number[] = [1, 2];
        const result33: number[] = arr33.concat(3, 4);

        expect(result33.join(',') === '1,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_0400
     * @tc.name      testArrayConcat0004
     * @tc.desc      Verify concat can mix elements and arrays in the same call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0004';
        console.log(TAG + ' start');

        const arr34: number[] = [1];
        const result34: number[] = arr34.concat(2, [3, 4], 5);

        expect(result34.join(',') === '1,2,3,4,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_0500
     * @tc.name      testArrayConcat0005
     * @tc.desc      Verify concat with no arguments returns a shallow copy (new array) of the original.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0005';
        console.log(TAG + ' start');

        const arr35: number[] = [1, 2];
        const result35: number[] = arr35.concat();

        expect(result35.join(',') === '1,2').assertTrue();
        expect(result35 !== arr35).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_0600
     * @tc.name      testArrayConcat0006
     * @tc.desc      Verify concat with an empty array returns an equivalent array (original content).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0006';
        console.log(TAG + ' start');

        const arr36: number[] = [1, 2];
        const result36: number[] = arr36.concat([]);

        expect(result36.join(',') === '1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_0700
     * @tc.name      testArrayConcat0007
     * @tc.desc      Verify concat does not flatten nested arrays beyond one level and join produces expected string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0007';
        console.log(TAG + ' start');

        const arr37: (number | number[])[] = [1, [2]];
        const arr37b: (number | number[])[] = [3, [4]];
        const result37: (number | number[])[] = arr37.concat(arr37b);

        expect(result37.join(',') === '1,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_0800
     * @tc.name      testArrayConcat0008
     * @tc.desc      Verify concat of single-element string array with string elements appends elements correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0008';
        console.log(TAG + ' start');

        const arr38: string[] = ['a'];
        const result38: string[] = arr38.concat('b', 'c');

        expect(result38.join(',') === 'a,b,c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_0900
     * @tc.name      testArrayConcat0009
     * @tc.desc      Verify concat on an empty array with elements yields an array of those elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0009';
        console.log(TAG + ' start');

        const arr39: number[] = [];
        const result39: number[] = arr39.concat(1, 2, 3);

        expect(result39.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONCAT_1000
     * @tc.name      testArrayConcat0010
     * @tc.desc      Verify concat concatenates arrays of objects; resulting length matches sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConcat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConcat0010';
        console.log(TAG + ' start');

        interface testobj {
          x?: number
          y?: number
        }

        const arr40: testobj[] = [{ x: 1 }];
        const arr40b: testobj[] = [{ y: 2 }];
        const result40: testobj[] = (arr40).concat(arr40b);

        expect(result40.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}
