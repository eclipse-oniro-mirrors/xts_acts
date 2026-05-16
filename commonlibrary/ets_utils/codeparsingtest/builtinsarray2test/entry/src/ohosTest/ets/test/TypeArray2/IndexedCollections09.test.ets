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

function createSymbol(description?: string): SymbolLike {
  return {
    id: `symbol_${Date.now()}_${Math.random().toString(36).slice(2, 10)}`,
    description
  };
}

interface SymbolLike {
  id: string;
  description?: string;
}

export default function IndexedCollections09Test() {
  describe('IndexedCollections09Test', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_CREATE_0100
     * @tc.name      testArrayCreate0001
     * @tc.desc      Verify that an array literal creates an empty array with length 0 and Array.isArray returns true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayCreate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayCreate0001';
        console.log(TAG + ' start');

        const arr1: number[] = [];
        const result1: boolean = arr1.length === 0 && Array.isArray(arr1);
        expect(result1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_TYPE_0100
     * @tc.name      testArrayType0001
     * @tc.desc      Verify that an empty array has typeof "object" and is an instance of Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayType0001';
        console.log(TAG + ' start');

        const arr2: number[] = [];
        const result2: boolean = typeof arr2 === 'object' && arr2 instanceof Array;
        expect(result2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CREATE_0200
     * @tc.name      testArrayCreate0002
     * @tc.desc      Verify that a single-element numeric array literal holds the number and has length 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayCreate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayCreate0002';
        console.log(TAG + ' start');

        const arr3: number[] = [5];
        const result3: boolean = arr3.length === 1 && arr3[0] === 5;
        expect(result3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CREATE_0300
     * @tc.name      testArrayCreate0003
     * @tc.desc      Verify that a single-element string array literal contains the expected string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayCreate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayCreate0003';
        console.log(TAG + ' start');

        const arr4: string[] = ['hello'];
        const result4: boolean = arr4[0] === 'hello';
        expect(result4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CREATE_0400
     * @tc.name      testArrayCreate0004
     * @tc.desc      Verify that a single-element boolean array literal contains the expected boolean.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayCreate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayCreate0004';
        console.log(TAG + ' start');

        const arr5: boolean[] = [true];
        const result5: boolean = arr5[0] === true;
        expect(result5).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CREATE_0500
     * @tc.name      testArrayCreate0005
     * @tc.desc      Verify that a single-element null array literal contains null.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayCreate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayCreate0005';
        console.log(TAG + ' start');

        const arr6: (null)[] = [null];
        const result6: boolean = arr6[0] === null;
        expect(result6).assertTrue();

        done();
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CREATE_0600
     * @tc.name      testArrayCreate0006
     * @tc.desc      Verify that a single-element undefined array literal contains undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayCreate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayCreate0006';
        console.log(TAG + ' start');

        const arr7: (undefined)[] = [undefined];
        const result7: boolean = arr7[0] === undefined;
        expect(result7).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CREATE_0700
     * @tc.name      testArrayCreate0007
     * @tc.desc      Verify that a single-element object array literal references the same object instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayCreate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayCreate0007';
        console.log(TAG + ' start');

        interface testobj {
          key: string
        }

        const obj8: testobj = { key: 'value' };
        const arr8: testobj[] = [obj8];
        const result8: boolean = arr8[0] === obj8;
        expect(result8).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CREATE_0800
     * @tc.name      testArrayCreate0008
     * @tc.desc      Verify that a single-element function array literal stores and invokes the same function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayCreate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayCreate0008';
        console.log(TAG + ' start');

        const func9: () => string = () => 'test';
        const arr9: (() => string)[] = [func9];
        const result9: boolean = arr9[0]() === 'test';
        expect(result9).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_0100
     * @tc.name      testArrayLength0001
     * @tc.desc      Verify that a multi-element numeric array has correct length and indexed value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0001';
        console.log(TAG + ' start');

        const arr10: number[] = [10, 20, 30, 40];
        const result10: boolean = arr10.length === 4 && arr10[2] === 30;
        expect(result10).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_JOIN_0100
     * @tc.name      testArrayJoin0001
     * @tc.desc      Verify that joining multiple string elements produces the expected concatenated string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayJoin0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayJoin0001';
        console.log(TAG + ' start');

        const arr11: string[] = ['a', 'b', 'c'];
        const result11: boolean = arr11.join('') === 'abc';
        expect(result11).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_INDEX_0100
     * @tc.name      testArrayIndex0001
     * @tc.desc      Verify mixed-type array elements are stored and retrievable by index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayIndex0001';
        console.log(TAG + ' start');

        const arr12: (number | string | boolean)[] = [1, 'two', true];
        const result12: boolean = arr12[0] === 1 && arr12[1] === 'two' && arr12[2] === true;

        expect(result12).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_INDEX_0200
     * @tc.name      testArrayIndex0002
     * @tc.desc      Verify that an array with null, object and nested array contains correct nested values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayIndex0002';
        console.log(TAG + ' start');

        interface testobj {
          a: number
        }

        const arr13: (null | testobj | number[])[] = [null, { a: 1 }, [2, 3]];
        const result13: boolean = (arr13[1] as testobj).a === 1 && (arr13[2] as number[])[1] === 3;

        expect(result13).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_NESTED_0100
     * @tc.name      testArrayNested0001
     * @tc.desc      Verify that nested arrays store and provide access to nested elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayNested0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayNested0001';
        console.log(TAG + ' start');

        const arr14: (number | number[])[] = [1, [2, 3], 4];
        const result14: boolean = (arr14[1] as number[])[1] === 3;
        expect(result14).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_NESTED_0200
     * @tc.name      testArrayNested0002
     * @tc.desc      Verify deep nested arrays allow multi-level index access.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayNested0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayNested0002';
        console.log(TAG + ' start');

        const arr15: (number | (number | (number | number[])[])[])[] = [1, [2, [3, [4]]]];
        const level1 = arr15[1] as (number | (number | number[])[])[];
        const level2 = level1[1] as (number | number[])[];
        const level3 = level2[1] as number[];

        const value = level3[0];
        const result15: boolean = value === 4;
        expect(result15).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_0100
     * @tc.name      testArrayConstruct0001
     * @tc.desc      Verify that constructing an Array with no arguments produces an empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0001';
        console.log(TAG + ' start');

        const arr16: Array<null> = new Array();
        const result16: boolean = arr16.length === 0 && Array.isArray(arr16);
        expect(result16).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_0200
     * @tc.name      testArrayConstruct0002
     * @tc.desc      Verify that new Array(5) creates an array of length 5 with undefined slots.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0002';
        console.log(TAG + ' start');

        const arr17: undefined[] = new Array(5);
        const result17: boolean = arr17.length === 5 && arr17[0] === undefined;
        expect(result17).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_0300
     * @tc.name      testArrayConstruct0003
     * @tc.desc      Verify that new Array("5") treats the string as a single element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0003';
        console.log(TAG + ' start');

        const arr18: string[] = new Array('5');
        const result18: boolean = arr18.length === 1 && arr18[0] === '5';
        expect(result18).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_0400
     * @tc.name      testArrayConstruct0004
     * @tc.desc      Verify that new Array(false) creates an array whose first element is the boolean false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0004';
        console.log(TAG + ' start');

        const arr19: boolean[] = new Array(false);
        const result19: boolean = arr19[0] === false;
        expect(result19).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_0500
     * @tc.name      testArrayConstruct0005
     * @tc.desc      Verify that new Array(obj) with an object argument stores the object as the first element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0005';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const obj20: testobj = { name: 'test' };
        const arr20: testobj[] = new Array(obj20);
        const result20: boolean = arr20[0] === obj20;
        expect(result20).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_0600
     * @tc.name      testArrayConstruct0006
     * @tc.desc      Verify new Array(1,2) creates an array of two elements [1,2].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0006';
        console.log(TAG + ' start');

        const arr21: number[] = new Array(1, 2);
        const result21: boolean = arr21.length === 2 && arr21[1] === 2;
        expect(result21).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_0700
     * @tc.name      testArrayConstruct0007
     * @tc.desc      Verify new Array(1,2,3,4) creates expected elements and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0007';
        console.log(TAG + ' start');

        const arr22: number[] = new Array(1, 2, 3, 4);
        const result22: boolean = arr22.length === 4 && arr22[2] === 3;
        expect(result22).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_0800
     * @tc.name      testArrayConstruct0008
     * @tc.desc      Verify new Array mixed-type args behave as element list.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0008';
        console.log(TAG + ' start');

        const arr23 = [1, 'a', true, null];
        const result23: boolean = arr23[2] === true && arr23[3] === null;
        expect(result23).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_0900
     * @tc.name      testArrayConstruct0009
     * @tc.desc      Verify new Array([1,2],[3,4]) creates an array containing the two nested arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0009';
        console.log(TAG + ' start');

        const arr24: number[][] = new Array([1, 2], [3, 4]);
        const result24: boolean = arr24[0][1] === 2;
        expect(result24).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_1000
     * @tc.name      testArrayConstruct0010
     * @tc.desc      Verify new Array(0) yields an array of length 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0010';
        console.log(TAG + ' start');

        const arr25: number[] = new Array(0);
        const result25: boolean = arr25.length === 0;
        expect(result25).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_CONSTRUCT_1100
     * @tc.name      testArrayConstruct0011
     * @tc.desc      Verify creating a very large array with new Array(1000000) sets the length accordingly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayConstruct0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayConstruct0011';
        console.log(TAG + ' start');

        const arr26: number[] = new Array(1000000);
        const result26: boolean = arr26.length === 1000000;
        expect(result26).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_0100
     * @tc.name      testArrayOf0001
     * @tc.desc      Verify Array.of(5) creates [5].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOf0001';
        console.log(TAG + ' start');

        const arr27: number[] = Array.of(5);
        const result27: boolean = arr27.length === 1 && arr27[0] === 5;
        expect(result27).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_0200
     * @tc.name      testArrayOf0002
     * @tc.desc      Verify Array.of(1,2,3,4) creates expected array [1,2,3,4].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOf0002';
        console.log(TAG + ' start');

        const arr28: number[] = Array.of(1, 2, 3, 4);
        const result28: boolean = arr28.length === 4 && arr28[3] === 4;
        expect(result28).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_0300
     * @tc.name      testArrayOf0003
     * @tc.desc      Verify Array.of with mixed-type args stores values in order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOf0003';
        console.log(TAG + ' start');

        const arr29 = Array.of<number | string | boolean | null>(1, 'two', true, null);
        const result29: boolean = arr29[1] === 'two' && arr29[2] === true;
        expect(result29).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_0400
     * @tc.name      testArrayOf0004
     * @tc.desc      Compare Array.of(3) and new Array(3): Array.of yields length 1 while new Array(3) is length 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOf0004';
        console.log(TAG + ' start');

        const arr30a: number[] = Array.of(3);
        const arr30b: number[] = new Array(3);
        const result30: boolean = arr30a.length === 1 && arr30b.length === 3;
        expect(result30).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_0500
     * @tc.name      testArrayOf0005
     * @tc.desc      Verify Array.of and new Array with multiple args produce identical arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOf0005';
        console.log(TAG + ' start');

        const arr31a: number[] = Array.of(1, 2, 3);
        const arr31b: number[] = new Array(1, 2, 3);
        const result31: boolean = JSON.stringify(arr31a) === JSON.stringify(arr31b);

        expect(result31).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OF_0600
     * @tc.name      testArrayOf0006
     * @tc.desc      Verify Array.of() with no args returns an empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayOf0006';
        console.log(TAG + ' start');

        const arr32: number[] = Array.of();
        const result32: boolean = arr32.length === 0;
        expect(result32).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });


    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_0100
     * @tc.name      testArrayFrom0001
     * @tc.desc      Verify Array.from([1,2,3]) produces a new array of length 3 and is not the same reference as the source.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0001';
        console.log(TAG + ' start');

        const arr33: number[] = Array.from([1, 2, 3]);
        const result33: boolean = arr33.length === 3 && (arr33 !== ([1, 2, 3]));
        expect(result33).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_0200
     * @tc.name      testArrayFrom0002
     * @tc.desc      Verify Array.from can convert array-like objects into arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0002';
        console.log(TAG + ' start');

        class CustomCollection {
          private data: string[] = [];

          constructor(items: string[]) {
            this.data = items;
          }

          toArray(): string[] {
            return [...this.data];
          }
        }

        const collection = new CustomCollection(['a', 'b', 'c']);
        const arr34: string[] = Array.from(collection.toArray());
        const result34: boolean = arr34.join('') === 'abc';
        expect(result34).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_0300
     * @tc.name      testArrayFrom0003
     * @tc.desc      Verify Array.from on length-0 array-like returns empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0003';
        console.log(TAG + ' start');

        let a: number[] = new Array(0);
        const b = a[Symbol.iterator]();
        const arr35: number[] = Array.from(b);
        const result35: boolean = arr35.length === 0;
        expect(result35).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_0400
     * @tc.name      testArrayFrom0004
     * @tc.desc      Verify Array.from can convert a string into an array of characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0004';
        console.log(TAG + ' start');

        const arr36: string[] = Array.from('test');
        const result36: boolean = arr36.join('') === 'test';
        expect(result36).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_0500
     * @tc.name      testArrayFrom0005
     * @tc.desc      Verify Array.from('') returns an empty array for empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0005';
        console.log(TAG + ' start');

        const arr37: string[] = Array.from('');
        const result37: boolean = arr37.length === 0;
        expect(result37).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_0600
     * @tc.name      testArrayFrom0006
     * @tc.desc      Verify Array.from can convert a Set into an array of its values (unique).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0006';
        console.log(TAG + ' start');

        const set38: Set<number> = new Set<number>([1, 2, 3, 2]);
        const arr38: number[] = Array.from(set38);
        const result38: boolean = arr38.join(',') === '1,2,3';
        expect(result38).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_0700
     * @tc.name      testArrayFrom0007
     * @tc.desc      Verify Array.from can convert a Map into an array of [key,value] pairs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0007';
        console.log(TAG + ' start');

        const map39: Map<string, number> = new Map<string, number>([['a', 1], ['b', 2]]);
        const arr39: [string, number][] = Array.from(map39);
        const result39: boolean = arr39[0][0] === 'a' && arr39[1][1] === 2;
        expect(result39).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_0800
     * @tc.name      testArrayFrom0008
     * @tc.desc      Verify Array.from with a mapping function applies the map to each item.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0008';
        console.log(TAG + ' start');

        const arr40: number[] = Array.from([1, 2, 3], (x: number) => x * 3);
        const result40: boolean = arr40.join(',') === '3,6,9';
        expect(result40).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_0900
     * @tc.name      testArrayFrom0009
     * @tc.desc      Verify Array.from mapping function can use thisArg when provided.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0009';
        console.log(TAG + ' start');

        interface testobj {
          factor: number
        }

        const obj41: testobj = { factor: 2 };
        const mapper = (x: number) => x * obj41.factor;
        const arr41: number[] = Array.from([1, 2, 3], mapper, obj41);
        const result41: boolean = arr41.join(',') === '2,4,6';
        expect(result41).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FROM_1000
     * @tc.name      testArrayFrom0010
     * @tc.desc      Verify Array.from can convert function arguments object into an array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFrom0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFrom0010';
        console.log(TAG + ' start');

        let test42 = (a: string[]) => {
          return Array.from(a).join(',');
        }

        const result42: boolean = test42(['a', 'b', 'c']) === 'a,b,c';
        expect(result42).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_0100
     * @tc.name      testArraySparse0001
     * @tc.desc      Verify that an array literal with an omitted element has length equal to declared length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0001';
        console.log(TAG + ' start');

        const arr43: (number | undefined)[] = [1, , 3];
        const result43: boolean = arr43.length === 3;
        expect(result43).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_0200
     * @tc.name      testArraySparse0002
     * @tc.desc      Verify that accessing a sparse slot returns undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0002';
        console.log(TAG + ' start');

        const arr44: (number | undefined)[] = [1, , 3];
        const result44: boolean = arr44[1] === undefined;
        expect(result44).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_0300
     * @tc.name      testArraySparse0003
     * @tc.desc      Verify multiple consecutive holes produce expected length and holes remain undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0003';
        console.log(TAG + ' start');

        const arr45: (number | undefined)[] = [1, , , , 5];
        const result45: boolean = arr45.length === 5 && arr45[2] === undefined;
        expect(result45).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_0400
     * @tc.name      testArraySparse0004
     * @tc.desc      Verify leading holes behave as undefined and length counts them.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0004';
        console.log(TAG + ' start');

        const arr46: (number | undefined)[] = [, , 3, 4];
        const result46: boolean = arr46[0] === undefined && arr46.length === 4;
        expect(result46).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_0500
     * @tc.name      testArraySparse0005
     * @tc.desc      Verify trailing comma creates holes at the end but length reflects positions before last present element index+1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0005';
        console.log(TAG + ' start');

        const arr47: (number | undefined)[] = [1, 2, ,];

        const result47: boolean = arr47.length === 3 && arr47[2] === undefined;
        expect(result47).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_0600
     * @tc.name      testArraySparse0006
     * @tc.desc      Verify an array composed entirely of holes retains length and holes are undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0006';
        console.log(TAG + ' start');

        const arr48: (undefined)[] = [, , , ,];
        const result48: boolean = arr48.length === 4 && arr48[1] === undefined;
        expect(result48).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_0700
     * @tc.name      testArraySparse0007
     * @tc.desc      Verify forEach skips holes (count equals number of present elements).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0007';
        console.log(TAG + ' start');

        const arr49: (number | undefined)[] = [1, , 3];
        let count49: number = 0;
        arr49.forEach(() => count49++);
        const result49: boolean = count49 === 2;
        expect(result49).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_0800
     * @tc.name      testArraySparse0008
     * @tc.desc      Verify map on sparse arrays will skip holes (hole remains hole in result).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0008';
        console.log(TAG + ' start');

        const arr50: (number | undefined)[] = [1, , 3];
        const mapped50: (number | undefined)[] = arr50.map(x => typeof x === 'number' ? x * 2 : undefined);
        const result50: boolean = mapped50[0] === 2 && mapped50[1] === undefined && mapped50[2] === 6;
        expect(result50).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_0900
     * @tc.name      testArraySparse0009
     * @tc.desc      Verify filter skips holes; the resulting array contains only present elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0009';
        console.log(TAG + ' start');

        const arr51: (number | undefined)[] = [1, , 3];
        const filtered51: (number | undefined)[] = arr51.filter(x => true as boolean);

        const result51: boolean = filtered51.length === 2 && filtered51[0] === 1 && filtered51[1] === 3;

        expect(result51).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1000
     * @tc.name      testArraySparse0010
     * @tc.desc      Verify find will skip holes and thus finding index 1 (hole) yields undefined (not invoked).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0010';
        console.log(TAG + ' start');

        const arr52: (number | undefined)[] = [1, , 3];
        const found52: number | undefined = arr52.find((x, i) => i === 1);

        const result52: boolean = found52 === undefined;

        expect(result52).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1100
     * @tc.name      testArraySparse0011
     * @tc.desc      Verify findIndex skips holes and will not call predicate for hole index (returns -1 if only hole at that index).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0011';
        console.log(TAG + ' start');

        const arr53: (number | undefined)[] = [1, , 3];
        const index53: number = arr53.findIndex(num => typeof num !== 'number');
        const result53: boolean = index53 === 1;

        expect(result53).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1200
     * @tc.name      testArraySparse0012
     * @tc.desc      Verify every skips holes; for a test function on elements, holes are ignored.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0012';
        console.log(TAG + ' start');

        const arr54: (number | undefined)[] = [1, , 3];
        const result54: boolean = arr54.every(x => (typeof x === 'number' ? x !== 0 : true));

        expect(result54).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1300
     * @tc.name      testArraySparse0013
     * @tc.desc      Verify some skips holes when iterating; predicate for index 1 (hole) is not invoked.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0013';
        console.log(TAG + ' start');

        const arr55: (number | undefined)[] = [1, , 3];
        const result55: boolean = arr55.some((x, i) => i === 1) === false;
        expect(result55).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1400
     * @tc.name      testArraySparse0014
     * @tc.desc      Verify reduce skips holes; when supplied initial value 0, we see sum of present elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0014';
        console.log(TAG + ' start');

        const arr56: (number | undefined)[] = [1, , 3];
        const sum56: number = arr56.reduce((acc: number, x) => acc + (typeof x === 'number' ? x : 0), 0);
        const result56: boolean = sum56 === 4;

        expect(result56).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1500
     * @tc.name      testArraySparse0015
     * @tc.desc      Verify join represents holes as empty entries (e.g., "1,,3").
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0015';
        console.log(TAG + ' start');

        const arr57: (number | undefined)[] = [1, , 3];
        const result57: boolean = arr57.join(',') === '1,,3';

        expect(result57).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1600
     * @tc.name      testArraySparse0016
     * @tc.desc      Verify toString on sparse arrays matches join behavior (holes produce empty slots).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0016';
        console.log(TAG + ' start');

        const arr58: (number | undefined)[] = [1, , 3];
        const result58: boolean = arr58.toString() === '1,,3';

        expect(result58).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1700
     * @tc.name      testArraySparse0017
     * @tc.desc      Verify new Array(3) produces a sparse array of length 3 with no iterated elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0017';
        console.log(TAG + ' start');

        const arr59: number[] = new Array(3);
        const result59: boolean = arr59.length === 3 && arr59[0] === undefined;

        expect(result59).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1800
     * @tc.name      testArraySparse0018
     * @tc.desc      Verify forEach on a constructor-created sparse array does not invoke callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0018';
        console.log(TAG + ' start');

        const arr60: number[] = new Array(3);
        let count60: number = 0;
        arr60.forEach(() => count60++);
        const result60: boolean = count60 === 0;

        expect(result60).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_1900
     * @tc.name      testArraySparse0019
     * @tc.desc      Verify assigning into a hole fills it and join reflects the filled value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0019';
        console.log(TAG + ' start');

        const arr61: (number | undefined)[] = [1, , 3];
        arr61[1] = 2;
        const result61: boolean = arr61.join(',') === '1,2,3';

        expect(result61).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_2000
     * @tc.name      testArraySparse0020
     * @tc.desc      Verify spread operator preserves hole positions and length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0020';
        console.log(TAG + ' start');

        const arr62: (number | undefined)[] = [1, , 3];
        const spread62: (number | undefined)[] = [...arr62];
        const result62: boolean = spread62[1] === undefined && spread62.length === 3;

        expect(result62).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_2100
     * @tc.name      testArraySparse0021
     * @tc.desc      Verify Array.from copies holes to the new array preserving undefined holes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0021';
        console.log(TAG + ' start');

        const arr63: (number | undefined)[] = [1, , 3];
        const from63: (number | undefined)[] = Array.from(arr63);
        const result63: boolean = from63[1] === undefined && from63.length === 3;

        expect(result63).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPARSE_2200
     * @tc.name      testArraySparse0022
     * @tc.desc      Verify manual dense conversion retains hole placeholders as explicit undefined entries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySparse0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySparse0022';
        console.log(TAG + ' start');

        const arr64: (number | undefined)[] = [1, , 3, , 5];
        const dense64: (number | undefined)[] = [];
        for (let i = 0; i < arr64.length; i++) {
          dense64.push(arr64[i]);
        }
        const result64: boolean = dense64.length === 5 && dense64[3] === undefined;

        expect(result64).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MISC_0100
     * @tc.name      testArrayMisc0001
     * @tc.desc      Verify array literal can contain extreme numeric values including Infinity and NaN and detect them.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMisc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMisc0001';
        console.log(TAG + ' start');

        const arr65: (number)[] = [Infinity, -Infinity, NaN];
        const result65: boolean = arr65[0] === Infinity && isNaN(arr65[2]);

        expect(result65).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MISC_0200
     * @tc.name      testArrayMisc0002
     * @tc.desc      Verify array can hold regular expressions and their flags/matching work.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMisc0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMisc0002';
        console.log(TAG + ' start');

        const arr66: RegExp[] = [/abc/, /def/g];
        const result66: boolean = arr66[0].test('abc') && arr66[1].flags === 'g';

        expect(result66).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MISC_0300
     * @tc.name      testArrayMisc0003
     * @tc.desc      Verify array constructed with Date object contains the same date instance.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMisc0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMisc0003';
        console.log(TAG + ' start');

        const date67: Date = new Date(2023, 0, 1);
        const arr67: Date[] = new Array(date67);
        const result67: boolean = arr67[0].getFullYear() === 2023;

        expect(result67).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MISC_0400
     * @tc.name      testArrayMisc0004
     * @tc.desc      Verify Array.of can include Symbol elements and the same symbol identity is preserved.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMisc0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMisc0004';
        console.log(TAG + ' start');

        const sym68: SymbolLike = createSymbol('test');
        const arr68: SymbolLike[] = Array.of(sym68);
        const result68: boolean = arr68[0] === sym68;

        expect(result68).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MISC_0500
     * @tc.name      testArrayMisc0005
     * @tc.desc      Verify Array.from can consume a generator and produce the expected array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMisc0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMisc0005';
        console.log(TAG + ' start');

        const sourceArray = Array.of(1, 2, 3);

        const arr69: number[] = Array.from(sourceArray);
        const result69: boolean = arr69.join(',') === '1,2,3';

        expect(result69).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MISC_0600
     * @tc.name      testArrayMisc0006
     * @tc.desc      Verify difference between empty slot and explicit undefined (stringify vs join).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMisc0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMisc0006';
        console.log(TAG + ' start');

        const arr70a: (number | undefined)[] = [1, , 3];
        const arr70b: (number | undefined)[] = [1, undefined, 3];

        const result70: boolean =
          JSON.stringify(arr70a) === JSON.stringify(arr70b) && arr70a.join(',') === arr70b.join(',');

        expect(result70).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}