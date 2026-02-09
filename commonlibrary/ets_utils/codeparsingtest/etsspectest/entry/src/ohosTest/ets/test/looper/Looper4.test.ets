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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  getLooper4Fn1,
  getLooper4Fn10,
  getLooper4Fn11,
  getLooper4Fn12,
  getLooper4Fn13,
  getLooper4Fn14,
  getLooper4Fn15,
  getLooper4Fn16,
  getLooper4Fn17,
  getLooper4Fn19,
  getLooper4Fn2,
  getLooper4Fn20,
  getLooper4Fn21,
  getLooper4Fn22,
  getLooper4Fn23,
  getLooper4Fn24,
  getLooper4Fn25,
  getLooper4Fn26,
  getLooper4Fn27,
  getLooper4Fn28,
  getLooper4Fn29,
  getLooper4Fn3,
  getLooper4Fn30,
  getLooper4Fn31,
  getLooper4Fn32,
  getLooper4Fn4,
  getLooper4Fn5,
  getLooper4Fn6,
  getLooper4Fn7,
  getLooper4Fn8,
  getLooper4Fn9
} from './looper4';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function looper4Test() {
  describe('looper4Test', () => {
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
     * @tc.name   testLoop4_001
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_0100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn1();
      expect(list.toString()).assertEqual('Current value: 1,Current value: 2,Current value: 3,Current value: 4');
    });

    /**
     * @tc.name   testLoop4_002
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_0200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn2();
      expect(list.toString()).assertEqual('Current value:1,Current value:3');
    });

    /**
     * @tc.name   testLoop4_003
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_0300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      for (let num = 0, str = 'loop'; num < 3; num++, str += 'ed') {
        list.push(`Number: ${num}, String: ${str}`);
      }
      expect(list.toString())
        .assertEqual('Number: 0, String: loop,Number: 1, String: looped,Number: 2, String: loopeded');
    });

    /**
     * @tc.name   testLoop4_004
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_0400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      const arr = [10, 20, 30, 40, 50];
      for (let i = arr.length - 1; i >= 0; i -= 2) {
        list.push(`Element: ${arr[i]}`);
      }
      expect(list.toString()).assertEqual('Element: 50,Element: 30,Element: 10');
    });

    /**
     * @tc.name   testLoop4_005
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_0500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      for (let i = 0; i < 10; i++) {
        if (i === 3) {
          i += 2;
        }
        list.push(`i: ${i}`);
      }
      expect(list.toString()).assertEqual('i: 0,i: 1,i: 2,i: 5,i: 6,i: 7,i: 8,i: 9');
    });

    /**
     * @tc.name   testLoop4_006
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_0600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn3();
      expect(list.toString()).assertEqual('In-stock product index: 0');
    });

    /**
     * @tc.name   testLoop4_007
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_0700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn3();
      for (let i = getStartIndex(); i < 5; i++) {
        list.push(`Starting from ${getStartIndex()}, current i: ${i}`);
      }
      expect([0, 1, 2, 3, 4, 5, 6]).assertContain(list.length);
    });


    /**
     * @tc.name   testLoop4_009
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_0900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      for (let i = 3; i <= 5; i++) {
        let row = '';
        for (let j = 1; j <= i; j++) {
          row += `${j}×${i}=${j * i}\t`;
        }
        list.push(row);
      }
      expect(list.toString())
        .assertEqual('1×3=3\t2×3=6\t3×3=9\t,1×4=4\t2×4=8\t3×4=12\t4×4=16\t,1×5=5\t2×5=10\t3×5=15\t4×5=20\t5×5=25\t');
    });

    /**
     * @tc.name   testLoop4_010
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_1000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      const target = 7;
      const numbers = [1, 3, 5, 7, 9];
      let foundIndex = -1;
      for (let i = 0; i < numbers.length; i++) {
        if (numbers[i] === target) {
          foundIndex = i;
          break;
        }
      }
      if (foundIndex !== -1) {
        list.push(`Target ${target} found at index ${foundIndex}`);
      }
      expect(list.toString()).assertEqual('Target 7 found at index 3');
    });

    /**
     * @tc.name   testLoop4_011
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_1100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      const data = [2, null, 5, undefined, 8];
      for (let i = 0; i < data.length; i++) {
        if (!data[i]) {
          continue;
        }
        list.push(`Valid data: ${data[i]}`);
      }
      expect(list.toString()).assertEqual('Valid data: 2,Valid data: 5,Valid data: 8');
    });

    /**
     * @tc.name   testLoop4_012
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_1200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list: Array<string> = await getLooper4Fn4();
      expect(list.toString()).assertEqual('var i: 3,var i: 3,var i: 3,let j: 0,let j: 1,let j: 2');
    });

    /**
     * @tc.name   testLoop4_013
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_1300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn5();
      expect(list.toString()).assertEqual('Sum: 10');
    });

    /**
     * @tc.name   testLoop4_014
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_1400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      const mixedArr = [1, 'a', 2, 'b', 3];
      for (let i = 0; i < mixedArr.length && typeof mixedArr[i] === 'string'; i++) {
        list.push(`String element: ${mixedArr[i]}`);
      }
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop4_015
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_1500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn6();
      expect(list.toString())
        .assertEqual('i: 0, current step: 1,i: 2, current step: 2,i: 3, current step: 1,i: 5, current step: 2,i: 6, current step: 1,i: 8, current step: 2,i: 9, current step: 1');
    });

    /**
     * @tc.name   testLoop4_017
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_1700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn7();
      expect(list.toString())
        .assertEqual('Formatted amount: 10.00元,Formatted amount: 25.50元,Formatted amount: 33.33元');
    });

    /**
     * @tc.name   testLoop4_018
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_1800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const scores = [85, 90, 88];
      let count = 0;
      for (; scores.every(score => score >= 85) && count < 3; count++) {
        list.push(count);
      }
      expect(list.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testLoop4_019
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_1900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [1, 2, 3];
      for (let i = 0; i < arr.length; i++) {
        list.push(arr[i]);
        list.push(arr.length);
        if (i === 1) {
          arr.push(4);
        }
      }
      expect(list.toString()).assertEqual('1,3,2,3,3,4,4,4');
    });

    /**
     * @tc.name   testLoop4_020
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_2000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn8();
      expect(list.toString())
        .assertEqual('i ranges from 2 to 5: 2,i ranges from 2 to 5: 3,i ranges from 2 to 5: 4,i ranges from 2 to 5: 5');
    });

    /**
     * @tc.name   testLoop4_021
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_2100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      let seconds = 3;
      do {
        list.push(`Countdown: ${seconds}s`);
        seconds--;
      } while (seconds >= 0);
      list.push('Countdown ended!');
      expect(list.toString()).assertEqual('Countdown: 3s,Countdown: 2s,Countdown: 1s,Countdown: 0s,Countdown ended!');
    });

    /**
     * @tc.name   testLoop4_023
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_2300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string | number>();
      let num = 0;
      do {
        num++;
        if (num % 3 === 0 && num % 5 === 0) {
          list.push(num);
        } else if (num % 3 === 0) {
          list.push(num + 1);
        } else if (num % 5 === 0) {
          list.push(num + 3);
        } else {
          list.push(num + 2);
        }
      } while (num < 15);
      expect(list.toString()).assertEqual('3,4,4,6,8,7,9,10,10,13,13,13,15,16,15');
    });
    /**
     * @tc.name   testLoop4_024
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_2400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string | number>();
      const data = [10, 20, 'error', 30];
      let index = 0;
      do {
        const item = data[index];
        if (typeof item !== 'number') {
          list.push(index);
          break;
        }
        list.push(item);
        index++;
      } while (index < data.length);
      expect(list.toString()).assertEqual('10,20,2');
    });

    /**
     * @tc.name   testLoop4_025
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_2500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let isRunning = true;
      let counter = 0;
      do {
        list.push(counter);
        counter++;
        if (counter === 3) {
          isRunning = false;
        }
      } while (isRunning);
      expect(list.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testLoop4_026
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_2600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn9();
      expect(list.toString()).assertEqual('1,1,2,2,3,3,4,4,4');
    });

    /**
     * @tc.name   testLoop4_027
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_2700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const fruits = ['apple', 'banana', 'cherry', 'date'];
      let i = 0;
      do {
        list.push(`Current fruit: ${fruits[i]}, array length: ${fruits.length}`);
        fruits.pop();
        i++;
      } while (i < fruits.length);
      expect(list.toString())
        .assertEqual('Current fruit: apple, array length: 4,Current fruit: banana, array length: 3');
    });

    /**
     * @tc.name   testLoop4_028
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_2800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      let retryCount = 0;
      const maxRetries = 3;
      let isSuccess = false;

      do {
        retryCount++;
        isSuccess = retryCount === 3;
        list.push(`${retryCount}/${maxRetries} -> ${isSuccess}`);
        if (!isSuccess && retryCount === maxRetries) {
          list.push('failed');
        }
      } while (!isSuccess && retryCount < maxRetries);
      expect(list.toString()).assertEqual('1/3 -> false,2/3 -> false,3/3 -> true');
    });

    /**
     * @tc.name   testLoop4_030
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const matrix = [[1, 2], [3, 4]];
      let row = 0;
      do {
        let col = 0;
        do {
          list.push(`Matrix[${row}][${col}] = ${matrix[row][col]}`);
          col++;
        } while (col < matrix[row].length);
        row++;
      } while (row < matrix.length);
      expect(list.toString()).assertEqual('Matrix[0][0] = 1,Matrix[0][1] = 2,Matrix[1][0] = 3,Matrix[1][1] = 4');
    });

    /**
     * @tc.name   testLoop4_031
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      let num = 0;
      do {
        num++;
        if (num === 2) {
          list.push(num + 10);
          continue;
        }
        list.push(num);
      } while (num < 4);
      expect(list.toString()).assertEqual('1,12,3,4');
    });

    /**
     * @tc.name   testLoop4_032
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string | undefined>();
      const queue = ['task1', 'task2', 'task3'];
      do {
        const task = queue.shift();
        list.push(task);
      } while (queue.length > 0);
      expect(list.toString()).assertEqual('task1,task2,task3');
    });

    /**
     * @tc.name   testLoop4_033
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let a = 0;
      let b = 5;
      do {
        list.push(a);
        list.push(b);
        a++;
        b--;
      } while (a < 3 || b > 2);
      expect(list.toString()).assertEqual('0,5,1,4,2,3');
    });

    /**
     * @tc.name   testLoop4_034
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num = 2;
      let sum = 0;
      do {
        sum += num;
        num += 2;
      } while (num <= 10);
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.name   testLoop4_035
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list: Array<string> = await getLooper4Fn10();
      expect(list.toString())
        .assertEqual('Async process 1/3 completed,Async process 2/3 completed,Async process 3/3 completed');
    });

    /**
     * @tc.name   testLoop4_036
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper4Fn11();
      expect(list.toString()).assertEqual('1');
    });

    /**
     * @tc.name   testLoop4_037
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper4Fn12();
      expect(list.toString()).assertEqual('5,4,3,2,1');
    });

    /**
     * @tc.name   testLoop4_038
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number | string> = getLooper4Fn13();
      expect(list.toString()).assertEqual('1,2,3,string');
    });

    /**
     * @tc.name   testLoop4_039
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_3900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string | undefined>();
      const stack = ['step1', 'step2', 'step3'];
      while (stack.length > 0) {
        const step = stack.pop();
        list.push(step);
      }
      expect(list.toString()).assertEqual('step3,step2,step1');
    });


    /**
     * @tc.name   testLoop4_040
     * @tc.number testLoop4_040
     * @tc.desc   testLoop4_040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let num = 1;
      while (num <= 10) {
        list.push(num);
        if (num % 3 === 0) {
          num += 2;
        } else {
          num++;
        }
      }
      expect(list.toString()).assertEqual('1,2,3,5,6,8,9');
    });
    /**
     * @tc.name   testLoop4_041
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_4100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      let count = 0;
      while (count < 5) {
        try {
          count++;
          if (count === 3) {
            throw new Error(`Error occurred at count ${count}`);
          }
          list.push(`Success at count ${count}`);
        } catch (e) {
          list.push(`Caught error: ${e.message}, continuing loop`);
        }
      }
      expect(list.toString())
        .assertEqual('Success at count 1,Success at count 2,Caught error: Error occurred at count 3, continuing loop,Success at count 4,Success at count 5');
    });

    /**
     * @tc.name   testLoop4_042
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_4200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper4Fn14();
      expect(list.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testLoop4_043
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_4300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const num = 17;
      let isPrime = num > 1;
      let divisor = 2;
      while (divisor <= Math.sqrt(num)) {
        if (num % divisor === 0) {
          isPrime = false;
          break;
        }
        divisor++;
      }
      expect(num).assertEqual(17);
      expect(isPrime).assertTrue();
    });

    /**
     * @tc.name   testLoop4_045
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_4500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      const threeDArr = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]];
      let i = 0;
      while (i < threeDArr.length) {
        let j = 0;
        while (j < threeDArr[i].length) {
          let k = 0;
          while (k < threeDArr[i][j].length) {
            list.push(`res[${i}][${j}][${k}] = ${threeDArr[i][j][k]}`);
            k++;
          }
          j++;
        }
        i++;
      }
      expect(list.toString())
        .assertEqual('res[0][0][0] = 1,res[0][0][1] = 2,res[0][1][0] = 3,res[0][1][1] = 4,res[1][0][0] = 5,res[1][0][1] = 6,res[1][1][0] = 7,res[1][1][1] = 8');
    });

    /**
     * @tc.name   testLoop4_047
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_4700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list: Array<number | string> = getLooper4Fn15();
      await sleep(1600);
      expect(list.toString()).assertEqual('1,2,3,3after debounce');
    });

    /**
     * @tc.name   testLoop4_048
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_4800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let condition = 5;
      while (condition > 0) {
        list.push(condition);
        if (condition === 3) {
          condition = 1;
        } else {
          condition--;
        }
      }
      expect(list.toString()).assertEqual('5,4,3,1');
    });

    /**
     * @tc.name   testLoop4_049
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_4900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn16();
      expect(list.toString()).assertEqual("Character 'p' appears 2 times in 'javascript programming'");
    });


    /**
     * @tc.name   testLoop4_050
     * @tc.number testLoop4_050
     * @tc.desc   testLoop4_050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let balance = 100;
      const withdrawAmount = 30;
      while (canWithdraw(balance, withdrawAmount)) {
        balance -= withdrawAmount;
        list.push(withdrawAmount);
        list.push(balance);
      }
      list.push(balance + 1000);
      expect(list.toString()).assertEqual("30,70,30,40,30,10,1010");
    });

    /**
     * @tc.name   testLoop4_051
     * @tc.number testLoop4_051
     * @tc.desc   testLoop4_051
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outerLoop: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          list.push(i);
          list.push(j);
          if (i === 1 && j === 1) {
            break outerLoop;
          }
        }
      }
      expect(list.toString()).assertEqual("0,0,0,1,0,2,1,0,1,1");
    });

    /**
     * @tc.name   testLoop4_053
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_5300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outer: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (j === 1) {
            list.push(100);
            continue outer;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual("0,0,100,1,0,100,2,0,100");
    });

    /**
     * @tc.name   testLoop4_056
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_5600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      level1: for (let i = 0; i < 2; i++) {
        level2: for (let j = 0; j < 2; j++) {
          level3: for (let k = 0; k < 2; k++) {
            list.push(i);
            list.push(j);
            list.push(k);
            if (i === 1 && j === 0 && k === 1) {
              list.push(100);
              break level2;
            }
          }
        }
      }
      expect(list.toString()).assertEqual("0,0,0,0,0,1,0,1,0,0,1,1,1,0,0,1,0,1,100");
    });

    /**
     * @tc.name   testLoop4_060
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_6000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outer: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          switch (i + j) {
            case 2:
              list.push(i);
              list.push(j);
              break outer;
            default:
              list.push(j + i);
          }
        }
      }
      expect(list.toString()).assertEqual("0,1,0,2");
    });

    /**
     * @tc.name   testLoop4_061
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_6100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const filePaths = ['file1.txt', 'error.txt', 'file3.txt'];
      let fileProcessed = false;

      for (let i = 0; i < filePaths.length; i++) {
        const path = filePaths[i];
        if (path === 'error.txt') {
          list.push(path);
          break;
        }
        list.push(path);
        fileProcessed = true;
      }
      if (!fileProcessed) {
        list.push("end");
      }
      expect(list.toString()).assertEqual('file1.txt,error.txt');
    });

    /**
     * @tc.name   testLoop4_063
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_6300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const data = [10, 20, null, 30];
      let index = 0;
      do {
        const item = data[index];
        if (item === null) {
          list.push(index);
          break;
        }
        list.push(item);
        index++;
      } while (index < data.length);
      expect(list.toString()).assertEqual('10,20,2');
    });

    /**
     * @tc.name   testLoop4_064
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_6400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      for (let i = 0; i < 3; i++) {
        list.push(i);
        for (let j = 0; j < 3; j++) {
          if (j === 1) {
            list.push(`start`);
            list.push(j);
            break;
          }
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual('0,0,start,1,1,0,start,1,2,0,start,1');
    });

    /**
     * @tc.name   testLoop4_065
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_6500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      outer: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          list.push(i);
          list.push(j);
          if (i === 2 && j === 0) {
            list.push("end");
            break outer;
          }
        }
      }
      expect(list.toString()).assertEqual('0,0,0,1,0,2,1,0,1,1,1,2,2,0,end');
    });

    /**
     * @tc.name   testLoop4_066
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_6600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn17();
      expect(list.toString()).assertEqual('mode,dev,port,3000,end,env,local');
    });

    /**
     * @tc.name   testLoop4_067
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_6700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const fruits = ['apple', 'banana', 'cherry', 'date'];
      for (let fruit of fruits) {
        list.push(fruit);
        if (fruit === 'cherry') {
          list.push('end');
          break;
        }
      }
      expect(list.toString()).assertEqual('apple,banana,cherry,end');
    });

    /**
     * @tc.name   testLoop4_068
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_6800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const numbers = [1, 2, 3, 4, 5];
      for (let num of numbers) {
        switch (num) {
          case 3:
            list.push(`end1`);
            break;
          case 4:
            list.push(`end2`);
            break;
          default:
            list.push(num);
        }
        if (num === 3) {
          break;
        }
      }
      expect(list.toString()).assertEqual('1,2,end1');
    });

    /**
     * @tc.name   testLoop4_069
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_6900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const operations = [() => 10 / 2, () => 10 / 0, () => 10 / 5];
      for (let op of operations) {
        try {
          const result = op();
          list.push(result);
        } catch (e) {
          list.push(e.message);
          break;
        }
      }
      expect(list.toString()).assertEqual('5,Infinity,2');
    });

    /**
     * @tc.name   testLoop4_070
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      let count = 0;
      for (; count < 10; count++) {
        if (count === 5) {
          list.push(`start`);
          break;
        }
      }
      list.push(count);
      expect(list.toString()).assertEqual('start,5');
    });

    /**
     * @tc.name   testLoop4_071
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const arr = [10, 20, 30, 40, 50];
      for (let i = 0; i < arr.length; i++) {
        if (i % 2 === 0) {
          list.push(i);
          continue;
        }
        list.push(i);
        list.push(arr[i]);
      }
      expect(list.toString()).assertEqual('0,1,20,2,3,40,4');
    });

    /**
     * @tc.name   testLoop4_072
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const data = [1, null, 2, undefined, 3];
      let index = 0;
      while (index < data.length) {
        const item = data[index];
        if (!item) {
          list.push(index);
          index++;
          continue;
        }
        list.push(item);
        index++;
      }
      expect(list.toString()).assertEqual('1,1,2,3,3');
    });

    /**
     * @tc.name   testLoop4_073
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      let num = 0;
      do {
        num++;
        if (num === 3) {
          list.push(3);
          continue;
        }
        list.push(num);
      } while (num < 5);
      expect(list.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.name   testLoop4_074
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      outer: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (j === 1) {
            list.push(`start`);
            continue outer;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual('0,0,start,1,0,start,2,0,start');
    });

    /**
     * @tc.name   testLoop4_075
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn19();
      expect(list.toString()).assertEqual('own,ownValue,inherited');
    });

    /**
     * @tc.name   testLoop4_076
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const numbers = [1, -2, 3, -4, 5];
      for (let num of numbers) {
        if (num < 0) {
          list.push(num + 100);
          continue;
        }
        list.push(num);
      }
      expect(list.toString()).assertEqual('1,98,3,96,5');
    });

    /**
     * @tc.name   testLoop4_077
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const words = ['a', 'ab', 'abc', 'abcd'];
      for (let word of words) {
        if (shouldSkip(word)) {
          list.push(word);
          continue;
        }
        list.push('out' + word);
      }
      expect(list.toString()).assertEqual('a,ab,outabc,outabcd');
    });

    /**
     * @tc.name   testLoop4_078
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      for (let i = 0; i < 3; i++) {
        list.push(i);
        for (let j = 0; j < 3; j++) {
          if (j === 1) {
            list.push(`Skipping inner loop j=1`);
            continue;
          }
          list.push(j);
        }
      }
      expect(list.toString())
        .assertEqual('0,0,Skipping inner loop j=1,2,1,0,Skipping inner loop j=1,2,2,0,Skipping inner loop j=1,2');
    });

    /**
     * @tc.name   testLoop4_079
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_7900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const operations = [() => 10 / 2, () => 10 / 0, () => 10 / 5];
      for (let i = 0; i < operations.length; i++) {
        try {
          const result = operations[i]();
          list.push(`Operation ${i} result: ${result}`);
        } catch (e) {
          list.push(`Operation ${i} failed: ${e.message}, continuing`);
          continue;
        }
      }
      expect(list.toString()).assertEqual('Operation 0 result: 5,Operation 1 result: Infinity,Operation 2 result: 2');
    });

    /**
     * @tc.name   testLoop4_080
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_8000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn20();
      expect(list.toString()).assertEqual('phone,5000,laptop,tablet,3000');
    });

    /**
     * @tc.name   testLoop4_081
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_8100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn21();
      expect(list.toString()).assertEqual('name,Bob,age,25,Skipping method: greet');
    });

    /**
     * @tc.name   testLoop4_082
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_8200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn22();
      expect(list.toString()).assertEqual('5,0,1,2,3,4,5');
    });

    /**
     * @tc.name   testLoop4_083
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_8300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn23();
      expect(list.toString()).assertEqual('start,y,x,traversal:,y');

    });

    /**
     * @tc.name   testLoop4_085
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_8500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn24();
      expect(list.toString()).assertEqual('brand,Toyota,year,2023');
    });

    /**
     * @tc.name   testLoop4_086
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_8600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn25();
      expect(list.toString()).assertEqual('public,value,Symbol:,secret,secretValue');

    });

    /**
     * @tc.name   testLoop4_087
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_8700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn26();
      expect(list.toString()).assertEqual('a,b,traversal,d,a,b,d');
    });

    /**
     * @tc.name   testLoop4_088
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_8800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn27();
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop4_089
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_8900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn28();
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop4_090
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_9000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn29();
      expect(list.toString()).assertEqual('a,1,b,2,end:,');
    });

    /**
     * @tc.name   testLoop4_091
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_9100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn30();
      expect(list.toString()).assertEqual('id,1,name,Alice,age,30');
    });

    /**
     * @tc.name   testLoop4_092
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_9200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const duplicateNums = [1, 2, 2, 3, 3, 3];
      const uniqueSet = new Set(duplicateNums);
      list.push('Start');
      for (let num of uniqueSet) {
        list.push(num);
      }
      expect(list.toString()).assertEqual('Start,1,2,3');
    });

    /**
     * @tc.name   testLoop4_093
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_9300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const str = 'Hello 世界';
      list.push('start');
      for (let char of str) {
        list.push(char);
      }
      expect(list.toString()).assertEqual('start,H,e,l,l,o, ,世,界');
    });

    /**
     * @tc.name   testLoop4_094
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_9400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn31();
      expect(list.toString()).assertEqual('2,4,6,8');
    });

    /**
     * @tc.name   testLoop4_095
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_9500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const typedArr = new Uint8Array([10, 20, 30, 40]);
      for (let val of typedArr) {
        list.push(val);
      }
      list.push(typedArr.constructor.name);
      expect(list.toString()).assertEqual('10,20,30,40,Uint8Array');
    });

    /**
     * @tc.name   testLoop4_098
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_9800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const fruits = ['apple', 'banana', 'cherry', 'date'];
      const target = 'cherry';

      for (let fruit of fruits) {
        list.push(fruit);
        if (fruit === target) {
          list.push("inner" + fruit);
          break;
        }
      }
      expect(list.toString()).assertEqual('apple,banana,cherry,innercherry');
    });

    /**
     * @tc.name   testLoop4_099
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_9900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const scores = [65, 85, 70, 90, 55];
      const passingScore = 70;
      for (let score of scores) {
        if (score < passingScore) {
          list.push(score);
          continue;
        }
        list.push(`inner: ${score}`);
      }
      expect(list.toString()).assertEqual('65,inner: 85,inner: 70,inner: 90,55');
    });

    /**
     * @tc.name   testLoop4_100
     * @tc.number SUB_COMMONLIBRARY_LOOPER4_10000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop4_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper4Fn32();
      expect(list.toString()).assertEqual('0,red,1,green,2,blue,3,yellow');
    });

  })
}

function getStartIndex() {
  return Math.floor(Math.random() * 3);
}


function canWithdraw(balance: number, withdrawAmount: number) {
  return balance >= withdrawAmount;
}

function shouldSkip(item: string) {
  return item.length < 3;
}