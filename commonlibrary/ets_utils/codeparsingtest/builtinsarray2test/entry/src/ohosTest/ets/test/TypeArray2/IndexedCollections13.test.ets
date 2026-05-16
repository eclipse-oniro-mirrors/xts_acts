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

export default function IndexedCollections13Test() {
  describe('IndexedCollections13Test', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_0100
     * @tc.name      testArraySlice0001
     * @tc.desc      Verify slice(1,3) extracts middle elements and original array remains unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0001';
        console.log(TAG + ' start');

        const arr1: number[] = [1, 2, 3, 4, 5];
        const result1: number[] = arr1.slice(1, 3);
        expect(result1.join(',') === '2,3').assertTrue();
        expect(arr1.join(',') === '1,2,3,4,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_0200
     * @tc.name      testArraySlice0002
     * @tc.desc      Verify slice(2,2) when start === end returns an empty array and original unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0002';
        console.log(TAG + ' start');

        const arr2: number[] = [10, 20, 30];
        const result2: number[] = arr2.slice(2, 2);
        expect(result2.length === 0).assertTrue();
        expect(arr2.join(',') === '10,20,30').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_0300
     * @tc.name      testArraySlice0003
     * @tc.desc      Verify slice(1) with omitted end slices to the end of array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0003';
        console.log(TAG + ' start');

        const arr3: string[] = ['a', 'b', 'c', 'd'];
        const result3: string[] = arr3.slice(1);
        expect(result3.join(',') === 'b,c,d').assertTrue();
        expect(arr3.join(',') === 'a,b,c,d').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_0400
     * @tc.name      testArraySlice0004
     * @tc.desc      Verify slice(0,2) extracts from beginning up to end index (non-inclusive).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0004';
        console.log(TAG + ' start');

        const arr4: boolean[] = [true, false, true];
        const result4: boolean[] = arr4.slice(0, 2);
        expect(result4.join(',') === 'true,false').assertTrue();
        expect(arr4.join(',') === 'true,false,true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_0500
     * @tc.name      testArraySlice0005
     * @tc.desc      Verify slice(0, length) returns a shallow copy of the whole array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0005';
        console.log(TAG + ' start');

        const arr5: number[] = [1, 2, 3];
        const result5: number[] = arr5.slice(0, arr5.length);
        expect(result5.join(',') === '1,2,3').assertTrue();
        expect(arr5.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_0600
     * @tc.name      testArraySlice0006
     * @tc.desc      Verify slice(-2) with negative start counts from the end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0006';
        console.log(TAG + ' start');

        const arr6: number[] = [10, 20, 30, 40];
        const result6: number[] = arr6.slice(-2);
        expect(result6.join(',') === '30,40').assertTrue();
        expect(arr6.join(',') === '10,20,30,40').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_0700
     * @tc.name      testArraySlice0007
     * @tc.desc      Verify slice(1,-1) where end is negative excludes the last element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0007';
        console.log(TAG + ' start');

        const arr7: string[] = ['x', 'y', 'z', 'w'];
        const result7: string[] = arr7.slice(1, -1);
        expect(result7.join(',') === 'y,z').assertTrue();
        expect(arr7.join(',') === 'x,y,z,w').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_0800
     * @tc.name      testArraySlice0008
     * @tc.desc      Verify slice(-4,-1) when both start and end negative and start < end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0008';
        console.log(TAG + ' start');

        const arr8: number[] = [1, 3, 5, 7, 9];
        const result8: number[] = arr8.slice(-4, -1);
        expect(result8.join(',') === '3,5,7').assertTrue();
        expect(arr8.join(',') === '1,3,5,7,9').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_0900
     * @tc.name      testArraySlice0009
     * @tc.desc      Verify slice(-2,-3) where computed end is before start returns empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0009';
        console.log(TAG + ' start');

        const arr9: number[] = [2, 4, 6, 8];
        const result9: number[] = arr9.slice(-2, -3);
        expect(result9.length === 0).assertTrue();
        expect(arr9.join(',') === '2,4,6,8').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1000
     * @tc.name      testArraySlice0010
     * @tc.desc      Verify slice(0,0) returns empty array for single-element array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0010';
        console.log(TAG + ' start');

        const arr10: string[] = ['a'];
        const result10: string[] = arr10.slice(0, 0);
        expect(result10.length === 0).assertTrue();
        expect(arr10.join(',') === 'a').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });


    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1100
     * @tc.name      testArraySlice0011
     * @tc.desc      Verify slice(start = length) returns empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0011';
        console.log(TAG + ' start');

        const arr11: number[] = [1, 2, 3, 4];
        const result11: number[] = arr11.slice(4);
        expect(result11.length === 0).assertTrue();
        expect(arr11.join(',') === '1,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1200
     * @tc.name      testArraySlice0012
     * @tc.desc      Verify slice(start > length) returns empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0012';
        console.log(TAG + ' start');

        const arr12: number[] = [10, 20];
        const result12: number[] = arr12.slice(5);
        expect(result12.length === 0).assertTrue();
        expect(arr12.join(',') === '10,20').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1300
     * @tc.name      testArraySlice0013
     * @tc.desc      Verify slice(0,5) with end > length slices to end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0013';
        console.log(TAG + ' start');

        const arr13: string[] = ['x', 'y'];
        const result13: string[] = arr13.slice(0, 5);
        expect(result13.join(',') === 'x,y').assertTrue();
        expect(arr13.join(',') === 'x,y').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1400
     * @tc.name      testArraySlice0014
     * @tc.desc      Verify negative start whose absolute value > length is clamped to 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0014';
        console.log(TAG + ' start');

        const arr14: number[] = [1, 2];
        const result14: number[] = arr14.slice(-5);
        expect(result14.join(',') === '1,2').assertTrue();
        expect(arr14.join(',') === '1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1500
     * @tc.name      testArraySlice0015
     * @tc.desc      Verify end negative with absolute > length clamps to 0 and may produce empty result when end <= start.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0015';
        console.log(TAG + ' start');

        const arr15: number[] = [3, 6, 9];
        const result15: number[] = arr15.slice(1, -5);
        expect(result15.length === 0).assertTrue();
        expect(arr15.join(',') === '3,6,9').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1600
     * @tc.name      testArraySlice0016
     * @tc.desc      Verify slice on empty array returns empty array regardless of indices.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0016';
        console.log(TAG + ' start');

        const arr16: number[] = [];
        const result16: number[] = arr16.slice(0, 10);
        expect(result16.length === 0).assertTrue();
        expect(arr16.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1700
     * @tc.name      testArraySlice0017
     * @tc.desc      Verify slice(0,1) on single-element array returns a one-element array containing that element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0017';
        console.log(TAG + ' start');

        const arr17: boolean[] = [true];
        const result17: boolean[] = arr17.slice(0, 1);
        expect(result17.join(',') === 'true').assertTrue();
        expect(arr17.join(',') === 'true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1800
     * @tc.name      testArraySlice0018
     * @tc.desc      Verify slice on mixed-type array returns expected elements by index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0018';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const arr18: (number | string | boolean | testobj)[] = [1, 'a', true, { name: 'test' }];
        const result18: (number | string | boolean | testobj)[] = arr18.slice(1, 3);
        // expected result: ['a', true]
        expect(result18[0] === 'a' && result18[1] === true).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_1900
     * @tc.name      testArraySlice0019
     * @tc.desc      Verify slice is a shallow copy: changing nested element affects original nested object.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0019';
        console.log(TAG + ' start');

        const arr19: (number | number[])[] = [1, [2, 3], 4];
        const result19: (number | number[])[] = arr19.slice(1, 2);
        (result19[0] as number[]).push(5);

        expect((arr19[1] as number[]).includes(5)).assertTrue();
        expect((result19[0] as number[]).includes(5)).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2000
     * @tc.name      testArraySlice0020
     * @tc.desc      Verify slice() without arguments returns a shallow copy; modifying copy does not change original.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0020';
        console.log(TAG + ' start');

        const arr20: number[] = [10, 20, 30];
        const result20: number[] = arr20.slice();
        result20.push(40);
        expect(arr20.join(',') === '10,20,30').assertTrue();
        expect(result20.join(',') === '10,20,30,40').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2100
     * @tc.name      testArraySlice0021
     * @tc.desc      Verify slice(1,length-1) returns middle elements excluding first and last.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0021';
        console.log(TAG + ' start');

        const arr21: number[] = [1, 2, 3, 4, 5, 6];
        const result21: number[] = arr21.slice(1, arr21.length - 1);
        expect(result21.join(',') === '2,3,4,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2200
     * @tc.name      testArraySlice0022
     * @tc.desc      Verify slice(-1) returns last element in an array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0022';
        console.log(TAG + ' start');

        const arr22: string[] = ['a', 'b', 'c'];
        const result22: string[] = arr22.slice(-1);
        expect(result22.join(',') === 'c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2300
     * @tc.name      testArraySlice0023
     * @tc.desc      Verify slice(-3,-2) extracts the third from last element only.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0023';
        console.log(TAG + ' start');

        const arr23: number[] = [10, 20, 30, 40, 50];
        const result23: number[] = arr23.slice(-3, -2);
        expect(result23.join(',') === '30').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2400
     * @tc.name      testArraySlice0024
     * @tc.desc      Verify slice(0,-1) excludes the last element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0024';
        console.log(TAG + ' start');

        const arr24: number[] = [1, 2, 3, 4];
        const result24: number[] = arr24.slice(0, -1);
        expect(result24.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2500
     * @tc.name      testArraySlice0025
     * @tc.desc      Verify slice(-2, length) returns the last two elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0025';
        console.log(TAG + ' start');

        const arr25: string[] = ['x', 'y', 'z', 'w'];
        const result25: string[] = arr25.slice(-2, arr25.length);
        expect(result25.join(',') === 'z,w').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2600
     * @tc.name      testArraySlice0026
     * @tc.desc      Verify slice('1',3) coerces string '1' to number and slices accordingly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0026';
        console.log(TAG + ' start');

        const arr26: number[] = [1, 2, 3];
        // "1" coerces to 1
        const result26: number[] = arr26.slice(Number('1'), 3);
        expect(result26.join(',') === '2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2700
     * @tc.name      testArraySlice0027
     * @tc.desc      Verify slice(NaN,1) treats NaN as 0 and returns slice(0,1).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0027';
        console.log(TAG + ' start');

        const arr27: number[] = [10, 20];
        const result27: number[] = arr27.slice(NaN, 1);
        expect(result27.join(',') === '10').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2800
     * @tc.name      testArraySlice0028
     * @tc.desc      Verify slice(1,NaN) treats NaN as 0 and returns empty array if end <= start.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0028';
        console.log(TAG + ' start');

        const arr28: number[] = [30, 40, 50];
        const result28: number[] = arr28.slice(1, NaN);
        expect(result28.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_2900
     * @tc.name      testArraySlice0029
     * @tc.desc      Verify slice(2,-1) mixes positive start and negative end correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0029';
        console.log(TAG + ' start');

        const arr29: number[] = [1, 2, 3, 4, 5];
        const result29: number[] = arr29.slice(2, -1);
        expect(result29.join(',') === '3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_3000
     * @tc.name      testArraySlice0030
     * @tc.desc      Verify modifying the returned slice does not modify the original array (shallow copy).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0030';
        console.log(TAG + ' start');

        const arr30: number[] = [10, 20, 30];
        const result30: number[] = arr30.slice(1);
        result30[0] = 99;

        expect(arr30.join(',') === '10,20,30').assertTrue();
        expect(result30.join(',') === '99,30').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_3100
     * @tc.name      testArraySlice0031
     * @tc.desc      Verify slice(0,1) extracts the first element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0031';
        console.log(TAG + ' start');

        const arr31: string[] = ['a', 'b', 'c'];
        const result31: string[] = arr31.slice(0, 1);
        expect(result31.join(',') === 'a').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_3200
     * @tc.name      testArraySlice0032
     * @tc.desc      Verify slice(-0,1) treats -0 as 0 and extracts the first element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0032';
        console.log(TAG + ' start');

        const arr32: number[] = [1, 2];
        const result32: number[] = arr32.slice(-0, 1);
        expect(result32.join(',') === '1').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_3300
     * @tc.name      testArraySlice0033
     * @tc.desc      Verify slice(1,-3) where end negative absolute equals length returns empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0033';
        console.log(TAG + ' start');

        const arr33: number[] = [1, 2, 3];
        const result33: number[] = arr33.slice(1, -3);
        expect(result33.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_3400
     * @tc.name      testArraySlice0034
     * @tc.desc      Verify slice(2,4) extracts two middle elements from a longer array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0034';
        console.log(TAG + ' start');

        const arr34: number[] = [10, 20, 30, 40, 50, 60];
        const result34: number[] = arr34.slice(2, 4);
        expect(result34.join(',') === '30,40').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_3500
     * @tc.name      testArraySlice0035
     * @tc.desc      Verify slice(-5,-3) on a long array returns expected elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0035';
        console.log(TAG + ' start');

        const arr35: number[] = [1, 2, 3, 4, 5, 6, 7];
        const result35: number[] = arr35.slice(-5, -3);
        expect(result35.join(',') === '3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_3700
     * @tc.name      testArraySlice0037
     * @tc.desc      Verify slice(undefined, undefined) returns a copy of the whole array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0037';
        console.log(TAG + ' start');

        const arr37: string[] = ['x', 'y'];
        const result37: string[] = arr37.slice(undefined, undefined);
        expect(result37.join(',') === 'x,y').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_3800
     * @tc.name      testArraySlice0038
     * @tc.desc      Verify slice(0,-0) treats -0 as 0, returning empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0038';
        console.log(TAG + ' start');

        const arr38: number[] = [1, 2];
        const result38: number[] = arr38.slice(0, -0);
        expect(result38.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_3900
     * @tc.name      testArraySlice0039
     * @tc.desc      Verify slicing arrays of functions returns correct lengths and original unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0039';
        console.log(TAG + ' start');

        const arr39: Array<() => number> = [() => 1, () => 2];
        const result39: Array<() => number> = arr39.slice(0, 1);
        expect(result39.length === 1).assertTrue();
        expect(arr39.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_4000
     * @tc.name      testArraySlice0040
     * @tc.desc      Verify slice on sparse arrays preserves holes (holes remain undefined and length preserved).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0040';
        console.log(TAG + ' start');

        const arr40: (number | undefined)[] = [1, , 3];
        const result40: (number | undefined)[] = arr40.slice(0, 3);
        expect(result40.length === 3).assertTrue();
        expect(result40[1] === undefined).assertTrue();
        expect(arr40.length === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_4100
     * @tc.name      testArraySlice0041
     * @tc.desc      Verify slice(2,3) on [5,6,7] returns [7] and original array is unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0041';
        console.log(TAG + ' start');

        const arr41: number[] = [5, 6, 7];
        const result41: number[] = arr41.slice(2, 3);

        const ok: boolean = result41.length === 1 && result41[0] === 7 && arr41.length === 3 && arr41[2] === 7;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_4200
     * @tc.name      testArraySlice0042
     * @tc.desc      Verify slice(-length, 0) returns empty array and original unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0042';
        console.log(TAG + ' start');

        const arr42: number[] = [1, 2, 3];
        const result42: number[] = arr42.slice(-3, 0);
        const ok: boolean = result42.length === 0 && arr42.length === 3;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_4300
     * @tc.name      testArraySlice0043
     * @tc.desc      Verify slice(-2,2) returns the full array for length 2 arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0043';
        console.log(TAG + ' start');

        const arr43: number[] = [10, 20];
        const result43: number[] = arr43.slice(-2, 2);
        const ok: boolean = result43.length === 2 && result43[0] === 10 && result43[1] === 20 && arr43.length === 2;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_4500
     * @tc.name      testArraySlice0045
     * @tc.desc      Verify slice(3,7) on a long array returns middle segment and original length unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0045';
        console.log(TAG + ' start');

        const arr45: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        const result45: number[] = arr45.slice(3, 7);
        const ok: boolean = JSON.stringify(result45) === JSON.stringify([3, 4, 5, 6]) && arr45.length === 10;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_4600
     * @tc.name      testArraySlice0046
     * @tc.desc      Verify multiple slice calls do not mutate the original array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0046';
        console.log(TAG + ' start');

        const arr46: string[] = ['a', 'b'];
        arr46.slice(0);
        arr46.slice(1, 2);
        const ok: boolean = arr46.length === 2 && arr46[0] === 'a' && arr46[1] === 'b';
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_4700
     * @tc.name      testArraySlice0047
     * @tc.desc      Verify slice(-1, length) returns the last element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0047';
        console.log(TAG + ' start');

        const arr47: number[] = [1, 2, 3];
        const result47: number[] = arr47.slice(-1, 3);
        const ok: boolean = result47.length === 1 && result47[0] === 3 && arr47.length === 3;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_4800
     * @tc.name      testArraySlice0048
     * @tc.desc      Verify slice(1,0) returns empty array when start >= end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0048';
        console.log(TAG + ' start');

        const arr48: number[] = [10, 20];
        const result48: number[] = arr48.slice(1, 0);
        const ok: boolean = result48.length === 0 && arr48.length === 2;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_4900
     * @tc.name      testArraySlice0049
     * @tc.desc      Verify slicing nested arrays returns shallow copy; modifying nested element affects original.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0049';
        console.log(TAG + ' start');

        const arr49: number[][] = [[1, 2], [3, 4]];
        const result49: number[][] = arr49.slice(0, 1);

        result49[0][0] = 9;
        const ok: boolean = arr49[0][0] === 9 && result49[0][0] === 9;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SLICE_5000
     * @tc.name      testArraySlice0050
     * @tc.desc      Verify slice on empty array returns empty array and original remains empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0050';
        console.log(TAG + ' start');

        const arr50: number[] = [];
        const result50: number[] = arr50.slice();
        const ok: boolean = result50.length === 0 && arr50.length === 0;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_0100
     * @tc.name      testArraySplice0001
     * @tc.desc      Verify splice(1,2) deletes middle elements and returns removed elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0001';
        console.log(TAG + ' start');

        const arr51: number[] = [1, 2, 3, 4, 5];
        const result51: number[] = arr51.splice(1, 2);
        const ok: boolean =
          JSON.stringify(result51) === JSON.stringify([2, 3]) && JSON.stringify(arr51) === JSON.stringify([1, 4, 5]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_0200
     * @tc.name      testArraySplice0002
     * @tc.desc      Verify splice(0,1) deletes the first element and returns it.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0002';
        console.log(TAG + ' start');

        const arr52: string[] = ['a', 'b', 'c'];
        const result52: string[] = arr52.splice(0, 1);
        const ok: boolean =
          JSON.stringify(result52) === JSON.stringify(['a']) && JSON.stringify(arr52) === JSON.stringify(['b', 'c']);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATE_ARRAY_SPLICE_0300
     * @tc.name      testArraySplice0003
     * @tc.desc      Verify splice(2,1) deletes last element and returns it.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0003';
        console.log(TAG + ' start');

        const arr53: number[] = [10, 20, 30];
        const result53: number[] = arr53.splice(2, 1);
        const ok: boolean =
          JSON.stringify(result53) === JSON.stringify([30]) && JSON.stringify(arr53) === JSON.stringify([10, 20]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_0400
     * @tc.name      testArraySplice0004
     * @tc.desc      Verify splice(1,1,'a') replaces element and returns removed element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0004';
        console.log(TAG + ' start');

        const arr54: (string | number)[] = [1, 2, 3];
        const result54: (string | number)[] = arr54.splice(1, 1, 'a');
        const ok: boolean =
          JSON.stringify(result54) === JSON.stringify([2]) && JSON.stringify(arr54) === JSON.stringify([1, 'a', 3]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_0500
     * @tc.name      testArraySplice0005
     * @tc.desc      Verify splice(1,2,5,6,7) replaces two elements with three and returns removed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0005';
        console.log(TAG + ' start');

        const arr55: number[] = [10, 20, 30, 40];
        const result55: number[] = arr55.splice(1, 2, 5, 6, 7);
        const ok: boolean = JSON.stringify(result55) === JSON.stringify([20, 30]) &&
          JSON.stringify(arr55) === JSON.stringify([10, 5, 6, 7, 40]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_0600
     * @tc.name      testArraySplice0006
     * @tc.desc      Verify splice(1,0,'a','b') inserts elements at index1 and returns empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0006';
        console.log(TAG + ' start');

        const arr56: (number | string)[] = [1, 2, 3];
        const result56: (number | string)[] = arr56.splice(1, 0, 'a', 'b');
        const ok: boolean = result56.length === 0 && JSON.stringify(arr56) === JSON.stringify([1, 'a', 'b', 2, 3]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_0700
     * @tc.name      testArraySplice0007
     * @tc.desc      Verify splice(0,0,'a') inserts at the beginning.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0007';
        console.log(TAG + ' start');

        const arr57: string[] = ['b', 'c'];
        const result57: string[] = arr57.splice(0, 0, 'a');
        const ok: boolean = result57.length === 0 && JSON.stringify(arr57) === JSON.stringify(['a', 'b', 'c']);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_0800
     * @tc.name      testArraySplice0008
     * @tc.desc      Verify splice with start equal length appends at the end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0008';
        console.log(TAG + ' start');

        const arr58: number[] = [1, 2];
        const result58: number[] = arr58.splice(2, 0, 3, 4);
        const ok: boolean = result58.length === 0 && JSON.stringify(arr58) === JSON.stringify([1, 2, 3, 4]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_0900
     * @tc.name      testArraySplice0009
     * @tc.desc      Verify splice with negative start counts from end and removes the correct element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0009';
        console.log(TAG + ' start');

        const arr59: number[] = [1, 2, 3, 4, 5];
        const result59: number[] = arr59.splice(-2, 1);
        const ok: boolean =
          JSON.stringify(result59) === JSON.stringify([4]) && JSON.stringify(arr59) === JSON.stringify([1, 2, 3, 5]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_1000
     * @tc.name      testArraySplice0010
     * @tc.desc      Verify splice with deleteCount larger than remaining elements deletes to the end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0010';
        console.log(TAG + ' start');

        const arr60: number[] = [10, 20, 30];
        const result60: number[] = arr60.splice(1, 10);
        const ok: boolean =
          JSON.stringify(result60) === JSON.stringify([20, 30]) && JSON.stringify(arr60) === JSON.stringify([10]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1100
     * @tc.name      testArraySplice0011
     * @tc.desc      Verify splice with deleteCount=0 returns empty array and leaves original unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0011';
        console.log(TAG + ' start');

        const arr61: number[] = [1, 2, 3];
        const result61: number[] = arr61.splice(1, 0);
        const ok: boolean = result61.length === 0 && JSON.stringify(arr61) === JSON.stringify([1, 2, 3]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_1200
     * @tc.name      testArraySplice0012
     * @tc.desc      Verify splice(1,0,'x') inserts a single element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0012';
        console.log(TAG + ' start');

        const arr62: string[] = ['a', 'b'];
        const result62: string[] = arr62.splice(1, 0, 'x');
        const ok: boolean = result62.length === 0 && JSON.stringify(arr62) === JSON.stringify(['a', 'x', 'b']);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1300
     * @tc.name      testArraySplice0013
     * @tc.desc      Verify splice with start equal to length behaves as append and deletion returns empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0013';
        console.log(TAG + ' start');

        const arr63: number[] = [1, 2];
        const result63: number[] = arr63.splice(2, 1);
        const ok: boolean = result63.length === 0 && JSON.stringify(arr63) === JSON.stringify([1, 2]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1400
     * @tc.name      testArraySplice0014
     * @tc.desc      Verify splice with start > length inserts at end.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0014';
        console.log(TAG + ' start');

        const arr64: number[] = [10, 20];
        const result64: number[] = arr64.splice(5, 0, 30);
        const ok: boolean = result64.length === 0 && JSON.stringify(arr64) === JSON.stringify([10, 20, 30]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1500
     * @tc.name      testArraySplice0015
     * @tc.desc      Verify splice with very negative start (abs > length) treats start as 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0015';
        console.log(TAG + ' start');

        const arr65: number[] = [1, 2];
        const result65: number[] = arr65.splice(-5, 1);
        const ok: boolean =
          JSON.stringify(result65) === JSON.stringify([1]) && JSON.stringify(arr65) === JSON.stringify([2]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1600
     * @tc.name      testArraySplice0016
     * @tc.desc      Verify splice(0, length) removes all elements and returns them.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0016';
        console.log(TAG + ' start');

        const arr66: number[] = [1, 2, 3];
        const result66: number[] = arr66.splice(0, 3);
        const ok: boolean = JSON.stringify(result66) === JSON.stringify([1, 2, 3]) && arr66.length === 0;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_DATE_ARRAY_SPLICE_1700
     * @tc.name      testArraySplice0017
     * @tc.desc      Verify splice can replace with mixed types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0017';
        console.log(TAG + ' start');

        const arr67: (number | string | boolean)[] = [1, 2, 3];
        const result67: (number | string | boolean)[] = arr67.splice(1, 2, 'a', true);
        const ok: boolean = JSON.stringify(result67) === JSON.stringify([2, 3]) &&
          JSON.stringify(arr67) === JSON.stringify([1, 'a', true]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_1800
     * @tc.name      testArraySplice0018
     * @tc.desc      Verify splice can insert objects and arrays; return is empty and length updates.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0018';
        console.log(TAG + ' start');

        interface testobj {
          x: number
        }

        type ArrayElement = testobj | number | number[];
        const arr68: ArrayElement[] = [1, 2];
        const result68: ArrayElement[] = arr68.splice(1, 0, { x: 1 }, [3, 4]);
        const ok: boolean = result68.length === 0 && arr68.length === 4 && (arr68[1] as testobj).x === 1;
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SPLICE_1900
     * @tc.name      testArraySplice0019
     * @tc.desc      Verify splice with negative start and deleteCount 0 inserts at computed position.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0019';
        console.log(TAG + ' start');

        const arr69: (number | string)[] = [1, 2, 3, 4];
        const result69: (number | string)[] = arr69.splice(-2, 0, 'x');
        const ok: boolean = result69.length === 0 && JSON.stringify(arr69) === JSON.stringify([1, 2, 'x', 3, 4]);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPLICE_2000
     * @tc.name      testArraySplice0020
     * @tc.desc      Verify splice on empty array inserting elements updates array appropriately.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySplice0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySplice0020';
        console.log(TAG + ' start');

        const arr70: string[] = [];
        const result70: string[] = arr70.splice(0, 0, 'a', 'b');
        const ok: boolean = result70.length === 0 && JSON.stringify(arr70) === JSON.stringify(['a', 'b']);
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

  })
}