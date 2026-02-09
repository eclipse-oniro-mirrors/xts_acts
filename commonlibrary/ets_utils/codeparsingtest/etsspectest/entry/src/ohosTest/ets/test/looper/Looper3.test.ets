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
  getLooper3Fn1,
  getLooper3Fn10,
  getLooper3Fn11,
  getLooper3Fn12,
  getLooper3Fn13,
  getLooper3Fn14,
  getLooper3Fn15,
  getLooper3Fn16,
  getLooper3Fn17,
  getLooper3Fn18,
  getLooper3Fn19,
  getLooper3Fn2,
  getLooper3Fn20,
  getLooper3Fn21,
  getLooper3Fn22,
  getLooper3Fn23,
  getLooper3Fn24,
  getLooper3Fn25,
  getLooper3Fn26,
  getLooper3Fn27,
  getLooper3Fn28,
  getLooper3Fn29,
  getLooper3Fn3,
  getLooper3Fn30,
  getLooper3Fn31,
  getLooper3Fn32,
  getLooper3Fn33,
  getLooper3Fn34,
  getLooper3Fn4,
  getLooper3Fn5,
  getLooper3Fn6,
  getLooper3Fn7,
  getLooper3Fn8,
  getLooper3Fn9
} from './looper3';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function looper3Test() {
  describe('looper3Test', () => {
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
     * @tc.name   testLoop3_001
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_0100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 5; i > 2; i--) {
        list.push(i);
      }
      expect(list.toString()).assertEqual('5,4,3');
    });

    /**
     * @tc.name   testLoop3_002
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_0200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 1; i < 10; i *= 2) {
        list.push(i);
      }
      expect(list.toString()).assertEqual('1,2,4,8');
    });

    /**
     * @tc.name   testLoop3_003
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_0300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn1();
      expect(list.toString()).assertEqual('2,3,4');
    });


    /**
     * @tc.name   testLoop3_005
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_0500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; i++) {
        list.push(i);
      }
      expect(list.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testLoop3_006
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_0600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0, j = 0; i < 3; i++, j += 2) {
        list.push(i);
        list.push(j);
      }
      expect(list.toString()).assertEqual('0,0,1,2,2,4');
    });

    /**
     * @tc.name   testLoop3_007
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_0700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number[]>();
      const nums = [1, 2, 3];
      for (let i = 0; i < nums.length; i++) {
        nums[i] *= 3;
      }
      list.push(nums);
      expect(list.toString()).assertEqual('3,6,9');
    });

    /**
     * @tc.name   testLoop3_008
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_0800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let isRunning = true;
      let count = 0;
      for (; isRunning; count++) {
        if (count === 3) {
          isRunning = false;
        }
        list.push(count);
      }
      expect(list.toString()).assertEqual('0,1,2,3');
    });

    /**
     * @tc.name   testLoop3_009
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_0900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; Number.isNaN(i); i++) {
        list.push(i);
      }
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop3_010
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      for (; i < Infinity; i++) {
        if (i === 2) {
          break;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual('0,1');
    });

    /**
     * @tc.name   testLoop3_011
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 4; i += 2) {
        for (let j = 1; j < 5; j += 2) {
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual('0,1,0,3,2,1,2,3');
    });

    /**
     * @tc.name   testLoop3_012
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [10, 20, 30, 40];
      for (let i = 0; i < arr.length; i++) {
        if (i % 2 === 0) {
          continue;
        }
        list.push(arr[i]);
      }
      expect(list.toString()).assertEqual('20,40');
    });

    /**
     * @tc.name   testLoop3_013
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const values = [1, 2, 0, 3, 4];
      for (let i = 0; i < values.length; i++) {
        if (!values[i]) {
          break;
        }
        list.push(values[i]);
      }
      expect(list.toString()).assertEqual('1,2');
    });

    /**
     * @tc.name   testLoop3_014
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn2();
      expect(list.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testLoop3_015
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn3();
      expect(list.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testLoop3_016
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 5; i++) {
        if (i === 2) {
          i = 0;
        }
        list.push(i);
        if (i === 1) {
          break;
        }
      }
      expect(list.toString()).assertEqual('0,1');
    });

    /**
     * @tc.name   testLoop3_017
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn4();
      expect(list.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.name   testLoop3_018
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number | string> = getLooper3Fn5();
      expect(list.toString()).assertEqual('null,1,2');
    });

    /**
     * @tc.name   testLoop3_019
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_1900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      for (; i !== undefined; i++) {
        if (i === 2) {
          break;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual('0,1');
    });

    /**
     * @tc.name   testLoop3_020
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const nums = [1, 2, 3, 4];
      let sum = 0;
      for (let i = 0; i < nums.length; i++) {
        sum += nums[i];
      }
      list.push(sum);
      expect(list.toString()).assertEqual('10');
    });
    /**
     * @tc.name   testLoop3_021
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      let str = 'a';
      do {
        list.push(str);
        str += 'a';
      } while (str.length < 4);
      expect(list.toString()).assertEqual('a,aa,aaa');
    });

    /**
     * @tc.name   testLoop3_022
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn6();
      expect(list.toString()).assertEqual('10,20,30,40');
    });

    /**
     * @tc.name   testLoop3_023
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn7();
      expect(list.toString()).assertEqual('2,1');
    });

    /**
     * @tc.name   testLoop3_024
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      do {
        let j = 0;
        do {
          list.push(i);
          list.push(j);
          j++;
        } while (j < 2);
        i++;
      } while (i < 2);
      expect(list.toString()).assertEqual('0,0,0,1,1,0,1,1');
    });

    /**
     * @tc.name   testLoop3_025
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      do {
        i++;
        if (i === 2) {
          continue;
        }
        list.push(i);
      } while (i < 4);
      expect(list.toString()).assertEqual('1,3,4');
    });

    /**
     * @tc.name   testLoop3_026
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let flag = true;
      let count = 0;
      do {
        list.push(count);
        count++;
        if (count === 3) {
          flag = false;
        }
      } while (flag);
      expect(list.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testLoop3_027
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [10, 20, 30];
      let i = arr.length;
      do {
        i--;
        list.push(arr[i]);
      } while (i > 0);
      expect(list.toString()).assertEqual('30,20,10');
    });

    /**
     * @tc.name   testLoop3_028
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn8();
      expect(list.toString()).assertEqual('0');
    });

    /**
     * @tc.name   testLoop3_029
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_2900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let num = 5;
      let factorial = 1;
      do {
        factorial *= num;
        num--;
      } while (num > 0);
      list.push(factorial);
      expect(list.toString()).assertEqual('120');
    });

    /**
     * @tc.name   testLoop3_030
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn9();
      expect(list.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testLoop3_031
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const data = [5, 3, 8, 2];
      let index = 0;
      do {
        list.push(data[index]);
        index++;
      } while (index < data.length && data[index] < 6);
      expect(list.toString()).assertEqual('5,3');
    });

    /**
     * @tc.name   testLoop3_032
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn10();
      expect(list.toString()).assertEqual('1');
    });

    /**
     * @tc.name   testLoop3_033
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let i = 0;
      do {
        i++;
      } while (i < 3);
      expect(i).assertEqual(3);
    });

    /**
     * @tc.name   testLoop3_034
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn11();
      expect(list.toString()).assertEqual('null,null,valid');
    });

    /**
     * @tc.name   testLoop3_035
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn12();
      expect(list.toString()).assertEqual('0,2,4,6');
    });

    /**
     * @tc.name   testLoop3_036
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      let text = 'hello';
      while (text.length > 2) {
        list.push(text);
        text = text.slice(0, -1);
      }
      expect(list.toString()).assertEqual('hello,hell,hel');
    });

    /**
     * @tc.name   testLoop3_037
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string | undefined>();
      const colors = ['red', 'green', 'blue', 'yellow'];
      while (colors.length > 2) {
        list.push(colors.pop());
      }
      expect(list.toString()).assertEqual('yellow,blue');
    });

    /**
     * @tc.name   testLoop3_038
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn13();
      expect(list.toString()).assertEqual('2,4,8');
    });

    /**
     * @tc.name   testLoop3_039
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_3900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (i < 3) {
        let j = i;
        while (j < 3) {
          list.push(i);
          list.push(j)
          j++;
        }
        i++;
      }
      expect(list.toString()).assertEqual('0,0,0,1,0,2,1,1,1,2,2,2');
    });

    /**
     * @tc.name   testLoop3_040
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (i < 5) {
        i++;
        if (i % 2 === 0) {
          continue;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual('1,3,5');
    });

    /**
     * @tc.name   testLoop3_041
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn14();
      expect(list.toString()).assertEqual('Stock left: 5,Stock left: 4,Stock left: 3,Stock left: 2,Stock left: 1');
    });

    /**
     * @tc.name   testLoop3_042
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn15();
      expect(list.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.name   testLoop3_043
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (Number.isNaN(i)) {
        list.push(i);
        i++;
      }
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop3_044
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn16();
      expect(list.toString()).assertEqual('1,1,2,3,5,8');
    });

    /**
     * @tc.name   testLoop3_045
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let count = 0;
      while (true) {
        list.push(count);
        count++;
        if (count === 3) {
          break;
        }
      }
      expect(list.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testLoop3_046
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | undefined>();
      const queue = [1, 2, 3, 4];
      while (queue.length > 0) {
        const item = queue.shift();
        list.push(item);
      }
      expect(list.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.name   testLoop3_047
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let min = 1, max = 5;
      let current = min;
      while (current <= max) {
        list.push(current);
        if (current === 3) {
          max = 4;
        }
        current++;
      }
      expect(list.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.name   testLoop3_048
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let i = 0;
      while (i++ < 3) {
        ;
      }
      expect(i).assertEqual(4);
    });

    /**
     * @tc.name   testLoop3_049
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_4900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn17();
      expect(list.toString()).assertEqual('undefined,undefined,data');
    });

    /**
     * @tc.name   testLoop3_050
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_5000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = '';
      let charCode = 97;
      while (charCode < 100) {
        result += String.fromCharCode(charCode);
        charCode++;
      }
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.name   testLoop3_051
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_5100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outer: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (j === 2) {
            continue outer;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual('0,0,0,1,1,0,1,1,2,0,2,1');
    });

    /**
     * @tc.name   testLoop3_054
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_5400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      mainBlock: {
        for (let i = 0; i < 2; i++) {
          for (let j = 0; j < 2; j++) {
            if (i === 1 && j === 1) {
              break mainBlock;
            }
            list.push(i);
            list.push(j);
          }
        }
        list.push(50);
      }
      expect(list.toString()).assertEqual('0,0,0,1,1,0');
    });

    /**
     * @tc.name   testLoop3_059
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_5900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      level1: {
        level2: {
          for (let i = 0; i < 2; i++) {
            if (i === 1) {
              break level1;
            }
            list.push(i);
          }
        }
      }
      expect(list.toString()).assertEqual('0');
    });

    /**
     * @tc.name   testLoop3_060
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_6000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outerLoop: for (let i = 0; i < 3; i++) {
        switch (i) {
          case 1:
            let j = 0;
            while (j < 2) {
              if (j === 1) {
                break outerLoop;
              }
              list.push(i);
              list.push(j);
              j++;
            }
            break;
          default:
            list.push(i);
        }
      }
      expect(list.toString()).assertEqual('0,1,0');
    });
    /**
     * @tc.name   testLoop3_061
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_6100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (i === 2 && j === 2) {
            break;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual('0,0,0,1,0,2,1,0,1,1,1,2,2,0,2,1');
    });

    /**
     * @tc.name   testLoop3_062
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_6200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      let j = 5;
      while (i < 5 && j > 0) {
        if (i + j === 5) {
          break;
        }
        list.push(i);
        list.push(j);
        i++;
        j--;
      }
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop3_063
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_6300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper3Fn18();
      expect(list.toString()).assertEqual('1,2');
    });

    /**
     * @tc.name   testLoop3_065
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_6500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn19();
      expect(list.toString()).assertEqual('apples: 5');
    });

    /**
     * @tc.name   testLoop3_066
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_6600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; i++) {
        let j = 0;
        while (j < 3) {
          if (i === 1 && j === 1) {
            break;
          }
          list.push(i);
          list.push(j);
          j++;
        }
      }
      expect(list.toString()).assertEqual('0,0,0,1,0,2,1,0,2,0,2,1,2,2');
    });

    /**
     * @tc.name   testLoop3_067
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_6700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 10; i++) {
        if (i > 5) {
          i = 10;
          break;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual('0,1,2,3,4,5');
    });

    /**
     * @tc.name   testLoop3_068
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_6800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper3Fn20();
      expect(list.toString()).assertEqual('2,4,Not a number');
    });

    /**
     * @tc.name   testLoop3_069
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_6900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      processData: {
        const numbers = [1, 2, 3, 4];
        for (let num of numbers) {
          if (num === 3) {
            break processData;
          }
          list.push(num);
        }
        list.push(50);
      }
      expect(list.toString()).assertEqual('1,2');
    });

    /**
     * @tc.name   testLoop3_070
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [1, 2, 3, 4, 5];
      for (let i = 0; i < arr.length; i++) {
        if (arr[i] === 3) {
          arr.length = i;
          break;
        }
        list.push(arr[i]);
      }
      expect(list.toString()).assertEqual('1,2');
    });

    /**
     * @tc.name   testLoop3_071
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const nums = [1, 2, 3, 4, 5, 6];
      for (let i = 0; i < nums.length; i++) {
        if (nums[i] % 3 === 0) {
          continue;
        }
        list.push(nums[i]);
      }
      expect(list.toString()).assertEqual('1,2,4,5');
    });

    /**
     * @tc.name   testLoop3_072
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (i < 10) {
        i++;
        if (i % 2 === 0) {
          continue;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual('1,3,5,7,9');
    });

    /**
     * @tc.name   testLoop3_073
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      let words = ['apple', 'cat', 'banana', 'dog'];
      let index = 0;
      do {
        index++;
        if (words[index]?.length < 5) {
          continue;
        }
        list.push(words[index]);
      } while (index < words.length - 1);
      expect(list.toString()).assertEqual('banana');
    });

    /**
     * @tc.name   testLoop3_074
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn21();
      expect(list.toString()).assertEqual('debug: true,env: development,port: 3000');
    });

    /**
     * @tc.name   testLoop3_075
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const uniqueNums = new Set([1, 2, 3, 4, 5, 6]);
      for (let num of uniqueNums) {
        if (num > 4) {
          continue;
        }
        list.push(num);
      }
      expect(list.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.name   testLoop3_076
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 4; i++) {
        for (let j = 0; j < 4; j++) {
          if (j === i) {
            continue;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.length).assertEqual(24);
      expect(list.toString()).assertEqual('0,1,0,2,0,3,1,0,1,2,1,3,2,0,2,1,2,3,3,0,3,1,3,2');
    });

    /**
     * @tc.name   testLoop3_077
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn22();
      expect(list.toString()).assertEqual('0,1,2,5,6');
    });

    /**
     * @tc.name   testLoop3_078
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn23();
      expect(list.toString()).assertEqual('Laptop,Tablet');
    });

    /**
     * @tc.name   testLoop3_079
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_7900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn24();
      expect(list.toString()).assertEqual('1: banana,3: date');
    });

    /**
     * @tc.name   testLoop3_080
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_8000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | string>();
      const values = [2, 4, '6', 8, 'ten'];
      for (let val of values) {
        try {
          const num = Number(val);
          if (isNaN(num)) {
            throw new Error('Invalid number');
          }
          if (num % 4 !== 0) {
            continue;
          }
          list.push(num);
        } catch (e) {
          list.push(e.message);
          continue;
        }
      }
      expect(list.toString()).assertEqual('4,8,Invalid number');
    });

    /**
     * @tc.name   testLoop3_081
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_8100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn25();
      expect(list.toString()).assertEqual('0,1,2,3,4,5');
    });

    /**
     * @tc.name   testLoop3_082
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_8200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn26();
      expect(list.toString()).assertEqual('for...in:,a,b,c,getOwnPropertyNames:');
    });

    /**
     * @tc.name   testLoop3_083
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_8300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn27();
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop3_085
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_8500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn28();
      expect(list.toString()).assertEqual('name->Bob,age->25');
    });

    /**
     * @tc.name   testLoop3_086
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_8600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn29();
      expect(list.toString()).assertEqual('prop,customMethod');
    });

    /**
     * @tc.name   testLoop3_087
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_8700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn30();
      expect(list.toString()).assertEqual('a');
    });

    /**
     * @tc.name   testLoop3_088
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_8800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn31();
      expect(list.toString()).assertEqual('a->1,b->2');
    });

    /**
     * @tc.name   testLoop3_089
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_8900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn32();
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop3_090
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_9000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn33();
      expect(list.toString()).assertEqual('a,b');
    });

    /**
     * @tc.name   testLoop3_091
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_9100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      const arr = ['x', 'y', 'z'];
      for (let val of arr.values()) {
        list.push(val);
      }
      expect(list.toString()).assertEqual('x,y,z');
    });

    /**
     * @tc.name   testLoop3_092
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_9200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [10, 20, 30];
      for (let key of arr.keys()) {
        list.push(key);
      }
      expect(list.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testLoop3_093
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_9300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper3Fn34();
      expect(list.toString()).assertEqual('t,e,s,t');
    });

    /**
     * @tc.name   testLoop3_094
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_9400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      const map = new Map([['a', 1], ['b', 2]]);
      for (let key of map.keys()) {
        list.push(key);
      }
      expect(list.toString()).assertEqual('a,b');
    });

    /**
     * @tc.name   testLoop3_095
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_9500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const map = new Map([['a', 1], ['b', 2]]);
      for (let val of map.values()) {
        list.push(val);
      }
      expect(list.toString()).assertEqual('1,2');
    });

    /**
     * @tc.name   testLoop3_096
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_9600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const set = new Set([1, 2, 3]);
      for (let val of set.values()) {
        list.push(val);
      }
      expect(list.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testLoop3_097
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_9700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const nums = [1, 2, 3, 4, 5];
      const evens = nums.filter(num => num % 2 === 0);
      for (let num of evens) {
        list.push(num);
      }
      expect(list.toString()).assertEqual('2,4');
    });

    /**
     * @tc.name   testLoop3_099
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_9900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number|string>();
      const arr = [1, 2, 3, 4, 5];
      const iterator = arr[Symbol.iterator]();
      for (let val of iterator) {
        list.push(val);
        if (val === 2) break;
      }
      const next = iterator.next();
      list.push('Next after break:', next.value);
      expect(list.toString()).assertEqual('1,2,Next after break:,3');
    });

    /**
     * @tc.name   testLoop3_100
     * @tc.number SUB_COMMONLIBRARY_LOOPER3_10000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop3_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const floatArr = new Float32Array([1.1, 2.2, 3.3]);
      for (let val of floatArr) {
        list.push(val);
      }
      expect(list.toString()).assertEqual('1.100000023841858,2.200000047683716,3.299999952316284');
    });

  })
}