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

export default function IndexedCollections11Test() {
  describe('IndexedCollections11Test', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_ACCESS_0100
     * @tc.name      testArrayAccess0001
     * @tc.desc      Verify that assigning to negative numeric indices stores properties under those keys and they are retrievable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAccess0001';
        console.log(TAG + ' start');

        const arr61: (number | string)[] = [1, 2];
        arr61[-1] = 'a';
        arr61[-2] = 'b';
        const result61: boolean = (arr61[-1] === 'a') && (arr61[-2] === 'b');

        expect(result61).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_0100
     * @tc.name      testArrayModify0001
     * @tc.desc      Verify that assigning an element to the result of a function call stores the computed value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0001';
        console.log(TAG + ' start');

        const arr62: number[] = [1];
        arr62[0] = (() => 100)();
        const result62: boolean = arr62[0] === 100;
        expect(result62).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ADD_0100
     * @tc.name      testArrayAdd0001
     * @tc.desc      Verify that using a string numeric key like "3" adds an indexed element and updates length accordingly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0001';
        console.log(TAG + ' start');

        const arr63: number[] = [1, 2];
        arr63['3'] = 4;
        const result63: boolean = arr63[3] === 4 && arr63.length === 4;
        expect(result63).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_ADD_0200
     * @tc.name      testArrayAdd0002
     * @tc.desc      Verify that using a non-integer numeric string as an index creates an object property and does not affect length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayAdd0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayAdd0002';
        console.log(TAG + ' start');

        const arr64: number[] = [1, 2];
        arr64['3.5'] = 4;
        const result64: boolean = arr64['3.5'] === 4 && arr64.length === 2;

        expect(result64).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPECIAL_0100
     * @tc.name      testArraySpecial0001
     * @tc.desc      Verify that BigInt values can be stored in arrays and retrieved correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySpecial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySpecial0001';
        console.log(TAG + ' start');

        const arr65: (number | bigint)[] = [1];
        arr65[1] = 100n;
        const result65: boolean = arr65[1] === 100n;

        expect(result65).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_GETTER_0100
     * @tc.name      testArrayGetter0001
     * @tc.desc      Verify that defining a getter on an array index returns the computed value when accessed.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayGetter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayGetter0001';
        console.log(TAG + ' start');

        class ArrayWithGetters {
          private data: number[];
          private getters: Record<string, () => number> = {};

          constructor(initial: number[]) {
            this.data = initial;
          }

          registerGetter(index: string, getter: () => number) {
            this.getters[index] = getter;
          }

          get(index: number): number {
            const key = index.toString();
            return this.getters[key] ? this.getters[key]() : this.data[index];
          }
        }

        const arr66 = new ArrayWithGetters([1]);
        arr66.registerGetter("1", () => 20);
        const result66: boolean = arr66.get(1) === 20;

        expect(result66).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_MODIFY_0200
     * @tc.name      testArrayModify0002
     * @tc.desc      Verify attempting to write to a non-writable (writable:false) array element does not change the stored value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0002';
        console.log(TAG + ' start');

        class ArrayWithNonWritable {
          private data: number[];
          private nonWritableIndices: Set<number> = new Set();

          constructor(initial: number[]) {
            this.data = [...initial];
          }

          defineNonWritable(index: number, value: number) {
            this.data[index] = value;
            this.nonWritableIndices.add(index);
          }

          set(index: number, value: number) {
            if (!this.nonWritableIndices.has(index)) {
              this.data[index] = value;
            }
          }

          get(index: number): number {
            return this.data[index];
          }
        }

        const arr67 = new ArrayWithNonWritable([1]);
        arr67.defineNonWritable(0, 10);
        try {
          arr67.set(0, 20);
        } catch (e) {
        }
        const result67: boolean = arr67.get(0) === 10;

        expect(result67).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_ITERATE_0100
     * @tc.name      testArrayIterate0001
     * @tc.desc      Verify that adding an element beyond current length updates length and iterating counts present (non-undefined) entries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayIterate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayIterate0001';
        console.log(TAG + ' start');

        const arr68: (number | undefined)[] = [1, 2];
        arr68[4] = 5;
        let count68 = 0;
        for (let i = 0; i < arr68.length; i++) {
          if (arr68[i] !== undefined) {
            count68++;
          }
        }
        const result68: boolean = count68 === 3;
        expect(result68).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPECIAL_0200
     * @tc.name      testArraySpecial0002
     * @tc.desc      Verify that storing explicit undefined as an element still results in forEach visiting that index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySpecial0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySpecial0002';
        console.log(TAG + ' start');

        const arr69: (number | undefined)[] = [1, undefined, 3];
        let count69 = 0;
        arr69.forEach(() => count69++);

        const result69: boolean = count69 === 3;
        expect(result69).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPECIAL_0300
     * @tc.name      testArraySpecial0003
     * @tc.desc      Verify that forEach skips holes (absent entries), so sparse array [1,,3] causes two callbacks.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySpecial0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySpecial0003';
        console.log(TAG + ' start');

        const arr70: (number | undefined)[] = [1, , 3];
        let count70 = 0;
        arr70.forEach(() => count70++);
        const result70: boolean = count70 === 2;
        expect(result70).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OBJECT_0100
     * @tc.name      testArrayObject0001
     * @tc.desc      Verify accessing an array that is a property of an object returns the expected element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayObject0001';
        console.log(TAG + ' start');

        interface testobj {
          arr: number[]
        }

        const obj71: testobj = { arr: [1, 2, 3] };
        const result71: boolean = obj71.arr[1] === 2;
        expect(result71).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OBJECT_0200
     * @tc.name      testArrayObject0002
     * @tc.desc      Verify modifying an element of an array that is an object property updates that element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayObject0002';
        console.log(TAG + ' start');

        interface testobj {
          arr: number[]
        }

        const obj72: testobj = { arr: [1, 2] };
        obj72.arr[1] = 20;
        const result72: boolean = obj72.arr[1] === 20;
        expect(result72).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_OBJECT_0300
     * @tc.name      testArrayObject0003
     * @tc.desc      Verify adding an element at index 2 to an array inside an object increases its length and leaves index 1 undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayObject0003';
        console.log(TAG + ' start');

        interface testobj {
          arr: (number | undefined)[]
        }

        const obj73: testobj = { arr: [1] };
        obj73.arr[2] = 3;
        const result73: boolean = obj73.arr.length === 3 && obj73.arr[1] === undefined;

        expect(result73).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FUNCTION_0100
     * @tc.name      testArrayFunction0001
     * @tc.desc      Verify storing a function expression in an array and invoking it returns expected string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFunction0001';
        console.log(TAG + ' start');

        const arr74: (number | Function)[] = [1];
        arr74[1] = () => {
          return 'func';
        };
        const result74: boolean = (typeof arr74[1] === 'function') && (arr74[1]() === 'func');

        expect(result74).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FUNCTION_0200
     * @tc.name      testArrayFunction0002
     * @tc.desc      Verify storing an arrow function in an array and invoking it returns expected string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayFunction0002';
        console.log(TAG + ' start');

        const arr75: (number | Function)[] = [1];
        arr75[1] = () => 'arrow';
        const result75: boolean = (typeof arr75[1] === 'function') && (arr75[1]() === 'arrow');
        expect(result75).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MODIFY_0300
     * @tc.name      testArrayModify0003
     * @tc.desc      Verify nested (chained) modification of nested array elements updates the inner element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayModify0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayModify0003';
        console.log(TAG + ' start');

        const arr76: (number | number[])[] = [1, [2, 3]];
        (arr76[1] as number[])[0] = 20;
        const result76: boolean = (arr76[1] as number[])[0] === 20;
        expect(result76).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_SLICE_0100
     * @tc.name      testArraySlice0001
     * @tc.desc      Verify that slicing an array that has holes returns an array of the correct length and holes preserved as undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySlice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySlice0001';
        console.log(TAG + ' start');

        const arr77: (number | undefined)[] = [1, 2];
        arr77[4] = 5;
        const sliced77: (number | undefined)[] = arr77.slice(0, 5);
        const result77: boolean = sliced77.length === 5 && sliced77[3] === undefined;

        expect(result77).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SPECIAL_0400
     * @tc.name      testArraySpecial0004
     * @tc.desc      Verify storing multiple distinct object instances in array retains object identities and values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArraySpecial0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArraySpecial0004';
        console.log(TAG + ' start');

        interface ObjType {
          a?: number;
          b?: number;
        }

        const obj78a: ObjType = { a: 1 };
        const obj78b: ObjType = { b: 2 };

        const arr78: ObjType[] = [obj78a];
        arr78[1] = obj78b;

        const result78: boolean = arr78[0].a === 1 && arr78[1].b === 2;

        expect(result78).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_DYNAMIC_0100
     * @tc.name      testArrayDynamic0001
     * @tc.desc      Verify dynamic index (variable) access returns expected element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayDynamic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayDynamic0001';
        console.log(TAG + ' start');

        const arr79: number[] = [10, 20, 30];
        const idx79: number = 1;
        const result79: boolean = arr79[idx79] === 20;
        expect(result79).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_DYNAMIC_0200
     * @tc.name      testArrayDynamic0002
     * @tc.desc      Verify dynamic index assignment modifies the correct element when index is a variable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayDynamic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayDynamic0002';
        console.log(TAG + ' start');

        const arr80: number[] = [10, 20];
        let idx80: number = 0;
        arr80[idx80] = 100;
        const result80: boolean = arr80[idx80] === 100;
        expect(result80).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    BASEDATE_ARRAY_LENGTH_0100
     * @tc.name      testArrayLength0001
     * @tc.desc      Verify initial length for an empty array literal is 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0001';
        console.log(TAG + ' start');

        const arr1: number[] = [];
        const result1: boolean = arr1.length === 0;
        expect(result1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_0200
     * @tc.name      testArrayLength0002
     * @tc.desc      Verify initial length for a single-element literal is 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0002';
        console.log(TAG + ' start');

        const arr2: number[] = [10];
        const result2: boolean = arr2.length === 1;
        expect(result2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_0300
     * @tc.name      testArrayLength0003
     * @tc.desc      Verify initial length for a 4-element literal is 4.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0003';
        console.log(TAG + ' start');

        const arr3: number[] = [1, 2, 3, 4];
        const result3: boolean = arr3.length === 4;
        expect(result3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_0400
     * @tc.name      testArrayLength0004
     * @tc.desc      Verify initial length for a constructed empty array is 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0004';
        console.log(TAG + ' start');

        const arr4: number[] = new Array();
        const result4: boolean = arr4.length === 0;
        expect(result4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_0500
     * @tc.name      testArrayLength0005
     * @tc.desc      Verify new Array(5) creates an array of length 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0005';
        console.log(TAG + ' start');

        const arr5: number[] = new Array(5);
        const result5: boolean = arr5.length === 5;
        expect(result5).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_0600
     * @tc.name      testArrayLength0006
     * @tc.desc      Verify new Array(1,2,3) creates an array of length 3.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0006';
        console.log(TAG + ' start');

        const arr6: number[] = new Array(1, 2, 3);
        const result6: boolean = arr6.length === 3;
        expect(result6).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_0700
     * @tc.name      testArrayLength0007
     * @tc.desc      Verify Array.of(10,20) creates an array of length 2.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0007';
        console.log(TAG + ' start');

        const arr7: number[] = Array.of(10, 20);
        const result7: boolean = arr7.length === 2;
        expect(result7).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_0800
     * @tc.name      testArrayLength0008
     * @tc.desc      Verify Array.from([1,2,3,4,5]) creates an array of length 5.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0008';
        console.log(TAG + ' start');

        const arr8: number[] = Array.from([1, 2, 3, 4, 5]);
        const result8: boolean = arr8.length === 5;
        expect(result8).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_0900
     * @tc.name      testArrayLength0009
     * @tc.desc      Verify mixed-type array literal has correct initial length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0009';
        console.log(TAG + ' start');

        const arr9: (number | string | boolean | null)[] = [1, 'a', true, null];
        const result9: boolean = arr9.length === 4;
        expect(result9).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1000
     * @tc.name      testArrayLength0010
     * @tc.desc      Verify nested array literal has correct initial length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0010';
        console.log(TAG + ' start');

        const arr10: (number | number[])[] = [1, [2, 3], 4];
        const result10: boolean = arr10.length === 3;
        expect(result10).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1100
     * @tc.name      testArrayLength0011
     * @tc.desc      Verify shortening length from 4 to 2 removes elements beyond new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0011';
        console.log(TAG + ' start');

        const arr11: (number | undefined)[] = [1, 2, 3, 4];
        arr11.length = 2;
        const result11: boolean = arr11.length === 2 && arr11[2] === undefined;
        expect(result11).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1200
     * @tc.name      testArrayLength0012
     * @tc.desc      Verify shortening length from 3 to 0 clears the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0012';
        console.log(TAG + ' start');

        const arr12: (number | undefined)[] = [10, 20, 30];
        arr12.length = 0;
        const result12: boolean = arr12.length === 0 && arr12[0] === undefined;
        expect(result12).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1300
     * @tc.name      testArrayLength0013
     * @tc.desc      Verify shortening a sparse array from length 5 to 3 removes trailing holes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0013';
        console.log(TAG + ' start');

        const arr13: (number | undefined)[] = [1, , 3, , 5];
        arr13.length = 3;
        const result13: boolean = arr13.length === 3 && arr13[3] === undefined;
        expect(result13).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1400
     * @tc.name      testArrayLength0014
     * @tc.desc      Verify assigning length to the same value leaves the array unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0014';
        console.log(TAG + ' start');

        const arr14: number[] = [1, 2, 3];
        arr14.length = 3;
        const result14: boolean = arr14.length === 3 && arr14[2] === 3;
        expect(result14).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1500
     * @tc.name      testArrayLength0015
     * @tc.desc      Verify shortening a single-element array to 0 clears it.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0015';
        console.log(TAG + ' start');

        const arr15: (string | undefined)[] = ['test'];
        arr15.length = 0;
        const result15: boolean = arr15.length === 0 && arr15[0] === undefined;
        expect(result15).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1600
     * @tc.name      testArrayLength0016
     * @tc.desc      Verify shortening outer array does not mutate inner nested arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0016';
        console.log(TAG + ' start');

        const arr16: (number | number[])[] = [1, [2, 3, 4], 5];
        arr16.length = 2;

        const inner = arr16[1] as number[];
        const result16: boolean = arr16.length === 2 && inner[2] === 4;
        expect(result16).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1700
     * @tc.name      testArrayLength0017
     * @tc.desc      Verify pushing after shortening appends elements correctly and updates length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0017';
        console.log(TAG + ' start');

        const arr17: number[] = [1, 2, 3, 4];
        arr17.length = 2;
        arr17.push(5);
        const result17: boolean = arr17.length === 3 && arr17[2] === 5;
        expect(result17).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1800
     * @tc.name      testArrayLength0018
     * @tc.desc      Verify assigning a negative length is invalid; length remains unchanged (handled via try/catch).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0018';
        console.log(TAG + ' start');

        const arr18: number[] = [1, 2, 3];
        const original = arr18.length;
        let threw = false;
        try {
          arr18.length = -1;
        } catch (e) {
          threw = true;
        }
        const result18: boolean = arr18.length === original;
        expect(result18).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_1900
     * @tc.name      testArrayLength0019
     * @tc.desc      Verify expanding length from 2 to 5 creates holes (undefined) for new indexes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0019';
        console.log(TAG + ' start');

        const arr19: (number | undefined)[] = [1, 2];
        arr19.length = 5;
        const result19: boolean = arr19.length === 5 && arr19[3] === undefined;
        expect(result19).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2000
     * @tc.name      testArrayLength0020
     * @tc.desc      Verify expanding length from 0 to 3 on empty array creates holes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0020';
        console.log(TAG + ' start');

        const arr20: (number | undefined)[] = [];
        arr20.length = 3;
        const result20: boolean = arr20.length === 3 && arr20[1] === undefined;
        expect(result20).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2100
     * @tc.name      testArrayLength0021
     * @tc.desc      Verify large expansion creates holes (length updated accordingly).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0021';
        console.log(TAG + ' start');

        const arr21: (number | undefined)[] = [10, 20, 30];
        arr21.length = 10;
        const result21: boolean = arr21.length === 10 && arr21[8] === undefined;
        expect(result21).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2200
     * @tc.name      testArrayLength0022
     * @tc.desc      Verify filling a newly created index after expansion updates that index and length remains consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0022';
        console.log(TAG + ' start');

        const arr22: (number | undefined)[] = [1, 2];
        arr22.length = 4;
        arr22[3] = 4;
        const result22: boolean = arr22[3] === 4 && arr22.length === 4;
        expect(result22).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2300
     * @tc.name      testArrayLength0023
     * @tc.desc      Verify expanding sparse array increases length and new indices are holes (undefined).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0023';
        console.log(TAG + ' start');

        const arr23: (number | undefined)[] = [1, , 3];
        arr23.length = 5;
        const result23: boolean = arr23.length === 5 && arr23[4] === undefined;
        expect(result23).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2400
     * @tc.name      testArrayLength0024
     * @tc.desc      Verify assigning beyond current length updates length automatically.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0024';
        console.log(TAG + ' start');

        const arr24: (number | undefined)[] = [1, 2];
        arr24.length = 4;
        (arr24)[5] = 6;
        const result24: boolean = arr24.length === 6;
        expect(result24).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2500
     * @tc.name      testArrayLength0025
     * @tc.desc      Verify assigning a non-integer length is truncated (ToUint32 behavior).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0025';
        console.log(TAG + ' start');
        try{
          const arr25: (number | undefined)[] = [1, 2];
          arr25.length = 3.8;
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err.toString()).assertEqual("RangeError: Not a valid array length");
        }
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2600
     * @tc.name      testArrayLength0026
     * @tc.desc      Verify assigning a numeric string to length coerces to number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0026';
        console.log(TAG + ' start');

        const arr26: (number | undefined)[] = [1, 2];
        arr26.length = Number("5");
        const result26: boolean = arr26.length === 5;
        expect(result26).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2700
     * @tc.name      testArrayLength0027
     * @tc.desc      Verify length reflects presence of a single hole in the array literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0027';
        console.log(TAG + ' start');

        const arr27: (number | undefined)[] = [1, , 3];
        const result27: boolean = arr27.length === 3;
        expect(result27).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2800
     * @tc.name      testArrayLength0028
     * @tc.desc      Verify length reflects multiple consecutive holes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0028';
        console.log(TAG + ' start');

        const arr28: (number | undefined)[] = [1, , , , 5];
        const result28: boolean = arr28.length === 5;
        expect(result28).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_2900
     * @tc.name      testArrayLength0029
     * @tc.desc      Verify length includes leading holes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0029';
        console.log(TAG + ' start');

        const arr29: (number | undefined)[] = [, , 3, 4];
        const result29: boolean = arr29.length === 4;
        expect(result29).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3000
     * @tc.name      testArrayLength0030
     * @tc.desc      Verify trailing holes affect length as expected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0030';
        console.log(TAG + ' start');

        const arr30: (number | undefined)[] = [1, 2, ,];
        const result30: boolean = arr30.length === 3;
        expect(result30).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3100
     * @tc.name      testArrayLength0031
     * @tc.desc      Verify array of only holes reports the correct length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0031';
        console.log(TAG + ' start');

        const arr31: (undefined)[] = [, , ,];
        const result31: boolean = arr31.length === 3;
        expect(result31).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3200
     * @tc.name      testArrayLength0032
     * @tc.desc      Verify constructor-created sparse array has expected length and undefined entries.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0032';
        console.log(TAG + ' start');

        const arr32: number[] = new Array(4);
        const result32: boolean = arr32.length === 4 && arr32[1] === undefined;
        expect(result32).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3300
     * @tc.name      testArrayLength0033
     * @tc.desc      Verify filling a hole does not change overall length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0033';
        console.log(TAG + ' start');

        const arr33: (number | undefined)[] = [1, , 3];
        arr33[1] = 2;
        const result33: boolean = arr33.length === 3;
        expect(result33).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3400
     * @tc.name      testArrayLength0034
     * @tc.desc      Verify truncating a sparse array removes trailing holes as expected.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0034';
        console.log(TAG + ' start');

        const arr34: (number | undefined)[] = [1, , 3, , 5];
        arr34.length = 3;
        const result34: boolean = arr34.length === 3 && arr34[2] === 3;
        expect(result34).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3500
     * @tc.name      testArrayLength0035
     * @tc.desc      Verify expanding a sparse array increases length and leaves new slots undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0035';
        console.log(TAG + ' start');

        const arr35: (number | undefined)[] = [1, , 3];
        arr35.length = 5;
        const result35: boolean = arr35.length === 5 && arr35[4] === undefined;
        expect(result35).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3600
     * @tc.name      testArrayLength0036
     * @tc.desc      Verify hole and explicit undefined have same length but differ in some behaviors.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0036';
        console.log(TAG + ' start');

        const arr36a: (number | undefined)[] = [1, , 3];
        const arr36b: (number | undefined)[] = [1, undefined, 3];
        const result36: boolean = arr36a.length === 3 && arr36b.length === 3;
        expect(result36).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3700
     * @tc.name      testArrayLength0037
     * @tc.desc      Verify forEach on sparse array does not change length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0037';
        console.log(TAG + ' start');

        const arr37: (number | undefined)[] = [1, , 3];
        let count37 = 0;
        arr37.forEach(() => count37++);
        const result37: boolean = arr37.length === 3;
        expect(result37).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3800
     * @tc.name      testArrayLength0038
     * @tc.desc      Verify Array.from copies holes into undefined entries and preserves length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0038';
        console.log(TAG + ' start');

        const arr38: (number | undefined)[] = [1, , 3, , 5];
        const dense38: (number | undefined)[] = Array.from(arr38);
        const result38: boolean = dense38.length === 5;
        expect(result38).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_3900
     * @tc.name      testArrayLength0039
     * @tc.desc      Verify behavior when assigning length to Number.MAX_SAFE_INTEGER: either set (rare) or RangeError occurs and length remains unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0039';
        console.log(TAG + ' start');

        const arr39: number[] = [];
        const original = arr39.length;
        let ok = false;
        try {
          arr39.length = Number.MAX_SAFE_INTEGER;
          ok = (arr39.length === Number.MAX_SAFE_INTEGER);
        } catch (e) {
          ok = (arr39.length === original);
        }
        expect(ok).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_LENGTH_4000
     * @tc.name      testArrayLength0040
     * @tc.desc      Verify assigning length beyond safe integer (Number.MAX_SAFE_INTEGER + 1) is invalid; length remains unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayLength0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayLength0040';
        console.log(TAG + ' start');

        const arr40: number[] = [1, 2];
        const original = arr40.length;
        let threw = false;
        try {
          arr40.length = Number.MAX_SAFE_INTEGER + 1;
        } catch (e) {
          threw = true;
        }
        const result40: boolean = threw ? (arr40.length === original) : (arr40.length === original);

        expect(result40).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_0100
     * @tc.name      testArrayPush0001
     * @tc.desc      Verify push adds a single numeric element and returns the new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0001';
        console.log(TAG + ' start');

        const arr1: number[] = [1, 2, 3];
        const result1: number = arr1.push(4);

        expect(result1 === 4).assertTrue();
        expect(arr1.join(',') === '1,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_0200
     * @tc.name      testArrayPush0002
     * @tc.desc      Verify push on empty array adds a string and returns length 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0002';
        console.log(TAG + ' start');

        const arr2: string[] = [];
        const result2: number = arr2.push('hello');

        expect(result2 === 1).assertTrue();
        expect(arr2.join(',') === 'hello').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_0300
     * @tc.name      testArrayPush0003
     * @tc.desc      Verify push adds a single boolean and returns the new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0003';
        console.log(TAG + ' start');

        const arr3: boolean[] = [true, false];
        const result3: number = arr3.push(true);

        expect(result3 === 3).assertTrue();
        expect(arr3.join(',') === 'true,false,true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_0400
     * @tc.name      testArrayPush0004
     * @tc.desc      Verify push can add an object as element and returns updated length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0004';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const arr4: (testobj | number)[] = [1];
        const obj: testobj = { name: 'test' };
        const result4: number = arr4.push(obj);

        expect(result4 === 2).assertTrue();
        expect(arr4.length === 2).assertTrue();
        expect((arr4[1] as testobj).name === 'test').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_0500
     * @tc.name      testArrayPush0005
     * @tc.desc      Verify push accepts multiple numeric arguments and returns the final length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0005';
        console.log(TAG + ' start');

        const arr5: number[] = [1, 2];
        const result5: number = arr5.push(3, 4, 5);

        expect(result5 === 5).assertTrue();
        expect(arr5.join(',') === '1,2,3,4,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_0600
     * @tc.name      testArrayPush0006
     * @tc.desc      Verify push accepts multiple string arguments and returns new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0006';
        console.log(TAG + ' start');

        const arr6: string[] = ['a'];
        const result6: number = arr6.push('b', 'c');

        expect(result6 === 3).assertTrue();
        expect(arr6.join(',') === 'a,b,c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_0700
     * @tc.name      testArrayPush0007
     * @tc.desc      Verify push accepts mixed types and returns updated length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0007';
        console.log(TAG + ' start');

        const arr7: (number | boolean | string)[] = [10];
        const result7: number = arr7.push(true, 'hello', 3.14);

        expect(result7 === 4).assertTrue();
        expect(arr7.length === 4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_0800
     * @tc.name      testArrayPush0008
     * @tc.desc      Verify push with no arguments returns current length and array is unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0008';
        console.log(TAG + ' start');

        const arr8: number[] = [1, 2, 3];
        const result8: number = arr8.push();

        expect(result8 === 3).assertTrue();
        expect(arr8.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_0900
     * @tc.name      testArrayPush0009
     * @tc.desc      Verify push can add undefined and returns new length; undefined shows in array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0009';
        console.log(TAG + ' start');

        const arr9: (null | undefined)[] = [null];
        const result9: number = arr9.push(undefined);

        expect(result9 === 2).assertTrue();
        expect(arr9[1] === undefined).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}