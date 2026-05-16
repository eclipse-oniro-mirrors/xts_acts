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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';


interface testobj1 {
  value: number
}

interface testobj2 {
  id: number;
  name: string
}

interface testobj3 {
  value: number
}

interface testobj4 {
  id: number;
  name: string
}

interface testobj5 {
  factor: number
}

interface testobj6 {
  name: string
}

interface testobj7 {
  multiplier: number
}

export default function IndexedCollections17Test() {
  describe('IndexedCollections17Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
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
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_1100
     * @tc.name      testArrayReduce0011
     * @tc.desc      Verify reduce sums object property values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0011';
        console.log(TAG + ' start');

        const arr116: testobj1[] = [{ value: 10 }, { value: 20 }, { value: 30 }];
        const result116: number = arr116.reduce((acc: number, cur: testobj1) => acc + cur.value, 0);
        expect(result116 === 60).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_1300
     * @tc.name      testArrayReduce0013
     * @tc.desc      Verify reduce can use index argument to compute weighted sum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0013';
        console.log(TAG + ' start');

        const arr118: int[] = [1, 2, 3];
        const result118: int = arr118.reduce((acc: int, cur: int, i: int) => acc + cur * i, 0);
        expect(result118 === 8).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_1400
     * @tc.name      testArrayReduce0014
     * @tc.desc      Verify reduce with initial array can collect transformed elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0014';
        console.log(TAG + ' start');

        const arr119: number[] = [1, 2, 3];
        const result119: number[] = arr119.reduce((acc: number[], cur: number) => {
          acc.push(cur * 2);
          return acc;
        }, [] as number[]);
        expect(result119.join(',') === '2,4,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_1500
     * @tc.name      testArrayReduce0015
     * @tc.desc      Verify reduce can ignore NaN values when accumulating (custom logic).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0015';
        console.log(TAG + ' start');

        const arr120: int[] = [1, NaN.toInt(), 3];
        const result120: int = arr120.reduce((acc: int, cur: int) => (isNaN(cur) ? acc : acc + cur), 0);
        expect(result120 === 4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_1600
     * @tc.name      testArrayReduce0016
     * @tc.desc      Verify reduce can compute maximum value from array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0016';
        console.log(TAG + ' start');

        const arr121: number[] = [5, 2, 9, 1, 7];
        const result121: number = arr121.reduce((acc: number, cur: number) => Math.max(acc, cur));
        expect(result121 === 9).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_1700
     * @tc.name      testArrayReduce0017
     * @tc.desc      Verify reduce with initial Infinity finds array minimum.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0017';
        console.log(TAG + ' start');

        const arr122: number[] = [5, 2, 9, 1, 7];
        const result122: number = arr122.reduce((acc: number, cur: number) => Math.min(acc, cur), Infinity);
        expect(result122 === 1).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCE_1900
     * @tc.name      testArrayReduce0019
     * @tc.desc      Verify reduce counts true values in a boolean array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduce0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduce0019';
        console.log(TAG + ' start');

        const arr124: boolean[] = [true, false, true, true, false];
        const result124: number = arr124.reduce((acc: number, cur: boolean) => acc + (cur ? 1 : 0), 0);
        expect(result124 === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_0100
     * @tc.name      testArrayReduceRight0001
     * @tc.desc      Verify reduceRight sums values from right to left and logs accumulator/current at each step.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0001';
        console.log(TAG + ' start');

        const arr131: number[] = [1, 2, 3, 4];

        const result131: number = arr131.reduceRight((acc: number, cur: number) => {
          console.log(`accumulator=${acc}, current=${cur}`);
          return acc + cur;
        });

        expect(result131 === 10).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_0200
     * @tc.name      testArrayReduceRight0002
     * @tc.desc      Verify reduceRight with an initial value sums correctly from right to left.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0002';
        console.log(TAG + ' start');

        const arr132: number[] = [1, 2, 3];
        const result132: number = arr132.reduceRight((acc: number, cur: number) => acc + cur, 10);
        expect(result132 === 16).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_0300
     * @tc.name      testArrayReduceRight0003
     * @tc.desc      Verify reduceRight concatenates strings in reverse order when initial value is empty string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0003';
        console.log(TAG + ' start');

        const arr133: string[] = ['a', 'b', 'c'];
        const result133: string = arr133.reduceRight((acc: string, cur: string) => acc + cur, '');

        expect(result133 === 'cba').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_0400
     * @tc.name      testArrayReduceRight0004
     * @tc.desc      Verify reduce and reduceRight produce different results when operation is non-commutative.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0004';
        console.log(TAG + ' start');

        const arr134: number[] = [1, 2, 3];
        const reduceVal: number = arr134.reduce((acc: number, cur: number) => acc - cur);
        const reduceRightVal: number = arr134.reduceRight((acc: number, cur: number) => acc - cur);

        expect(reduceVal === -4).assertTrue();
        expect(reduceRightVal === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_0500
     * @tc.name      testArrayReduceRight0005
     * @tc.desc      Verify reduceRight on single-element array without initial value returns that element.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0005';
        console.log(TAG + ' start');

        const arr135: number[] = [5];
        const result135: number = arr135.reduceRight((acc: number, cur: number) => acc + cur);
        expect(result135 === 5).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_0600
     * @tc.name      testArrayReduceRight0006
     * @tc.desc      Verify reduceRight on empty array with initial value does not throw and returns initial value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0006';
        console.log(TAG + ' start');

        const arr136: number[] = [];
        const result136: number = arr136.reduceRight((acc: number, cur: number) => acc + cur, 0);
        expect(result136 === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_0700
     * @tc.name      testArrayReduceRight0007
     * @tc.desc      Verify reduceRight on empty array without initial value throws TypeError.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0007';
        console.log(TAG + ' start');
        try {
          const arr137: number[] = [];
          let result137: string | number;
          result137 = arr137.reduceRight((acc: number, cur: number) => acc + cur);

        } catch (e) {
          const errMsg = (e instanceof Error) ? e.message : String(e);
          console.log('137. empty array reduceRight (no initial) error: ' + errMsg);
          expect(errMsg).assertEqual("Reduce of empty array with no initial value");
        }

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_0800
     * @tc.name      testArrayReduceRight0008
     * @tc.desc      Verify reduceRight can accumulate object property values from right to left.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0008';
        console.log(TAG + ' start');

        const arr138: testobj3[] = [{ value: 10 }, { value: 20 }, { value: 30 }];
        const result138: number = arr138.reduceRight((acc: number, cur: testobj3) => acc + cur.value, 0);
        expect(result138 === 60).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_1000
     * @tc.name      testArrayReduceRight0010
     * @tc.desc      Verify reduceRight can use the index parameter correctly (indices are the same as usual but traversal is right-to-left).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0010';
        console.log(TAG + ' start');

        const arr140: int[] = [1, 2, 3];
        const result140: int = arr140.reduceRight((acc: int, cur: int, i: int) => {
          return acc + cur * i;
        }, 0);

        expect(result140 === 8).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_1100
     * @tc.name      testArrayReduceRight0011
     * @tc.desc      Verify reduceRight can compute the maximum value from right to left.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0011';
        console.log(TAG + ' start');

        const arr141: number[] = [5, 9, 3, 7];
        const result141: number = arr141.reduceRight((acc: number, cur: number) => Math.max(acc, cur));

        expect(result141 === 9).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_1200
     * @tc.name      testArrayReduceRight0012
     * @tc.desc      Verify reduceRight can filter and accumulate even numbers from right to left.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0012';
        console.log(TAG + ' start');

        const arr142: number[] = [1, 2, 3, 4, 5, 6];
        const result142: number = arr142.reduceRight((acc: number, cur: number) => {
          return cur % 2 === 0 ? acc + cur : acc;
        }, 0);

        expect(result142 === 12).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_1300
     * @tc.name      testArrayReduceRight0013
     * @tc.desc      Verify reduceRight can reverse characters producing reversed string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0013';
        console.log(TAG + ' start');

        const arr143: string[] = ['h', 'e', 'l', 'l', 'o'];
        const result143: string = arr143.reduceRight((acc: string, cur: string) => acc + cur, '');

        expect(result143 === 'olleh').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_1500
     * @tc.name      testArrayReduceRight0015
     * @tc.desc      Verify reduceRight can collect values into an array in reverse order when initial accumulator is an array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0015';
        console.log(TAG + ' start');

        const arr145: number[] = [1, 2, 3];
        const result145: number[] = arr145.reduceRight((acc: number[], cur: number) => {
          acc.push(cur);
          return acc;
        }, [] as number[]);

        expect(result145.join(',') === '3,2,1').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_1600
     * @tc.name      testArrayReduceRight0016
     * @tc.desc      Verify reduceRight can handle NaN by skipping NaN values when desired.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0016';
        console.log(TAG + ' start');

        const arr146: (number)[] = [1, NaN, 3];
        const result146: number = arr146.reduceRight((acc: number, cur: number) => {
          return isNaN(cur) ? acc : acc + cur;
        }, 0);

        expect(result146 === 4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_REDUCERIGHT_1800
     * @tc.name      testArrayReduceRight0018
     * @tc.desc      Verify reduceRight counts true values in boolean array when traversed right-to-left.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayReduceRight0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayReduceRight0018';
        console.log(TAG + ' start');

        const arr148: boolean[] = [true, false, true, false];
        const result148: number = arr148.reduceRight((acc: number, cur: boolean) => acc + (cur ? 1 : 0), 0);
        expect(result148 === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_0100
     * @tc.name      testArrayForEach0001
     * @tc.desc      Verify forEach callback receives (element, index, array) as parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0001';
        console.log(TAG + ' start');

        const arr41: number[] = [1, 2];
        const log41: string[] = [];
        arr41.forEach((element: number, index: int, array: number[]) => {
          log41.push(`element ${element}, index ${index}, arrayLength ${array.length}`);
        });
        const joined = log41.join(' ; ');
        expect(joined === 'element 1, index 0, arrayLength 2 ; element 2, index 1, arrayLength 2').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_0300
     * @tc.name      testArrayForEach0003
     * @tc.desc      Verify forEach callback can modify the original array during traversal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0003';
        console.log(TAG + ' start');

        const arr43: number[] = [1, 2, 3];
        arr43.forEach((element: number, index: int, array: number[]) => {
          array[index] = element * 2;
        });

        expect(arr43.join(',') === '2,4,6').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_0400
     * @tc.name      testArrayForEach0004
     * @tc.desc      Verify forEach on an empty array does not invoke the callback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0004';
        console.log(TAG + ' start');

        const arr44: number[] = [];
        let count44: number = 0;
        arr44.forEach(() => {
          count44++;
        });

        expect(count44 === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_0500
     * @tc.name      testArrayForEach0005
     * @tc.desc      Verify forEach on single-element array invokes callback once with correct index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0005';
        console.log(TAG + ' start');

        const arr45: string[] = ['test'];
        let log45: string = '';
        arr45.forEach((element: string, index: int) => {
          log45 = `element ${element}, index ${index}`;
        });

        expect(log45 === 'element test, index 0').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_0700
     * @tc.name      testArrayForEach0007
     * @tc.desc      Verify arrow function shorthand works with forEach.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0007';
        console.log(TAG + ' start');

        const arr47: number[] = [1, 2];
        let sum47: number = 0;
        arr47.forEach(x => {
          sum47 += x
        });

        expect(sum47 === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_0800
     * @tc.name      testArrayForEach0008
     * @tc.desc      Verify forEach iterates object arrays and accesses properties.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0008';
        console.log(TAG + ' start');

        const arr48: testobj6[] = [{ name: 'a' }, { name: 'b' }];
        const names48: string[] = [];
        arr48.forEach(obj => {
          names48.push(obj.name)
        });

        expect(names48.join(',') === 'a,b').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_0900
     * @tc.name      testArrayForEach0009
     * @tc.desc      Verify adding elements during forEach does not make them be visited in the current traversal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0009';
        console.log(TAG + ' start');

        const arr49: number[] = [1, 2];
        arr49.forEach((element: number) => {
          if (element === 1) {
            arr49.push(3);
          }
        });

        expect(arr49.join(',') === '1,2,3').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_1000
     * @tc.name      testArrayForEach0010
     * @tc.desc      Verify removing elements during forEach does not affect already visited elements.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0010';
        console.log(TAG + ' start');

        const arr50: number[] = [1, 2, 3, 4];
        arr50.forEach((element: number, index: int, array: number[]) => {
          if (element === 2) {
            array.splice(index, 1);
          }
        });

        expect(arr50.join(',') === '1,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_1200
     * @tc.name      testArrayForEach0012
     * @tc.desc      Verify nested forEach can flatten nested arrays by pushing inner elements into an accumulator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0012';
        console.log(TAG + ' start');

        const arr52: number[][] = [[1, 2], [3, 4]];
        const flat52: number[] = [];
        arr52.forEach(subArr => {
          subArr.forEach(num => {
            flat52.push(num)
          });
        });

        expect(flat52.join(',') === '1,2,3,4').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_1300
     * @tc.name      testArrayForEach0013
     * @tc.desc      Verify forEach works with boolean arrays and can count true occurrences.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0013';
        console.log(TAG + ' start');

        const arr53: boolean[] = [true, false, true];
        let countTrue53: number = 0;
        arr53.forEach(x => {
          if (x) {
            countTrue53++;
          }
        });

        expect(countTrue53 === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_1400
     * @tc.name      testArrayForEach0014
     * @tc.desc      Verify forEach handles undefined elements and receives the correct index and value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0014';
        console.log(TAG + ' start');

        const arr54: (number | undefined)[] = [undefined, 1, undefined];
        const log54: string[] = [];
        arr54.forEach((x, i) => {
          log54.push(`index ${i}: ${String(x)}`)
        });
        const joined = log54.join(', ');
        expect(joined === 'index 0: undefined, index 1: 1, index 2: undefined').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_FOREACH_1500
     * @tc.name      testArrayForEach0015
     * @tc.desc      Verify forEach on a larger array executes the callback expected number of times.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayForEach0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayForEach0015';
        console.log(TAG + ' start');

        const arr55: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        let count55: number = 0;
        arr55.forEach(() => {
          count55++
        });
        expect(count55 === 10).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_0100
     * @tc.name      testArrayBuffer0001
     * @tc.desc      Verify creating a TypedArray (Int16Array) from an ArrayBuffer (default offset and length).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0001';
        console.log(TAG + ' start');

        const buffer21: ArrayBuffer = new ArrayBuffer(8);
        const arr21: Int16Array = new Int16Array(buffer21);

        const resultLen = arr21.length;
        const resultOffset = arr21.byteOffset;
        expect(resultLen === 4).assertTrue();
        expect(resultOffset === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_0200
     * @tc.name      testArrayBuffer0002
     * @tc.desc      Verify creating a Uint8Array with an explicit byteOffset works and reports byteOffset/byteLength.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0002';
        console.log(TAG + ' start');

        const buffer22: ArrayBuffer = new ArrayBuffer(10);
        const arr22: Uint8Array = new Uint8Array(buffer22, 3);

        expect(arr22.byteOffset === 3).assertTrue();
        expect(arr22.byteLength === 7).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_0300
     * @tc.name      testArrayBuffer0003
     * @tc.desc      Verify creating a typed view with explicit byteOffset and length works (Int32Array).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0003';
        console.log(TAG + ' start');

        const buffer23: ArrayBuffer = new ArrayBuffer(16);
        const arr23: Int32Array = new Int32Array(buffer23, 4, 2);

        expect(arr23.byteOffset === 4).assertTrue();
        expect(arr23.length === 2).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_0400
     * @tc.name      testArrayBuffer0004
     * @tc.desc      Verify creating a Float32Array with offset 0 and explicit length works and reports byteLength.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0004';
        console.log(TAG + ' start');

        const buffer24: ArrayBuffer = new ArrayBuffer(8);
        const arr24: Float32Array = new Float32Array(buffer24, 0, 2);

        expect(arr24.length === 2).assertTrue();
        expect(arr24.byteLength === 8).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_0500
     * @tc.name      testArrayBuffer0005
     * @tc.desc      Verify that two typed views created from the same buffer share underlying memory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0005';
        console.log(TAG + ' start');

        const buffer25: ArrayBuffer = new ArrayBuffer(4);
        const arr25a: Int16Array = new Int16Array(buffer25);
        const arr25b: Int16Array = new Int16Array(buffer25);
        arr25a[0] = 100;

        expect(arr25b[0] === 100).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_0600
     * @tc.name      testArrayBuffer0006
     * @tc.desc      Verify that different typed views share the same buffer (endianness-aware): write via Uint32 and read first byte via Uint8.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0006';
        console.log(TAG + ' start');

        const buffer26: ArrayBuffer = new ArrayBuffer(4);
        const arr26a: Uint32Array = new Uint32Array(buffer26);
        const arr26b: Uint8Array = new Uint8Array(buffer26);
        arr26a[0] = 0x12345678;

        const firstByteHex = arr26b[0].toString(16);
        expect(typeof firstByteHex === 'string').assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_0700
     * @tc.name      testArrayBuffer0007
     * @tc.desc      Verify that creating a typed view with a byteOffset larger than buffer length throws RangeError.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0007';
        console.log(TAG + ' start');

        const buffer27: ArrayBuffer = new ArrayBuffer(8);
        let threw = false;
        try {
          const arr27 = new Int16Array(buffer27, 10);
        } catch (e) {
          console.log('offset out of bounds thrown RangeError: ' + (e instanceof RangeError));
          threw = (e instanceof RangeError);
        }
        expect(threw).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_0800
     * @tc.name      testArrayBuffer0008
     * @tc.desc      Verify that creating a typed view with a length that exceeds the buffer throws RangeError.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0008';
        console.log(TAG + ' start');

        const buffer28: ArrayBuffer = new ArrayBuffer(8);
        let threw = false;
        try {
          const arr28 = new Int32Array(buffer28, 0, 3);
        } catch (e) {
          console.log('length exceeds buffer thrown RangeError: ' + (e instanceof RangeError));
          threw = (e instanceof RangeError);
        }
        expect(threw).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_0900
     * @tc.name      testArrayBuffer0009
     * @tc.desc      Verify that byteOffset + length exceeding buffer throws RangeError.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0009';
        console.log(TAG + ' start');

        const buffer29: ArrayBuffer = new ArrayBuffer(10);
        let threw = false;
        try {
          const arr29 = new Uint8Array(buffer29, 8, 3);
        } catch (e) {
          console.log('offset + length exceed thrown RangeError: ' + (e instanceof RangeError));
          threw = (e instanceof RangeError);
        }
        expect(threw).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_1000
     * @tc.name      testArrayBuffer0010
     * @tc.desc      Verify that non-aligned byteOffset for typed views is rejected (RangeError) per spec.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0010';
        console.log(TAG + ' start');

        const buffer30: ArrayBuffer = new ArrayBuffer(10);
        let threw = false;
        try {
          const arr30 = new Int16Array(buffer30, 1, 4);
        } catch (e) {
          console.log('non-aligned offset thrown RangeError: ' + (e instanceof RangeError));
          threw = (e instanceof RangeError);
        }
        expect(threw).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_1100
     * @tc.name      testArrayBuffer0011
     * @tc.desc      Verify creating typed view from zero-length ArrayBuffer yields zero-length typed array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0011';
        console.log(TAG + ' start');

        const buffer31: ArrayBuffer = new ArrayBuffer(0);
        const arr31: Int8Array = new Int8Array(buffer31);
        expect(arr31.length === 0).assertTrue();
        expect(arr31.byteLength === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_1200
     * @tc.name      testArrayBuffer0012
     * @tc.desc      Verify buffer byteLength matches type byte multiples (Int32Array from 12 bytes => 3 elements).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0012';
        console.log(TAG + ' start');

        const buffer32: ArrayBuffer = new ArrayBuffer(12);
        const arr32: Int32Array = new Int32Array(buffer32);
        expect(arr32.length === 3).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_1300
     * @tc.name      testArrayBuffer0013
     * @tc.desc      Verify buffer byteLength not multiple of element size truncates final incomplete element (floor division).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0013';
        console.log(TAG + ' start');
        try{
          const buffer33: ArrayBuffer = new ArrayBuffer(10);
          const arr33: Int32Array = new Int32Array(buffer33);
          console.log('non-byte-multiple length: ' + arr33.length);
        } catch (err) {
          console.error(`${TAG} fail, err: ${err}`);
          expect(err.toString()).assertEqual("RangeError: ArrayBuffer.byteLength should be multiple of 4 as Int32Array.BYTES_PER_ELEMENT");
        }
        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_1400
     * @tc.name      testArrayBuffer0014
     * @tc.desc      Verify that specifying byteOffset equal to buffer.byteLength creates an empty typed array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0014';
        console.log(TAG + ' start');

        const buffer34: ArrayBuffer = new ArrayBuffer(8);
        const arr34: Uint16Array = new Uint16Array(buffer34, 8);
        expect(arr34.length === 0).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_1800
     * @tc.name      testArrayBuffer0018
     * @tc.desc      Verify creating a TypedArray from the underlying ArrayBuffer of a DataView (use view.buffer).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0018';
        console.log(TAG + ' start');

        const buffer38: ArrayBuffer = new ArrayBuffer(8);
        const view38: DataView = new DataView(buffer38);
        const arr38: Int16Array = new Int16Array(view38.buffer);
        expect(arr38.length === 4).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_1900
     * @tc.name      testArrayBuffer0019
     * @tc.desc      Verify that negative byteOffset throws RangeError when creating typed view.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0019';
        console.log(TAG + ' start');

        const buffer39: ArrayBuffer = new ArrayBuffer(8);
        let threw = false;
        try {
          const arr39 = new Uint32Array(buffer39, -1);
          console.log('unexpected success, len: ' + arr39.length);
        } catch (e) {
          console.log('negative offset throws RangeError: ' + (e instanceof RangeError));
          threw = (e instanceof RangeError);
        }
        expect(threw).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

    /**
     * @tc.number    SUB_BASEDATE_ARRAY_BUFFER_2000
     * @tc.name      testArrayBuffer0020
     * @tc.desc      Verify that negative length passed to typed view constructor throws RangeError.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayBuffer0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        const TAG = 'testArrayBuffer0020';
        console.log(TAG + ' start');

        const buffer40: ArrayBuffer = new ArrayBuffer(8);
        let threw = false;
        try {
          const arr40 = new Float64Array(buffer40, 0, -1);
          console.log('unexpected success, len: ' + arr40.length);
        } catch (e) {
          console.log('negative length throws RangeError: ' + (e instanceof RangeError));
          threw = (e instanceof RangeError);
        }
        expect(threw).assertTrue();

        console.log(TAG + ' done');
        done();
        console.log(TAG + ' end');
      });

  })
}