/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function builtinsArrayMapPrototypebTest(){
  describe('builtinsArrayMapPrototypebTest', ():void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(():void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async ():Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(():void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(():void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number builtinsArrayMapPrototypebTest0100
     * @tc.name builtinsArrayMapPrototypebTest0100
     * @tc.desc map(self: FixedArray<boolean>, callbackfn) 全部元素取反
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let result = map(arr, (v, k, array) => !v);
        expect([...result]).assertDeepEquals([false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest0200
     * @tc.name builtinsArrayMapPrototypebTest0200
     * @tc.desc map(self: FixedArray<boolean>, callbackfn) 恒为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        let result = map(arr, (v, k, array) => true);
        expect([...result]).assertDeepEquals([true, true, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest0300
     * @tc.name builtinsArrayMapPrototypebTest0300
     * @tc.desc map(self: FixedArray<boolean>, callbackfn) 恒为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = map(arr, (v, k, array) => false);
        expect([...result]).assertDeepEquals([false, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest0400
     * @tc.name builtinsArrayMapPrototypebTest0400
     * @tc.desc map(self: FixedArray<boolean>, callbackfn) 根据索引奇偶返回true/false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false, false];
        let result = map(arr, (v, k, array) => k % 2 === 0);
        expect([...result]).assertDeepEquals([true, false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest0500
     * @tc.name builtinsArrayMapPrototypebTest0500
     * @tc.desc map(self: FixedArray<boolean>, callbackfn) callbackfn依赖原数组内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let result = map(arr, (v, k, array) => array[0]);
        expect([...result]).assertDeepEquals([true, true, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest0600
     * @tc.name builtinsArrayMapPrototypebTest0600
     * @tc.desc map(self: FixedArray<boolean>, callbackfn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = map(arr, (v, k, array) => !v);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest0700
     * @tc.name builtinsArrayMapPrototypebTest0700
     * @tc.desc map(self: FixedArray<boolean>, callbackfn) 单元素true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true];
        let result = map(arr, (v, k, array) => !v);
        expect([...result]).assertDeepEquals([false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest0800
     * @tc.name builtinsArrayMapPrototypebTest0800
     * @tc.desc map(self: FixedArray<boolean>, callbackfn) 单元素false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false];
        let result = map(arr, (v, k, array) => !v);
        expect([...result]).assertDeepEquals([true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest0900
     * @tc.name builtinsArrayMapPrototypebTest0900
     * @tc.desc map(self: FixedArray<byte>, callbackfn) 全部元素加1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = map(arr, (v, k, array) => (v + 1).toByte());
        expect([...result]).assertDeepEquals([2, 3, 4] as Array<byte>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1000
     * @tc.name builtinsArrayMapPrototypebTest1000
     * @tc.desc map(self: FixedArray<byte>, callbackfn) 恒为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [5, 6, 7];
        let result = map(arr, (v, k, array) => (0).toByte() );
        expect([...result]).assertDeepEquals([0, 0, 0] as Array<byte>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1100
     * @tc.name builtinsArrayMapPrototypebTest1100
     * @tc.desc map(self: FixedArray<byte>, callbackfn)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = map(arr, (v, k, array) => (255).toByte());
        expect([...result]).assertDeepEquals([-1, -1, -1] as Array<byte>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1200
     * @tc.name builtinsArrayMapPrototypebTest1200
     * @tc.desc map(self: FixedArray<byte>, callbackfn) 根据索引返回不同值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [10, 20, 30, 40];
        let result = map(arr, (v, k, array) => (k * 2).toByte());
        expect([...result]).assertDeepEquals([0, 2, 4, 6] as Array<byte>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1300
     * @tc.name builtinsArrayMapPrototypebTest1300
     * @tc.desc map(self: FixedArray<byte>, callbackfn) callbackfn依赖原数组内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [7, 8, 9];
        let result = map(arr, (v, k, array) => array[0]);
        expect([...result]).assertDeepEquals([7, 7, 7] as Array<byte>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1400
     * @tc.name builtinsArrayMapPrototypebTest1400
     * @tc.desc map(self: FixedArray<byte>, callbackfn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = map(arr, (v, k, array) => (v + 1).toByte());
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1500
     * @tc.name builtinsArrayMapPrototypebTest1500
     * @tc.desc map(self: FixedArray<byte>, callbackfn) 单元素加1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [10];
        let result = map(arr, (v, k, array) => (v + 1).toByte());
        expect([...result]).assertDeepEquals([11] as Array<byte>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1600
     * @tc.name builtinsArrayMapPrototypebTest1600
     * @tc.desc map(self: FixedArray<byte>, callbackfn) 单元素返回0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [(255).toByte()];
        let result = map(arr, (v, k, array) => (0).toByte());
        expect([...result]).assertDeepEquals([0] as Array<byte>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1700
     * @tc.name builtinsArrayMapPrototypebTest1700
     * @tc.desc map(self: FixedArray<char>, callbackfn) 全部元素转为下一个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = map(arr, (v, k, array) => (v.toInt() + 1).toChar());
        expect([...result]).assertDeepEquals([c'b', c'c', c'd']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1800
     * @tc.name builtinsArrayMapPrototypebTest1800
     * @tc.desc map(self: FixedArray<char>, callbackfn) 恒为c'x'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = map(arr, (v, k, array) => c'x');
        expect([...result]).assertDeepEquals([c'x', c'x', c'x']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest1900
     * @tc.name builtinsArrayMapPrototypebTest1900
     * @tc.desc map(self: FixedArray<char>, callbackfn) 恒为c'\0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = map(arr, (v, k, array) => c'\0');
        expect([...result]).assertDeepEquals([c'\0', c'\0', c'\0']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2000
     * @tc.name builtinsArrayMapPrototypebTest2000
     * @tc.desc map(self: FixedArray<char>, callbackfn) 根据索引返回不同字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        let result = map(arr, (v, k, array) => (c'a'.toInt() + k.toInt()).toChar());
        expect([...result]).assertDeepEquals([c'a', c'b', c'c', c'd']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2100
     * @tc.name builtinsArrayMapPrototypebTest2100
     * @tc.desc map(self: FixedArray<char>, callbackfn) callbackfn依赖原数组内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'x', c'y', c'z'];
        let result = map(arr, (v, k, array) => array[0]);
        expect([...result]).assertDeepEquals([c'x', c'x', c'x']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2200
     * @tc.name builtinsArrayMapPrototypebTest2200
     * @tc.desc map(self: FixedArray<char>, callbackfn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [];
        let result = map(arr, (v, k, array) => (v.toInt() + 1).toChar());
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2300
     * @tc.name builtinsArrayMapPrototypebTest2300
     * @tc.desc map(self: FixedArray<char>, callbackfn) 单元素转为下一个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a'];
        let result = map(arr, (v, k, array) => (v.toInt() + 1).toChar());
        expect([...result]).assertDeepEquals([c'b']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2400
     * @tc.name builtinsArrayMapPrototypebTest2400
     * @tc.desc map(self: FixedArray<char>, callbackfn) 单元素返回c'x'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'z'];
        let result = map(arr, (v, k, array) => c'x');
        expect([...result]).assertDeepEquals([c'x']);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2500
     * @tc.name builtinsArrayMapPrototypebTest2500
     * @tc.desc map(self: FixedArray<double>, callbackfn) 全部元素加1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        let result = map(arr, (v, k, array) => v + 1.5);
        expect([...result]).assertDeepEquals([2.6, 3.7, 4.8]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2600
     * @tc.name builtinsArrayMapPrototypebTest2600
     * @tc.desc map(self: FixedArray<double>, callbackfn) 恒为0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [5.5.toDouble(), 6.6.toDouble(), 7.7.toDouble()];
        let result = map(arr, (v, k, array) => 0.0);
        expect([...result]).assertDeepEquals([0.0, 0.0, 0.0]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2700
     * @tc.name builtinsArrayMapPrototypebTest2700
     * @tc.desc map(self: FixedArray<double>, callbackfn) 恒为-1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        let result = map(arr, (v, k, array) => -1.1);
        expect([...result]).assertDeepEquals([-1.1, -1.1, -1.1]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2800
     * @tc.name builtinsArrayMapPrototypebTest2800
     * @tc.desc map(self: FixedArray<double>, callbackfn) 根据索引返回不同值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [10.0.toDouble(), 20.0.toDouble(), 30.0.toDouble(), 40.0.toDouble()];
        let result = map(arr, (v, k, array) => k * 1.0);
        expect([...result]).assertDeepEquals([0.0, 1.0, 2.0, 3.0]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest2900
     * @tc.name builtinsArrayMapPrototypebTest2900
     * @tc.desc map(self: FixedArray<double>, callbackfn) callbackfn依赖原数组内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [7.7.toDouble(), 8.8.toDouble(), 9.9.toDouble()];
        let result = map(arr, (v, k, array) => array[0]);
        expect([...result]).assertDeepEquals([7.7, 7.7, 7.7]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3000
     * @tc.name builtinsArrayMapPrototypebTest3000
     * @tc.desc map(self: FixedArray<double>, callbackfn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let result = map(arr, (v, k, array) => v + 1.5);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3100
     * @tc.name builtinsArrayMapPrototypebTest3100
     * @tc.desc map(self: FixedArray<double>, callbackfn) 单元素加1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [10.0.toDouble()];
        let result = map(arr, (v, k, array) => v + 1.5);
        expect([...result]).assertDeepEquals([11.5]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3200
     * @tc.name builtinsArrayMapPrototypebTest3200
     * @tc.desc map(self: FixedArray<double>, callbackfn) 单元素返回0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [255.0.toDouble()];
        let result = map(arr, (v, k, array) => 0.0);
        expect([...result]).assertDeepEquals([0.0]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3300
     * @tc.name builtinsArrayMapPrototypebTest3300
     * @tc.desc map(self: FixedArray<float>, callbackfn) 全部元素加1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = map(arr, (v, k, array) => v + 1.5.toFloat());
        expect([...result]).assertDeepEquals([2.6.toFloat(), 3.7.toFloat(), 4.8.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3400
     * @tc.name builtinsArrayMapPrototypebTest3400
     * @tc.desc map(self: FixedArray<float>, callbackfn) 恒为0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [5.5.toFloat(), 6.6.toFloat(), 7.7.toFloat()];
        let result = map(arr, (v, k, array) => 0.0.toFloat());
        expect([...result]).assertDeepEquals([0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3500
     * @tc.name builtinsArrayMapPrototypebTest3500
     * @tc.desc map(self: FixedArray<float>, callbackfn) 恒为-1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = map(arr, (v, k, array) => -1.1 .toFloat());
        expect([...result]).assertDeepEquals([-1.1.toFloat(), -1.1.toFloat(), -1.1.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3600
     * @tc.name builtinsArrayMapPrototypebTest3600
     * @tc.desc map(self: FixedArray<float>, callbackfn) 根据索引返回不同值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [10.0.toFloat(), 20.0.toFloat(), 30.0.toFloat(), 40.0.toFloat()];
        let result = map(arr, (v, k, array) => (k * 1.0).toFloat());
        expect([...result]).assertDeepEquals([0.0.toFloat(), 1.0.toFloat(), 2.0.toFloat(), 3.0.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3700
     * @tc.name builtinsArrayMapPrototypebTest3700
     * @tc.desc map(self: FixedArray<float>, callbackfn) callbackfn依赖原数组内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [7.7.toFloat(), 8.8.toFloat(), 9.9.toFloat()];
        let result = map(arr, (v, k, array) => array[0]);
        expect([...result]).assertDeepEquals([7.7.toFloat(), 7.7.toFloat(), 7.7.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3800
     * @tc.name builtinsArrayMapPrototypebTest3800
     * @tc.desc map(self: FixedArray<float>, callbackfn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let result = map(arr, (v, k, array) => v + 1.5.toFloat());
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest3900
     * @tc.name builtinsArrayMapPrototypebTest3900
     * @tc.desc map(self: FixedArray<float>, callbackfn) 单元素加1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [10.0.toFloat()];
        let result = map(arr, (v, k, array) => v + 1.5.toFloat());
        expect([...result]).assertDeepEquals([11.5.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4000
     * @tc.name builtinsArrayMapPrototypebTest4000
     * @tc.desc map(self: FixedArray<float>, callbackfn) 单元素返回0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [255.0.toFloat()];
        let result = map(arr, (v, k, array) => 0.0.toFloat());
        expect([...result]).assertDeepEquals([0.0.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4100
     * @tc.name builtinsArrayMapPrototypebTest4100
     * @tc.desc map(self: FixedArray<int>, callbackfn) 全部元素加1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = map(arr, (v, k, array) => v + 1);
        expect([...result]).assertDeepEquals([2, 3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4200
     * @tc.name builtinsArrayMapPrototypebTest4200
     * @tc.desc map(self: FixedArray<int>, callbackfn) 恒为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [5, 6, 7];
        let result = map(arr, (v, k, array) => 0);
        expect([...result]).assertDeepEquals([0, 0, 0]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4300
     * @tc.name builtinsArrayMapPrototypebTest4300
     * @tc.desc map(self: FixedArray<int>, callbackfn) 恒为-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = map(arr, (v, k, array) => -1);
        expect([...result]).assertDeepEquals([-1, -1, -1]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4400
     * @tc.name builtinsArrayMapPrototypebTest4400
     * @tc.desc map(self: FixedArray<int>, callbackfn) 根据索引返回不同值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [10, 20, 30, 40];
        let result = map(arr, (v, k, array) => k.toInt() * 2);
        expect([...result]).assertDeepEquals([0, 2, 4, 6]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4500
     * @tc.name builtinsArrayMapPrototypebTest4500
     * @tc.desc map(self: FixedArray<int>, callbackfn) callbackfn依赖原数组内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [7, 8, 9];
        let result = map(arr, (v, k, array) => array[0]);
        expect([...result]).assertDeepEquals([7, 7, 7]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4600
     * @tc.name builtinsArrayMapPrototypebTest4600
     * @tc.desc map(self: FixedArray<int>, callbackfn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = map(arr, (v, k, array) => v + 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4700
     * @tc.name builtinsArrayMapPrototypebTest4700
     * @tc.desc map(self: FixedArray<int>, callbackfn) 单元素加1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [10];
        let result = map(arr, (v, k, array) => v + 1);
        expect([...result]).assertDeepEquals([11]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4800
     * @tc.name builtinsArrayMapPrototypebTest4800
     * @tc.desc map(self: FixedArray<int>, callbackfn) 单元素返回0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [255];
        let result = map(arr, (v, k, array) => 0);
        expect([...result]).assertDeepEquals([0]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest4900
     * @tc.name builtinsArrayMapPrototypebTest4900
     * @tc.desc map(self: FixedArray<long>, callbackfn) 全部元素加1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = map(arr, (v, k, array) => v + 1);
        expect([...result]).assertDeepEquals([2, 3, 4] as Array<long>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5000
     * @tc.name builtinsArrayMapPrototypebTest5000
     * @tc.desc map(self: FixedArray<long>, callbackfn) 恒为0L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [5, 6, 7];
        let result = map(arr, (v, k, array) => 0);
        expect([...result]).assertDeepEquals([0, 0, 0] as Array<long>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5100
     * @tc.name builtinsArrayMapPrototypebTest5100
     * @tc.desc map(self: FixedArray<long>, callbackfn) 恒为-1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = map(arr, (v, k, array) => -1);
        expect([...result]).assertDeepEquals([-1, -1, -1] as Array<long>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5200
     * @tc.name builtinsArrayMapPrototypebTest5200
     * @tc.desc map(self: FixedArray<long>, callbackfn) 根据索引返回不同值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [10, 20, 30, 40];
        let result = map(arr, (v, k, array) => (k.toLong() * 2));
        expect([...result]).assertDeepEquals([0, 2, 4, 6] as Array<long>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5300
     * @tc.name builtinsArrayMapPrototypebTest5300
     * @tc.desc map(self: FixedArray<long>, callbackfn) callbackfn依赖原数组内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [7, 8, 9];
        let result = map(arr, (v, k, array) => array[0]);
        expect([...result]).assertDeepEquals([7, 7, 7] as Array<long>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5400
     * @tc.name builtinsArrayMapPrototypebTest5400
     * @tc.desc map(self: FixedArray<long>, callbackfn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = map(arr, (v, k, array) => v + 1);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5500
     * @tc.name builtinsArrayMapPrototypebTest5500
     * @tc.desc map(self: FixedArray<long>, callbackfn) 单元素加1L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [10];
        let result = map(arr, (v, k, array) => v + 1);
        expect([...result]).assertDeepEquals([11] as Array<long>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5600
     * @tc.name builtinsArrayMapPrototypebTest5600
     * @tc.desc map(self: FixedArray<long>, callbackfn) 单元素返回0L
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [255];
        let result = map(arr, (v, k, array) => 0);
        expect([...result]).assertDeepEquals([0] as Array<long>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5700
     * @tc.name builtinsArrayMapPrototypebTest5700
     * @tc.desc map(self: FixedArray<short>, callbackfn) 全部元素加1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = map(arr, (v, k, array) => (v + 1).toShort());
        expect([...result]).assertDeepEquals([2, 3, 4] as Array<short>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5800
     * @tc.name builtinsArrayMapPrototypebTest5800
     * @tc.desc map(self: FixedArray<short>, callbackfn) 恒为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [5, 6, 7];
        let result = map(arr, (v, k, array) => 0);
        expect([...result]).assertDeepEquals([0, 0, 0] as Array<short>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest5900
     * @tc.name builtinsArrayMapPrototypebTest5900
     * @tc.desc map(self: FixedArray<short>, callbackfn) 恒为-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = map(arr, (v, k, array) => (-1).toShort());
        expect([...result]).assertDeepEquals([-1, -1, -1] as Array<short>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest6000
     * @tc.name builtinsArrayMapPrototypebTest6000
     * @tc.desc map(self: FixedArray<short>, callbackfn) 根据索引返回不同值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [10, 20, 30, 40];
        let result = map(arr, (v, k, array) => (k * 2).toShort());
        expect([...result]).assertDeepEquals([0, 2, 4, 6] as Array<short>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest6100
     * @tc.name builtinsArrayMapPrototypebTest6100
     * @tc.desc map(self: FixedArray<short>, callbackfn) callbackfn依赖原数组内容
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [7, 8, 9];
        let result = map(arr, (v, k, array) => array[0]);
        expect([...result]).assertDeepEquals([7, 7, 7] as Array<short>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest6200
     * @tc.name builtinsArrayMapPrototypebTest6200
     * @tc.desc map(self: FixedArray<short>, callbackfn) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = map(arr, (v, k, array) => (v + 1).toShort());
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest6300
     * @tc.name builtinsArrayMapPrototypebTest6300
     * @tc.desc map(self: FixedArray<short>, callbackfn) 单元素加1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [10];
        let result = map(arr, (v, k, array) => (v + 1).toShort());
        expect([...result]).assertDeepEquals([11] as Array<short>);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayMapPrototypebTest6400
     * @tc.name builtinsArrayMapPrototypebTest6400
     * @tc.desc map(self: FixedArray<short>, callbackfn) 单元素返回0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayMapPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayMapPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [255];
        let result = map(arr, (v, k, array) => 0);
        expect([...result]).assertDeepEquals([0] as Array<short>);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}