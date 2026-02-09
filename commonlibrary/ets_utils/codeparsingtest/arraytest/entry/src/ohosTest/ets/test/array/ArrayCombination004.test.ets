/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size} from '@ohos/hypium';
import { ArrayCombinationTest4Js149,
  ArrayCombinationTest4Js150,
  ArrayCombinationTest4Js151,
  ArrayCombinationTest4Js152,
  ArrayCombinationTest4Js153,
  ArrayCombinationTest4Js154,
  ArrayCombinationTest4Js155,
  ArrayCombinationTest4Js156,
  ArrayCombinationTest4Js157,
  ArrayCombinationTest4Js158,
  ArrayCombinationTest4Js159,
  ArrayCombinationTest4Js160
} from './ArrayCombinationJs.test';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

interface A {
  x: number;
}

export default function ArrayCombinationTest4() {
  describe('ArrayCombinationTest4', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   ArrayCombinationTest4001
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4001
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4001';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      arr.push(1);
      arr.map(x => x * 2);
      expect(arr).assertDeepEquals([1]);

      const ta = new Int8Array([]);
      expect(Array.from(ta)).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4002
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4002
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4002';
      console.info(`${caseName}, test start`);
      const arr = [42];
      const p = arr.pop();
      arr.fill(0);
      expect(arr).assertDeepEquals([]);
      expect(p).assertEqual(42);

      const ta = new Int8Array([42]);
      const v = ta[0];
      ta.fill(0);
      expect(Array.from(ta)).assertDeepEquals([0]);
      expect(v).assertEqual(42);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4003
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4003
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4003';
      console.info(`${caseName}, test start`);
      const arr = [NaN, 2, 1];
      arr.sort().reverse();
      expect(arr.length).assertEqual(3);
      expect(isNaN(arr[0])).assertEqual(true);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1)

      const ta = new Int8Array([3,1,2]);
      ta.sort().reverse();
      expect(Array.from(ta)).assertDeepEquals([3,2,1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4004
     * @tc.number ArrayCombinationTest4004
     * @tc.desc   ArrayCombinationTest4004
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4004';
      console.info(`${caseName}, test start`);
      const arr = new Array<number>(3);
      expect(arr.length).assertEqual(3);
      arr.forEach((v,i,a)=>{ a[i]=i; });
      arr.push(3);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(3);

      const ta = new Int8Array([0,0,0]);
      ta.forEach((v,i,a)=>{ a[i]=i; });
      expect(Array.from(ta)).assertDeepEquals([0,1,2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4005
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4005
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4005';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.slice(-2).fill(9);
      expect(arr).assertDeepEquals([1,2,3,4]);

      const ta = new Int8Array([1,2,3,4]);
      ta.subarray(-2).fill(9);
      expect(Array.from(ta)).assertDeepEquals([1,2,9,9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4006
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4006
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4006';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.map((v,i,a)=>{ if(i===0) a.push(4); return v*2; });
      expect(arr).assertDeepEquals([1,2,3,4]);

      const ta = new Int8Array([1,2,3]);
      ta.map(v=>v*2);
      expect(Array.from(ta)).assertDeepEquals([1,2,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4007
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4007
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4007';
      console.info(`${caseName}, test start`);
      const obj1: A = {x:1}, obj2:A = {x:2};
      const arr = [obj1].concat([obj2]);
      arr.fill({x:9});
      expect(arr).assertDeepEquals([{x:9},{x:9}]);

      const ta = new Int8Array([1,2]);
      ta.fill(9);
      expect(Array.from(ta)).assertDeepEquals([9,9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4008
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4008
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4008';
      console.info(`${caseName}, test start`);
      const arr = [1,"1",true];
      const r1 = arr.includes("1");
      const p = arr.pop();
      expect(r1).assertEqual(true);
      expect(arr).assertDeepEquals([1,"1"]);

      const ta = new Int8Array([1,2]);
      const r2 = ta.includes(2);
      const v = ta[ta.length-1];
      expect(r2).assertEqual(true);
      expect(Array.from(ta)).assertDeepEquals([1,2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4009
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4009
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4009';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.push(4);
      arr.pop();
      arr.reverse();
      expect(arr).assertDeepEquals([3,2,1]);

      const ta = new Int8Array([1,2,3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3,2,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4010
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4010
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4010';
      console.info(`${caseName}, test start`);
      const arr : Array<number> = [];
      let errorCaught = false;
      try { arr.reduce((a,b)=>a+b); } catch(e) { errorCaught = true; }
      arr.fill(0);
      expect(errorCaught).assertEqual(true);
      expect(arr).assertDeepEquals([]);

      const ta = new Int8Array([]);
      expect(Array.from(ta)).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4011
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4011
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4011';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.splice(10,1).push(4);
      expect(arr).assertDeepEquals([1,2,3]);

      const ta = new Int8Array([1,2,3]);
      expect(Array.from(ta)).assertDeepEquals([1,2,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4012
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4012
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4012';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.copyWithin(0,10).fill(9,1,3);
      expect(arr).assertDeepEquals([1,9,9,4]);

      const ta = new Int8Array([1,2,3,4]);
      ta.copyWithin(0,10).fill(9,1,3);
      expect(Array.from(ta)).assertDeepEquals([1,9,9,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4013
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4013
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4013';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.slice(10).reverse();
      expect(arr).assertDeepEquals([1,2,3]);

      const ta = new Int8Array([1,2,3]);
      ta.subarray(10).reverse();
      expect(Array.from(ta)).assertDeepEquals([1,2,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4014
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4014
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4014';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      let errorCaught = false;
      try { arr.map((v,i,a)=>{ if(i===1) throw new Error("oops"); return v*2; }); } catch(e) { errorCaught = true; }
      arr.push(4);
      expect(errorCaught).assertEqual(true);
      expect(arr).assertDeepEquals([1,2,3,4]);

      const ta = new Int8Array([1,2,3]);
      ta.map(v=>v*2);
      expect(Array.from(ta)).assertDeepEquals([1,2,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4015
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4015
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4015';
      console.info(`${caseName}, test start`);
      const arr = new Array<number>(5);
      arr.fill(1);
      arr.reverse();
      expect(arr).assertDeepEquals([1,1,1,1,1]);

      const ta = new Int8Array(5);
      ta.fill(1).reverse();
      expect(Array.from(ta)).assertDeepEquals([1,1,1,1,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4016
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4016
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4016';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.reduceRight((acc,v,i,a)=>{ a[i]=v*2; return acc+v; },0);
      expect(arr).assertDeepEquals([2,4,6]);

      const ta = new Int8Array([1,2,3]);
      ta.reduceRight((acc,v,i,a)=>{ return acc+v; },0);
      expect(Array.from(ta)).assertDeepEquals([1,2,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4017
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4017
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4017';
      console.info(`${caseName}, test start`);
      const arr = [[1,2],[3,4]];
      arr.flat().fill(9,1,3);
      expect(arr).assertDeepEquals([[1,2],[3,4]]);

      const ta = new Int8Array([1,2,3,4]);
      ta.fill(9,1,3);
      expect(Array.from(ta)).assertDeepEquals([1,9,9,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4018
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4018
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4018';
      console.info(`${caseName}, test start`);
      const arr = [1];
      arr.push(2);
      arr.push(3);
      arr.pop();
      expect(arr).assertDeepEquals([1,2]);

      const ta = new Int8Array([1,2]);
      expect(Array.from(ta)).assertDeepEquals([1,2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4019
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4019
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4019';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      const r = arr.includes(2);
      arr.reverse().fill(0,1);
      expect(r).assertEqual(true);
      expect(arr).assertDeepEquals([3,0,0]);

      const ta = new Int8Array([1,2,3]);
      const r2 = ta.includes(2);
      ta.reverse().fill(0,1);
      expect(r2).assertEqual(true);
      expect(Array.from(ta)).assertDeepEquals([3,0,0]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4020
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4020
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4020';
      console.info(`${caseName}, test start`);
      const ta = new Int8Array([1,2,3,4]);
      ta.copyWithin(0,10);
      expect(Array.from(ta)).assertDeepEquals([1,2,3,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4021
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4021
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4021';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.splice(10,2,9,9).fill(0,1);
      expect(arr).assertDeepEquals([1,2,3,9,9]);

      const ta = new Int8Array([1,2,3]);
      ta.fill(0,1);
      expect(Array.from(ta)).assertDeepEquals([1,0,0]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4022
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4022
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4022';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.splice(1,2,9).reverse().push(5);
      expect(arr).assertDeepEquals([1,9,4]);

      const ta = new Int8Array([1,2,3,4]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([4,3,2,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4023
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4023
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4023';
      console.info(`${caseName}, test start`);
      const arr = [3,1,2];
      arr.sort().push(4);
      arr.pop();
      expect(arr).assertDeepEquals([1,2,3]);

      const ta = new Int8Array([3,1,2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1,2,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4024
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4024
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4024';
      console.info(`${caseName}, test start`);
      const arr = [4,2,3,1];
      arr.sort().fill(0,1,3);
      expect(arr).assertDeepEquals([1,0,0,4]);

      const ta = new Int8Array([4,2,3,1]);
      ta.sort();
      ta.fill(0,1,3);
      expect(Array.from(ta)).assertDeepEquals([1,0,0,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4025
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4025
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4025';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.copyWithin(0,2).splice(1,1,9);
      expect(arr).assertDeepEquals([3,9,3,4]);

      const ta = new Int8Array([1,2,3,4]);
      ta.copyWithin(0,2);
      expect(Array.from(ta)).assertDeepEquals([3,4,3,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4026
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4026
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4026';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.copyWithin(0,2).reverse();
      expect(arr).assertDeepEquals([4,3,4,3]);

      const ta = new Int8Array([1,2,3,4]);
      ta.copyWithin(0,2).reverse();
      expect(Array.from(ta)).assertDeepEquals([4,3,4,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4027
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4027
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4027';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.copyWithin(0,2).fill(9,1,3);
      expect(arr).assertDeepEquals([3,9,9,4]);

      const ta = new Int8Array([1,2,3,4]);
      ta.copyWithin(0,2).fill(9,1,3);
      expect(Array.from(ta)).assertDeepEquals([3,9,9,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4028
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4028
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4028';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.splice(-2,1,9).push(5);
      expect(arr).assertDeepEquals([1,2,9,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4029
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4029
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4029';
      console.info(`${caseName}, test start`);
      const arr = [-2,3,0,1];
      arr.sort((a,b)=>a-b);
      expect(arr).assertDeepEquals([-2,0,1,3]);

      const ta = new Int8Array([-2,3,0,1]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([-2,0,1,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4030
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4030
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4030';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      arr.splice(0,1,9);
      expect(arr).assertDeepEquals([9]);

      const ta = new Int8Array([]);
      expect(Array.from(ta)).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4031
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4031
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4031';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.fill(NaN,1,3).push(4);
      expect(arr.length).assertEqual(4);
      expect(isNaN(arr[1])).assertEqual(true);
      expect(isNaN(arr[2])).assertEqual(true);
      expect(arr[0]).assertEqual(1);
      expect(arr[3]).assertEqual(4)
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4032
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4032
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4032';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.fill(Infinity,1,3);
      const p = arr.pop();
      expect(arr).assertDeepEquals([1,Infinity]);
      expect(p).assertEqual(Infinity);

      const ta = new Int8Array([1,2,3]);
      ta.fill(127,1,3);
      const last = ta[ta.length-1];
      expect(Array.from(ta)).assertDeepEquals([1,127,127]);
      expect(last).assertEqual(127);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4033
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4033
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4033';
      console.info(`${caseName}, test start`);
      const arr = [1,-2,3,4];
      arr.fill(-9,1,3);
      const s = arr.shift();
      expect(arr).assertDeepEquals([-9,-9,4]);
      expect(s).assertEqual(1);

      const ta = new Int8Array([1,-2,3,4]);
      ta.fill(-9,1,3);
      const first = ta[0];
      expect(Array.from(ta)).assertDeepEquals([1,-9,-9,4]);
      expect(first).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4034
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4034
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4034';
      console.info(`${caseName}, test start`);
      const arr = new Array<number>(3);
      arr.fill(0).unshift(1);
      expect(arr).assertDeepEquals([1,0,0,0]);

      const ta = new Int8Array(3);
      ta.fill(1);
      expect(Array.from(ta)).assertDeepEquals([1,1,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4035
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4035
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4035';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.fill(9).splice(1,1,5);
      expect(arr).assertDeepEquals([9,5,9]);

      const ta = new Int8Array([1,2,3]);
      ta.fill(9,0,3);
      expect(Array.from(ta)).assertDeepEquals([9,9,9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4036
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4036
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4036';
      console.info(`${caseName}, test start`);
      const arr: Array<number|boolean|string> = [1,"2",true];
      arr.fill("x",1).reverse();
      expect(arr).assertDeepEquals(["x","x",1]);

      const ta = new Int8Array([1,2,3]);
      ta.fill(9,1,3).reverse();
      expect(Array.from(ta)).assertDeepEquals([9,9,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4037
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4037
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4037';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.fill(NaN,1,3).copyWithin(0,2);
      expect(arr.length).assertEqual(4);
      expect(isNaN(arr[0])).assertEqual(true);
      expect(isNaN(arr[2])).assertEqual(true);
      expect(arr[1]).assertEqual(4);
      expect(arr[3]).assertEqual(4);

      const ta = new Int8Array([1,2,3,4]);
      ta.fill(9,1,3).copyWithin(0,2);
      expect(Array.from(ta)).assertDeepEquals([9,4,9,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4038
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4038
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4038';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.fill(Infinity,1,3).fill(0,2);
      expect(arr).assertDeepEquals([1,Infinity,0,0]);

      const ta = new Int8Array([1,2,3,4]);
      ta.fill(127,1,3).fill(0,2);
      expect(Array.from(ta)).assertDeepEquals([1,127,0,0]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4039
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4039
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4039';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.fill(9,1,3).map((v,i,a)=>{ if(i===0) a.push(4); return v; });
      expect(arr).assertDeepEquals([1,9,9,4]);

      const ta = new Int8Array([1,2,3]);
      ta.fill(9,1,3).map(v=>v*2);
      expect(Array.from(ta)).assertDeepEquals([1,9,9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4040
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4040
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4040';
      console.info(`${caseName}, test start`);
      const arr = new Array<number>(4);
      arr.fill(-1,1,3).pop();
      expect(arr).assertDeepEquals([undefined,-1,-1]);

      const ta = new Int8Array([1,2,3,4]);
      ta.fill(-9,1,3);
      const last = ta[ta.length-1];
      expect(Array.from(ta)).assertDeepEquals([1,-9,-9,4]);
      expect(last).assertEqual(4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4041
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4041
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4041';
      console.info(`${caseName}, test start`);
      const arr = [-1,2,-3];
      arr.push(-4);
      arr.pop();
      expect(arr).assertDeepEquals([-1,2,-3]);

      const ta = new Int8Array([-1,2,-3]);
      expect(Array.from(ta)).assertDeepEquals([-1,2,-3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4042
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4042
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4042';
      console.info(`${caseName}, test start`);
      const arr = new Array<number>(3);
      arr.push(1);
      arr.shift();
      expect(arr.length).assertEqual(3);
      expect(arr).assertDeepEquals([undefined,undefined,1]);

      const ta = new Int8Array(3);
      expect(Array.from(ta)).assertDeepEquals([0,0,0]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4043
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4043
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4043';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.unshift(0);
      arr.pop();
      arr.fill(9,1,3);
      expect(arr).assertDeepEquals([0,9,9]);

      const ta = new Int8Array([1,2,3]);
      ta.fill(9,1,3);
      expect(Array.from(ta)).assertDeepEquals([1,9,9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4044
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4044
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4044';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.splice(-2,1,9).push(5);
      expect(arr).assertDeepEquals([1,2,9,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4045
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4045
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4045';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      arr.splice(1,1,9).map((v,i,a)=>{ if(i===0) a.push(4); return v; });
      expect(arr).assertDeepEquals([1,9,3]);

      const ta = new Int8Array([1,2,3]);
      ta.fill(9,0,3);
      expect(Array.from(ta)).assertDeepEquals([9,9,9]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4046
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4046
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4046';
      console.info(`${caseName}, test start`);
      const arr = [3,1,NaN,2];
      arr.sort().push(4);
      expect(JSON.stringify(arr)).assertDeepEquals("[1,2,3,null,4]");

      const ta = new Int8Array([3,1,2]);
      ta.sort();
      expect(Array.from(ta)).assertDeepEquals([1,2,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4047
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4047
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4047';
      console.info(`${caseName}, test start`);
      const arr = [-2,3,0,1];
      arr.sort((a,b)=>a-b).reverse();
      expect(arr).assertDeepEquals([3,1,0,-2]);

      const ta = new Int8Array([-2,3,0,1]);
      ta.sort();
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3,1,0,-2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4048
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4048
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4048';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.copyWithin(0,2).push(NaN);
      expect(JSON.stringify(arr)).assertDeepEquals("[3,4,3,4,null]");

      const ta = new Int8Array([1,2,3,4]);
      ta.copyWithin(0,2);
      expect(Array.from(ta)).assertDeepEquals([3,4,3,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4049
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4049
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4049';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4];
      arr.copyWithin(-3,1).fill(9,1,3);
      expect(arr).assertDeepEquals([1,9,9,4]);

      const ta = new Int8Array([1,2,3,4]);
      ta.copyWithin(0,1).fill(9,1,3);
      expect(Array.from(ta)).assertDeepEquals([2,9,9,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4050
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4050
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4050';
      console.info(`${caseName}, test start`);
      const arr = new Array<number>(3);
      arr.fill(0).pop();
      arr.push(5);
      expect(arr).assertDeepEquals([0,0,5]);

      const ta = new Int8Array(3);
      ta.fill(1);
      expect(Array.from(ta)).assertDeepEquals([1,1,1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4051
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4051
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4051';
      console.info(`${caseName}, test start`);
      const arr = [[1,2],[3,4]];
      arr.push([5,6]);
      const sum = arr.flat().reduce((a,b)=>a+b,0);
      expect(sum).assertEqual(21);

      const ta = new Int8Array([1,2,3]);
      const total = ta.reduce((a,b)=>a+b,0);
      expect(total).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4052
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4052
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4052';
      console.info(`${caseName}, test start`);
      const arr = [[1,2],[3,4]];
      arr.pop();
      const allNum = arr.flat().every(x=>typeof x === 'number');
      expect(allNum).assertEqual(true);

      const ta = new Int8Array([1,2,3]);
      const result = ta.every(x=>x>0);
      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4053
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4053
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4053';
      console.info(`${caseName}, test start`);
      const arr = [[1,2],[3,4]];
      arr.shift();
      const has3 = arr.flat().some(x=>x===3);
      expect(has3).assertEqual(true);

      const ta = new Int8Array([1,2,3]);
      const result = ta.some(x=>x===2);
      expect(result).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4054
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4054
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4054';
      console.info(`${caseName}, test start`);
      const arr = [[3,4]];
      arr.unshift([1,2]);
      const val = arr.flat().find(x=>x>3);
      expect(val).assertEqual(4);

      const ta = new Int8Array([1,2,3]);
      const found = ta.find(x=>x>2);
      expect(found).assertEqual(3);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4055
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4055
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4055';
      console.info(`${caseName}, test start`);
      const arr = [[1,2],[3,4]];
      arr.splice(1,0,[5]);
      const idx = arr.flat().findIndex(x=>x===5);
      expect(idx).assertEqual(2);

      const ta = new Int8Array([1,2,3]);
      const index = Array.from(ta).findIndex(x=>x===2);
      expect(index).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4056
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4056
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4056';
      console.info(`${caseName}, test start`);
      const arr = [[4,3],[2,1]];
      const total = arr.sort().flat().reduceRight((a,b)=>a-b);
      expect(total).assertEqual(-4);

      const ta = new Int8Array([1,2,3,4]);
      const val = ta.reduceRight((a,b)=>a-b);
      expect(val).assertEqual(-2);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4057
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4057
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4057';
      console.info(`${caseName}, test start`);
      const arr = [[1,2],[3,4]];
      arr.reverse();
      const result = arr.flat().some(x=>x===1);
      expect(result).assertEqual(true);

      const ta = new Int8Array([1,2,3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3,2,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4058
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4058
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4058';
      console.info(`${caseName}, test start`);
      const arr = [[1,2],[3,4]];
      arr.copyWithin(0,1);
      const allNum = arr.flat().every(x=>typeof x === 'number');
      expect(allNum).assertEqual(true);

      const ta = new Int8Array([1,2,3,4]);
      ta.copyWithin(0,2);
      expect(Array.from(ta)).assertDeepEquals([3,4,3,4]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4061
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4061
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4061';
      console.info(`${caseName}, test start`);
      const arr = [1,,3,4];
      const result = arr.map(x => x || 0).filter(x => x > 0).flat();
      expect(result).assertDeepEquals([1,3,4]);

      const ta = new Int8Array([1,0,3,4]);
      const filtered = Array.from(ta).filter(x => x !== 0);
      expect(filtered).assertDeepEquals([1,3,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4062
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4062
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4062';
      console.info(`${caseName}, test start`);
      const arr = [1,,2,,3];
      const r = arr.slice(1).flat().concat([4]);
      expect(r.length).assertEqual(3);
      expect(r[0]).assertEqual(2);
      expect(r[1]).assertEqual(3);
      expect(r[2]).assertEqual(4);

      const ta = new Int8Array([1,2,3]);
      const combined = Array.from(ta.slice(1)).concat([4]);
      expect(combined).assertDeepEquals([2,3,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4063
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4063
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4063';
      console.info(`${caseName}, test start`);
      const arr = [NaN, 3, 2, 1];
      const res = arr.sort().filter(x => !isNaN(x)).reverse();
      expect(res).assertDeepEquals([3,2,1]);

      const ta = new Float32Array([NaN,3,2,1]);
      const filtered = Array.from(ta).filter(x => !isNaN(x)).sort().reverse();
      expect(filtered).assertDeepEquals([3,2,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4064
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4064
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4064';
      console.info(`${caseName}, test start`);
      const arr = [Infinity, 5, -Infinity, 2];
      const res = arr.sort((a,b)=>a-b).map(x=>x*2).flat();
      expect(res).assertDeepEquals([-Infinity,4,10,Infinity]);

      const ta = new Float64Array([Infinity,5,-Infinity,2]);
      const mapped = Array.from(ta).sort((a,b)=>a-b).map(x=>x*2);
      expect(mapped).assertDeepEquals([-Infinity,4,10,Infinity]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4065
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4065
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4065';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4,5];
      arr.splice(-2,1,99);
      const flatResult = arr.flat();
      expect(flatResult).assertDeepEquals([1,2,3,99,5]);

      const ta = new Int16Array([1,2,3,4,5]);
      const replaced = Array.from(ta);
      replaced.splice(-2,1,99);
      expect(replaced).assertDeepEquals([1,2,3,99,5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4066
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4066
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4066';
      console.info(`${caseName}, test start`);
      const arr = [1,,3,4,5];
      arr.copyWithin(1,2);
      const filtered = arr.flat().filter(x=>x!==undefined);
      expect(filtered).assertDeepEquals([1,3,4,5,5]);

      const ta = new Int8Array([1,0,3,4,5]);
      ta.copyWithin(1,2);
      expect(Array.from(ta)).assertDeepEquals([1,3,4,5,5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4067
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4067
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4067';
      console.info(`${caseName}, test start`);
      const arr = [1,,2,,3];
      const r = arr.reverse().map(x => x || 0).flat();
      expect(r).assertDeepEquals([3,2,1]);

      const ta = new Int8Array([1,2,3]);
      ta.reverse();
      expect(Array.from(ta)).assertDeepEquals([3,2,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4068
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4068
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4068';
      console.info(`${caseName}, test start`);
      const arr : Array<Array<number>> = [];
      for (let i = 0; i < 10000; i++) arr.push([i]);
      const flatResult = arr.flat();
      expect(flatResult.length).assertEqual(10000);
      expect(flatResult[9999]).assertEqual(9999);

      const ta = new Int32Array(10000).map((_,i)=>i);
      expect(ta.length).assertEqual(10000);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4069
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4069
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4069';
      console.info(`${caseName}, test start`);
      const arr = [3, undefined, 1];
      const r = arr.sort().flat().filter(x => x !== undefined);
      expect(r).assertDeepEquals([1,3]);

      const ta = new Int16Array([3,1,2]);
      const sorted = Array.from(ta).sort();
      expect(sorted).assertDeepEquals([1,2,3]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4070
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4070
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4070';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3];
      const result = arr.map((x,i,a)=>{
        if (i===1) a.push(4);
        return x*2;
      }).flat();
      expect(result).assertDeepEquals([2,4,6]);

      const ta = new Int8Array([1,2,3]);
      const mapped = Array.from(ta).map(x=>x*2);
      expect(mapped).assertDeepEquals([2,4,6]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4071
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4071
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4071';
      console.info(`${caseName}, test start`);
      const arr = Array.of([3, 1], [2, 4]);
      const res = arr.flat().sort();
      expect(res).assertDeepEquals([1,2,3,4]);

      const ta = new Int16Array(Array.of(3,1,2,4));
      const sorted = Array.from(ta).sort();
      expect(sorted).assertDeepEquals([1,2,3,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4072
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4072
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4072';
      console.info(`${caseName}, test start`);
      const arr = Array.from([1, 2, 3]);
      const res = arr.concat([4, 5]).flat();
      expect(res).assertDeepEquals([1,2,3,4,5]);

      const ta = new Int8Array(Array.from([1,2,3]));
      const combined = Array.from(ta).concat([4,5]);
      expect(combined).assertDeepEquals([1,2,3,4,5]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4073
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4073
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4073';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const res = arr.flatMap(x => [x, x * 2]).fill(0, 2, 4);
      expect(res.includes(0)).assertTrue();
      expect(res.length).assertEqual(6);

      const ta = new Int8Array([1,2,3]);
      const flatMapped = Array.from(ta).flatMap(x => [x, x*2]);
      expect(flatMapped.includes(4)).assertTrue();
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4074
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4074
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4074';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, 3]].concat([[4, 5]]);
      const flatRes = arr.flat().reduce((a,b)=>a+b,0);
      expect(flatRes).assertEqual(15);

      const ta = new Int8Array([1,2,3,4,5]);
      const sum = Array.from(ta).reduce((a,b)=>a+b,0);
      expect(sum).assertEqual(15);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4075
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4075
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4075';
      console.info(`${caseName}, test start`);
      const arr = [1, [2, [3, [4]]]];
      const flat1 = arr.flat(1);
      const flat2 = arr.flat(2);
      const flatAll = arr.flat(Infinity);
      expect(flat1).assertDeepEquals([1,2,[3,[4]]]);
      expect(flat2).assertDeepEquals([1,2,3,[4]]);
      expect(flatAll).assertDeepEquals([1,2,3,4]);

      const ta = new Int16Array([1,2,3,4]);
      expect(Array.from(ta).flat()).assertDeepEquals([1,2,3,4]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4076
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4076
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4076';
      console.info(`${caseName}, test start`);
      const arr = [3, 1].concat([2, 4]);
      const result = arr.sort().flatMap(x => [x, x * 10]);
      expect(result).assertDeepEquals([1,10,2,20,3,30,4,40]);

      const ta = new Int16Array([3,1,2,4]);
      const mapped = Array.from(ta).sort().flatMap(x=>[x,x*10]);
      expect(mapped).assertDeepEquals([1,10,2,20,3,30,4,40]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4077
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4077
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4077';
      console.info(`${caseName}, test start`);
      const arr = new Array<number[]>(4).fill([1]);
      const flatArr = arr.flat();
      expect(flatArr).assertDeepEquals([1,1,1,1]);

      const ta = new Int8Array(4);
      ta.fill(2);
      expect(Array.from(ta)).assertDeepEquals([2,2,2,2]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4078
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4078
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4078';
      console.info(`${caseName}, test start`);
      const arr :Array<number|number[]> = [1,2];
      arr.push(3);
      const res = arr.concat([[4,5]]).flat().reverse();
      expect(res).assertDeepEquals([5,4,3,2,1]);

      const ta = new Int8Array([1,2,3]);
      const rev = Array.from(ta).concat([4,5]).reverse();
      expect(rev).assertDeepEquals([5,4,3,2,1]);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4079
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4079
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4079';
      console.info(`${caseName}, test start`);
      const arr:Array<number|number[]> = [1,2,3,4];
      arr.splice(1,2,[9,9]);
      const sum = arr.flat().reduce((a,b)=>a+b,0);
      expect(sum).assertEqual(1+9+9+4);

      const ta = new Int16Array([1,2,3,4]);
      const modified = Array.from(ta);
      modified.splice(1,2,9,9);
      const total = modified.reduce((a,b)=>a+b,0);
      expect(total).assertEqual(1+9+9+4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4080
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4080
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4080';
      console.info(`${caseName}, test start`);
      const arr = [[0,1], [2,3]].reverse().flat();
      expect(arr.some(x=>x>2)).assertTrue();

      const ta = new Int8Array([0,1,2,3]);
      const reversed = Array.from(ta).reverse();
      expect(reversed.some(x=>x>2)).assertTrue();
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4081
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4081
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4081';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      arr.copyWithin(0, 3, 5);
      const found = arr.find(x => x === 4);
      expect(found).assertEqual(4);
      expect(arr).assertDeepEquals([4,5,3,4,5]);

      const ta = new Int8Array([1,2,3,4,5]);
      ta.copyWithin(0,3,5);
      const taFound = Array.from(ta).find(x=>x===4);
      expect(taFound).assertEqual(4);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4082
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4082
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4082';
      console.info(`${caseName}, test start`);
      const arr = [10, 20, 30, 40];
      arr.copyWithin(1, 2);
      const idx = arr.findIndex(x => x === 40);
      expect(idx).assertEqual(2);
      expect(arr).assertDeepEquals([10,30,40,40]);

      const ta = new Int8Array([10,20,30,40]);
      ta.copyWithin(1,2);
      const idx2 = Array.from(ta).findIndex(x=>x===40);
      expect(idx2).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4084
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4084
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4084';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      arr.splice(2, 2, 9, 9);
      const found = arr.find(x => x === 9);
      expect(found).assertEqual(9);
      expect(arr).assertDeepEquals([1,2,9,9,5]);

      const ta = new Int16Array([1,2,3,4,5]);
      const copy = Array.from(ta);
      copy.splice(2,2,9,9);
      expect(copy.find(x=>x===9)).assertEqual(9);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4085
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4085
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4085';
      console.info(`${caseName}, test start`);
      const arr = [3, 6, 9, 12];
      arr.splice(1, 1, 8);
      const idx = arr.findIndex(x => x === 8);
      expect(idx).assertEqual(1);

      const ta = new Int8Array([3,6,9,12]);
      const copy = Array.from(ta);
      copy.splice(1,1,8);
      expect(copy.findIndex(x=>x===8)).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4087
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4087
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4087';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      arr.fill(0, 1, 3);
      const found = arr.find(x => x === 0);
      expect(found).assertEqual(0);
      expect(arr).assertDeepEquals([1,0,0,4]);

      const ta = new Int8Array([1,2,3,4]);
      ta.fill(0,1,3);
      expect(Array.from(ta).find(x=>x===0)).assertEqual(0);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4088
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4088
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4088';
      console.info(`${caseName}, test start`);
      const arr = [NaN, 1, 2, 3];
      arr.fill(NaN, 1, 2);
      const idx = arr.findIndex(x => Number.isNaN(x));
      expect(idx).assertEqual(0);

      const ta = new Float32Array([NaN,1,2,3]);
      ta.fill(NaN,1,2);
      const idx2 = Array.from(ta).findIndex(x=>Number.isNaN(x));
      expect(idx2).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4090
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4090
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4090';
      console.info(`${caseName}, test start`);
      const arr = [1,2,3,4,5];
      const idx = arr.fill(9,1,3).copyWithin(3,0,2).findIndex(x=>x===9);
      expect(idx).assertEqual(1);
      expect(arr).assertDeepEquals([1,9,9,1,9]);

      const ta = new Int8Array([1,2,3,4,5]);
      ta.fill(9,1,3);
      ta.copyWithin(3,0,2);
      const idx2 = Array.from(ta).findIndex(x=>x===9);
      expect(idx2).assertEqual(1);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4091
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4091
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4091';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const found = arr.reverse().find(x => x > 2);
      expect(found).assertEqual(4);
      expect(arr).assertDeepEquals([4,3,2,1]);

      const ta = new Int8Array([1,2,3,4]);
      ta.reverse();
      const found2 = Array.from(ta).find(x => x > 2);
      expect(found2).assertEqual(4);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4093
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4093
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4093';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const sum = arr.reverse().reduceRight((a, b) => a + b, 0);
      expect(sum).assertEqual(6);
      expect(arr).assertDeepEquals([3,2,1]);

      const ta = new Int8Array([1,2,3]);
      ta.reverse();
      const taSum = Array.from(ta).reduceRight((a,b)=>a+b,0);
      expect(taSum).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4095
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4095
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4095';
      console.info(`${caseName}, test start`);
      const arr = [4, 2, 8, 6];
      const result = arr.sort((a,b)=>a-b).some(x=>x>7);
      expect(result).assertEqual(true);
      expect(arr).assertDeepEquals([2,4,6,8]);

      const ta = new Int16Array([4,2,8,6]);
      ta.sort();
      const taResult = Array.from(ta).some(x=>x>7);
      expect(taResult).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4096
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4096
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4096';
      console.info(`${caseName}, test start`);
      const arr = [9, 3, 6];
      const result = arr.sort((a,b)=>a-b).every(x=>x>=3);
      expect(result).assertEqual(true);
      expect(arr).assertDeepEquals([3,6,9]);

      const ta = new Int8Array([9,3,6]);
      ta.sort();
      const taRes = Array.from(ta).every(x=>x>=3);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4097
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4097
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4097';
      console.info(`${caseName}, test start`);
      const arr = [0, 1, 2];
      const res = arr.reverse().some(x=>x===0);
      expect(res).assertEqual(true);
      expect(arr).assertDeepEquals([2,1,0]);

      const ta = new Int8Array([0,1,2]);
      ta.reverse();
      const taRes = Array.from(ta).some(x=>x===0);
      expect(taRes).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4098
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4098
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4098';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      const sum = arr.sort().reduceRight((a,b)=>a+b);
      expect(sum).assertEqual(6);
      expect(arr).assertDeepEquals([1,2,3]);

      const ta = new Int8Array([3,1,2]);
      ta.sort();
      const taSum = Array.from(ta).reduceRight((a,b)=>a+b);
      expect(taSum).assertEqual(6);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4099
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4099
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4099';
      console.info(`${caseName}, test start`);
      const arr = [10, 8, 6];
      const ok = arr.reverse().every(x=>x>5);
      expect(ok).assertEqual(true);
      expect(arr).assertDeepEquals([6,8,10]);

      const ta = new Int16Array([10,8,6]);
      ta.reverse();
      const ok2 = Array.from(ta).every(x=>x>5);
      expect(ok2).assertEqual(true);
      console.info(`${caseName}, test end`);
    });
    /**
     * @tc.name   ArrayCombinationTest4100
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4100
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4100';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2, 1];
      const idx = arr.sort((a,b)=>a-b).reverse().findIndex(x=>x===2);
      expect(idx).assertEqual(1);
      expect(arr).assertDeepEquals([3,2,1,1]);

      const ta = new Int8Array([3,1,2,1]);
      ta.sort();
      ta.reverse();
      const idx2 = Array.from(ta).findIndex(x=>x===2);
      expect(idx2).assertEqual(1);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4101
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4101
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4101';
      console.info(`${caseName}, test start`);
      const arr = [3, 1, 2];
      const arrResult = arr.map(x => x * 2).sort((a, b) => a - b);
      expect(arrResult).assertDeepEquals([2, 4, 6]);

      const ta = new Int16Array([3, 1, 2]);
      const taResult = Array.from(ta.map(x => x * 2)).sort((a, b) => a - b);
      expect(taResult).assertDeepEquals([2, 4, 6]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4102
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4102
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4102';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const arrResult = arr.map(x => x + 1).reverse();
      expect(arrResult).assertDeepEquals([4, 3, 2]);

      const ta = new Int16Array([1, 2, 3]);
      const taResult = Array.from(ta.map(x => x + 1)).reverse();
      expect(taResult).assertDeepEquals([4, 3, 2]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4103
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4103
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4103';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const arrResult = arr.map(x => x * 10).copyWithin(1, 2);
      expect(arrResult).assertDeepEquals([10, 30, 40, 40]);

      const ta = new Int16Array([1, 2, 3, 4]);
      const taResult = new Int16Array(Array.from(ta.map(x => x * 10)));
      taResult.copyWithin(1, 2);
      expect(Array.from(taResult)).assertDeepEquals([10, 30, 40, 40]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4104
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4104
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4104';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const arrResult = arr.map(x => x + 5).fill(9, 1, 2);
      expect(arrResult).assertDeepEquals([6, 9, 8]);

      const ta = new Int16Array([1, 2, 3]);
      const taResult = new Int16Array(Array.from(ta.map(x => x + 5)));
      taResult.fill(9, 1, 2);
      expect(Array.from(taResult)).assertDeepEquals([6, 9, 8]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4105
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4105
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4105';
      console.info(`${caseName}, test start`);
      const arr = [5, 2, 8, 1];
      const arrResult = arr.filter(x => x > 2).sort((a, b) => b - a);
      expect(arrResult).assertDeepEquals([8, 5]);

      const ta = new Int16Array([5, 2, 8, 1]);
      const taResult = Array.from(ta.filter(x => x > 2)).sort((a, b) => b - a);
      expect(taResult).assertDeepEquals([8, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4106
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4106
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4106';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const arrResult = arr.filter(x => x % 2 === 0).reverse();
      expect(arrResult).assertDeepEquals([4, 2]);

      const ta = new Int16Array([1, 2, 3, 4]);
      const taResult = Array.from(ta.filter(x => x % 2 === 0)).reverse();
      expect(taResult).assertDeepEquals([4, 2]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4107
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4107
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4107';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4, 5];
      const arrResult = arr.filter(x => x > 2).copyWithin(1, 2);
      expect(arrResult).assertDeepEquals([3, 5, 5]);

      const ta = new Int16Array([1, 2, 3, 4, 5]);
      const taResult = new Int16Array(Array.from(ta.filter(x => x > 2)));
      taResult.copyWithin(1, 2);
      expect(Array.from(taResult)).assertDeepEquals([3, 5, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4108
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4108
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4108';
      console.info(`${caseName}, test start`);
      const arr = [10, 15, 20];
      const arrResult = arr.filter(x => x > 10).fill(0);
      expect(arrResult).assertDeepEquals([0, 0]);

      const ta = new Int16Array([10, 15, 20]);
      const taResult = new Int16Array(Array.from(ta.filter(x => x > 10)));
      taResult.fill(0);
      expect(Array.from(taResult)).assertDeepEquals([0, 0]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4109
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4109
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4109';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const arrResult = arr.flatMap(x => [x, x * 2]).sort((a, b) => b - a);
      expect(arrResult).assertDeepEquals([6, 4, 3, 2, 2, 1]);

      const ta = new Int16Array([1, 2, 3]);
      const taResult = Array.from(ta).flatMap(x => [x, x * 2]).sort((a, b) => b - a);
      expect(taResult).assertDeepEquals([6, 4, 3, 2, 2, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4110
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4110
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4110';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const arrResult = arr.flatMap(x => [x, x + 1]).reverse();
      expect(arrResult).assertDeepEquals([3, 2, 2, 1]);

      const ta = new Int16Array([1, 2]);
      const taResult = Array.from(ta).flatMap(x => [x, x + 1]).reverse();
      expect(taResult).assertDeepEquals([3, 2, 2, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4111
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4111
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4111';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const arrResult = arr.flatMap(x => [x, x * 2]).copyWithin(2, 0, 2);
      expect(arrResult).assertDeepEquals([1, 2, 1, 2, 3, 6]);

      const ta = new Int16Array([1, 2, 3]);
      const taResult = new Int16Array(Array.from(ta).flatMap(x => [x, x * 2]));
      taResult.copyWithin(2, 0, 2);
      expect(Array.from(taResult)).assertDeepEquals([1, 2, 1, 2, 3, 6]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4112
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4112
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4112';
      console.info(`${caseName}, test start`);
      const arr = [1, 2];
      const arrResult = arr.flatMap(x => [x, x + 1]).fill(9, 2);
      expect(arrResult).assertDeepEquals([1, 2, 9, 9]);

      const ta = new Int16Array([1, 2]);
      const taResult = new Int16Array(Array.from(ta).flatMap(x => [x, x + 1]));
      taResult.fill(9, 2);
      expect(Array.from(taResult)).assertDeepEquals([1, 2, 9, 9]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4113
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4113
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4113';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.map(x => x * 2).sort();
      expect(arrResult.length).assertEqual(0);

      const ta = new Int16Array([]);
      const taResult = Array.from(ta.map(x => x * 2)).sort();
      expect(taResult.length).assertEqual(0);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4114
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4114
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4114';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.map(x => x + 1).reverse();
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = Array.from(ta.map(x => x + 1)).reverse();
      expect(taResult).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4115
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4115
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4115';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.map(x => x * 10).copyWithin(0, 1);
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = new Int16Array(Array.from(ta.map(x => x * 10)));
      taResult.copyWithin(0, 1);
      expect(Array.from(taResult)).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4116
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4116
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4116';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.map(x => x + 5).fill(1);
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = new Int16Array(Array.from(ta.map(x => x + 5)));
      taResult.fill(1);
      expect(Array.from(taResult)).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4117
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4117
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4117';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.filter(x => x > 0).sort();
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = Array.from(ta.filter(x => x > 0)).sort();
      expect(taResult).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4118
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4118
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4118';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.filter(x => x % 2 === 0).reverse();
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = Array.from(ta.filter(x => x % 2 === 0)).reverse();
      expect(taResult).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4119
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4119
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4119';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.filter(x => x < 5).copyWithin(0, 1);
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = new Int16Array(Array.from(ta.filter(x => x < 5)));
      taResult.copyWithin(0, 1);
      expect(Array.from(taResult)).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4120
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4120
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4120';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.filter(x => x > 10).fill(0);
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = new Int16Array(Array.from(ta.filter(x => x > 10)));
      taResult.fill(0);
      expect(Array.from(taResult)).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4121
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4121
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4121';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.flatMap(x => [x, x * 2]).sort();
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = Array.from(ta).flatMap(x => [x, x * 2]).sort();
      expect(taResult).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4122
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4122
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4122';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.flatMap(x => [x, x + 1]).reverse();
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = Array.from(ta).flatMap(x => [x, x + 1]).reverse();
      expect(taResult).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4123
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4123
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4123';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.flatMap(x => [x, x * 2]).copyWithin(1, 0);
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = new Int16Array(Array.from(ta).flatMap(x => [x, x * 2]));
      taResult.copyWithin(1, 0);
      expect(Array.from(taResult)).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4124
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4124
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4124';
      console.info(`${caseName}, test start`);
      const arr: number[] = [];
      const arrResult = arr.flatMap(x => [x, x + 1]).fill(9);
      expect(arrResult).assertDeepEquals([]);

      const ta = new Int16Array([]);
      const taResult = new Int16Array(Array.from(ta).flatMap(x => [x, x + 1]));
      taResult.fill(9);
      expect(Array.from(taResult)).assertDeepEquals([]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4125
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4125
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4125';
      console.info(`${caseName}, test start`);
      const arr = [ , 2, , 5 ];
      const arrResult = arr.map(x => (x ?? 0) * 2).sort((a, b) => a - b);
      expect(arrResult.length).assertEqual(4);
      expect(arrResult[0]).assertEqual(4);
      expect(arrResult[1]).assertEqual(10);

      const ta = new Int16Array([0, 2, 0, 5]);
      const taResult = Array.from(ta.map(x => (x ?? 0) * 2)).sort((a, b) => a - b);
      expect(taResult).assertDeepEquals([0, 0, 4, 10]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4126
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4126
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4126';
      console.info(`${caseName}, test start`);
      const arr = [ , 1, , 3 ];
      const arrResult = arr.map(x => (x ?? -1) + 1).reverse();
      expect(arrResult.length).assertEqual(4);
      expect(arrResult[0]).assertEqual(4);
      expect(arrResult[2]).assertEqual(2);

      const ta = new Int16Array([0, 1, 0, 3]);
      const taResult = Array.from(ta.map(x => (x ?? -1) + 1)).reverse();
      expect(taResult.length).assertEqual(4);
      expect(taResult[0]).assertEqual(4);
      expect(taResult[2]).assertEqual(2);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4127
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4127
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4127';
      console.info(`${caseName}, test start`);
      const arr = [1, , 3, , 5];
      const arrResult = arr.map(x => (x ?? 0) * 2).copyWithin(1, 3);
      expect(arrResult.length).assertEqual(5);
      expect(arrResult[0]).assertEqual(2);
      expect(arrResult[2]).assertEqual(10);
      expect(arrResult[4]).assertEqual(10);

      const ta = new Int16Array([1, 0, 3, 0, 5]);
      const taResult = new Int16Array(Array.from(ta.map(x => (x ?? 0) * 2)));
      taResult.copyWithin(1, 3);
      expect(taResult).assertDeepEquals(new Int16Array([2, 0, 10, 0, 10]));
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4128
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4128
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4128';
      console.info(`${caseName}, test start`);
      const arr = [ , , 2, , 4 ];
      const arrResult = arr.map(x => (x ?? 1) + 1).fill(9, 1, 3);
      expect(arrResult.length).assertEqual(5);
      expect(arrResult[1]).assertEqual(9);
      expect(arrResult[2]).assertEqual(9);
      expect(arrResult[4]).assertEqual(5);

      const ta = new Int16Array([0, 0, 2, 0, 4]);
      const taResult = new Int16Array(Array.from(ta.map(x => (x ?? 1) + 1)));
      taResult.fill(9, 1, 3);
      expect(taResult.length).assertEqual(5);
      expect(taResult[1]).assertEqual(9);
      expect(taResult[2]).assertEqual(9);
      expect(taResult[4]).assertEqual(5);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4129
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4129
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4129';
      console.info(`${caseName}, test start`);
      const arr = [ , 5, , 3, , 1 ];
      const arrResult = arr.filter(x => x! > 2).sort((a, b) => a! - b!);
      expect(arrResult).assertDeepEquals([3, 5]);

      const ta = new Int16Array([0, 5, 0, 3, 0, 1]);
      const taResult = Array.from(ta.filter(x => x > 2)).sort((a, b) => a - b);
      expect(taResult).assertDeepEquals([3, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4130
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4130
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4130';
      console.info(`${caseName}, test start`);
      const arr = [ , 1, , 4 ];
      const arrResult = arr.filter(x => (x ?? 0) > 0).reverse();
      expect(arrResult).assertDeepEquals([4, 1]);

      const ta = new Int16Array([0, 1, 0, 4]);
      const taResult = Array.from(ta.filter(x => x > 0)).reverse();
      expect(taResult).assertDeepEquals([4, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4131
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4131
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4131';
      console.info(`${caseName}, test start`);
      const arr = [ , 2, , 3, , 4 ];
      const arrResult = arr.filter(x => (x ?? 0) > 2).copyWithin(1, 0);
      expect(arrResult).assertDeepEquals([3, 3]);

      const ta = new Int16Array([0, 2, 0, 3, 0, 4]);
      const taResult = new Int16Array(Array.from(ta.filter(x => x > 2)));
      taResult.copyWithin(1, 0);
      expect(Array.from(taResult)).assertDeepEquals([3, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4132
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4132
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4132';
      console.info(`${caseName}, test start`);
      const arr = [1, , , 4];
      const arrResult = arr.filter(x => (x ?? 0) > 0).fill(0, 1);
      expect(arrResult).assertDeepEquals([1, 0]);

      const ta = new Int16Array([1, 0, 0, 4]);
      const taResult = new Int16Array(Array.from(ta.filter(x => x > 0)));
      taResult.fill(0, 1);
      expect(Array.from(taResult)).assertDeepEquals([1, 0]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4133
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4133
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4133';
      console.info(`${caseName}, test start`);
      const arr = [ , 2, , 3 ];
      const arrResult = arr.flatMap(x => [x ?? 0, (x ?? 0) * 2]).sort((a, b) => a - b);
      expect(arrResult).assertDeepEquals([2, 3, 4, 6]);

      const ta = new Int16Array([0, 2, 0, 3]);
      const taResult = Array.from(ta).flatMap(x => [x ?? 0, (x ?? 0) * 2]).sort((a, b) => a - b);
      expect(taResult).assertDeepEquals([0, 0, 0, 0, 2, 3, 4, 6]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4134
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4134
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4134';
      console.info(`${caseName}, test start`);
      const arr = [ , 1, , 2 ];
      const arrResult = arr.flatMap(x => [x ?? -1, (x ?? -1) + 1]).reverse();
      expect(arrResult).assertDeepEquals([3, 2, 2, 1]);

      const ta = new Int16Array([0, 1, 0, 2]);
      const taResult = Array.from(ta).flatMap(x => [x ?? -1, (x ?? -1) + 1]).reverse();
      expect(taResult).assertDeepEquals([3, 2, 1, 0, 2, 1, 1, 0]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4135
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4135
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4135';
      console.info(`${caseName}, test start`);
      const arr = [ , 2, , 4 ];
      const arrResult = arr.flatMap(x => [x ?? 0, (x ?? 0) + 1]).copyWithin(2, 0);
      expect(arrResult).assertDeepEquals([2, 3, 2, 3]);

      const ta = new Int16Array([0, 2, 0, 4]);
      const taResult = new Int16Array(Array.from(ta).flatMap(x => [x ?? 0, (x ?? 0) + 1]));
      taResult.copyWithin(2, 0);
      expect(Array.from(taResult)).assertDeepEquals([0, 1, 0, 1, 2, 3, 0, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4136
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4136
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4136';
      console.info(`${caseName}, test start`);
      const arr = [ , 3, , 5 ];
      const arrResult = arr.flatMap(x => [x ?? 0, (x ?? 0) * 2]).fill(9, 2, 4);
      expect(arrResult).assertDeepEquals([3, 6, 9, 9]);

      const ta = new Int16Array([0, 3, 0, 5]);
      const taResult = new Int16Array(Array.from(ta).flatMap(x => [x ?? 0, (x ?? 0) * 2]));
      taResult.fill(9, 2, 4);
      expect(Array.from(taResult)).assertDeepEquals([0, 0, 9, 9, 0, 0, 5, 10]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4137
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4137
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4137';
      console.info(`${caseName}, test start`);
      const arr = [NaN, undefined, null, 2];
      const arrResult = arr.map(x => Number(x) + 1).sort((a, b) => a - b);
      expect(arrResult.includes(NaN)).assertTrue();
      expect(arrResult[arrResult.length - 1]).assertEqual(3);

      const ta = new Int16Array([0, 0, 0, 2]);
      const taResult = Array.from(ta.map(x => Number(x) + 1)).sort((a, b) => a - b);
      expect(taResult).assertDeepEquals([1, 1, 1, 3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4138
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4138
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4138';
      console.info(`${caseName}, test start`);
      const arr = [undefined, null, NaN];
      const arrResult = arr.map(x => Number.isNaN(x) ? 0 : (x ?? 5)).reverse();
      expect(arrResult).assertDeepEquals([0,5,5]);

      const ta = new Int16Array([0, 0, 0]);
      const taResult = Array.from(ta.map(x => x + 5)).reverse();
      expect(taResult).assertDeepEquals([5, 5, 5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4139
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4139
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4139';
      console.info(`${caseName}, test start`);
      const arr = [1, NaN, undefined, null];
      const arrResult = arr.map(x => Number(x) || 0).copyWithin(1, 2);
      expect(arrResult).assertDeepEquals([1, 0, 0, 0]);

      const ta = new Int16Array([1, 0, 0, 0]);
      const taResult = new Int16Array(Array.from(ta.map(x => x + 0)));
      taResult.copyWithin(1, 2);
      expect(Array.from(taResult)).assertDeepEquals([1, 0, 0, 0]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4140
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4140
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4140';
      console.info(`${caseName}, test start`);
      const arr = [NaN, undefined, null];
      const arrResult = arr.map(x => (x == null ? 0 : x)).fill(7, 1);
      expect(arrResult.length).assertEqual(3);
      expect(arrResult[1]).assertEqual(7);
      expect(arrResult[2]).assertEqual(7);

      const ta = new Int16Array([0, 0, 0]);
      const taResult = new Int16Array(Array.from(ta.map(x => x + 1)));
      taResult.fill(7, 1);
      expect(Array.from(taResult)).assertDeepEquals([1, 7, 7]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4141
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4141
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4141';
      console.info(`${caseName}, test start`);
      const arr = [NaN, undefined, 2, null];
      const arrResult = arr.filter(x => typeof x === "number" && !Number.isNaN(x)).sort();
      expect(arrResult).assertDeepEquals([2]);

      const ta = new Int16Array([0, 0, 2, 0]);
      const taResult = Array.from(ta.filter(x => x > 0)).sort();
      expect(taResult).assertDeepEquals([2]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4142
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4142
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4142';
      console.info(`${caseName}, test start`);
      const arr = [undefined, NaN, 1, null];
      const arrResult = arr.filter(x => x != null).reverse();
      expect(arrResult.length).assertEqual(2);
      expect(arrResult[0]).assertEqual(1);

      const ta = new Int16Array([0, 0, 1, 0]);
      const taResult = Array.from(ta.filter(x => x != 0)).reverse();
      expect(taResult).assertDeepEquals([1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4143
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4143
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4143';
      console.info(`${caseName}, test start`);
      const arr = [NaN, null, 1, undefined];
      const arrResult = arr.filter(x => x).copyWithin(0, 1);
      expect(arrResult).assertDeepEquals([1]);

      const ta = new Int16Array([0, 0, 1, 0]);
      const taResult = new Int16Array(Array.from(ta.filter(x => x)));
      taResult.copyWithin(0, 1);
      expect(Array.from(taResult)).assertDeepEquals([1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4144
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4144
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4144';
      console.info(`${caseName}, test start`);
      const arr = [undefined, NaN, null, 5];
      const arrResult = arr.filter(x => x != null).fill(0, 1);
      expect(arrResult.length).assertEqual(2);
      expect(arrResult[1]).assertEqual(0);

      const ta = new Int16Array([0, 0, 0, 5]);
      const taResult = new Int16Array(Array.from(ta.filter(x => x != 0)));
      taResult.fill(0, 1);
      expect(Array.from(taResult)).assertDeepEquals([5]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4145
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4145
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4145';
      console.info(`${caseName}, test start`);
      const arr = [1, NaN, undefined];
      const arrResult = arr.flatMap(x => [x, Number(x)]).sort((a, b) => {
        if (Number.isNaN(a)) return 1;
        if (Number.isNaN(b)) return -1;
        return (a ?? 0) - (b ?? 0);
      });
      expect(arrResult.includes(NaN)).assertTrue();

      const ta = new Int16Array([1, 0, 0]);
      const taResult = Array.from(ta).flatMap(x => [x, Number(x)]).sort((a, b) => a - b);
      expect(taResult).assertDeepEquals([0, 0, 0, 0, 1, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4146
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4146
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4146';
      console.info(`${caseName}, test start`);
      const arr = [NaN, undefined, null];
      const arrResult = arr.flatMap(x => [x, String(x)]).reverse();
      expect(arrResult.length).assertEqual(6);

      const ta = new Int16Array([0, 0, 0]);
      const taResult = Array.from(ta).flatMap(x => [x, String(x)]).reverse();
      expect(taResult.slice(0, 2)).assertDeepEquals(["0", 0]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4147
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4147
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4147';
      console.info(`${caseName}, test start`);
      const arr = [undefined, 3, NaN];
      const arrResult = arr.flatMap(x => [x ?? 0, (x ?? 0) * 2]).copyWithin(2, 0);
      expect(arrResult.length).assertEqual(6);

      const ta = new Int16Array([0, 3, 0]);
      const taResult = new Int16Array(Array.from(ta).flatMap(x => [x ?? 0, (x ?? 0) * 2]));
      taResult.copyWithin(2, 0);
      expect(Array.from(taResult).length).assertEqual(6);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4148
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4148
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4148';
      console.info(`${caseName}, test start`);
      const arr = [null, NaN, undefined];
      const arrResult = arr.flatMap(x => [x ?? 0, 1]).fill(9, 1, 3);
      expect(arrResult).assertDeepEquals([0, 9, 9, 1, 0, 1]);

      const ta = new Int16Array([0, 0, 0]);
      const taResult = new Int16Array(Array.from(ta).flatMap(x => [x ?? 0, 1]));
      taResult.fill(9, 1, 3);
      expect(Array.from(taResult)).assertDeepEquals([0, 9, 9, 1, 0, 1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4149
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4149
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4149';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js149()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4150
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4150
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4150';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js150()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4151
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4151
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4151';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js151()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4152
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4152
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4152';
      console.info(`${caseName}, test start`);
      let arr: number[][] = ArrayCombinationTest4Js152();
      expect(arr[0]).assertDeepEquals([9, 9, 9]);
      expect(arr[1]).assertDeepEquals([9, 9, 9]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4153
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4153
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4153';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js153()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4154
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4154
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4154';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js154()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4155
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4155
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4155';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js155()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4156
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4156
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4156';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js156()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4157
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4157
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4157';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js157()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4158
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4158
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4158';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js158()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4159
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4159
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4159';
      console.info(`${caseName}, test start`);
      expect(ArrayCombinationTest4Js159()).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4160
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4160
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4160';
      console.info(`${caseName}, test start`);
      let arr: number[][] = ArrayCombinationTest4Js160();
      expect(arr[0]).assertDeepEquals([12345, 12345, 12345]);
      expect(arr[1]).assertDeepEquals([12345, 12345, 12345]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4161
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4161
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4161';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const arrResult = arr.map((x, i, a) => {
        if (i === 0) a.push(99);
        return x * 2;
      }).sort((a, b) => a - b);
      expect(arrResult).assertDeepEquals([2, 4, 6, 8]);

      const ta = new Int16Array([1, 2, 3, 4]);
      const taResult = Array.from(ta.map((x, i) => {
        if (i === 0) ta[i] = 9;
        return x * 2;
      })).sort((a, b) => a - b);
      expect(taResult).assertDeepEquals([2, 4, 6, 8]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4162
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4162
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4162';
      console.info(`${caseName}, test start`);
      const arr = [10, 20, 30];
      const arrResult = arr.map((x, i, a) => {
        if (i === 1) a.pop();
        return x + 1;
      }).reverse();
      expect(arrResult.length).assertEqual(3);
      expect(arrResult[1]).assertEqual(21);
      expect(arrResult[2]).assertEqual(11);

      const ta = new Int16Array([10, 20, 30]);
      const taResult = Array.from(ta.map((x, i) => {
        if (i === 1) ta[2] = 99;
        return x + 1;
      })).reverse();
      expect(taResult.includes(100)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4163
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4163
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4163';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const arrResult = arr.map((x, i, a) => {
        if (i === 2) a.shift();
        return x * 10;
      }).copyWithin(1, 0, 2);
      expect(arrResult[0]).assertEqual(10);

      const ta = new Int16Array([1, 2, 3, 4]);
      const taResult = new Int16Array(Array.from(ta.map((x, i) => {
        if (i === 2) ta[0] = 99;
        return x * 10;
      })));
      taResult.copyWithin(1, 0, 2);
      expect(taResult[1]).assertEqual(10);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4164
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4164
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4164';
      console.info(`${caseName}, test start`);
      const arr = [5, 6, 7];
      const arrResult = arr.map((x, i, a) => {
        if (i === 0) a.push(9);
        return x + 1;
      }).fill(100, 2);
      expect(arrResult).assertDeepEquals([6,7,100]);
      expect(arrResult.slice(2)).assertDeepEquals([100]);

      const ta = new Int16Array([5, 6, 7]);
      const taResult = new Int16Array(Array.from(ta.map((x, i) => {
        if (i === 0) ta[2] = 9;
        return x + 1;
      })));
      taResult.fill(100, 2);
      expect(Array.from(taResult)).assertDeepEquals([6,7,100]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4165
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4165
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4165';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const arrResult = arr.filter((x, i, a) => {
        if (i === 0) a.pop();
        return x > 1;
      }).sort((a, b) => b - a);
      expect(arrResult).assertDeepEquals([3, 2]);

      const ta = new Int16Array([1, 2, 3, 4]);
      const taResult = Array.from(ta.filter((x, i) => {
        if (i === 0) ta[1] = 99;
        return x > 1;
      })).sort((a, b) => b - a);
      expect(taResult).assertDeepEquals([99,4,3]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4166
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4166
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4166';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const arrResult = arr.filter((x, i, a) => {
        if (i === 1) a.push(99);
        return x % 2 === 1;
      }).reverse();
      expect(arrResult).assertDeepEquals([3,1]);

      const ta = new Int16Array([1, 2, 3]);
      const taResult = Array.from(ta.filter((x, i) => {
        if (i === 0) ta[2] = 0;
        return x > 0;
      })).reverse();
      expect(Array.from(taResult)).assertDeepEquals([2,1]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4167
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4167
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4167';
      console.info(`${caseName}, test start`);
      const arr = [10, 20, 30, 40];
      const arrResult = arr.filter((x, i, a) => {
        if (i === 2) a.shift();
        return x >= 20;
      }).copyWithin(1, 0, 1);
      expect(arrResult[1]).assertEqual(arrResult[0]);

      const ta = new Int16Array([10, 20, 30, 40]);
      const taResult = new Int16Array(Array.from(ta.filter((x, i) => {
        if (i === 2) ta[0] = 99;
        return x >= 20;
      })));
      taResult.copyWithin(1, 0, 1);
      expect(taResult[1]).assertEqual(taResult[0]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4168
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4168
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4168';
      console.info(`${caseName}, test start`);
      const arr = [5, 10, 15];
      const arrResult = arr.filter((x, i, a) => {
        if (i === 1) a.push(20);
        return x > 5;
      }).fill(0, 1);
      expect(arrResult).assertDeepEquals([10,0]);

      const ta = new Int16Array([5, 10, 15]);
      const taResult = new Int16Array(Array.from(ta.filter((x, i) => {
        if (i === 1) ta[2] = 0;
        return x > 5;
      })));
      taResult.fill(0, 1);
      expect(Array.from(taResult)).assertDeepEquals([10]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4169
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4169
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4169';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3];
      const arrResult = arr.flatMap((x, i, a) => {
        if (i === 0) a.push(9);
        return [x, x * 2];
      }).sort((a, b) => a - b);
      expect(arrResult).assertDeepEquals([1, 2, 2, 3, 4, 6]);

      const ta = new Int16Array([1, 2, 3]);
      const taResult = Array.from(ta).flatMap((x, i, a) => {
        if (i === 0) a.push(9);
        return [x, x * 2];
      }).sort((a, b) => a - b);
      expect(Array.from(taResult)).assertDeepEquals([1, 2, 2, 3, 4, 6]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4170
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4170
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4170';
      console.info(`${caseName}, test start`);
      const arr = [2, 4, 6];
      const arrResult = arr.flatMap((x, i, a) => {
        if (i === 1) a.pop();
        return [x, x + 1];
      }).reverse();
      expect(arrResult[0]).assertEqual(5);

      const ta = new Int16Array([2, 4, 6]);
      const taResult = Array.from(ta).flatMap((x, i, a) => {
        if (i === 1) a[2] = 99;
        return [x, x + 1];
      }).reverse();
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4171
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4171
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4171';
      console.info(`${caseName}, test start`);
      const arr = [1, 2, 3, 4];
      const arrResult = arr.flatMap((x, i, a) => {
        if (i === 0) a.pop();
        return [x];
      }).copyWithin(1, 0, 1);
      expect(arrResult[1]).assertEqual(arrResult[0]);

      const ta = new Int16Array([1, 2, 3, 4]);
      const taResult = new Int16Array(Array.from(ta).flatMap((x, i) => {
        if (i === 1) ta[0] = 99;
        return [x];
      }));
      taResult.copyWithin(1, 0, 1);
      expect(taResult[1]).assertEqual(taResult[0]);
      console.info(`${caseName}, test end`);
    });

    /**
     * @tc.name   ArrayCombinationTest4172
     * @tc.number BUILTINS_ARRAY_COMBINATION_TEST4172
     * @tc.desc   Test Method Combination in Array/TypedArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayCombinationTest4172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const caseName = 'ArrayCombinationTest4172';
      console.info(`${caseName}, test start`);
      const arr = [3, 6, 9];
      const arrResult = arr.flatMap((x, i, a) => {
        if (i === 2) a.push(12);
        return [x, x + 1];
      }).fill(777, 3);
      expect(arrResult.includes(777)).assertEqual(true);

      const ta = new Int16Array([3, 6, 9]);
      const taResult = new Int16Array(Array.from(ta).flatMap((x, i) => {
        if (i === 2) ta[0] = 1;
        return [x, x + 1];
      }));
      taResult.fill(777, 3);
      expect(Array.from(taResult).includes(777)).assertEqual(true);
      console.info(`${caseName}, test end`);
    });

  });
}