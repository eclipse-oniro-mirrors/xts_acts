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

export default function IndexedCollections12Test() {
  describe('IndexedCollections12Test', () => {
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
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1000
     * @tc.name      testArrayPush0010
     * @tc.desc      Verify push multiple elements increases length accordingly and elements appear in order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0010';
        console.log(TAG + ' start');

        const arr10: number[] = [1];
        const result10: number = arr10.push(2, 3, 4, 5, 6);

        expect(result10 === 6).assertTrue();
        expect(arr10.join(',') === '1,2,3,4,5,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1100
     * @tc.name      testArrayPush0011
     * @tc.desc      Verify push on empty array adding zero behaves correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0011';
        console.log(TAG + ' start');

        const arr11: number[] = [];
        const result11: number = arr11.push(0);
        expect(result11 === 1).assertTrue();
        expect(arr11[0] === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1200
     * @tc.name      testArrayPush0012
     * @tc.desc      Verify push multiple strings appends them in order and returns new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0012';
        console.log(TAG + ' start');

        const arr12: string[] = ['a', 'b'];
        const result12: number = arr12.push('c', 'd', 'e');
        expect(result12 === 5).assertTrue();
        expect(arr12.join(',') === 'a,b,c,d,e').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1300
     * @tc.name      testArrayPush0013
     * @tc.desc      Verify push single numeric element appends correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0013';
        console.log(TAG + ' start');

        const arr13: number[] = [10, 20];
        const result13: number = arr13.push(30);
        expect(result13 === 3).assertTrue();
        expect(arr13.join(',') === '10,20,30').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1400
     * @tc.name      testArrayPush0014
     * @tc.desc      Verify push multiple boolean values appends them and returns new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0014';
        console.log(TAG + ' start');

        const arr14: boolean[] = [true];
        const result14: number = arr14.push(false, true);
        expect(result14 === 3).assertTrue();
        expect(arr14.join(',') === 'true,false,true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1500
     * @tc.name      testArrayPush0015
     * @tc.desc      Verify push with mixed types appends elements and returns updated length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0015';
        console.log(TAG + ' start');

        interface testobj {
          key: string
        }

        const arr15: (number | string | boolean | testobj)[] = [1, 'a'];
        const result15: number = arr15.push(true, { key: 'value' });
        expect(result15 === 4).assertTrue();
        expect(arr15.length === 4).assertTrue();
        expect((arr15[3] as testobj).key === 'value').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1600
     * @tc.name      testArrayPush0016
     * @tc.desc      Verify push appends to long arrays and last element is correct.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0016';
        console.log(TAG + ' start');

        const arr16: number[] = [1, 2, 3, 4];
        const result16: number = arr16.push(5);
        expect(result16 === 5).assertTrue();
        expect(arr16[4] === 5).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1700
     * @tc.name      testArrayPush0017
     * @tc.desc      Verify pushing multiple elements into an empty array adds them in order and returns length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0017';
        console.log(TAG + ' start');

        const arr17: number[] = [];
        const result17: number = arr17.push(1, 2, 3, 4, 5);
        expect(result17 === 5).assertTrue();
        expect(arr17.join(',') === '1,2,3,4,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1800
     * @tc.name      testArrayPush0018
     * @tc.desc      Verify push appends floating point numbers and returns new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0018';
        console.log(TAG + ' start');

        const arr18: number[] = [3.14, 2.71];
        const result18: number = arr18.push(1.618);
        expect(result18 === 3).assertTrue();
        expect(arr18.join(',') === '3.14,2.71,1.618').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_1900
     * @tc.name      testArrayPush0019
     * @tc.desc      Verify push can append an array as an element and return updated length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0019';
        console.log(TAG + ' start');

        const arr19: (number | number[])[] = [1, [2, 3]];
        const result19: number = arr19.push([4, 5]);
        expect(result19 === 3).assertTrue();
        expect(arr19.length === 3).assertTrue();
        expect(Array.isArray(arr19[2])).assertTrue();
        expect((arr19[2] as number[]).join(',') === '4,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_PUSH_2000
     * @tc.name      testArrayPush0020
     * @tc.desc      Verify push appends function elements and returns updated length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPush0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPush0020';
        console.log(TAG + ' start');

        const fn1: () => number = () => {
          return 1;
        };
        const fn2: () => number = () => {
          return 2;
        };
        const arr20: (() => number)[] = [fn1];
        const result20: number = arr20.push(fn2);
        expect(result20 === 2).assertTrue();
        expect(arr20.length === 2).assertTrue();
        expect(typeof arr20[1] === 'function').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_0100
     * @tc.name      testArrayPop0001
     * @tc.desc      Verify pop() on a non-empty numeric array returns the last element and shortens the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0001';
        console.log(TAG + ' start');

        const arr21: number[] = [1, 2, 3];
        const result21: number | undefined = arr21.pop();
        expect(result21 === 3).assertTrue();
        expect(arr21.join(',') === '1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_0200
     * @tc.name      testArrayPop0002
     * @tc.desc      Verify pop() on an empty array returns undefined and array remains empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0002';
        console.log(TAG + ' start');

        const arr22: undefined[] = [];
        const result22: undefined = arr22.pop();
        expect(result22 === undefined).assertTrue();
        expect(arr22.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_0300
     * @tc.name      testArrayPop0003
     * @tc.desc      Verify pop() on a single-element string array returns the element and empties the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0003';
        console.log(TAG + ' start');

        const arr23: string[] = ['a'];
        const result23: string | undefined = arr23.pop();
        expect(result23 === 'a').assertTrue();
        expect(arr23.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_0400
     * @tc.name      testArrayPop0004
     * @tc.desc      Verify pop() on a boolean array returns the last boolean and shortens the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0004';
        console.log(TAG + ' start');

        const arr24: boolean[] = [true, false, true];
        const result24: boolean | undefined = arr24.pop();
        expect(result24 === true).assertTrue();
        expect(arr24.join(',') === 'true,false').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_0500
     * @tc.name      testArrayPop0005
     * @tc.desc      Verify pop() on a mixed-type array returns the last element and shortens the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0005';
        console.log(TAG + ' start');

        const arr25: (number | string | boolean)[] = [1, 'a', true];
        const result25: boolean | undefined = arr25.pop() as boolean | undefined;
        expect(result25 === true).assertTrue();
        expect(arr25.join(',') === '1,a').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_0600
     * @tc.name      testArrayPop0006
     * @tc.desc      Verify pop() on a numeric array returns last number and shortens the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0006';
        console.log(TAG + ' start');

        const arr26: number[] = [10, 20, 30, 40];
        const result26: number | undefined = arr26.pop();
        expect(result26 === 40).assertTrue();
        expect(arr26.join(',') === '10,20,30').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_0700
     * @tc.name      testArrayPop0007
     * @tc.desc      Verify pop() on an array of objects returns an object and reduces length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0007';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const arr27: testobj[] = [{ name: 'test' }];
        const result27: testobj | undefined = arr27.pop();
        expect(typeof result27 === 'object').assertTrue();
        expect(arr27.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_0800
     * @tc.name      testArrayPop0008
     * @tc.desc      Verify pop() on array containing null and undefined returns undefined and leaves null.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0008';
        console.log(TAG + ' start');

        const arr28: (null | undefined)[] = [null, undefined];
        const result28: null | undefined = arr28.pop();
        expect(result28 === undefined).assertTrue();
        expect(arr28.length === 1 && arr28[0] === null).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_0900
     * @tc.name      testArrayPop0009
     * @tc.desc      Verify two consecutive pop() calls return correct second value and result array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0009';
        console.log(TAG + ' start');

        const arr29: number[] = [1, 2, 3, 4, 5];
        const first: number | undefined = arr29.pop();
        const second: number | undefined = arr29.pop();
        expect(first === 5).assertTrue();
        expect(second === 4).assertTrue();
        expect(arr29.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1000
     * @tc.name      testArrayPop0010
     * @tc.desc      Verify pop() on string array returns last string and shortens the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0010';
        console.log(TAG + ' start');

        const arr30: string[] = ['hello', 'world'];
        const result30: string | undefined = arr30.pop();
        expect(result30 === 'world').assertTrue();
        expect(arr30.join(',') === 'hello').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });


    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1100
     * @tc.name      testArrayPop0011
     * @tc.desc      Verify pop() on a single-element float array returns the float and empties the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0011';
        console.log(TAG + ' start');

        const arr31: number[] = [3.14];
        const result31: number | undefined = arr31.pop();
        expect(result31 === 3.14).assertTrue();
        expect(arr31.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1200
     * @tc.name      testArrayPop0012
     * @tc.desc      Verify pop() on array containing nested arrays returns last element and join yields flattened string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0012';
        console.log(TAG + ' start');

        const arr32: (number | number[])[] = [1, [2, 3], 4];
        const result32: number | undefined = arr32.pop() as number | undefined;
        expect(result32 === 4).assertTrue();
        expect(arr32.join(',') === '1,2,3').assertTrue(); // [1,[2,3]].join(',') -> "1,2,3"

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1300
     * @tc.name      testArrayPop0013
     * @tc.desc      Verify pop() on array of functions returns a function and reduces length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0013';
        console.log(TAG + ' start');

        const arr33: (() => number)[] = [() => {
          return 1;
        }];
        const result33: (() => number) | undefined = arr33.pop();
        expect(typeof result33 === 'function').assertTrue();
        expect(arr33.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1400
     * @tc.name      testArrayPop0014
     * @tc.desc      Verify pop() handles zero as a normal numeric element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0014';
        console.log(TAG + ' start');

        const arr34: number[] = [0, 1, 2];
        const result34: number | undefined = arr34.pop();
        expect(result34 === 2).assertTrue();
        expect(arr34.join(',') === '0,1').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1500
     * @tc.name      testArrayPop0015
     * @tc.desc      Verify popping twice from a single-element array returns undefined the second time and array remains empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0015';
        console.log(TAG + ' start');

        const arr35: number[] = [1];
        const first: number | undefined = arr35.pop();
        const second: number | undefined = arr35.pop();
        expect(first === 1).assertTrue();
        expect(second === undefined).assertTrue();
        expect(arr35.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1600
     * @tc.name      testArrayPop0016
     * @tc.desc      Verify pop() on a longer string array returns last and shortens correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0016';
        console.log(TAG + ' start');

        const arr36: string[] = ['a', 'b', 'c', 'd'];
        const result36: string | undefined = arr36.pop();
        expect(result36 === 'd').assertTrue();
        expect(arr36.join(',') === 'a,b,c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1700
     * @tc.name      testArrayPop0017
     * @tc.desc      Verify pop() on a single boolean element returns the boolean and empties the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0017';
        console.log(TAG + ' start');

        const arr37: boolean[] = [true];
        const result37: boolean | undefined = arr37.pop();
        expect(result37 === true).assertTrue();
        expect(arr37.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1800
     * @tc.name      testArrayPop0018
     * @tc.desc      Verify pop() returns last element for large numeric arrays and shortens correctly.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0018';
        console.log(TAG + ' start');

        const arr38: number[] = [100, 200, 300];
        const result38: number | undefined = arr38.pop();
        expect(result38 === 300).assertTrue();
        expect(arr38.join(',') === '100,200').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_1900
     * @tc.name      testArrayPop0019
     * @tc.desc      Verify pop() on single-null-element array returns null and empties the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0019';
        console.log(TAG + ' start');

        const arr39: (null)[] = [null];
        const result39: null | undefined = arr39.pop();
        expect(result39 === null).assertTrue();
        expect(arr39.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_POP_2000
     * @tc.name      testArrayPop0020
     * @tc.desc      Verify pop() on an array with single undefined element returns undefined and empties the array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayPop0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayPop0020';
        console.log(TAG + ' start');

        const arr40: (undefined)[] = [undefined];
        const result40: undefined = arr40.pop() as undefined;
        expect(result40 === undefined).assertTrue();
        expect(arr40.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_0100
     * @tc.name      testArrayUnshift0001
     * @tc.desc      Verify unshift adds single number to the beginning and returns new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0001';
        console.log(TAG + ' start');

        const arr41: number[] = [2, 3, 4];
        const result41: number = arr41.unshift(1);
        expect(result41 === 4 && arr41.join(',') === '1,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_0200
     * @tc.name      testArrayUnshift0002
     * @tc.desc      Verify unshift on empty array adds element and returns length 1.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0002';
        console.log(TAG + ' start');

        const arr42: string[] = [];
        const result42: number = arr42.unshift('first');
        expect(result42 === 1 && arr42.join(',') === 'first').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_0300
     * @tc.name      testArrayUnshift0003
     * @tc.desc      Verify unshift adds boolean to the beginning and returns new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0003';
        console.log(TAG + ' start');

        const arr43: boolean[] = [true, false];
        const result43: number = arr43.unshift(false);
        expect(result43 === 3 && arr43.join(',') === 'false,true,false').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_0400
     * @tc.name      testArrayUnshift0004
     * @tc.desc      Verify unshift can add multiple numbers to the beginning and returns updated length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0004';
        console.log(TAG + ' start');

        const arr44: number[] = [1, 2];
        const result44: number = arr44.unshift(3, 4, 0);
        expect(result44 === 5 && arr44.join(',') === '3,4,0,1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_0500
     * @tc.name      testArrayUnshift0005
     * @tc.desc      Verify unshift adds a single string to the beginning and returns the new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0005';
        console.log(TAG + ' start');

        const arr45: string[] = ['b', 'c'];
        const result45: number = arr45.unshift('a');
        expect(result45 === 3 && arr45.join(',') === 'a,b,c').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_0600
     * @tc.name      testArrayUnshift0006
     * @tc.desc      Verify unshift adds multiple strings to the beginning and returns updated length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0006';
        console.log(TAG + ' start');

        const arr46: string[] = ['d'];
        const result46: number = arr46.unshift('a', 'b', 'c');
        expect(result46 === 4 && arr46.join(',') === 'a,b,c,d').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_0700
     * @tc.name      testArrayUnshift0007
     * @tc.desc      Verify unshift adds mixed types and returns new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0007';
        console.log(TAG + ' start');

        interface testobj {
          key: string
        }

        const arr47: (boolean | testobj | number | string)[] = [1, 'a'];
        const result47: number = arr47.unshift(true, { key: 'value' } as testobj);
        console.log('unshift mixed types returns: ' + result47 + ', length: ' + arr47.length);
        expect(result47 === 4 && arr47.length === 4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_0800
     * @tc.name      testArrayUnshift0008
     * @tc.desc      Verify unshift with no arguments returns current length and array remains unchanged.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0008';
        console.log(TAG + ' start');

        const arr48: number[] = [1, 2, 3];
        const result48: number = arr48.unshift();

        expect(result48 === 3 && arr48.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_0900
     * @tc.name      testArrayUnshift0009
     * @tc.desc      Array Unshift index 0.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0009';
        console.log(TAG + ' start');

        const arr49: number[] = [10, 20];
        const result49: number = arr49.unshift(5);

        expect(result49 === 3 && arr49.join(',') === '5,10,20').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1000
     * @tc.name      testArrayUnshift0010
     * @tc.desc      Verify unshift can add multiple boolean values and returns correct length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0010';
        console.log(TAG + ' start');

        const arr50: boolean[] = [true];
        const result50: number = arr50.unshift(false, true);
        expect(result50 === 3 && arr50.join(',') === 'false,true,true').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1100
     * @tc.name      testArrayUnshift0011
     * @tc.desc      Verify unshift adding undefined yields undefined at index 0 and returns new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0011';
        console.log(TAG + ' start');

        const arr51: (undefined | null)[] = [null];
        const result51: number = arr51.unshift(undefined);
        expect(result51 === 2 && arr51[0] === undefined && arr51[1] === null).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1200
     * @tc.name      testArrayUnshift0012
     * @tc.desc      Verify Array Unshift Test.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0012';
        console.log(TAG + ' start');

        const arr52: number[] = [1, 2, 3, 4];
        const result52: number = arr52.unshift(0);
        expect(result52 === 5 && arr52[0] === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1300
     * @tc.name      testArrayUnshift0013
     * @tc.desc      Verify unshift adding multiple elements to empty array returns correct length and elements order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0013';
        console.log(TAG + ' start');

        const arr53: number[] = [];
        const result53: number = arr53.unshift(1, 2, 3, 4, 5);
        expect(result53 === 5 && arr53.join(',') === '1,2,3,4,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1400
     * @tc.name      testArrayUnshift0014
     * @tc.desc      Verify unshift accepts floating point numbers and returns updated length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0014';
        console.log(TAG + ' start');

        const arr54: number[] = [3.14, 2.71];
        const result54: number = arr54.unshift(1.618);
        expect(result54 === 3 && arr54.join(',') === '1.618,3.14,2.71').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1500
     * @tc.name      testArrayUnshift0015
     * @tc.desc      Verify unshift can add an array element (nested array) and updates the length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0015';
        console.log(TAG + ' start');

        const arr55: (number[] | number)[] = [1, [2, 3]];
        const result55: number = arr55.unshift([0]);
        expect(result55 === 3 && arr55.length === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1600
     * @tc.name      testArrayUnshift0016
     * @tc.desc      Verify unshift can add function elements and returns new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0016';
        console.log(TAG + ' start');

        const arr56: (() => number)[] = [() => {
          return 2;
        }];
        const result56: number = arr56.unshift(() => {
          return 1;
        });

        expect(result56 === 2 && arr56.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1700
     * @tc.name      testArrayUnshift0017
     * @tc.desc      Verify unshift adds a string to the beginning and updates length and content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0017';
        console.log(TAG + ' start');

        const arr57: string[] = ['world'];
        const result57: number = arr57.unshift('hello');
        expect(result57 === 2 && arr57.join(',') === 'hello,world').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1800
     * @tc.name      testArrayUnshift0018
     * @tc.desc      Verify unshift can add multiple numeric values and maintains order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0018';
        console.log(TAG + ' start');

        const arr58: number[] = [2, 3];
        const result58: number = arr58.unshift(0, 1);
        expect(result58 === 4 && arr58.join(',') === '0,1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_1900
     * @tc.name      testArrayUnshift0019
     * @tc.desc      Verify unshift adds objects properly and returns updated length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0019';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const arr59: testobj[] = [{ name: 'second' }];
        const result59: number = arr59.unshift({ name: 'first' });
        expect(result59 === 2 && arr59.length === 2 && arr59[0].name === 'first').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_UNSHIFT_2000
     * @tc.name      testArrayUnshift0020
     * @tc.desc      Verify unshift adds multiple numbers at the beginning and returns the new length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayUnshift0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayUnshift0020';
        console.log(TAG + ' start');

        const arr60: number[] = [100];
        const result60: number = arr60.unshift(50, 75);
        const contentOk: boolean = (arr60.length === 3) && arr60[0] === 50 && arr60[1] === 75 && arr60[2] === 100;

        expect(result60 === 3).assertTrue();
        expect(contentOk).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });


    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_0100
     * @tc.name      testArrayShift0001
     * @tc.desc      Verify shift on non-empty numeric array returns first element and mutates array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0001';
        console.log(TAG + ' start');

        const arr61: number[] = [1, 2, 3];
        const result61: number | undefined = arr61.shift();
        expect(result61 === 1).assertTrue();
        expect(arr61.length === 2 && arr61[0] === 2 && arr61[1] === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_0200
     * @tc.name      testArrayShift0002
     * @tc.desc      Verify shift on empty array returns undefined and array remains empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0002';
        console.log(TAG + ' start');

        const arr62: undefined[] = [];
        const result62: undefined = arr62.shift() as undefined;
        expect(result62 === undefined).assertTrue();
        expect(arr62.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_0300
     * @tc.name      testArrayShift0003
     * @tc.desc      Verify shift on single-element string array returns the element and leaves array empty.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0003';
        console.log(TAG + ' start');

        const arr63: string[] = ['a'];
        const result63: string | undefined = arr63.shift();

        expect(result63 === 'a').assertTrue();
        expect(arr63.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_0400
     * @tc.name      testArrayShift0004
     * @tc.desc      Verify shift on boolean array returns first boolean and updates content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0004';
        console.log(TAG + ' start');

        const arr64: boolean[] = [true, false, true];
        const result64: boolean | undefined = arr64.shift();
        expect(result64 === true).assertTrue();
        expect(arr64.length === 2 && arr64[0] === false && arr64[1] === true).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_0500
     * @tc.name      testArrayShift0005
     * @tc.desc      Verify shift on mixed-type array returns the first element and shifts remaining elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0005';
        console.log(TAG + ' start');

        const arr65: (number | string | boolean)[] = [1, 'a', true];
        const result65: number | undefined = arr65.shift() as number | undefined;
        expect(result65 === 1).assertTrue();
        expect(arr65.length === 2 && arr65[0] === 'a' && arr65[1] === true).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_0600
     * @tc.name      testArrayShift0006
     * @tc.desc      Verify shift on numeric array returns first number and shifts the rest.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0006';
        console.log(TAG + ' start');

        const arr66: number[] = [10, 20, 30, 40];
        const result66: number | undefined = arr66.shift();
        expect(result66 === 10).assertTrue();
        expect(JSON.stringify(arr66) === JSON.stringify([20, 30, 40])).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_0700
     * @tc.name      testArrayShift0007
     * @tc.desc      Verify shift on object array returns an object (typeof 'object') and reduces length by one.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0007';
        console.log(TAG + ' start');

        interface testobj {
          name: string
        }

        const arr67: testobj[] = [{ name: 'first' }, { name: 'second' }];
        const result67: testobj | undefined = arr67.shift();
        expect(typeof result67 === 'object').assertTrue();
        expect(arr67.length === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_0800
     * @tc.name      testArrayShift0008
     * @tc.desc      Verify shift returns null when first element is null and rest elements move left.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0008';
        console.log(TAG + ' start');

        const arr68: (null | undefined | number)[] = [null, undefined, 1];
        const result68: null | undefined = arr68.shift() as null | undefined;
        expect(result68 === null).assertTrue();
        expect(arr68.length === 2 && arr68[0] === undefined && arr68[1] === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_0900
     * @tc.name      testArrayShift0009
     * @tc.desc      Verify two consecutive shifts return appropriate values and leave remaining elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0009';
        console.log(TAG + ' start');

        const arr69: number[] = [1, 2, 3, 4, 5];
        const first: number | undefined = arr69.shift();
        const second: number | undefined = arr69.shift();
        expect(second === 2).assertTrue();
        expect(JSON.stringify(arr69) === JSON.stringify([3, 4, 5])).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_SHIFT_1000
     * @tc.name      testArrayShift0010
     * @tc.desc      Verify shift on string array returns the first string and leaves remaining strings.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayShift0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayShift0010';
        console.log(TAG + ' start');

        const arr70: string[] = ['hello', 'world', 'test'];
        const result70: string | undefined = arr70.shift();

        expect(result70 === 'hello').assertTrue();
        expect(arr70.length === 2 && arr70[0] === 'world' && arr70[1] === 'test').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_0100
     * @tc.name      testArrayMutate0001
     * @tc.desc      Verify that after popping all elements from [1,2,3], pushing 4 returns 1 and array becomes [4].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0001';
        console.log(TAG + ' start');

        const arr71: number[] = [1, 2, 3];
        arr71.pop();
        arr71.pop();
        arr71.pop();
        const result71: number = arr71.push(4);
        expect(result71 === 1).assertTrue();
        expect(arr71.length === 1 && arr71[0] === 4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_0200
     * @tc.name      testArrayMutate0002
     * @tc.desc      Verify pushing 1 then 2 and popping returns 2 and leaves [1].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0002';
        console.log(TAG + ' start');

        const arr72: number[] = [];
        arr72.push(1);
        arr72.push(2);
        const result72: number | undefined = arr72.pop();
        expect(result72 === 2).assertTrue();
        expect(arr72.length === 1 && arr72[0] === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_0300
     * @tc.name      testArrayMutate0003
     * @tc.desc      Verify mixed operations shift -> unshift -> push produce expected array [0,2,3].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0003';
        console.log(TAG + ' start');

        const arr73: number[] = [1, 2];
        arr73.shift();
        arr73.unshift(0);
        arr73.push(3);

        expect(arr73.length === 3 && arr73[0] === 0 && arr73[1] === 2 && arr73[2] === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_0400
     * @tc.name      testArrayMutate0004
     * @tc.desc      Verify popping twice from [1] yields second pop undefined and pushing 2 results in [2].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0004';
        console.log(TAG + ' start');

        const arr74: number[] = [1];
        const firstPop: number | undefined = arr74.pop();
        const secondPop: number | undefined = arr74.pop();
        arr74.push(2);

        expect(secondPop === undefined).assertTrue();
        expect(arr74.length === 1 && arr74[0] === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_0500
     * @tc.name      testArrayMutate0005
     * @tc.desc      Verify mixed operations shift -> pop -> unshift -> push result in [0,2,3,5].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0005';
        console.log(TAG + ' start');

        const arr75: number[] = [1, 2, 3, 4];
        arr75.shift();
        arr75.pop();
        arr75.unshift(0);
        arr75.push(5);

        expect(arr75.length === 4 && arr75.join(',') === '0,2,3,5').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_0600
     * @tc.name      testArrayMutate0006
     * @tc.desc      Verify consecutive unshift then shift returns 2 and leaves [1].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0006';
        console.log(TAG + ' start');

        const arr76: number[] = [];
        arr76.unshift(1);
        arr76.unshift(2);
        const result76: number | undefined = arr76.shift();

        expect(result76 === 2).assertTrue();
        expect(arr76.length === 1 && arr76[0] === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_0700
     * @tc.name      testArrayMutate0007
     * @tc.desc      Verify push -> pop -> shift -> unshift sequence yields [0,2,3,4] for initial [1,2,3].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0007';
        console.log(TAG + ' start');

        const arr77: number[] = [1, 2, 3];
        arr77.push(4, 5);
        arr77.pop();
        arr77.shift();
        arr77.unshift(0);

        expect(arr77.join(',') === '0,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_0800
     * @tc.name      testArrayMutate0008
     * @tc.desc      Verify mixed operations produce final array [5,20] and last pop returned 30.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0008';
        console.log(TAG + ' start');

        const arr78: number[] = [10, 20];
        const firstShift: number | undefined = arr78.shift();
        arr78.push(30);
        const lastPop: number | undefined = arr78.pop();
        arr78.unshift(5);

        expect(lastPop === 30).assertTrue();
        expect(arr78.join(',') === '5,20').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_0900
     * @tc.name      testArrayMutate0009
     * @tc.desc      Verify that sequence unshift->push->shift->pop on [1,2] results back to [1,2].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0009';
        console.log(TAG + ' start');

        const arr79: number[] = [1, 2];
        arr79.unshift(0);
        arr79.push(3);
        arr79.shift();
        arr79.pop();

        expect(arr79.join(',') === '1,2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_MUTATE_1000
     * @tc.name      testArrayMutate0010
     * @tc.desc      Verify full cycle operations on empty array yield push(3,4) returns 2 and array [3,4].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMutate0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayMutate0010';
        console.log(TAG + ' start');

        const arr80: number[] = [];
        arr80.push(1);
        arr80.shift();
        arr80.unshift(2);
        arr80.pop();
        const result80: number = arr80.push(3, 4);
        expect(result80 === 2).assertTrue();
        expect(arr80.join(',') === '3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });
  })
}