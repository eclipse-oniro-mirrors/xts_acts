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

export default function builtinsArrayCopyOfTest(){
  describe('builtinsArrayCopyOfTest', (): void => {
    beforeAll((): void => {
      // Preset actions before all test cases
    })

    beforeEach(async (): Promise<void> => {
      await sleep(100); // Each test needs 100ms delay
    })

    afterEach((): void => {
      // Cleanup after each test case
    })

    afterAll((): void => {
      // Final cleanup after all test cases
    })

    /**
     @tc.number builtinsArrayCopyOfBooleanTest0100
     @tc.name  ArrayCopyOfTest0100
     @tc.desc copyOf(src: FixedArray<boolean>): FixedArray<boolean> 正常布尔数组复制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayCopyOfTest0100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, false, true];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([true, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     @tc.number builtinsArrayCopyOfBooleanTest0200
     @tc.name  ArrayCopyOfTest0200
     @tc.desc copyOf(src: FixedArray<boolean>): FixedArray<boolean> 空数组复制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayCopyOfTest0200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [];
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     @tc.number builtinsArrayCopyOfBooleanTest0300
     @tc.name  ArrayCopyOfTest0300
     @tc.desc copyOf(src: FixedArray<boolean>): FixedArray<boolean> 单元素数组（true）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'ArrayCopyOfTest0300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     @tc.number builtinsArrayCopyOfBooleanTest0400
     @tc.name  ArrayCopyOfTest0400
     @tc.desc copyOf(src: FixedArray<boolean>): FixedArray<boolean> 单元素数组（false）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfBooleanTest0400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [false];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     @tc.number builtinsArrayCopyOfBooleanTest0500
     @tc.name  ArrayCopyOfTest0500
     @tc.desc copyOf(src: FixedArray<boolean>): FixedArray<boolean> 全为 true 的数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfBooleanTest0500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, true, true, true];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([true, true, true, true]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     @tc.number builtinsArrayCopyOfBooleanTest0600
     @tc.name  ArrayCopyOfTest0600
     @tc.desc copyOf(src: FixedArray<boolean>): FixedArray<boolean> 全为 false 的数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfBooleanTest0600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [false, false, false];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([false, false, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     @tc.number builtinsArrayCopyOfBooleanTest0700
     @tc.name  ArrayCopyOfTest0700
     @tc.desc copyOf(src: FixedArray<boolean>): FixedArray<boolean> 交替布尔值数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfBooleanTest0700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, false, true, false];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([true, false, true, false]);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     @tc.number builtinsArrayCopyOfBooleanTest0800
     @tc.name  ArrayCopyOfTest0800
     @tc.desc copyOf(src: FixedArray<boolean>): FixedArray<boolean> 长度为 10 的布尔数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfBooleanTest0800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<boolean> = [true, false, false, true, true, false, true, false, false, true];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([true, false, false, true, true, false, true, false, false, true]);
        console.info(`${caseName}, test end`);
        Done();
      })
  })

    /**
     @tc.number builtinsArrayCopyOfCharTest0100
     @tc.name  ArrayCopyOfTest1700
     @tc.desc copyOf(src: FixedArray<char>): FixedArray<char> 正常字符数组复制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfCharTest0100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [Int.toChar(97), Int.toChar(98), Int.toChar(99), Int.toChar(100)];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([Int.toChar(97), Int.toChar(98), Int.toChar(99), Int.toChar(100)]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfCharTest0200
     @tc.name  ArrayCopyOfTest1800
     @tc.desc copyOf(src: FixedArray<char>): FixedArray<char> 空字符数组复制
     */
    it('ArrayCopyOfTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfCharTest0200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [];
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfCharTest0300
     @tc.name  ArrayCopyOfTest1900
     @tc.desc copyOf(src: FixedArray<char>): FixedArray<char> 单元素字符数组
     */
    it('ArrayCopyOfTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfCharTest0300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [Int.toChar(90)];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([Int.toChar(90)]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfCharTest0400
     @tc.name  ArrayCopyOfTest2000
     @tc.desc copyOf(src: FixedArray<char>): FixedArray<char> 包含特殊字符的数组
     */
    it('ArrayCopyOfTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfCharTest0400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [Int.toChar(33), Int.toChar(64), Int.toChar(35), Int.toChar(8242)];
        const result = copyOf(src); // 修正：添加空格，规范格式
        expect([...result]).assertDeepEquals([Int.toChar(33), Int.toChar(64), Int.toChar(35), Int.toChar(8242)]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfCharTest0500
     @tc.name  ArrayCopyOfTest2100
     @tc.desc copyOf(src: FixedArray<char>): FixedArray<char> 全相同字符的数组
     */
    it('ArrayCopyOfTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfCharTest0500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [Int.toChar(115), Int.toChar(115), Int.toChar(115)];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([Int.toChar(115), Int.toChar(115), Int.toChar(115)]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfCharTest0600
     @tc.name  ArrayCopyOfTest2200
     @tc.desc copyOf(src: FixedArray<char>): FixedArray<char> 字母序列数组
     */
    it('ArrayCopyOfTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfCharTest0600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [Int.toChar(110), Int.toChar(111), Int.toChar(112), Int.toChar(113)];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([Int.toChar(110), Int.toChar(111), Int.toChar(112), Int.toChar(113)]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfCharTest0700
     @tc.name  ArrayCopyOfTest2300
     @tc.desc copyOf(src: FixedArray<char>): FixedArray<char> 混合大小写字符数组
     */
    it('ArrayCopyOfTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfCharTest0700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> = [Int.toChar(88), Int.toChar(80), Int.toChar(104), Int.toChar(105)];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([Int.toChar(88), Int.toChar(80), Int.toChar(104), Int.toChar(105)]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfCharTest0800
     @tc.name  ArrayCopyOfTest2400
     @tc.desc copyOf(src: FixedArray<char>): FixedArray<char> 长度为 10 的字符数组
     */
    it('ArrayCopyOfTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfCharTest0800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<char> =
          [Int.toChar(110), Int.toChar(111), Int.toChar(112), Int.toChar(113), Int.toChar(88), Int.toChar(80), Int.toChar(104), Int.toChar(105)];
        const result = copyOf(src);
        expect([...result])
          .assertDeepEquals([Int.toChar(110), Int.toChar(111), Int.toChar(112), Int.toChar(113), Int.toChar(88), Int.toChar(80), Int.toChar(104),
            Int.toChar(105)]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfDoubleTest0100
     @tc.name  ArrayCopyOfTest2500
     @tc.desc copyOf(src: FixedArray<double>): FixedArray<double> 正常双精度数组复制（正整数）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfDoubleTest0100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [1.0, 2.0, 3.0, 4.0];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([1.0, 2.0, 3.0, 4.0]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfDoubleTest0200
     @tc.name  ArrayCopyOfTest2600
     @tc.desc copyOf(src: FixedArray<double>): FixedArray<double> 空双精度数组复制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfDoubleTest0200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [];
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfDoubleTest0300
     @tc.name  ArrayCopyOfTest2700
     @tc.desc copyOf(src: FixedArray<double>): FixedArray<double> 单元素双精度数组（小数）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfDoubleTest0300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [3.14159];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([3.14159]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfDoubleTest0400
     @tc.name  ArrayCopyOfTest2800
     @tc.desc copyOf(src: FixedArray<double>): FixedArray<double> 包含负数的双精度数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfDoubleTest0400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [-1.5, -2.0, -3.75];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-1.5, -2.0, -3.75]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfDoubleTest0500
     @tc.name  ArrayCopyOfTest2900
     @tc.desc copyOf(src: FixedArray<double>): FixedArray<double> 包含零值的双精度数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfDoubleTest0500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [0.0, 0.0, 0.0];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([0.0, 0.0, 0.0]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfDoubleTest0600
     @tc.name  ArrayCopyOfTest3000
     @tc.desc copyOf(src: FixedArray<double>): FixedArray<double> 混合正负值的双精度数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfDoubleTest0600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [-10.2, 3.14, -0.5, 7.0];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-10.2, 3.14, -0.5, 7.0]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfDoubleTest0700
     @tc.name  ArrayCopyOfTest3100
     @tc.desc copyOf(src: FixedArray<double>): FixedArray<double> 大数值双精度数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfDoubleTest0700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [123456.789, 987654.321, 1000000.0];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([123456.789, 987654.321, 1000000.0]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfDoubleTest0800
     @tc.name  ArrayCopyOfTest3200
     @tc.desc copyOf(src: FixedArray<double>): FixedArray<double> 长度为10的双精度数组（混合场景）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfDoubleTest0800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<double> = [
          0.1, -0.2, 3.0, -4.5, 6.78,
          9.0, -10.11, 123.45, 0.0, -987.65
        ];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([
          0.1, -0.2, 3.0, -4.5, 6.78,
          9.0, -10.11, 123.45, 0.0, -987.65
        ]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfFloatTest0100
     @tc.name  ArrayCopyOfTest3300
     @tc.desc copyOf(src: FixedArray<float>): FixedArray<float> 正常浮点数组复制（正整数）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfFloatTest0100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [1.0, 2.0, 3.0, 4.0];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([1.0, 2.0, 3.0, 4.0]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfFloatTest0200
     @tc.name  ArrayCopyOfTest3400
     @tc.desc copyOf(src: FixedArray<float>): FixedArray<float> 空浮点数组复制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfFloatTest0200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [];
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfFloatTest0300
     @tc.name  ArrayCopyOfTest3500
     @tc.desc copyOf(src: FixedArray<float>): FixedArray<float> 单元素浮点数组（小数）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfFloatTest0300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [2.71828.toFloat()];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([2.71828.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfFloatTest0400
     @tc.name  ArrayCopyOfTest3600
     @tc.desc copyOf(src: FixedArray<float>): FixedArray<float> 包含负数的浮点数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfFloatTest0400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [-0.5.toFloat(), -3.14.toFloat(), -10.0.toFloat()];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-0.5.toFloat(), -3.14.toFloat(), -10.0.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfFloatTest0500
     @tc.name  ArrayCopyOfTest3700
     @tc.desc copyOf(src: FixedArray<float>): FixedArray<float> 包含零值的浮点数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfFloatTest0500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([0.0.toFloat(), 0.0.toFloat(), 0.0.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfFloatTest0600
     @tc.name  ArrayCopyOfTest3800
     @tc.desc copyOf(src: FixedArray<float>): FixedArray<float> 混合正负值的浮点数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfFloatTest0600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [-5.2.toFloat(), 3.1415.toFloat(), -0.123.toFloat(), 99.9.toFloat()];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-5.2.toFloat(), 3.1415.toFloat(), -0.123.toFloat(), 99.9.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfFloatTest0700
     @tc.name  ArrayCopyOfTest3900
     @tc.desc copyOf(src: FixedArray<float>): FixedArray<float> 科学计数法表示的浮点数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfFloatTest0700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [1e3.toFloat(), 2.5e-2.toFloat(), -3e1.toFloat()];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([1e3.toFloat(), 2.5e-2.toFloat(), -3e1.toFloat()]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfFloatTest0800
     @tc.name  ArrayCopyOfTest4000
     @tc.desc copyOf(src: FixedArray<float>): FixedArray<float> 长度为10的浮点数组（混合场景）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('ArrayCopyOfTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfFloatTest0800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<float> = [
          0.123.toFloat(), -0.456.toFloat(), 7.0.toFloat(), -8.9.toFloat(), 10.11.toFloat()
        ];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([
          0.123.toFloat(), -0.456.toFloat(), 7.0.toFloat(), -8.9.toFloat(), 10.11.toFloat()
        ]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsArrayCopyOfIntTest0100
     @tc.name  builtinsArrayCopyOfTest4100
     @tc.desc copyOf(src: FixedArray<int>): FixedArray<int> 正常整数数组复制（正整数）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it ('builtinsArrayCopyOfTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfIntTest0100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [1, 2, 3, 4];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([1, 2, 3, 4]);
        console.info(`${caseName}, test end`);
        Done();
      });
    /**
     @tc.number builtinsArrayCopyOfIntTest0200
     @tc.name  builtinsArrayCopyOfTest4200
     @tc.desc copyOf(src: FixedArray<int>): FixedArray<int> 空整数数组复制
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it ('builtinsArrayCopyOfTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfIntTest0200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [];
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      });
    /**
     @tc.number builtinsArrayCopyOfIntTest0300
     @tc.name  builtinsArrayCopyOfTest4300
     @tc.desc copyOf(src: FixedArray<int>): FixedArray<int> 单元素整数数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it ('builtinsArrayCopyOfTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfIntTest0300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [42];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([42]);
        console.info(`${caseName}, test end`);
        Done();
      });
    /**
     @tc.number builtinsArrayCopyOfIntTest0400
     @tc.name  builtinsArrayCopyOfTest4400
     @tc.desc copyOf(src: FixedArray<int>): FixedArray<int> 包含负数的整数数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it ('builtinsArrayCopyOfTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfIntTest0400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [-1, -2, -3];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-1, -2, -3]);
        console.info(`${caseName}, test end`);
        Done();
      });
    /**
     @tc.number builtinsArrayCopyOfIntTest0500
     @tc.name  builtinsArrayCopyOfTest4500
     @tc.desc copyOf(src: FixedArray<int>): FixedArray<int> 包含零值的整数数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it ('builtinsArrayCopyOfTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfIntTest0500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [0, 0, 0];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([0, 0, 0]);
        console.info(`${caseName}, test end`);
        Done();
      });
    /**
     @tc.number builtinsArrayCopyOfIntTest0600
     @tc.name  builtinsArrayCopyOfTest4600
     @tc.desc copyOf(src: FixedArray<int>): FixedArray<int> 混合正负值的整数数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it ('builtinsArrayCopyOfTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfIntTest0600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [-10, 20, -30, 40];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-10, 20, -30, 40]);
        console.info(`${caseName}, test end`);
        Done();
      });
    /**
     @tc.number builtinsArrayCopyOfIntTest0700
     @tc.name  builtinsArrayCopyOfTest4700
     @tc.desc copyOf(src: FixedArray<int>): FixedArray<int> 大整数数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it ('builtinsArrayCopyOfTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfIntTest0700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [1000, 2000, 3000, 4000];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([1000, 2000, 3000, 4000]);
        console.info(`${caseName}, test end`);
        Done();
      });
    /**
     @tc.number builtinsArrayCopyOfIntTest0800
     @tc.name  builtinsArrayCopyOfTest4800
     @tc.desc copyOf(src: FixedArray<int>): FixedArray<int> 长度为 10 的整数数组（混合场景）
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it ('builtinsArrayCopyOfTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayCopyOfIntTest0800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<int> = [
          1, -2, 3, -4, 5,
          -6, 7, -8, 9, 0
        ];
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([
          1, -2, 3, -4, 5,
          -6, 7, -8, 9, 0
        ]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfLongTest0100
     @tc.name builtinsCopyOfTest4900
     @tc.desc 验证正常正整数long数组的复制功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfLongTest0100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [1, 2, 3, 4, 5] as FixedArray<long>;
        const result = copyOf(src);

        expect([...result]).assertDeepEquals([1, 2, 3, 4, 5]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfLongTest0200
     @tc.name builtinsCopyOfTest5000
     @tc.desc 验证空数组的复制功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfLongTest0200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [] as FixedArray<long>;
        const result = copyOf(src);

        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfLongTest0300
     @tc.name builtinsCopyOfTest5100
     @tc.desc 验证包含负数的long数组复制功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfLongTest0300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [-10, -20, -30, -40] as FixedArray<long>;
        const result = copyOf(src);

        expect([...result]).assertDeepEquals([-10, -20, -30, -40]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfLongTest0400
     @tc.name builtinsCopyOfTest5200
     @tc.desc 验证仅含一个元素的long数组复制功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfLongTest0400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [987654321] as FixedArray<long>;
        const result = copyOf(src);

        expect([...result]).assertDeepEquals([987654321]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfLongTest0500
     @tc.name builtinsCopyOfTest5300
     @tc.desc 验证全为零的long数组复制功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfLongTest0500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [0, 0, 0] as FixedArray<long>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([0, 0, 0]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfLongTest0600
     @tc.name builtinsCopyOfTest5400
     @tc.desc 验证包含正数、负数和零的long数组复制功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfLongTest0600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [-5, 0, 5, -10, 10] as FixedArray<long>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-5, 0, 5, -10, 10]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfLongTest0700
     @tc.name builtinsCopyOfTest5500
     @tc.desc 验证包含大数值的long数组复制功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfLongTest0700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [1234567890123, 9876543210987] as FixedArray<long>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([1234567890123, 9876543210987]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfLongTest0800
     @tc.name builtinsCopyOfTest5600
     @tc.desc 验证长度为8的long数组复制功能
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfLongTest0800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<long> = [
          10, 20, 30, 40,
          50, 60, 70, 80
        ] as FixedArray<long>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([
          10, 20, 30, 40,
          50, 60, 70, 80
        ]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfNullishTest0100
     @tc.name builtinsCopyOfTest5700
     @tc.desc copyOf 基础场景：复制全为null的数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfNullishTest0100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [null, null, null] as FixedArray<Any>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([null, null, null]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfNullishTest0200
     @tc.name builtinsCopyOfTest5800
     @tc.desc copyOf 基础场景：复制全为undefined的数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfNullishTest0200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [undefined, undefined, undefined] as FixedArray<Any>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([undefined, undefined, undefined]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfNullishTest0300
     @tc.name builtinsCopyOfTest5900
     @tc.desc copyOf 混合场景：包含null和undefined的数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfNullishTest0300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [null, undefined, null, undefined] as FixedArray<Any>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([null, undefined, null, undefined]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfNullishTest0400
     @tc.name builtinsCopyOfTest6000
     @tc.desc copyOf 边界场景：复制空数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfNullishTest0400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [] as FixedArray<Any>;
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfNullishTest0500
     @tc.name builtinsCopyOfTest6100
     @tc.desc copyOf 单元素场景：复制单个null
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfNullishTest0500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [null] as FixedArray<Any>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([null]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfNullishTest0600
     @tc.name builtinsCopyOfest6200
     @tc.desc copyOf 单元素场景：复制单个undefined
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfNullishTest0600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [undefined] as FixedArray<Any>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([undefined]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfNullishTest0700
     @tc.name builtinsCopyOfTest6300
     @tc.desc copyOf 交替场景：null和undefined交替出现的数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfNullishTest0700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [null, undefined, null, undefined, null] as FixedArray<Any>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([null, undefined, null, undefined, null]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfNullishTest0800
     @tc.name builtinsCopyOfTest6400
     @tc.desc copyOf 长数组场景：长度为6的nullish数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfNullishTest0800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<Any> = [
          null, undefined, null,
          undefined, null, undefined
        ] as FixedArray<Any>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([
          null, undefined, null,
          undefined, null, undefined
        ]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfShortTest0100
     @tc.name builtinsCopyOfTest6500
     @tc.desc copyOf 基础场景：复制正常的正整数short数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfShortTest0100';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([1, 2, 3, 4, 5]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfShortTest0200
     @tc.name builtinsCopyOfTest6600
     @tc.desc copyOf 边界场景：复制空short数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfShortTest0200';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [] as FixedArray<short>;
        const result = copyOf(src);
        expect(result.length).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfShortTest0300
     @tc.name builtinsCopyOfTest6700
     @tc.desc copyOf 负数场景：复制包含负数的short数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfShortTest0300';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [-10, -20, -30] as FixedArray<short>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-10, -20, -30]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfShortTest0400
     @tc.name builtinsCopyOfTest6800
     @tc.desc copyOf 单元素场景：复制仅含一个元素的short数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfShortTest0400';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [32767] as FixedArray<short>; // short类型最大值
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([32767]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfShortTest0500
     @tc.name builtinsCopyOfTest6900
     @tc.desc copyOf 零值场景：复制全为零的short数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfShortTest0500';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [0, 0, 0, 0] as FixedArray<short>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([0, 0, 0, 0]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfShortTest0600
     @tc.name builtinsCopyOfTest7000
     @tc.desc copyOf 混合场景：包含正负数和零的short数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfShortTest0600';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [-5, 0, 5, -10, 10] as FixedArray<short>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-5, 0, 5, -10, 10]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfShortTest0700
     @tc.name builtinsCopyOfTest7100
     @tc.desc copyOf 边界值场景：包含short最小值的数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfShortTest0700';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [-32768, 1] as FixedArray<short>; // short类型最小值
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([-32768, 1]);
        console.info(`${caseName}, test end`);
        Done();
      });

    /**
     @tc.number builtinsCopyOfShortTest0800
     @tc.name builtinsCopyOfTest7200
     @tc.desc copyOf 长数组场景：复制长度为10的short数组
     @tc.size MediumTest
     @tc.type Function
     @tc.level Level 2
     */
    it('builtinsCopyOfTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsCopyOfShortTest0800';
        console.info(`${caseName}, test start`);
        const src: FixedArray<short> = [
          1, 2, 3, 4, 5,
          6, 7, 8, 9, 10
        ] as FixedArray<short>;
        const result = copyOf(src);
        expect([...result]).assertDeepEquals([
          1, 2, 3, 4, 5,
          6, 7, 8, 9, 10
        ]);
        console.info(`${caseName}, test end`);
        Done();
      });

}
