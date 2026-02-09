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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../hypium/index';


export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function builtinsArrayForEachPrototypebTest() {
  describe('builtinsArrayForEachPrototypebTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest0100
     * @tc.name builtinsArrayForEachPrototypebTest0100
     * @tc.desc forEach(self: FixedArray<boolean>, callbackfn) 全部元素置反
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest0100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = !v;
        });
        expect(arr[0]).assertEqual(false);
        expect(arr[1]).assertEqual(true);
        expect(arr[2]).assertEqual(false);
        expect(arr[3]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest0200
     * @tc.name builtinsArrayForEachPrototypebTest0200
     * @tc.desc forEach(self: FixedArray<boolean>, callbackfn) 全部元素置为true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest0200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [false, false, false];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = true;
        });
        expect(arr[0]).assertEqual(true);
        expect(arr[1]).assertEqual(true);
        expect(arr[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest0300
     * @tc.name builtinsArrayForEachPrototypebTest0300
     * @tc.desc forEach(self: FixedArray<boolean>, callbackfn) 全部元素置为false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest0300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, true, true];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = false;
        });
        expect(arr[0]).assertEqual(false);
        expect(arr[1]).assertEqual(false);
        expect(arr[2]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest0400
     * @tc.name builtinsArrayForEachPrototypebTest0400
     * @tc.desc forEach(self: FixedArray<boolean>, callbackfn) 空数组不执行回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest0400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [];
        let called = false;
        forEach(arr, (v, k, array) => {
          called = true;
        });
        expect(called).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest0500
     * @tc.name builtinsArrayForEachPrototypebTest0500
     * @tc.desc forEach(self: FixedArray<boolean>, callbackfn) 检查回调参数index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest0500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let indices: number[] = [];
        forEach(arr, (v, k, array) => {
          indices.push(k);
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest0600
     * @tc.name builtinsArrayForEachPrototypebTest0600
     * @tc.desc forEach(self: FixedArray<boolean>, callbackfn) 检查回调参数value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest0600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true];
        let values: boolean[] = [];
        forEach(arr, (v, k, array) => {
          values.push(v);
        });
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(true);
        expect(values[1]).assertEqual(false);
        expect(values[2]).assertEqual(true);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest0700
     * @tc.name builtinsArrayForEachPrototypebTest0700
     * @tc.desc forEach(self: FixedArray<boolean>, callbackfn) 检查回调参数array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest0700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false];
        let arrays: FixedArray<boolean>[] = [];
        forEach(arr, (v, k, array) => {
          arrays.push(array);
        });
        expect(arrays.length).assertEqual(2);
        expect(arrays[0]).assertEqual(arr);
        expect(arrays[1]).assertEqual(arr);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest0800
     * @tc.name builtinsArrayForEachPrototypebTest0800
     * @tc.desc forEach(self: FixedArray<boolean>, callbackfn) 复杂场景：交替置反
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest0800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<boolean> = [true, false, true, false];
        forEach(arr, (v, k, array) => {
          if (k % 2 === 0) {
            array[Double.toInt(k)] = !v;
          }
        });
        expect(arr[0]).assertEqual(false);
        expect(arr[1]).assertEqual(false);
        expect(arr[2]).assertEqual(false);
        expect(arr[3]).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest0900
     * @tc.name builtinsArrayForEachPrototypebTest0900
     * @tc.desc forEach(self: FixedArray<byte>, callbackfn) 所有元素加1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest0900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2, 3, 4];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = (v + 1).toByte();
        });
        expect(arr[0]).assertEqual(2);
        expect(arr[1]).assertEqual(3);
        expect(arr[2]).assertEqual(4);
        expect(arr[3]).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest1000
     * @tc.name builtinsArrayForEachPrototypebTest1000
     * @tc.desc forEach(self: FixedArray<byte>, callbackfn) 所有元素置为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest1000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [5, 6, 7];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = 0;
        });
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest1100
     * @tc.name builtinsArrayForEachPrototypebTest1100
     * @tc.desc forEach(self: FixedArray<byte>, callbackfn) 空数组不执行回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest1100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [];
        let called = false;
        forEach(arr, (v, k, array) => {
          called = true;
        });
        expect(called).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest1200
     * @tc.name builtinsArrayForEachPrototypebTest1200
     * @tc.desc forEach(self: FixedArray<byte>, callbackfn) 检查回调参数index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest1200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [10, 20, 30];
        let indices: number[] = [];
        forEach(arr, (v, k, array) => {
          indices.push(Double.toInt(k));
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest1300
     * @tc.name builtinsArrayForEachPrototypebTest1300
     * @tc.desc forEach(self: FixedArray<byte>, callbackfn) 检查回调参数value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest1300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [7, 8, 9];
        let values: byte[] = [];
        forEach(arr, (v, k, array) => {
          values.push(v);
        });
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(7);
        expect(values[1]).assertEqual(8);
        expect(values[2]).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest1400
     * @tc.name builtinsArrayForEachPrototypebTest1400
     * @tc.desc forEach(self: FixedArray<byte>, callbackfn) 检查回调参数array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest1400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [1, 2];
        let arrays: FixedArray<byte>[] = [];
        forEach(arr, (v, k, array) => {
          arrays.push(array);
        });
        expect(arrays.length).assertEqual(2);
        expect(arrays[0]).assertEqual(arr);
        expect(arrays[1]).assertEqual(arr);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest1500
     * @tc.name builtinsArrayForEachPrototypebTest1500
     * @tc.desc forEach(self: FixedArray<byte>, callbackfn) 复杂场景：偶数下标加2，奇数下标减1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest1500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [10, 20, 30, 40];
        forEach(arr, (v, k, array) => {
          if (Double.toInt(k) % 2 === 0) {
            array[Double.toInt(k)] = (v + 2).toByte();
          } else {
            array[Double.toInt(k)] =
              (v - 1).toByte();
          }
        });
        expect(arr[0]).assertEqual(12);
        expect(arr[1]).assertEqual(19);
        expect(arr[2]).assertEqual(32);
        expect(arr[3]).assertEqual(39);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest1600
     * @tc.name builtinsArrayForEachPrototypebTest1600
     * @tc.desc forEach(self: FixedArray<byte>, callbackfn) 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest1600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<byte> = [99];
        let sum = 0;
        forEach(arr, (v, k, array) => {
          sum += v;
        });
        expect(sum).assertEqual(99);
        console.info(`${caseName}, test end`);
        Done();
      })



    /**
     * @tc.number builtinsArrayForEachPrototypebTest1900
     * @tc.name builtinsArrayForEachPrototypebTest1900
     * @tc.desc forEach(self: FixedArray<char>, callbackfn) 空数组不执行回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest1900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<char> = [];
        let called = false;
        forEach(arr, (v, k, array) => {
          called = true;
        });
        expect(called).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number builtinsArrayForEachPrototypebTest2500
     * @tc.name builtinsArrayForEachPrototypebTest2500
     * @tc.desc forEach(self: FixedArray<double>, callbackfn) 所有元素加1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest2500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.0, 2.0, 3.0, 4.0];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = v + 1.5;
        });
        expect(arr[0]).assertEqual(2.5);
        expect(arr[1]).assertEqual(3.5);
        expect(arr[2]).assertEqual(4.5);
        expect(arr[3]).assertEqual(5.5);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest2600
     * @tc.name builtinsArrayForEachPrototypebTest2600
     * @tc.desc forEach(self: FixedArray<double>, callbackfn) 所有元素置为0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest2600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [5.5, 6.6, 7.7];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = 0.0;
        });
        expect(arr[0]).assertEqual(0.0);
        expect(arr[1]).assertEqual(0.0);
        expect(arr[2]).assertEqual(0.0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest2700
     * @tc.name builtinsArrayForEachPrototypebTest2700
     * @tc.desc forEach(self: FixedArray<double>, callbackfn) 空数组不执行回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest2700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [];
        let called = false;
        forEach(arr, (v, k, array) => {
          called = true;
        });
        expect(called).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest2800
     * @tc.name builtinsArrayForEachPrototypebTest2800
     * @tc.desc forEach(self: FixedArray<double>, callbackfn) 检查回调参数index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest2800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [10.1, 20.2, 30.3];
        let indices: number[] = [];
        forEach(arr, (v, k, array) => {
          indices.push(Double.toInt(k));
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest2900
     * @tc.name builtinsArrayForEachPrototypebTest2900
     * @tc.desc forEach(self: FixedArray<double>, callbackfn) 检查回调参数value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest2900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [7.7, 8.8, 9.9];
        let values: double[] = [];
        forEach(arr, (v, k, array) => {
          values.push(v);
        });
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(7.7);
        expect(values[1]).assertEqual(8.8);
        expect(values[2]).assertEqual(9.9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3000
     * @tc.name builtinsArrayForEachPrototypebTest3000
     * @tc.desc forEach(self: FixedArray<double>, callbackfn) 检查回调参数array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [1.1, 2.2];
        let arrays: FixedArray<double>[] = [];
        forEach(arr, (v, k, array) => {
          arrays.push(array);
        });
        expect(arrays.length).assertEqual(2);
        expect(arrays[0]).assertEqual(arr);
        expect(arrays[1]).assertEqual(arr);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3100
     * @tc.name builtinsArrayForEachPrototypebTest3100
     * @tc.desc forEach(self: FixedArray<double>, callbackfn) 复杂场景：偶数下标加2.2，奇数下标减1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [10.0, 20.0, 30.0, 40.0];
        forEach(arr, (v, k, array) => {
          if (Double.toInt(k) % 2 === 0) {
            array[Double.toInt(k)] = v + 2.2;
          } else {
            array[Double.toInt(k)] = v - 1.1;
          }
        });
        expect(arr[0]).assertEqual(12.2);
        expect(arr[1]).assertEqual(18.9);
        expect(arr[2]).assertEqual(32.2);
        expect(arr[3]).assertEqual(38.9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3200
     * @tc.name builtinsArrayForEachPrototypebTest3200
     * @tc.desc forEach(self: FixedArray<double>, callbackfn) 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<double> = [99.99];
        let sum = 0.0;
        forEach(arr, (v, k, array) => {
          sum += v;
        });
        expect(sum).assertEqual(99.99);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3300
     * @tc.name builtinsArrayForEachPrototypebTest3300
     * @tc.desc forEach(self: FixedArray<float>, callbackfn) 所有元素加1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.0.toFloat(), 2.0.toFloat(), 3.0.toFloat(), 4.0.toFloat()];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = (v + 1.5.toFloat()).toFloat();
        });
        expect(arr[0]).assertEqual(2.5.toFloat());
        expect(arr[1]).assertEqual(3.5.toFloat());
        expect(arr[2]).assertEqual(4.5.toFloat());
        expect(arr[3]).assertEqual(5.5.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3400
     * @tc.name builtinsArrayForEachPrototypebTest3400
     * @tc.desc forEach(self: FixedArray<float>, callbackfn) 所有元素置为0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [5.5.toFloat(), 6.6.toFloat(), 7.7.toFloat()];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = 0.0.toFloat();
        });
        expect(arr[0]).assertEqual(0.0.toFloat());
        expect(arr[1]).assertEqual(0.0.toFloat());
        expect(arr[2]).assertEqual(0.0.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3500
     * @tc.name builtinsArrayForEachPrototypebTest3500
     * @tc.desc forEach(self: FixedArray<float>, callbackfn) 空数组不执行回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [];
        let called = false;
        forEach(arr, (v, k, array) => {
          called = true;
        });
        expect(called).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3600
     * @tc.name builtinsArrayForEachPrototypebTest3600
     * @tc.desc forEach(self: FixedArray<float>, callbackfn) 检查回调参数index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [10.1.toFloat(), 20.2.toFloat(), 30.3.toFloat()];
        let indices: number[] = [];
        forEach(arr, (v, k, array) => {
          indices.push(Double.toInt(k));
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3700
     * @tc.name builtinsArrayForEachPrototypebTest3700
     * @tc.desc forEach(self: FixedArray<float>, callbackfn) 检查回调参数value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [7.7.toFloat(), 8.8.toFloat(), 9.9.toFloat()];
        let values: float[] = [];
        forEach(arr, (v, k, array) => {
          values.push(v);
        });
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(7.7.toFloat());
        expect(values[1]).assertEqual(8.8.toFloat());
        expect(values[2]).assertEqual(9.9.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3800
     * @tc.name builtinsArrayForEachPrototypebTest3800
     * @tc.desc forEach(self: FixedArray<float>, callbackfn) 检查回调参数array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [1.1.toFloat(), 2.2.toFloat()];
        let arrays: FixedArray<float>[] = [];
        forEach(arr, (v, k, array) => {
          arrays.push(array);
        });
        expect(arrays.length).assertEqual(2);
        expect(arrays[0]).assertEqual(arr);
        expect(arrays[1]).assertEqual(arr);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest3900
     * @tc.name builtinsArrayForEachPrototypebTest3900
     * @tc.desc forEach(self: FixedArray<float>, callbackfn) 复杂场景：偶数下标加2.2，奇数下标减1.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest3900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [10.0.toFloat(), 20.0.toFloat(), 30.0.toFloat(), 40.0.toFloat()];
        forEach(arr, (v, k, array) => {
          if (Double.toInt(k) % 2 === 0) {
            array[Double.toInt(k)] =
              (v + 2.2.toFloat()).toFloat();
          } else {
            array[Double.toInt(k)] = (v - 1.1.toFloat()).toFloat();
          }
        });
        expect(arr[0]).assertEqual(12.2.toFloat());
        expect(arr[1]).assertEqual(18.9.toFloat());
        expect(arr[2]).assertEqual(32.2.toFloat());
        expect(arr[3]).assertEqual(38.9.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4000
     * @tc.name builtinsArrayForEachPrototypebTest4000
     * @tc.desc forEach(self: FixedArray<float>, callbackfn) 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<float> = [99.99.toFloat()];
        let sum = 0.0.toFloat();
        forEach(arr, (v, k, array) => {
          sum += v;
        });
        expect(sum).assertEqual(99.99.toFloat());
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4100
     * @tc.name builtinsArrayForEachPrototypebTest4100
     * @tc.desc forEach(self: FixedArray<int>, callbackfn) 所有元素加10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2, 3, 4];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = v + 10;
        });
        expect(arr[0]).assertEqual(11);
        expect(arr[1]).assertEqual(12);
        expect(arr[2]).assertEqual(13);
        expect(arr[3]).assertEqual(14);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4200
     * @tc.name builtinsArrayForEachPrototypebTest4200
     * @tc.desc forEach(self: FixedArray<int>, callbackfn) 所有元素置为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [5, 6, 7];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = 0;
        });
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4300
     * @tc.name builtinsArrayForEachPrototypebTest4300
     * @tc.desc forEach(self: FixedArray<int>, callbackfn) 空数组不执行回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [];
        let called = false;
        forEach(arr, (v, k, array) => {
          called = true;
        });
        expect(called).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4400
     * @tc.name builtinsArrayForEachPrototypebTest4400
     * @tc.desc forEach(self: FixedArray<int>, callbackfn) 检查回调参数index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [10, 20, 30];
        let indices: number[] = [];
        forEach(arr, (v, k, array) => {
          indices.push(Double.toInt(k));
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4500
     * @tc.name builtinsArrayForEachPrototypebTest4500
     * @tc.desc forEach(self: FixedArray<int>, callbackfn) 检查回调参数value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [7, 8, 9];
        let values: int[] = [];
        forEach(arr, (v, k, array) => {
          values.push(v);
        });
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(7);
        expect(values[1]).assertEqual(8);
        expect(values[2]).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4600
     * @tc.name builtinsArrayForEachPrototypebTest4600
     * @tc.desc forEach(self: FixedArray<int>, callbackfn) 检查回调参数array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [1, 2];
        let arrays: FixedArray<int>[] = [];
        forEach(arr, (v, k, array) => {
          arrays.push(array);
        });
        expect(arrays.length).assertEqual(2);
        expect(arrays[0]).assertEqual(arr);
        expect(arrays[1]).assertEqual(arr);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4700
     * @tc.name builtinsArrayForEachPrototypebTest4700
     * @tc.desc forEach(self: FixedArray<int>, callbackfn) 复杂场景：偶数下标加2，奇数下标减1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [10, 20, 30, 40];
        forEach(arr, (v, k, array) => {
          if (Double.toInt(k) % 2 === 0) {
            array[Double.toInt(k)] = v + 2;
          } else {
            array[Double.toInt(k)] = v - 1;
          }
        });
        expect(arr[0]).assertEqual(12);
        expect(arr[1]).assertEqual(19);
        expect(arr[2]).assertEqual(32);
        expect(arr[3]).assertEqual(39);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4800
     * @tc.name builtinsArrayForEachPrototypebTest4800
     * @tc.desc forEach(self: FixedArray<int>, callbackfn) 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<int> = [99];
        let sum = 0;
        forEach(arr, (v, k, array) => {
          sum += v;
        });
        expect(sum).assertEqual(99);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest4900
     * @tc.name builtinsArrayForEachPrototypebTest4900
     * @tc.desc forEach(self: FixedArray<long>, callbackfn) 所有元素加100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest4900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2, 3, 4];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = v + 100;
        });
        expect(arr[0]).assertEqual(101);
        expect(arr[1]).assertEqual(102);
        expect(arr[2]).assertEqual(103);
        expect(arr[3]).assertEqual(104);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5000
     * @tc.name builtinsArrayForEachPrototypebTest5000
     * @tc.desc forEach(self: FixedArray<long>, callbackfn) 所有元素置为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [5, 6, 7];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = 0;
        });
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5100
     * @tc.name builtinsArrayForEachPrototypebTest5100
     * @tc.desc forEach(self: FixedArray<long>, callbackfn) 空数组不执行回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [];
        let called = false;
        forEach(arr, (v, k, array) => {
          called = true;
        });
        expect(called).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5200
     * @tc.name builtinsArrayForEachPrototypebTest5200
     * @tc.desc forEach(self: FixedArray<long>, callbackfn) 检查回调参数index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [10, 20, 30];
        let indices: number[] = [];
        forEach(arr, (v, k, array) => {
          indices.push(Double.toInt(k));
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5300
     * @tc.name builtinsArrayForEachPrototypebTest5300
     * @tc.desc forEach(self: FixedArray<long>, callbackfn) 检查回调参数value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [7, 8, 9];
        let values: long[] = [];
        forEach(arr, (v, k, array) => {
          values.push(v);
        });
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(7);
        expect(values[1]).assertEqual(8);
        expect(values[2]).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5400
     * @tc.name builtinsArrayForEachPrototypebTest5400
     * @tc.desc forEach(self: FixedArray<long>, callbackfn) 检查回调参数array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [1, 2];
        let arrays: FixedArray<long>[] = [];
        forEach(arr, (v, k, array) => {
          arrays.push(array);
        });
        expect(arrays.length).assertEqual(2);
        expect(arrays[0]).assertEqual(arr);
        expect(arrays[1]).assertEqual(arr);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5500
     * @tc.name builtinsArrayForEachPrototypebTest5500
     * @tc.desc forEach(self: FixedArray<long>, callbackfn) 复杂场景：偶数下标加2，奇数下标减1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5500';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [10, 20, 30, 40];
        forEach(arr, (v, k, array) => {
          if (Double.toInt(k) % 2 === 0) {
            array[Double.toInt(k)] = v + 2;
          } else {
            array[Double.toInt(k)] = v - 1;
          }
        });
        expect(arr[0]).assertEqual(12);
        expect(arr[1]).assertEqual(19);
        expect(arr[2]).assertEqual(32);
        expect(arr[3]).assertEqual(39);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5600
     * @tc.name builtinsArrayForEachPrototypebTest5600
     * @tc.desc forEach(self: FixedArray<long>, callbackfn) 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5600';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<long> = [99];
        let sum = 0;
        forEach(arr, (v, k, array) => {
          sum += v;
        });
        expect(sum).assertEqual(99);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5700
     * @tc.name builtinsArrayForEachPrototypebTest5700
     * @tc.desc forEach(self: FixedArray<short>, callbackfn) 所有元素加10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5700';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2, 3, 4];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = (v + 10).toShort();
        });
        expect(arr[0]).assertEqual(11);
        expect(arr[1]).assertEqual(12);
        expect(arr[2]).assertEqual(13);
        expect(arr[3]).assertEqual(14);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5800
     * @tc.name builtinsArrayForEachPrototypebTest5800
     * @tc.desc forEach(self: FixedArray<short>, callbackfn) 所有元素置为0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5800';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [5, 6, 7];
        forEach(arr, (v, k, array) => {
          array[Double.toInt(k)] = 0;
        });
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest5900
     * @tc.name builtinsArrayForEachPrototypebTest5900
     * @tc.desc forEach(self: FixedArray<short>, callbackfn) 空数组不执行回调
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest5900';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [];
        let called = false;
        forEach(arr, (v, k, array) => {
          called = true;
        });
        expect(called).assertEqual(false);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest6000
     * @tc.name builtinsArrayForEachPrototypebTest6000
     * @tc.desc forEach(self: FixedArray<short>, callbackfn) 检查回调参数index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest6000';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [10, 20, 30];
        let indices: number[] = [];
        forEach(arr, (v, k, array) => {
          indices.push(Double.toInt(k));
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest6100
     * @tc.name builtinsArrayForEachPrototypebTest6100
     * @tc.desc forEach(self: FixedArray<short>, callbackfn) 检查回调参数value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest6100';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [7, 8, 9];
        let values: short[] = [];
        forEach(arr, (v, k, array) => {
          values.push(v);
        });
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(7);
        expect(values[1]).assertEqual(8);
        expect(values[2]).assertEqual(9);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest6200
     * @tc.name builtinsArrayForEachPrototypebTest6200
     * @tc.desc forEach(self: FixedArray<short>, callbackfn) 检查回调参数array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest6200';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [1, 2];
        let arrays: FixedArray<short>[] = [];
        forEach(arr, (v, k, array) => {
          arrays.push(array);
        });
        expect(arrays.length).assertEqual(2);
        expect(arrays[0]).assertEqual(arr);
        expect(arrays[1]).assertEqual(arr);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest6300
     * @tc.name builtinsArrayForEachPrototypebTest6300
     * @tc.desc forEach(self: FixedArray<short>, callbackfn) 复杂场景：偶数下标加2，奇数下标减1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest6300';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [10, 20, 30, 40];
        forEach(arr, (v, k, array) => {
          if (Double.toInt(k) % 2 === 0) {
            array[Double.toInt(k)] = (v + 2).toShort();
          } else {
            array[Double.toInt(k)] =
              (v - 1).toShort();
          }
        });
        expect(arr[0]).assertEqual(12);
        expect(arr[1]).assertEqual(19);
        expect(arr[2]).assertEqual(32);
        expect(arr[3]).assertEqual(39);
        console.info(`${caseName}, test end`);
        Done();
      })

    /**
     * @tc.number builtinsArrayForEachPrototypebTest6400
     * @tc.name builtinsArrayForEachPrototypebTest6400
     * @tc.desc forEach(self: FixedArray<short>, callbackfn) 单元素数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayForEachPrototypebTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'builtinsArrayForEachPrototypebTest6400';
        console.info(`${caseName}, test start`);
        let arr: FixedArray<short> = [99];
        let sum = 0;
        forEach(arr, (v, k, array) => {
          const currentValue = Short.toInt(v);
          sum = sum + currentValue;
        });
        expect(sum).assertEqual(99);
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}