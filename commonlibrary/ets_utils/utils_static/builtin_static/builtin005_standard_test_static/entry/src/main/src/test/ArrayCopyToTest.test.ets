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
export default function builtinsArrayCopyToPrototypebTest(){
  describe('builtinsArrayCopyToPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayCopyToPrototypebTest0100
     * @tc.name builtinsArrayCopyToPrototypebTest0100
     * @tc.desc copyTo(self: FixedArray<boolean>, ...) 全量拷贝到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, false, true];
        const dst: FixedArray<boolean> = [false, false, false];
        copyTo(src, dst, 0, 0, 3);
        expect(dst[0]).assertEqual(true);
        expect(dst[1]).assertEqual(false);
        expect(dst[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest0200
     * @tc.name builtinsArrayCopyToPrototypebTest0200
     * @tc.desc copyTo(self: FixedArray<boolean>, ...) 拷贝前缀片段到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, false, true, false];
        const dst: FixedArray<boolean> = [false, false, false, false];
        copyTo(src, dst, 0, 0, 2);
        expect(dst[0]).assertEqual(true);
        expect(dst[1]).assertEqual(false);
        expect(dst[2]).assertEqual(false);
        expect(dst[3]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest0300
     * @tc.name builtinsArrayCopyToPrototypebTest0300
     * @tc.desc copyTo(self: FixedArray<boolean>, ...) 中间片段拷贝到偏移位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, false, true, false, true];
        const dst: FixedArray<boolean> = [false, false, false, false, false];
        copyTo(src, dst, 1, 1, 4);
        expect(dst[0]).assertEqual(false);
        expect(dst[1]).assertEqual(false);
        expect(dst[2]).assertEqual(true);
        expect(dst[3]).assertEqual(false);
        expect(dst[4]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest0400
     * @tc.name builtinsArrayCopyToPrototypebTest0400
     * @tc.desc copyTo(self: FixedArray<boolean>, ...) 前缀片段拷贝到dst中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, true, false, false];
        const dst: FixedArray<boolean> = [false, false, false, false, false];
        copyTo(src, dst, 2, 0, 2);
        expect(dst[0]).assertEqual(false);
        expect(dst[1]).assertEqual(false);
        expect(dst[2]).assertEqual(true);
        expect(dst[3]).assertEqual(true);
        expect(dst[4]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest0500
     * @tc.name builtinsArrayCopyToPrototypebTest0500
     * @tc.desc copyTo(self: FixedArray<boolean>, ...) 空区间拷贝(srcStart==srcEnd)不改变dst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, false, true];
        const dst: FixedArray<boolean> = [true, false, true];
        copyTo(src, dst, 1, 2, 2);
        expect(dst[0]).assertEqual(true);
        expect(dst[1]).assertEqual(false);
        expect(dst[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest0600
     * @tc.name builtinsArrayCopyToPrototypebTest0600
     * @tc.desc copyTo(self: FixedArray<boolean>, ...) 覆盖dst中间区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [false, false, false];
        const dst: FixedArray<boolean> = [true, true, true, true];
        copyTo(src, dst, 1, 0, 3);
        expect(dst[0]).assertEqual(true);
        expect(dst[1]).assertEqual(false);
        expect(dst[2]).assertEqual(false);
        expect(dst[3]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest0700
     * @tc.name builtinsArrayCopyToPrototypebTest0700
     * @tc.desc copyTo(self: FixedArray<boolean>, ...) 单元素拷贝到末尾-1位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [false, true, false];
        const dst: FixedArray<boolean> = [false, false, false];
        copyTo(src, dst, 2, 1, 2);
        expect(dst[0]).assertEqual(false);
        expect(dst[1]).assertEqual(false);
        expect(dst[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest0800
     * @tc.name builtinsArrayCopyToPrototypebTest0800
     * @tc.desc copyTo(self: FixedArray<boolean>, ...) 尾部片段拷贝到dst尾部
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, false, true, false];
        const dst: FixedArray<boolean> = [false, false, false, false, false];
        copyTo(src, dst, 3, 2, 4);
        expect(dst[0]).assertEqual(false);
        expect(dst[1]).assertEqual(false);
        expect(dst[2]).assertEqual(false);
        expect(dst[3]).assertEqual(true);
        expect(dst[4]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest0900
     * @tc.name builtinsArrayCopyToPrototypebTest0900
     * @tc.desc copyTo(self: FixedArray<byte>, ...) 全量拷贝到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const src: FixedArray<byte> = [1, 2, 3];
        const dst: FixedArray<byte> = [0, 0, 0];
        copyTo(src, dst, 0, 0, 3);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
        expect(dst[2]).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1000
     * @tc.name builtinsArrayCopyToPrototypebTest1000
     * @tc.desc copyTo(self: FixedArray<byte>, ...) 拷贝前缀片段到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const src: FixedArray<byte> = [1, 2, 3, 4];
        const dst: FixedArray<byte> = [0, 0, 0, 0];
        copyTo(src, dst, 0, 0, 2);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
        expect(dst[2]).assertEqual(0);
        expect(dst[3]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1100
     * @tc.name builtinsArrayCopyToPrototypebTest1100
     * @tc.desc copyTo(self: FixedArray<byte>, ...) 中间片段拷贝到偏移位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<byte> = [9, 8, 7, 6, 5];
        const dst: FixedArray<byte> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 1, 1, 4);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(8);
        expect(dst[2]).assertEqual(7);
        expect(dst[3]).assertEqual(6);
        expect(dst[4]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1200
     * @tc.name builtinsArrayCopyToPrototypebTest1200
     * @tc.desc copyTo(self: FixedArray<byte>, ...) 前缀片段拷贝到dst中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<byte> = [5, 6, 7, 8];
        const dst: FixedArray<byte> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 2, 0, 2);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(5);
        expect(dst[3]).assertEqual(6);
        expect(dst[4]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1300
     * @tc.name builtinsArrayCopyToPrototypebTest1300
     * @tc.desc copyTo(self: FixedArray<byte>, ...) 空区间拷贝(srcStart==srcEnd)不改变dst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<byte> = [1, 2, 3];
        const dst: FixedArray<byte> = [7, 8, 9];
        copyTo(src, dst, 1, 2, 2);
        expect(dst[0]).assertEqual(7);
        expect(dst[1]).assertEqual(8);
        expect(dst[2]).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1400
     * @tc.name builtinsArrayCopyToPrototypebTest1400
     * @tc.desc copyTo(self: FixedArray<byte>, ...) 覆盖dst中间区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<byte> = [9, 9, 9];
        const dst: FixedArray<byte> = [1, 2, 3, 4];
        copyTo(src, dst, 1, 0, 2);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(9);
        expect(dst[2]).assertEqual(9);
        expect(dst[3]).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1500
     * @tc.name builtinsArrayCopyToPrototypebTest1500
     * @tc.desc copyTo(self: FixedArray<byte>, ...) 单元素拷贝到末尾-1位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<byte> = [1, 2, 3];
        const dst: FixedArray<byte> = [0, 0, 0];
        copyTo(src, dst, 2, 1, 2);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1600
     * @tc.name builtinsArrayCopyToPrototypebTest1600
     * @tc.desc copyTo(self: FixedArray<byte>, ...) 尾部片段拷贝到dst尾部
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<byte> = [1, 2, 3, 4];
        const dst: FixedArray<byte> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 3, 2, 4);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(0);
        expect(dst[3]).assertEqual(3);
        expect(dst[4]).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1700
     * @tc.name builtinsArrayCopyToPrototypebTest1700
     * @tc.desc copyTo(self: FixedArray<char>, ...) 全量拷贝到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [c'a', c'b', c'c'];
        const dst: FixedArray<char> = [c'x', c'x', c'x'];
        copyTo(src, dst, 0, 0, 3);
        expect(dst[0]).assertEqual(c'a');
        expect(dst[1]).assertEqual(c'b');
        expect(dst[2]).assertEqual(c'c');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1800
     * @tc.name builtinsArrayCopyToPrototypebTest1800
     * @tc.desc copyTo(self: FixedArray<char>, ...) 拷贝前缀片段到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const dst: FixedArray<char> = [c'x', c'x', c'x', c'x'];
        copyTo(src, dst, 0, 0, 2);
        expect(dst[0]).assertEqual(c'a');
        expect(dst[1]).assertEqual(c'b');
        expect(dst[2]).assertEqual(c'x');
        expect(dst[3]).assertEqual(c'x');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest1900
     * @tc.name builtinsArrayCopyToPrototypebTest1900
     * @tc.desc copyTo(self: FixedArray<char>, ...) 中间片段拷贝到偏移位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [c'j', c'i', c'h', c'g', c'f'];
        const dst: FixedArray<char> = [c'x', c'x', c'x', c'x', c'x'];
        copyTo(src, dst, 1, 1, 4);
        expect(dst[0]).assertEqual(c'x');
        expect(dst[1]).assertEqual(c'i');
        expect(dst[2]).assertEqual(c'h');
        expect(dst[3]).assertEqual(c'g');
        expect(dst[4]).assertEqual(c'x');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2000
     * @tc.name builtinsArrayCopyToPrototypebTest2000
     * @tc.desc copyTo(self: FixedArray<char>, ...) 前缀片段拷贝到dst中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [c'm', c'n', c'o', c'p'];
        const dst: FixedArray<char> = [c'x', c'x', c'x', c'x', c'x'];
        copyTo(src, dst, 2, 0, 2);
        expect(dst[0]).assertEqual(c'x');
        expect(dst[1]).assertEqual(c'x');
        expect(dst[2]).assertEqual(c'm');
        expect(dst[3]).assertEqual(c'n');
        expect(dst[4]).assertEqual(c'x');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2100
     * @tc.name builtinsArrayCopyToPrototypebTest2100
     * @tc.desc copyTo(self: FixedArray<char>, ...) 空区间拷贝(srcStart==srcEnd)不改变dst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [c'a', c'b', c'c'];
        const dst: FixedArray<char> = [c'u', c'v', c'w'];
        copyTo(src, dst, 1, 2, 2);
        expect(dst[0]).assertEqual(c'u');
        expect(dst[1]).assertEqual(c'v');
        expect(dst[2]).assertEqual(c'w');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2200
     * @tc.name builtinsArrayCopyToPrototypebTest2200
     * @tc.desc copyTo(self: FixedArray<char>, ...) 覆盖dst中间区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [c'k', c'k', c'k'];
        const dst: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        copyTo(src, dst, 1, 0, 2);
        expect(dst[0]).assertEqual(c'a');
        expect(dst[1]).assertEqual(c'k');
        expect(dst[2]).assertEqual(c'k');
        expect(dst[3]).assertEqual(c'd');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2300
     * @tc.name builtinsArrayCopyToPrototypebTest2300
     * @tc.desc copyTo(self: FixedArray<char>, ...) 单元素拷贝到末尾-1位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [c'a', c'z', c'y'];
        const dst: FixedArray<char> = [c'0', c'0', c'0'];
        copyTo(src, dst, 2, 1, 2);
        expect(dst[0]).assertEqual(c'0');
        expect(dst[1]).assertEqual(c'0');
        expect(dst[2]).assertEqual(c'z');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2400
     * @tc.name builtinsArrayCopyToPrototypebTest2400
     * @tc.desc copyTo(self: FixedArray<char>, ...) 尾部片段拷贝到dst尾部
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [c'a', c'b', c'c', c'd'];
        const dst: FixedArray<char> = [c'_', c'_', c'_', c'_', c'_'];
        copyTo(src, dst, 3, 2, 4);
        expect(dst[0]).assertEqual(c'_');
        expect(dst[1]).assertEqual(c'_');
        expect(dst[2]).assertEqual(c'_');
        expect(dst[3]).assertEqual(c'c');
        expect(dst[4]).assertEqual(c'd');
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2500
     * @tc.name builtinsArrayCopyToPrototypebTest2500
     * @tc.desc copyTo(self: FixedArray<double>, ...) 全量拷贝到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const dst: FixedArray<double> = [0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble()];
        copyTo(src, dst, 0, 0, 3);
        expect(dst[0]).assertEqual(1.1.toDouble());
        expect(dst[1]).assertEqual(2.2.toDouble());
        expect(dst[2]).assertEqual(3.3.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2600
     * @tc.name builtinsArrayCopyToPrototypebTest2600
     * @tc.desc copyTo(self: FixedArray<double>, ...) 拷贝前缀片段到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble()];
        const dst: FixedArray<double> = [0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble()];
        copyTo(src, dst, 0, 0, 2);
        expect(dst[0]).assertEqual(1.1.toDouble());
        expect(dst[1]).assertEqual(2.2.toDouble());
        expect(dst[2]).assertEqual(0.0.toDouble());
        expect(dst[3]).assertEqual(0.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2700
     * @tc.name builtinsArrayCopyToPrototypebTest2700
     * @tc.desc copyTo(self: FixedArray<double>, ...) 中间片段拷贝到偏移位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [9.9.toDouble(), 8.8.toDouble(), 7.7.toDouble(), 6.6.toDouble(), 5.5.toDouble()];
        const dst: FixedArray<double> = [0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble()];
        copyTo(src, dst, 1, 1, 4);
        expect(dst[0]).assertEqual(0.0.toDouble());
        expect(dst[1]).assertEqual(8.8.toDouble());
        expect(dst[2]).assertEqual(7.7.toDouble());
        expect(dst[3]).assertEqual(6.6.toDouble());
        expect(dst[4]).assertEqual(0.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2800
     * @tc.name builtinsArrayCopyToPrototypebTest2800
     * @tc.desc copyTo(self: FixedArray<double>, ...) 前缀片段拷贝到dst中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [5.5.toDouble(), 6.6.toDouble(), 7.7.toDouble(), 8.8.toDouble()];
        const dst: FixedArray<double> = [0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble()];
        copyTo(src, dst, 2, 0, 2);
        expect(dst[0]).assertEqual(0.0.toDouble());
        expect(dst[1]).assertEqual(0.0.toDouble());
        expect(dst[2]).assertEqual(5.5.toDouble());
        expect(dst[3]).assertEqual(6.6.toDouble());
        expect(dst[4]).assertEqual(0.0.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest2900
     * @tc.name builtinsArrayCopyToPrototypebTest2900
     * @tc.desc copyTo(self: FixedArray<double>, ...) 空区间拷贝(srcStart==srcEnd)不改变dst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const dst: FixedArray<double> = [7.7.toDouble(), 8.8.toDouble(), 9.9.toDouble()];
        copyTo(src, dst, 1, 2, 2);
        expect(dst[0]).assertEqual(7.7.toDouble());
        expect(dst[1]).assertEqual(8.8.toDouble());
        expect(dst[2]).assertEqual(9.9.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3000
     * @tc.name builtinsArrayCopyToPrototypebTest3000
     * @tc.desc copyTo(self: FixedArray<double>, ...) 覆盖dst中间区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [9.9.toDouble(), 9.9.toDouble(), 9.9.toDouble()];
        const dst: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble()];
        copyTo(src, dst, 1, 0, 2);
        expect(dst[0]).assertEqual(1.1.toDouble());
        expect(dst[1]).assertEqual(9.9.toDouble());
        expect(dst[2]).assertEqual(9.9.toDouble());
        expect(dst[3]).assertEqual(4.4.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3100
     * @tc.name builtinsArrayCopyToPrototypebTest3100
     * @tc.desc copyTo(self: FixedArray<double>, ...) 单元素拷贝到末尾-1位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble()];
        const dst: FixedArray<double> = [0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble()];
        copyTo(src, dst, 2, 1, 2);
        expect(dst[0]).assertEqual(0.0.toDouble());
        expect(dst[1]).assertEqual(0.0.toDouble());
        expect(dst[2]).assertEqual(2.2.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3200
     * @tc.name builtinsArrayCopyToPrototypebTest3200
     * @tc.desc copyTo(self: FixedArray<double>, ...) 尾部片段拷贝到dst尾部
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [1.1.toDouble(), 2.2.toDouble(), 3.3.toDouble(), 4.4.toDouble()];
        const dst: FixedArray<double> = [0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble(), 0.0.toDouble()];
        copyTo(src, dst, 3, 2, 4);
        expect(dst[0]).assertEqual(0.0.toDouble());
        expect(dst[1]).assertEqual(0.0.toDouble());
        expect(dst[2]).assertEqual(0.0.toDouble());
        expect(dst[3]).assertEqual(3.3.toDouble());
        expect(dst[4]).assertEqual(4.4.toDouble());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3300
     * @tc.name builtinsArrayCopyToPrototypebTest3300
     * @tc.desc copyTo(self: FixedArray<float>, ...) 全量拷贝到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const dst: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        copyTo(src, dst, 0, 0, 3);
        expect(dst[0]).assertEqual(1.1.toFloat());
        expect(dst[1]).assertEqual(2.2.toFloat());
        expect(dst[2]).assertEqual(3.3.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3400
     * @tc.name builtinsArrayCopyToPrototypebTest3400
     * @tc.desc copyTo(self: FixedArray<float>, ...) 拷贝前缀片段到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const dst: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        copyTo(src, dst, 0, 0, 2);
        expect(dst[0]).assertEqual(1.1.toFloat());
        expect(dst[1]).assertEqual(2.2.toFloat());
        expect(dst[2]).assertEqual(0.0.toFloat());
        expect(dst[3]).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3500
     * @tc.name builtinsArrayCopyToPrototypebTest3500
     * @tc.desc copyTo(self: FixedArray<float>, ...) 中间片段拷贝到偏移位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [9.9.toFloat(), 8.8.toFloat(), 7.7.toFloat(), 6.6.toFloat(), 5.5.toFloat()];
        const dst: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        copyTo(src, dst, 1, 1, 4);
        expect(dst[0]).assertEqual(0.0.toFloat());
        expect(dst[1]).assertEqual(8.8.toFloat());
        expect(dst[2]).assertEqual(7.7.toFloat());
        expect(dst[3]).assertEqual(6.6.toFloat());
        expect(dst[4]).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3600
     * @tc.name builtinsArrayCopyToPrototypebTest3600
     * @tc.desc copyTo(self: FixedArray<float>, ...) 前缀片段拷贝到dst中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [5.5.toFloat(), 6.6.toFloat(), 7.7.toFloat(), 8.8.toFloat()];
        const dst: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        copyTo(src, dst, 2, 0, 2);
        expect(dst[0]).assertEqual(0.0.toFloat());
        expect(dst[1]).assertEqual(0.0.toFloat());
        expect(dst[2]).assertEqual(5.5.toFloat());
        expect(dst[3]).assertEqual(6.6.toFloat());
        expect(dst[4]).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3700
     * @tc.name builtinsArrayCopyToPrototypebTest3700
     * @tc.desc copyTo(self: FixedArray<float>, ...) 空区间拷贝(srcStart==srcEnd)不改变dst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const dst: FixedArray<float> = [7.7.toFloat(), 8.8.toFloat(), 9.9.toFloat()];
        copyTo(src, dst, 1, 2, 2);
        expect(dst[0]).assertEqual(7.7.toFloat());
        expect(dst[1]).assertEqual(8.8.toFloat());
        expect(dst[2]).assertEqual(9.9.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3800
     * @tc.name builtinsArrayCopyToPrototypebTest3800
     * @tc.desc copyTo(self: FixedArray<float>, ...) 覆盖dst中间区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [9.9.toFloat(), 9.9.toFloat(), 9.9.toFloat()];
        const dst: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        copyTo(src, dst, 1, 0, 2);
        expect(dst[0]).assertEqual(1.1.toFloat());
        expect(dst[1]).assertEqual(9.9.toFloat());
        expect(dst[2]).assertEqual(9.9.toFloat());
        expect(dst[3]).assertEqual(4.4.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest3900
     * @tc.name builtinsArrayCopyToPrototypebTest3900
     * @tc.desc copyTo(self: FixedArray<float>, ...) 单元素拷贝到末尾-1位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const dst: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        copyTo(src, dst, 2, 1, 2);
        expect(dst[0]).assertEqual(0.0.toFloat());
        expect(dst[1]).assertEqual(0.0.toFloat());
        expect(dst[2]).assertEqual(2.2.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4000
     * @tc.name builtinsArrayCopyToPrototypebTest4000
     * @tc.desc copyTo(self: FixedArray<float>, ...) 尾部片段拷贝到dst尾部
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat(), 4.4.toFloat()];
        const dst: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        copyTo(src, dst, 3, 2, 4);
        expect(dst[0]).assertEqual(0.0.toFloat());
        expect(dst[1]).assertEqual(0.0.toFloat());
        expect(dst[2]).assertEqual(0.0.toFloat());
        expect(dst[3]).assertEqual(3.3.toFloat());
        expect(dst[4]).assertEqual(4.4.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4100
     * @tc.name builtinsArrayCopyToPrototypebTest4100
     * @tc.desc copyTo(self: FixedArray<int>, ...) 全量拷贝到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [1, 2, 3];
        const dst: FixedArray<int> = [0, 0, 0];
        copyTo(src, dst, 0, 0, 3);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
        expect(dst[2]).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4200
     * @tc.name builtinsArrayCopyToPrototypebTest4200
     * @tc.desc copyTo(self: FixedArray<int>, ...) 拷贝前缀片段到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [1, 2, 3, 4];
        const dst: FixedArray<int> = [0, 0, 0, 0];
        copyTo(src, dst, 0, 0, 2);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
        expect(dst[2]).assertEqual(0);
        expect(dst[3]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4300
     * @tc.name builtinsArrayCopyToPrototypebTest4300
     * @tc.desc copyTo(self: FixedArray<int>, ...) 中间片段拷贝到偏移位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [9, 8, 7, 6, 5];
        const dst: FixedArray<int> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 1, 1, 4);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(8);
        expect(dst[2]).assertEqual(7);
        expect(dst[3]).assertEqual(6);
        expect(dst[4]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4400
     * @tc.name builtinsArrayCopyToPrototypebTest4400
     * @tc.desc copyTo(self: FixedArray<int>, ...) 前缀片段拷贝到dst中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [5, 6, 7, 8];
        const dst: FixedArray<int> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 2, 0, 2);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(5);
        expect(dst[3]).assertEqual(6);
        expect(dst[4]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4500
     * @tc.name builtinsArrayCopyToPrototypebTest4500
     * @tc.desc copyTo(self: FixedArray<int>, ...) 空区间拷贝(srcStart==srcEnd)不改变dst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [1, 2, 3];
        const dst: FixedArray<int> = [7, 8, 9];
        copyTo(src, dst, 1, 2, 2);
        expect(dst[0]).assertEqual(7);
        expect(dst[1]).assertEqual(8);
        expect(dst[2]).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4600
     * @tc.name builtinsArrayCopyToPrototypebTest4600
     * @tc.desc copyTo(self: FixedArray<int>, ...) 覆盖dst中间区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [9, 9, 9];
        const dst: FixedArray<int> = [1, 2, 3, 4];
        copyTo(src, dst, 1, 0, 2);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(9);
        expect(dst[2]).assertEqual(9);
        expect(dst[3]).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4700
     * @tc.name builtinsArrayCopyToPrototypebTest4700
     * @tc.desc copyTo(self: FixedArray<int>, ...) 单元素拷贝到末尾-1位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [1, 2, 3];
        const dst: FixedArray<int> = [0, 0, 0];
        copyTo(src, dst, 2, 1, 2);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4800
     * @tc.name builtinsArrayCopyToPrototypebTest4800
     * @tc.desc copyTo(self: FixedArray<int>, ...) 尾部片段拷贝到dst尾部
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [1, 2, 3, 4];
        const dst: FixedArray<int> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 3, 2, 4);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(0);
        expect(dst[3]).assertEqual(3);
        expect(dst[4]).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest4900
     * @tc.name builtinsArrayCopyToPrototypebTest4900
     * @tc.desc copyTo(self: FixedArray<long>, ...) 全量拷贝到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [1, 2, 3];
        const dst: FixedArray<long> = [0, 0, 0];
        copyTo(src, dst, 0, 0, 3);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
        expect(dst[2]).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5000
     * @tc.name builtinsArrayCopyToPrototypebTest5000
     * @tc.desc copyTo(self: FixedArray<long>, ...) 拷贝前缀片段到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [1, 2, 3, 4];
        const dst: FixedArray<long> = [0, 0, 0, 0];
        copyTo(src, dst, 0, 0, 2);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
        expect(dst[2]).assertEqual(0);
        expect(dst[3]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5100
     * @tc.name builtinsArrayCopyToPrototypebTest5100
     * @tc.desc copyTo(self: FixedArray<long>, ...) 中间片段拷贝到偏移位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [9, 8, 7, 6, 5];
        const dst: FixedArray<long> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 1, 1, 4);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(8);
        expect(dst[2]).assertEqual(7);
        expect(dst[3]).assertEqual(6);
        expect(dst[4]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5200
     * @tc.name builtinsArrayCopyToPrototypebTest5200
     * @tc.desc copyTo(self: FixedArray<long>, ...) 前缀片段拷贝到dst中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [5, 6, 7, 8];
        const dst: FixedArray<long> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 2, 0, 2);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(5);
        expect(dst[3]).assertEqual(6);
        expect(dst[4]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5300
     * @tc.name builtinsArrayCopyToPrototypebTest5300
     * @tc.desc copyTo(self: FixedArray<long>, ...) 空区间拷贝(srcStart==srcEnd)不改变dst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [1, 2, 3];
        const dst: FixedArray<long> = [7, 8, 9];
        copyTo(src, dst, 1, 2, 2);
        expect(dst[0]).assertEqual(7);
        expect(dst[1]).assertEqual(8);
        expect(dst[2]).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5400
     * @tc.name builtinsArrayCopyToPrototypebTest5400
     * @tc.desc copyTo(self: FixedArray<long>, ...) 覆盖dst中间区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [9, 9, 9];
        const dst: FixedArray<long> = [1, 2, 3, 4];
        copyTo(src, dst, 1, 0, 2);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(9);
        expect(dst[2]).assertEqual(9);
        expect(dst[3]).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5500
     * @tc.name builtinsArrayCopyToPrototypebTest5500
     * @tc.desc copyTo(self: FixedArray<long>, ...) 单元素拷贝到末尾-1位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [1, 2, 3];
        const dst: FixedArray<long> = [0, 0, 0];
        copyTo(src, dst, 2, 1, 2);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5600
     * @tc.name builtinsArrayCopyToPrototypebTest5600
     * @tc.desc copyTo(self: FixedArray<long>, ...) 尾部片段拷贝到dst尾部
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [1, 2, 3, 4];
        const dst: FixedArray<long> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 3, 2, 4);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(0);
        expect(dst[3]).assertEqual(3);
        expect(dst[4]).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5700
     * @tc.name builtinsArrayCopyToPrototypebTest5700
     * @tc.desc copyTo(self: FixedArray<Any>, ...) 全量拷贝到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [null, undefined, null];
        const dst: FixedArray<Any> = [undefined, undefined, undefined];
        copyTo(src, dst, 0, 0, 3);
        expect(dst[0] === null).assertTrue();
        expect(dst[1] === undefined).assertTrue();
        expect(dst[2] === null).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5800
     * @tc.name builtinsArrayCopyToPrototypebTest5800
     * @tc.desc copyTo(self: FixedArray<Any>, ...) 拷贝前缀片段到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [null, undefined, null, undefined];
        const dst: FixedArray<Any> = [null, null, null, null];
        copyTo(src, dst, 0, 0, 2);
        expect(dst[0] === null).assertTrue();
        expect(dst[1] === undefined).assertTrue();
        expect(dst[2] === null).assertTrue();
        expect(dst[3] === null).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest5900
     * @tc.name builtinsArrayCopyToPrototypebTest5900
     * @tc.desc copyTo(self: FixedArray<Any>, ...) 中间片段拷贝到偏移位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest5900';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [undefined, null, undefined, null, undefined];
        const dst: FixedArray<Any> = [null, null, null, null, null];
        copyTo(src, dst, 1, 1, 4);
        expect(dst[0] === null).assertTrue();
        expect(dst[1] === null).assertTrue();
        expect(dst[2] === undefined).assertTrue();
        expect(dst[3] === null).assertTrue();
        expect(dst[4] === null).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6000
     * @tc.name builtinsArrayCopyToPrototypebTest6000
     * @tc.desc copyTo(self: FixedArray<Any>, ...) 前缀片段拷贝到dst中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6000';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [null, null, undefined, undefined];
        const dst: FixedArray<Any> = [undefined, undefined, undefined, undefined, undefined];
        copyTo(src, dst, 2, 0, 2);
        expect(dst[0] === undefined).assertTrue();
        expect(dst[1] === undefined).assertTrue();
        expect(dst[2] === null).assertTrue();
        expect(dst[3] === null).assertTrue();
        expect(dst[4] === undefined).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6100
     * @tc.name builtinsArrayCopyToPrototypebTest6100
     * @tc.desc copyTo(self: FixedArray<Any>, ...) 空区间拷贝(srcStart==srcEnd)不改变dst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [undefined, null, undefined];
        const dst: FixedArray<Any> = [null, undefined, null];
        copyTo(src, dst, 1, 2, 2);
        expect(dst[0] === null).assertTrue();
        expect(dst[1] === undefined).assertTrue();
        expect(dst[2] === null).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6200
     * @tc.name builtinsArrayCopyToPrototypebTest6200
     * @tc.desc copyTo(self: FixedArray<Any>, ...) 覆盖dst中间区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [undefined, undefined, undefined];
        const dst: FixedArray<Any> = [null, null, null, null];
        copyTo(src, dst, 1, 0, 2);
        expect(dst[0] === null).assertTrue();
        expect(dst[1] === undefined).assertTrue();
        expect(dst[2] === undefined).assertTrue();
        expect(dst[3] === null).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6300
     * @tc.name builtinsArrayCopyToPrototypebTest6300
     * @tc.desc copyTo(self: FixedArray<Any>, ...) 单元素拷贝到末尾-1位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [null, undefined, null];
        const dst: FixedArray<Any> = [undefined, undefined, undefined];
        copyTo(src, dst, 2, 1, 2);
        expect(dst[0] === undefined).assertTrue();
        expect(dst[1] === undefined).assertTrue();
        expect(dst[2] === undefined).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6400
     * @tc.name builtinsArrayCopyToPrototypebTest6400
     * @tc.desc copyTo(self: FixedArray<Any>, ...) 尾部片段拷贝到dst尾部
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [null, undefined, null, undefined];
        const dst: FixedArray<Any> = [null, null, null, null, null];
        copyTo(src, dst, 3, 2, 4);
        expect(dst[0] === null).assertTrue();
        expect(dst[1] === null).assertTrue();
        expect(dst[2] === null).assertTrue();
        expect(dst[3] === null).assertTrue();
        expect(dst[4] === undefined).assertTrue();
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6500
     * @tc.name builtinsArrayCopyToPrototypebTest6500
     * @tc.desc copyTo(self: FixedArray<short>, ...) 全量拷贝到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [1, 2, 3];
        const dst: FixedArray<short> = [0, 0, 0];
        copyTo(src, dst, 0, 0, 3);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
        expect(dst[2]).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6600
     * @tc.name builtinsArrayCopyToPrototypebTest6600
     * @tc.desc copyTo(self: FixedArray<short>, ...) 拷贝前缀片段到起始位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [1, 2, 3, 4];
        const dst: FixedArray<short> = [0, 0, 0, 0];
        copyTo(src, dst, 0, 0, 2);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(2);
        expect(dst[2]).assertEqual(0);
        expect(dst[3]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6700
     * @tc.name builtinsArrayCopyToPrototypebTest6700
     * @tc.desc copyTo(self: FixedArray<short>, ...) 中间片段拷贝到偏移位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [9, 8, 7, 6, 5];
        const dst: FixedArray<short> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 1, 1, 4);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(8);
        expect(dst[2]).assertEqual(7);
        expect(dst[3]).assertEqual(6);
        expect(dst[4]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6800
     * @tc.name builtinsArrayCopyToPrototypebTest6800
     * @tc.desc copyTo(self: FixedArray<short>, ...) 前缀片段拷贝到dst中间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [5, 6, 7, 8];
        const dst: FixedArray<short> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 2, 0, 2);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(5);
        expect(dst[3]).assertEqual(6);
        expect(dst[4]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest6900
     * @tc.name builtinsArrayCopyToPrototypebTest6900
     * @tc.desc copyTo(self: FixedArray<short>, ...) 空区间拷贝(srcStart==srcEnd)不改变dst
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest6900';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [1, 2, 3];
        const dst: FixedArray<short> = [7, 8, 9];
        copyTo(src, dst, 1, 2, 2);
        expect(dst[0]).assertEqual(7);
        expect(dst[1]).assertEqual(8);
        expect(dst[2]).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest7000
     * @tc.name builtinsArrayCopyToPrototypebTest7000
     * @tc.desc copyTo(self: FixedArray<short>, ...) 覆盖dst中间区间
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest7000';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [9, 9, 9];
        const dst: FixedArray<short> = [1, 2, 3, 4];
        copyTo(src, dst, 1, 0, 2);
        expect(dst[0]).assertEqual(1);
        expect(dst[1]).assertEqual(9);
        expect(dst[2]).assertEqual(9);
        expect(dst[3]).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest7100
     * @tc.name builtinsArrayCopyToPrototypebTest7100
     * @tc.desc copyTo(self: FixedArray<short>, ...) 单元素拷贝到末尾-1位置
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest7100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [1, 2, 3];
        const dst: FixedArray<short> = [0, 0, 0];
        copyTo(src, dst, 2, 1, 2);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayCopyToPrototypebTest7200
     * @tc.name builtinsArrayCopyToPrototypebTest7200
     * @tc.desc copyTo(self: FixedArray<short>, ...) 尾部片段拷贝到dst尾部
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayCopyToPrototypebTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyToPrototypebTest7200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [1, 2, 3, 4];
        const dst: FixedArray<short> = [0, 0, 0, 0, 0];
        copyTo(src, dst, 3, 2, 4);
        expect(dst[0]).assertEqual(0);
        expect(dst[1]).assertEqual(0);
        expect(dst[2]).assertEqual(0);
        expect(dst[3]).assertEqual(3);
        expect(dst[4]).assertEqual(4);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}