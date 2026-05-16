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
export default function builtinsArrayEntriesPrototypebTest(){
  describe('builtinsArrayEntriesPrototypebTest', ():void => {
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
     * @tc.number builtinsArrayEntriesPrototypebTest0100
     * @tc.name builtinsArrayEntriesPrototypebTest0100
     * @tc.desc entries(self: FixedArray<byte>): IterableIterator<[number, byte]> 正常遍历，for循环逐项断言（平台推荐初始化）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest0100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [10,20,30];
        const result = entries(arr);
        const expected = [10, 20, 30];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, byte];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest0200
     * @tc.name builtinsArrayEntriesPrototypebTest0200
     * @tc.desc entries(self: FixedArray<byte>): IterableIterator<[number, byte]> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest0200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest0300
     * @tc.name builtinsArrayEntriesPrototypebTest0300
     * @tc.desc entries(self: FixedArray<byte>): IterableIterator<[number, byte]> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest0300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [99];
        const result = entries(arr);
        const expected = [99];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, byte];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest0400
     * @tc.name builtinsArrayEntriesPrototypebTest0400
     * @tc.desc entries(self: FixedArray<byte>): IterableIterator<[number, byte]> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest0400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [7, 7, 7];
        const result = entries(arr);
        const expected = [7, 7, 7];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, byte];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest0500
     * @tc.name builtinsArrayEntriesPrototypebTest0500
     * @tc.desc entries(self: FixedArray<byte>): IterableIterator<[number, byte]> 只取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest0500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [1, 2, 3];
        const result = entries(arr);
        const expected = [1, 2, 3];
        let idx = 0;
        const first = result.next();
        const value = first.value as [number, byte];
        expect(value[0]).assertEqual(0);
        expect(value[1]).assertEqual(1);
        expect(first.done).assertEqual(false);
        idx++;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest0600
     * @tc.name builtinsArrayEntriesPrototypebTest0600
     * @tc.desc entries(self: FixedArray<byte>): IterableIterator<[number, byte]> 迭代器遍历到done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest0600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [5, 6];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest0700
     * @tc.name builtinsArrayEntriesPrototypebTest0700
     * @tc.desc entries(self: FixedArray<byte>): IterableIterator<[number, byte]> 大数组遍历，检查部分关键下标和值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest0700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = new FixedArray<byte>(50);
        for (let i = 0; i < 50; i++) {
          arr[i] = (i * 2).toByte();
        }
        const result = entries(arr);
        let count = 0;
        let foundFirst = false;
        let foundMid = false;
        let foundLast = false;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, byte];
          const idx = value[0];
          const val = value[1];
          count++;
          if (idx === 0 && val === 0) foundFirst = true;
          if (idx === 25 && val === 50) foundMid = true;
          if (idx === 49 && val === 98) foundLast = true;
        }
        expect(foundFirst).assertTrue();
        expect(foundMid).assertTrue();
        expect(foundLast).assertTrue();
        expect(count).assertEqual(50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest0800
     * @tc.name builtinsArrayEntriesPrototypebTest0800
     * @tc.desc entries(self: FixedArray<byte>): IterableIterator<[number, byte]> 迭代器多次next后done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest0800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<byte> = [8, 9];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.value).assertEqual(undefined);
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest0900
     * @tc.name builtinsArrayEntriesPrototypebTest0900
     * @tc.desc entries(self: FixedArray<char>): IterableIterator<[number, char]> 正常遍历，while+next逐项断言
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest0900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = entries(arr);
        const expected = [c'a', c'b', c'c'];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, char];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1000
     * @tc.name builtinsArrayEntriesPrototypebTest1000
     * @tc.desc entries(self: FixedArray<char>): IterableIterator<[number, char]> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1100
     * @tc.name builtinsArrayEntriesPrototypebTest1100
     * @tc.desc entries(self: FixedArray<char>): IterableIterator<[number, char]> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'z'];
        const result = entries(arr);
        const expected = [c'z'];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, char];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1200
     * @tc.name builtinsArrayEntriesPrototypebTest1200
     * @tc.desc entries(self: FixedArray<char>): IterableIterator<[number, char]> 全部为同一字符
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'x', c'x'];
        const result = entries(arr);
        const expected = [c'x', c'x', c'x'];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, char];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1300
     * @tc.name builtinsArrayEntriesPrototypebTest1300
     * @tc.desc entries(self: FixedArray<char>): IterableIterator<[number, char]> 只取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'a', c'b', c'c'];
        const result = entries(arr);
        const expected = [c'a', c'b', c'c'];
        let idx = 0;
        const first = result.next();
        const value = first.value as [number, char];
        expect(value[0]).assertEqual(0);
        expect(value[1]).assertEqual(c'a');
        expect(first.done).assertEqual(false);
        idx++;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1400
     * @tc.name builtinsArrayEntriesPrototypebTest1400
     * @tc.desc entries(self: FixedArray<char>): IterableIterator<[number, char]> 迭代器遍历到done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'm', c'n'];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1500
     * @tc.name builtinsArrayEntriesPrototypebTest1500
     * @tc.desc entries(self: FixedArray<char>): IterableIterator<[number, char]> 大数组遍历，检查部分关键下标和值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = new FixedArray<char>(50);
        const chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        for (let i = 0; i < 50; i++) {
          arr[i] = chars.charAt(i);
        }
        const result = entries(arr);
        let count = 0;
        let foundFirst = false;
        let foundMid = false;
        let foundLast = false;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, char];
          const idx = value[0];
          const val = value[1];
          count++;
          if (idx === 0 && val === c'A') foundFirst = true;
          if (idx === 25 && val === c'Z') foundMid = true;
          if (idx === 49 && val === c'x') foundLast = true;
        }
        expect(foundFirst).assertTrue();
        expect(foundMid).assertTrue();
        expect(foundLast).assertTrue();
        expect(count).assertEqual(50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1600
     * @tc.name builtinsArrayEntriesPrototypebTest1600
     * @tc.desc entries(self: FixedArray<char>): IterableIterator<[number, char]> 迭代器多次next后done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<char> = [c'x', c'y'];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.value).assertEqual(undefined);
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1700
     * @tc.name builtinsArrayEntriesPrototypebTest1700
     * @tc.desc entries(self: FixedArray<double>): IterableIterator<[number, double]> 正常遍历，while+next逐项断言
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = entries(arr);
        const expected = [1.1, 2.2, 3.3];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, double];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1800
     * @tc.name builtinsArrayEntriesPrototypebTest1800
     * @tc.desc entries(self: FixedArray<double>): IterableIterator<[number, double]> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest1900
     * @tc.name builtinsArrayEntriesPrototypebTest1900
     * @tc.desc entries(self: FixedArray<double>): IterableIterator<[number, double]> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest1900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [9.9];
        const result = entries(arr);
        const expected = [9.9];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, double];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2000
     * @tc.name builtinsArrayEntriesPrototypebTest2000
     * @tc.desc entries(self: FixedArray<double>): IterableIterator<[number, double]> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [7.7, 7.7, 7.7];
        const result = entries(arr);
        const expected = [7.7, 7.7, 7.7];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, double];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2100
     * @tc.name builtinsArrayEntriesPrototypebTest2100
     * @tc.desc entries(self: FixedArray<double>): IterableIterator<[number, double]> 只取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [1.1, 2.2, 3.3];
        const result = entries(arr);
        const expected = [1.1, 2.2, 3.3];
        let idx = 0;
        const first = result.next();
        const value = first.value as [number, double];
        expect(value[0]).assertEqual(0);
        expect(value[1]).assertEqual(1.1);
        expect(first.done).assertEqual(false);
        idx++;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2200
     * @tc.name builtinsArrayEntriesPrototypebTest2200
     * @tc.desc entries(self: FixedArray<double>): IterableIterator<[number, double]> 迭代器遍历到done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [5.5, 6.6];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2300
     * @tc.name builtinsArrayEntriesPrototypebTest2300
     * @tc.desc entries(self: FixedArray<double>): IterableIterator<[number, double]> 大数组遍历，检查部分关键下标和值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = new FixedArray<double>(50);
        for (let i = 0; i < 50; i++) {
          arr[i] = i * 1.5;
        }
        const result = entries(arr);
        let count = 0;
        let foundFirst = false;
        let foundMid = false;
        let foundLast = false;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, double];
          const idx = value[0];
          const val = value[1];
          count++;
          if (idx === 0 && val === 0) foundFirst = true;
          if (idx === 25 && val === 37.5) foundMid = true;
          if (idx === 49 && val === 73.5) foundLast = true;
        }
        expect(foundFirst).assertTrue();
        expect(foundMid).assertTrue();
        expect(foundLast).assertTrue();
        expect(count).assertEqual(50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2400
     * @tc.name builtinsArrayEntriesPrototypebTest2400
     * @tc.desc entries(self: FixedArray<double>): IterableIterator<[number, double]> 迭代器多次next后done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<double> = [8.8, 9.9];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.value).assertEqual(undefined);
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2500
     * @tc.name builtinsArrayEntriesPrototypebTest2500
     * @tc.desc entries(self: FixedArray<float>): IterableIterator<[number, float]> 正常遍历，while+next逐项断言
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = entries(arr);
        const expected = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, float];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2600
     * @tc.name builtinsArrayEntriesPrototypebTest2600
     * @tc.desc entries(self: FixedArray<float>): IterableIterator<[number, float]> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2700
     * @tc.name builtinsArrayEntriesPrototypebTest2700
     * @tc.desc entries(self: FixedArray<float>): IterableIterator<[number, float]> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [9.9.toFloat()];
        const result = entries(arr);
        const expected = [9.9.toFloat()];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, float];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2800
     * @tc.name builtinsArrayEntriesPrototypebTest2800
     * @tc.desc entries(self: FixedArray<float>): IterableIterator<[number, float]> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [7.7.toFloat(), 7.7.toFloat(), 7.7.toFloat()];
        const result = entries(arr);
        const expected = [7.7.toFloat(), 7.7.toFloat(), 7.7.toFloat()];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, float];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest2900
     * @tc.name builtinsArrayEntriesPrototypebTest2900
     * @tc.desc entries(self: FixedArray<float>): IterableIterator<[number, float]> 只取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest2900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        const result = entries(arr);
        const expected = [1.1.toFloat(), 2.2.toFloat(), 3.3.toFloat()];
        let idx = 0;
        const first = result.next();
        const value = first.value as [number, float];
        expect(value[0]).assertEqual(0);
        expect(value[1]).assertEqual(1.1.toFloat());
        expect(first.done).assertEqual(false);
        idx++;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3000
     * @tc.name builtinsArrayEntriesPrototypebTest3000
     * @tc.desc entries(self: FixedArray<float>): IterableIterator<[number, float]> 迭代器遍历到done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [5.5.toFloat(), 6.6.toFloat()];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3100
     * @tc.name builtinsArrayEntriesPrototypebTest3100
     * @tc.desc entries(self: FixedArray<float>): IterableIterator<[number, float]> 大数组遍历，检查部分关键下标和值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = new FixedArray<float>(50);
        for (let i = 0; i < 50; i++) {
          arr[i] = (i * 1.5).toFloat();
        }
        const result = entries(arr);
        let count = 0;
        let foundFirst = false;
        let foundMid = false;
        let foundLast = false;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, float];
          const idx = value[0];
          const val = value[1];
          count++;
          if (idx === 0 && val === 0.0.toFloat()) foundFirst = true;
          if (idx === 25 && val === 37.5.toFloat()) foundMid = true;
          if (idx === 49 && val === 73.5.toFloat()) foundLast = true;
        }
        expect(foundFirst).assertTrue();
        expect(foundMid).assertTrue();
        expect(foundLast).assertTrue();
        expect(count).assertEqual(50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3200
     * @tc.name builtinsArrayEntriesPrototypebTest3200
     * @tc.desc entries(self: FixedArray<float>): IterableIterator<[number, float]> 迭代器多次next后done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<float> = [8.8.toFloat(), 9.9.toFloat()];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.value).assertEqual(undefined);
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3300
     * @tc.name builtinsArrayEntriesPrototypebTest3300
     * @tc.desc entries(self: FixedArray<int>): IterableIterator<[number, int]> 正常遍历，while+next逐项断言
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = entries(arr);
        const expected = [1, 2, 3];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, int];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3400
     * @tc.name builtinsArrayEntriesPrototypebTest3400
     * @tc.desc entries(self: FixedArray<int>): IterableIterator<[number, int]> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3500
     * @tc.name builtinsArrayEntriesPrototypebTest3500
     * @tc.desc entries(self: FixedArray<int>): IterableIterator<[number, int]> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [99];
        const result = entries(arr);
        const expected = [99];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, int];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3600
     * @tc.name builtinsArrayEntriesPrototypebTest3600
     * @tc.desc entries(self: FixedArray<int>): IterableIterator<[number, int]> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [7, 7, 7];
        const result = entries(arr);
        const expected = [7, 7, 7];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, int];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3700
     * @tc.name builtinsArrayEntriesPrototypebTest3700
     * @tc.desc entries(self: FixedArray<int>): IterableIterator<[number, int]> 只取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [1, 2, 3];
        const result = entries(arr);
        const expected = [1, 2, 3];
        let idx = 0;
        const first = result.next();
        const value = first.value as [number, int];
        expect(value[0]).assertEqual(0);
        expect(value[1]).assertEqual(1);
        expect(first.done).assertEqual(false);
        idx++;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3800
     * @tc.name builtinsArrayEntriesPrototypebTest3800
     * @tc.desc entries(self: FixedArray<int>): IterableIterator<[number, int]> 迭代器遍历到done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [5, 6];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest3900
     * @tc.name builtinsArrayEntriesPrototypebTest3900
     * @tc.desc entries(self: FixedArray<int>): IterableIterator<[number, int]> 大数组遍历，检查部分关键下标和值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest3900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = new FixedArray<int>(50);
        for (let i = 0; i < 50; i++) {
          arr[i] = i * 2;
        }
        const result = entries(arr);
        let count = 0;
        let foundFirst = false;
        let foundMid = false;
        let foundLast = false;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, int];
          const idx = value[0];
          const val = value[1];
          count++;
          if (idx === 0 && val === 0) foundFirst = true;
          if (idx === 25 && val === 50) foundMid = true;
          if (idx === 49 && val === 98) foundLast = true;
        }
        expect(foundFirst).assertTrue();
        expect(foundMid).assertTrue();
        expect(foundLast).assertTrue();
        expect(count).assertEqual(50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4000
     * @tc.name builtinsArrayEntriesPrototypebTest4000
     * @tc.desc entries(self: FixedArray<int>): IterableIterator<[number, int]> 迭代器多次next后done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<int> = [8, 9];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.value).assertEqual(undefined);
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4100
     * @tc.name builtinsArrayEntriesPrototypebTest4100
     * @tc.desc entries(self: FixedArray<long>): IterableIterator<[number, long]> 正常遍历，while+next逐项断言
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = entries(arr);
        const expected = [1, 2, 3];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, long];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4200
     * @tc.name builtinsArrayEntriesPrototypebTest4200
     * @tc.desc entries(self: FixedArray<long>): IterableIterator<[number, long]> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4300
     * @tc.name builtinsArrayEntriesPrototypebTest4300
     * @tc.desc entries(self: FixedArray<long>): IterableIterator<[number, long]> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [99];
        const result = entries(arr);
        const expected = [99];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, long];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4400
     * @tc.name builtinsArrayEntriesPrototypebTest4400
     * @tc.desc entries(self: FixedArray<long>): IterableIterator<[number, long]> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [7, 7, 7];
        const result = entries(arr);
        const expected = [7, 7, 7];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, long];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4500
     * @tc.name builtinsArrayEntriesPrototypebTest4500
     * @tc.desc entries(self: FixedArray<long>): IterableIterator<[number, long]> 只取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [1, 2, 3];
        const result = entries(arr);
        const expected = [1, 2, 3];
        let idx = 0;
        const first = result.next();
        const value = first.value as [number, long];
        expect(value[0]).assertEqual(0);
        expect(value[1]).assertEqual(1);
        expect(first.done).assertEqual(false);
        idx++;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4600
     * @tc.name builtinsArrayEntriesPrototypebTest4600
     * @tc.desc entries(self: FixedArray<long>): IterableIterator<[number, long]> 迭代器遍历到done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [5, 6];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4700
     * @tc.name builtinsArrayEntriesPrototypebTest4700
     * @tc.desc entries(self: FixedArray<long>): IterableIterator<[number, long]> 大数组遍历，检查部分关键下标和值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4700';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = new FixedArray<long>(50);
        for (let i = 0; i < 50; i++) {
          arr[i] = i * 2;
        }
        const result = entries(arr);
        let count = 0;
        let foundFirst = false;
        let foundMid = false;
        let foundLast = false;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, long];
          const idx = value[0];
          const val = value[1];
          count++;
          if (idx === 0 && val === 0) foundFirst = true;
          if (idx === 25 && val === 50) foundMid = true;
          if (idx === 49 && val === 98) foundLast = true;
        }
        expect(foundFirst).assertTrue();
        expect(foundMid).assertTrue();
        expect(foundLast).assertTrue();
        expect(count).assertEqual(50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4800
     * @tc.name builtinsArrayEntriesPrototypebTest4800
     * @tc.desc entries(self: FixedArray<long>): IterableIterator<[number, long]> 迭代器多次next后done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4800';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<long> = [8, 9];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.value).assertEqual(undefined);
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest4900
     * @tc.name builtinsArrayEntriesPrototypebTest4900
     * @tc.desc entries(self: FixedArray<short>): IterableIterator<[number, short]> 正常遍历，while+next逐项断言
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest4900';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = entries(arr);
        const expected = [1, 2, 3];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, short];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest5000
     * @tc.name builtinsArrayEntriesPrototypebTest5000
     * @tc.desc entries(self: FixedArray<short>): IterableIterator<[number, short]> 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest5000';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest5100
     * @tc.name builtinsArrayEntriesPrototypebTest5100
     * @tc.desc entries(self: FixedArray<short>): IterableIterator<[number, short]> 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest5100';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [99];
        const result = entries(arr);
        const expected = [99];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, short];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(1);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest5200
     * @tc.name builtinsArrayEntriesPrototypebTest5200
     * @tc.desc entries(self: FixedArray<short>): IterableIterator<[number, short]> 全部为同一数值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest5200';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [7, 7, 7];
        const result = entries(arr);
        const expected = [7, 7, 7];
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, short];
          expect(value[0]).assertEqual(idx);
          expect(value[1]).assertEqual(expected[idx]);
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest5300
     * @tc.name builtinsArrayEntriesPrototypebTest5300
     * @tc.desc entries(self: FixedArray<short>): IterableIterator<[number, short]> 只取第一个元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest5300';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [1, 2, 3];
        const result = entries(arr);
        const expected = [1, 2, 3];
        let idx = 0;
        const first = result.next();
        const value = first.value as [number, short];
        expect(value[0]).assertEqual(0);
        expect(value[1]).assertEqual(1);
        expect(first.done).assertEqual(false);
        idx++;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        expect(idx).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest5400
     * @tc.name builtinsArrayEntriesPrototypebTest5400
     * @tc.desc entries(self: FixedArray<short>): IterableIterator<[number, short]> 迭代器遍历到done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest5400';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [5, 6];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest5500
     * @tc.name builtinsArrayEntriesPrototypebTest5500
     * @tc.desc entries(self: FixedArray<short>): IterableIterator<[number, short]> 大数组遍历，检查部分关键下标和值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest5500';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = new FixedArray<short>(50);
        for (let i = 0; i < 50; i++) {
          arr[i] = (i * 2).toShort();
        }
        const result = entries(arr);
        let count = 0;
        let foundFirst = false;
        let foundMid = false;
        let foundLast = false;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          const value = next.value as [number, short];
          const idx = value[0];
          const val = value[1];
          count++;
          if (idx === 0 && val === 0 as short) foundFirst = true;
          if (idx === 25 && val === 50 as short) foundMid = true;
          if (idx === 49 && val === 98 as short) foundLast = true;
        }
        expect(foundFirst).assertTrue();
        expect(foundMid).assertTrue();
        expect(foundLast).assertTrue();
        expect(count).assertEqual(50);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayEntriesPrototypebTest5600
     * @tc.name builtinsArrayEntriesPrototypebTest5600
     * @tc.desc entries(self: FixedArray<short>): IterableIterator<[number, short]> 迭代器多次next后done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEntriesPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayEntriesPrototypebTest5600';
        console.info(`${caseName}, test start`);
        const arr: FixedArray<short> = [8, 9];
        const result = entries(arr);
        let idx = 0;
        while (true) {
          const next = result.next();
          if (next.done) {
            break;
          }
          idx++;
        }
        const last = result.next();
        expect(last.value).assertEqual(undefined);
        expect(last.done).assertEqual(true);
        expect(idx).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}