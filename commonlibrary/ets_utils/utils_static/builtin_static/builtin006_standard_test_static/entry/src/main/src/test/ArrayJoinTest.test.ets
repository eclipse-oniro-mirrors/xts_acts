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
export default function builtinsArrayJoinPrototypebTest(){
  describe('builtinsArrayJoinPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayJoinPrototypebTest0100
     * @tc.name builtinsArrayJoinPrototypebTest0100
     * @tc.desc join(self: FixedArray<boolean>, sep?) 默认分隔符，全部true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        let result = join(arr);
        expect(result).assertEqual("true,true,true");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest0200
     * @tc.name builtinsArrayJoinPrototypebTest0200
     * @tc.desc join(self: FixedArray<boolean>, sep?) 默认分隔符，true和false混合
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let result = join(arr);
        expect(result).assertEqual("true,false,true");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest0300
     * @tc.name builtinsArrayJoinPrototypebTest0300
     * @tc.desc join(self: FixedArray<boolean>, sep?) 指定分隔符'|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, true];
        let result = join(arr, "|");
        expect(result).assertEqual("false|false|true");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest0400
     * @tc.name builtinsArrayJoinPrototypebTest0400
     * @tc.desc join(self: FixedArray<boolean>, sep?) 指定分隔符空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, false];
        let result = join(arr, "");
        expect(result).assertEqual("truefalsefalse");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest0500
     * @tc.name builtinsArrayJoinPrototypebTest0500
     * @tc.desc join(self: FixedArray<boolean>, sep?) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false];
        let result = join(arr);
        expect(result).assertEqual("false");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest0600
     * @tc.name builtinsArrayJoinPrototypebTest0600
     * @tc.desc join(self: FixedArray<boolean>, sep?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let result = join(arr);
        expect(result).assertEqual("");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest0700
     * @tc.name builtinsArrayJoinPrototypebTest0700
     * @tc.desc join(self: FixedArray<boolean>, sep?) 指定分隔符为逗号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, true];
        let result = join(arr, ",");
        expect(result).assertEqual("false,true");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest0800
     * @tc.name builtinsArrayJoinPrototypebTest0800
     * @tc.desc join(self: FixedArray<boolean>, sep?) 指定分隔符为多个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let result = join(arr, "--");
        expect(result).assertEqual("true--false--true");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest0900
     * @tc.name builtinsArrayJoinPrototypebTest0900
     * @tc.desc join(self: FixedArray<byte>, sep?) 默认分隔符，全部元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3];
        let result = join(arr);
        expect(result).assertEqual("1,2,3");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1000
     * @tc.name builtinsArrayJoinPrototypebTest1000
     * @tc.desc join(self: FixedArray<byte>, sep?) 默认分隔符，包含0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [0, 1, 2];
        let result = join(arr);
        expect(result).assertEqual("0,1,2");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1100
     * @tc.name builtinsArrayJoinPrototypebTest1100
     * @tc.desc join(self: FixedArray<byte>, sep?) 指定分隔符'|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [4, 5, 6];
        let result = join(arr, "|");
        expect(result).assertEqual("4|5|6");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1200
     * @tc.name builtinsArrayJoinPrototypebTest1200
     * @tc.desc join(self: FixedArray<byte>, sep?) 指定分隔符空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [7, 8, 9];
        let result = join(arr, "");
        expect(result).assertEqual("789");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1300
     * @tc.name builtinsArrayJoinPrototypebTest1300
     * @tc.desc join(self: FixedArray<byte>, sep?) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [10];
        let result = join(arr);
        expect(result).assertEqual("10");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1400
     * @tc.name builtinsArrayJoinPrototypebTest1400
     * @tc.desc join(self: FixedArray<byte>, sep?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let result = join(arr);
        expect(result).assertEqual("");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1500
     * @tc.name builtinsArrayJoinPrototypebTest1500
     * @tc.desc join(self: FixedArray<byte>, sep?) 指定分隔符为逗号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [11, 12];
        let result = join(arr, ",");
        expect(result).assertEqual("11,12");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1600
     * @tc.name builtinsArrayJoinPrototypebTest1600
     * @tc.desc join(self: FixedArray<byte>, sep?) 指定分隔符为多个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [13, 14, 15];
        let result = join(arr, "--");
        expect(result).assertEqual("13--14--15");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1700
     * @tc.name builtinsArrayJoinPrototypebTest1700
     * @tc.desc join(self: FixedArray<char>, sep?) 默认分隔符，全部小写字母
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = join(arr);
        expect(result).assertEqual("a,b,c");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1800
     * @tc.name builtinsArrayJoinPrototypebTest1800
     * @tc.desc join(self: FixedArray<char>, sep?) 默认分隔符，包含大写字母
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'A', c'b', c'C'];
        let result = join(arr);
        expect(result).assertEqual("A,b,C");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest1900
     * @tc.name builtinsArrayJoinPrototypebTest1900
     * @tc.desc join(self: FixedArray<char>, sep?) 指定分隔符'|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'x', c'y', c'z'];
        let result = join(arr, "|");
        expect(result).assertEqual("x|y|z");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2000
     * @tc.name builtinsArrayJoinPrototypebTest2000
     * @tc.desc join(self: FixedArray<char>, sep?) 指定分隔符空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = join(arr, "");
        expect(result).assertEqual("abc");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2100
     * @tc.name builtinsArrayJoinPrototypebTest2100
     * @tc.desc join(self: FixedArray<char>, sep?) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'k'];
        let result = join(arr);
        expect(result).assertEqual("k");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2200
     * @tc.name builtinsArrayJoinPrototypebTest2200
     * @tc.desc join(self: FixedArray<char>, sep?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [];
        let result = join(arr);
        expect(result).assertEqual("");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2300
     * @tc.name builtinsArrayJoinPrototypebTest2300
     * @tc.desc join(self: FixedArray<char>, sep?) 指定分隔符为逗号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b'];
        let result = join(arr, ",");
        expect(result).assertEqual("a,b");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2400
     * @tc.name builtinsArrayJoinPrototypebTest2400
     * @tc.desc join(self: FixedArray<char>, sep?) 指定分隔符为多个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [c'a', c'b', c'c'];
        let result = join(arr, "--");
        expect(result).assertEqual("a--b--c");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2500
     * @tc.name builtinsArrayJoinPrototypebTest2500
     * @tc.desc join(self: FixedArray<double>, sep?) 默认分隔符，全部元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        let result = join(arr);
        expect(result).assertEqual("1.1,2.2,3.3");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2600
     * @tc.name builtinsArrayJoinPrototypebTest2600
     * @tc.desc join(self: FixedArray<double>, sep?) 默认分隔符，包含0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [0.0.toDouble(), 1.1.toDouble(), 2.2.toDouble()];
        let result = join(arr);
        expect(result).assertEqual("0,1.1,2.2");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2700
     * @tc.name builtinsArrayJoinPrototypebTest2700
     * @tc.desc join(self: FixedArray<double>, sep?) 指定分隔符'|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [4.4.toDouble(), 5.5.toDouble(), 6.6.toDouble()];
        let result = join(arr, "|");
        expect(result).assertEqual("4.4|5.5|6.6");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2800
     * @tc.name builtinsArrayJoinPrototypebTest2800
     * @tc.desc join(self: FixedArray<double>, sep?) 指定分隔符空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [7.7.toDouble(), 8.8.toDouble(), 9.9.toDouble()];
        let result = join(arr, "");
        expect(result).assertEqual("7.78.89.9");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest2900
     * @tc.name builtinsArrayJoinPrototypebTest2900
     * @tc.desc join(self: FixedArray<double>, sep?) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [10.1.toDouble()];
        let result = join(arr);
        expect(result).assertEqual("10.1");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3000
     * @tc.name builtinsArrayJoinPrototypebTest3000
     * @tc.desc join(self: FixedArray<double>, sep?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let result = join(arr);
        expect(result).assertEqual("");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3100
     * @tc.name builtinsArrayJoinPrototypebTest3100
     * @tc.desc join(self: FixedArray<double>, sep?) 指定分隔符为逗号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [11.11.toDouble(), 12.12.toDouble()];
        let result = join(arr, ",");
        expect(result).assertEqual("11.11,12.12");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3200
     * @tc.name builtinsArrayJoinPrototypebTest3200
     * @tc.desc join(self: FixedArray<double>, sep?) 指定分隔符为多个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [13.13.toDouble(), 14.14.toDouble(), 15.15.toDouble()];
        let result = join(arr, "--");
        expect(result).assertEqual("13.13--14.14--15.15");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3300
     * @tc.name builtinsArrayJoinPrototypebTest3300
     * @tc.desc join(self: FixedArray<float>, sep?) 默认分隔符，全部元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let result = join(arr);
        expect(result).assertEqual("1.1,2.2,3.3");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3400
     * @tc.name builtinsArrayJoinPrototypebTest3400
     * @tc.desc join(self: FixedArray<float>, sep?) 默认分隔符，包含0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [0.0.toFloat(), 1.1.toFloat(), 2.2.toFloat()];
        let result = join(arr);
        expect(result).assertEqual("0,1.1,2.2");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3500
     * @tc.name builtinsArrayJoinPrototypebTest3500
     * @tc.desc join(self: FixedArray<float>, sep?) 指定分隔符'|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [4.4.toFloat(), 5.5.toFloat(), 6.6.toFloat()];
        let result = join(arr, "|");
        expect(result).assertEqual("4.4|5.5|6.6");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3600
     * @tc.name builtinsArrayJoinPrototypebTest3600
     * @tc.desc join(self: FixedArray<float>, sep?) 指定分隔符空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [7.7.toFloat(), 8.8.toFloat(), 9.9.toFloat()];
        let result = join(arr, "");
        expect(result).assertEqual("7.78.89.9");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3700
     * @tc.name builtinsArrayJoinPrototypebTest3700
     * @tc.desc join(self: FixedArray<float>, sep?) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [10.1.toFloat()];
        let result = join(arr);
        expect(result).assertEqual("10.1");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3800
     * @tc.name builtinsArrayJoinPrototypebTest3800
     * @tc.desc join(self: FixedArray<float>, sep?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let result = join(arr);
        expect(result).assertEqual("");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest3900
     * @tc.name builtinsArrayJoinPrototypebTest3900
     * @tc.desc join(self: FixedArray<float>, sep?) 指定分隔符为逗号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [11.11.toFloat(), 12.12.toFloat()];
        let result = join(arr, ",");
        expect(result).assertEqual("11.11,12.12");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4000
     * @tc.name builtinsArrayJoinPrototypebTest4000
     * @tc.desc join(self: FixedArray<float>, sep?) 指定分隔符为多个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [13.13.toFloat(), 14.14.toFloat(), 15.15.toFloat()];
        let result = join(arr, "--");
        expect(result).assertEqual("13.13--14.14--15.15");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4100
     * @tc.name builtinsArrayJoinPrototypebTest4100
     * @tc.desc join(self: FixedArray<int>, sep?) 默认分隔符，全部元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3];
        let result = join(arr);
        expect(result).assertEqual("1,2,3");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4200
     * @tc.name builtinsArrayJoinPrototypebTest4200
     * @tc.desc join(self: FixedArray<int>, sep?) 默认分隔符，包含0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [0, 1, 2];
        let result = join(arr);
        expect(result).assertEqual("0,1,2");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4300
     * @tc.name builtinsArrayJoinPrototypebTest4300
     * @tc.desc join(self: FixedArray<int>, sep?) 指定分隔符'|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [4, 5, 6];
        let result = join(arr, "|");
        expect(result).assertEqual("4|5|6");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4400
     * @tc.name builtinsArrayJoinPrototypebTest4400
     * @tc.desc join(self: FixedArray<int>, sep?) 指定分隔符空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [7, 8, 9];
        let result = join(arr, "");
        expect(result).assertEqual("789");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4500
     * @tc.name builtinsArrayJoinPrototypebTest4500
     * @tc.desc join(self: FixedArray<int>, sep?) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [10];
        let result = join(arr);
        expect(result).assertEqual("10");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4600
     * @tc.name builtinsArrayJoinPrototypebTest4600
     * @tc.desc join(self: FixedArray<int>, sep?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let result = join(arr);
        expect(result).assertEqual("");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4700
     * @tc.name builtinsArrayJoinPrototypebTest4700
     * @tc.desc join(self: FixedArray<int>, sep?) 指定分隔符为逗号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [11, 12];
        let result = join(arr, ",");
        expect(result).assertEqual("11,12");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4800
     * @tc.name builtinsArrayJoinPrototypebTest4800
     * @tc.desc join(self: FixedArray<int>, sep?) 指定分隔符为多个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [13, 14, 15];
        let result = join(arr, "--");
        expect(result).assertEqual("13--14--15");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest4900
     * @tc.name builtinsArrayJoinPrototypebTest4900
     * @tc.desc join(self: FixedArray<long>, sep?) 默认分隔符，全部元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3];
        let result = join(arr);
        expect(result).assertEqual("1,2,3");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5000
     * @tc.name builtinsArrayJoinPrototypebTest5000
     * @tc.desc join(self: FixedArray<long>, sep?) 默认分隔符，包含0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [0, 1, 2];
        let result = join(arr);
        expect(result).assertEqual("0,1,2");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5100
     * @tc.name builtinsArrayJoinPrototypebTest5100
     * @tc.desc join(self: FixedArray<long>, sep?) 指定分隔符'|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [4, 5, 6];
        let result = join(arr, "|");
        expect(result).assertEqual("4|5|6");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5200
     * @tc.name builtinsArrayJoinPrototypebTest5200
     * @tc.desc join(self: FixedArray<long>, sep?) 指定分隔符空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [7, 8, 9];
        let result = join(arr, "");
        expect(result).assertEqual("789");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5300
     * @tc.name builtinsArrayJoinPrototypebTest5300
     * @tc.desc join(self: FixedArray<long>, sep?) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [10];
        let result = join(arr);
        expect(result).assertEqual("10");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5400
     * @tc.name builtinsArrayJoinPrototypebTest5400
     * @tc.desc join(self: FixedArray<long>, sep?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let result = join(arr);
        expect(result).assertEqual("");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5500
     * @tc.name builtinsArrayJoinPrototypebTest5500
     * @tc.desc join(self: FixedArray<long>, sep?) 指定分隔符为逗号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [11, 12];
        let result = join(arr, ",");
        expect(result).assertEqual("11,12");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5600
     * @tc.name builtinsArrayJoinPrototypebTest5600
     * @tc.desc join(self: FixedArray<long>, sep?) 指定分隔符为多个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [13, 14, 15];
        let result = join(arr, "--");
        expect(result).assertEqual("13--14--15");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5700
     * @tc.name builtinsArrayJoinPrototypebTest5700
     * @tc.desc join(self: FixedArray<short>, sep?) 默认分隔符，全部元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3];
        let result = join(arr);
        expect(result).assertEqual("1,2,3");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5800
     * @tc.name builtinsArrayJoinPrototypebTest5800
     * @tc.desc join(self: FixedArray<short>, sep?) 默认分隔符，包含0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [0, 1, 2];
        let result = join(arr);
        expect(result).assertEqual("0,1,2");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest5900
     * @tc.name builtinsArrayJoinPrototypebTest5900
     * @tc.desc join(self: FixedArray<short>, sep?) 指定分隔符'|'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [4, 5, 6];
        let result = join(arr, "|");
        expect(result).assertEqual("4|5|6");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest6000
     * @tc.name builtinsArrayJoinPrototypebTest6000
     * @tc.desc join(self: FixedArray<short>, sep?) 指定分隔符空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [7, 8, 9];
        let result = join(arr, "");
        expect(result).assertEqual("789");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest6100
     * @tc.name builtinsArrayJoinPrototypebTest6100
     * @tc.desc join(self: FixedArray<short>, sep?) 只有一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [10];
        let result = join(arr);
        expect(result).assertEqual("10");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest6200
     * @tc.name builtinsArrayJoinPrototypebTest6200
     * @tc.desc join(self: FixedArray<short>, sep?) 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let result = join(arr);
        expect(result).assertEqual("");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest6300
     * @tc.name builtinsArrayJoinPrototypebTest6300
     * @tc.desc join(self: FixedArray<short>, sep?) 指定分隔符为逗号
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [11, 12];
        let result = join(arr, ",");
        expect(result).assertEqual("11,12");
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayJoinPrototypebTest6400
     * @tc.name builtinsArrayJoinPrototypebTest6400
     * @tc.desc join(self: FixedArray<short>, sep?) 指定分隔符为多个字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayJoinPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayJoinPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [13, 14, 15];
        let result = join(arr, "--");
        expect(result).assertEqual("13--14--15");
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}