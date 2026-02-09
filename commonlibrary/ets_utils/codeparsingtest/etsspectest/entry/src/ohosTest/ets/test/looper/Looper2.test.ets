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
  data,
  events,
  getLooper2Fn1,
  getLooper2Fn10,
  getLooper2Fn11,
  getLooper2Fn12,
  getLooper2Fn13,
  getLooper2Fn14,
  getLooper2Fn16,
  getLooper2Fn17,
  getLooper2Fn18,
  getLooper2Fn19,
  getLooper2Fn2,
  getLooper2Fn20,
  getLooper2Fn21,
  getLooper2Fn22,
  getLooper2Fn23,
  getLooper2Fn24,
  getLooper2Fn25,
  getLooper2Fn26,
  getLooper2Fn27,
  getLooper2Fn28,
  getLooper2Fn3,
  getLooper2Fn4,
  getLooper2Fn5,
  getLooper2Fn6,
  getLooper2Fn7,
  getLooper2Fn8,
  getLooper2Fn9
} from './looper2';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function looper2Test() {
  describe('looper2Test', () => {
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
     * @tc.name   testForLoopWithDestructuring
     * @tc.number SUB_COMMONLIBRARY_LOOPER_10200
     * @tc.desc   Test that traditional for loop uses array destructuring to access elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForLoopWithDestructuring', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let result = getLooper2Fn1();
      expect(result.toString()).assertEqual('1-a,2-b,3-c');
    });

    /**
     * @tc.name   testCustomIterableInfinitePrevent
     * @tc.number SUB_COMMONLIBRARY_LOOPER_10300
     * @tc.desc   Test that custom iterable stops iteration to prevent infinite loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCustomIterableInfinitePrevent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let values = getLooper2Fn2();
      expect(values.toString()).assertEqual('0,1,2,3,4');
    });

    /**
     * @tc.name   testReduceCalculateMedian
     * @tc.number SUB_COMMONLIBRARY_LOOPER_10400
     * @tc.desc   Test that Array.reduce calculates median of number array (even/odd length)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReduceCalculateMedian', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const calcMedian = (nums: number[]) => {
        const sorted = nums.sort((a, b) => a - b);
        const len = sorted.length;
        return len % 2 === 1
          ? sorted[Math.floor(len / 2)]
          : sorted.reduce((acc, val, idx) => idx === len / 2 - 1 || idx === len / 2 ? acc + val : acc, 0) / 2;
      };
      expect(calcMedian([1, 3, 5])).assertEqual(3);
      expect(calcMedian([1, 2, 3, 4])).assertEqual(2.5);
    });

    /**
     * @tc.name   testForInObjectWithSymbolProps
     * @tc.number SUB_COMMONLIBRARY_LOOPER_10500
     * @tc.desc   Test that for...in loop ignores Symbol properties even if enumerable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForInObjectWithSymbolProps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let keys = getLooper2Fn3();
      expect(keys.toString()).assertEqual('str');
    });

    /**
     * @tc.name   testMapWithOptionalChaining
     * @tc.number SUB_COMMONLIBRARY_LOOPER_10700
     * @tc.desc   Test that Array.map uses optional chaining to access nested properties safely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapWithOptionalChaining', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const names = data.map(item => item.user?.name ?? 'Unknown');
      expect(names.toString()).assertEqual('Alice,Unknown,Unknown');
    });

    /**
     * @tc.name   testForOfMapEntriesDestructure
     * @tc.number SUB_COMMONLIBRARY_LOOPER_10800
     * @tc.desc   Test that for...of loop destructures [key, value] pairs from Map.entries()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForOfMapEntriesDestructure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let entries = getLooper2Fn4();
      expect(entries.toString()).assertEqual('id:100,name:Test,active:true');
    });


    /**
     * @tc.name   testDoWhileLoopWithBatchProcessing
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11000
     * @tc.desc   Test that do...while loop processes data in batches until all are handled
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('testDoWhileLoopWithBatchProcessing', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const data = [1, 2, 3, 4, 5, 6, 7];
      const batchSize = 3;
      let offset = 0;
      const processed: number[] = [];
      do {
        const batch = data.slice(offset, offset + batchSize);
        processed.push(...batch);
        offset += batchSize;
      } while (offset < data.length);
      expect(processed.toString()).assertEqual('1,2,3,4,5,6,7');
      expect(processed.length).assertEqual(7);
    });

    /**
     * @tc.name   testFindWithDateComparison
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11100
     * @tc.desc   Test that Array.find locates object with date matching condition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFindWithDateComparison', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const targetDate = new Date('2024-02-01');
      const found = events.find(evt => evt.date.getTime() === targetDate.getTime());
      expect(found).assertEqual(events[1]);
    });

    /**
     * @tc.name   testForLoopWithSpreadOperator
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11200
     * @tc.desc   Test that traditional for loop uses spread operator to expand array elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForLoopWithSpreadOperator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const nested = [[1, 2], [3, 4], [5, 6]];
      const flattened: number[] = [];
      for (let i = 0; i < nested.length; i++) {
        flattened.push(...nested[i]);
      }
      expect(flattened.toString()).assertEqual('1,2,3,4,5,6');
    });

    /**
     * @tc.name   testIterableWithReturnCleanup
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11300
     * @tc.desc   Test that iterable's return method performs resource cleanup on loop break
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIterableWithReturnCleanup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      let isCleaned = getLooper2Fn5();
      expect(isCleaned).assertEqual(true);
    });

    /**
     * @tc.name   testReduceGroupByDateMonth
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11400
     * @tc.desc   Test that Array.reduce groups objects by month of date property
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('testReduceGroupByDateMonth', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      let grouped = getLooper2Fn6();
      expect(JSON.stringify(grouped)).assertEqual('{"1":[1,3],"2":[2]}');
    });

    /**
     * @tc.name   testForInArrayLikeWithLength
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11500
     * @tc.desc   Test that for...in loop iterates array-like object with length property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForInArrayLikeWithLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let values: Array<Array<number>> = getLooper2Fn7();
      expect(values.toString()).assertEqual('x,y,z,3');
    });

    /**
     * @tc.name   testWhileLoopWithDynamicBatchSize
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11600
     * @tc.desc   Test that while loop adjusts batch size dynamically during iteration
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('testWhileLoopWithDynamicBatchSize', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, () => {
      const data = [1, 2, 3, 4, 5, 6, 7, 8, 9];
      let offset = 0;
      let batchSize = 3;
      const processed: number[][] = [];
      while (offset < data.length) {
        const batch = data.slice(offset, offset + batchSize);
        processed.push(batch);
        offset += batchSize;
        if (offset > 5) {
          batchSize = 2;
        }
      }
      expect(processed.toString()).assertEqual('1,2,3,4,5,6,7,8,9');
    });

    /**
     * @tc.name   testMapWithBigInt
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11700
     * @tc.desc   Test that Array.map processes BigInt values correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMapWithBigInt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bigNums = [100n, 200n, 300n];
      const doubled = bigNums.map(num => num * 2n);
      expect(doubled.toString()).assertEqual('200,400,600');
      expect(typeof doubled[0]).assertEqual('bigint');
    });

    /**
     * @tc.name   testForOfStringUnicodeNormalization
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11800
     * @tc.desc   Test that for...of loop handles Unicode normalized strings correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testForOfStringUnicodeNormalization', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const strNFC = 'éclair';
      const strNFD = strNFC.normalize('NFD');
      const charsNFC: string[] = [];
      const charsNFD: string[] = [];

      for (const c of strNFC) {
        charsNFC.push(c);
      }
      for (const c of strNFD) {
        charsNFD.push(c);
      }
      expect(charsNFC.length).assertEqual(6);
      expect(charsNFD.length).assertEqual(7);
    });

    /**
     * @tc.name   testFilterWithRegExpFlags
     * @tc.number SUB_COMMONLIBRARY_LOOPER_11900
     * @tc.desc   Test that Array.filter uses regex with flags (case-insensitive) to match elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFilterWithRegExpFlags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const words = ['Apple', 'banana', 'Apricot', 'orange', 'Pineapple'];
      const reg = /^ap/i;
      const matched = words.filter(word => reg.test(word));
      expect(matched.toString()).assertEqual('Apple,Apricot');
    });
    /**
     * @tc.name   testLoop2_001
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_0100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; i++) {
        list.push(i);
      }
      expect(list.toString()).assertEqual("0,1,2")
    })

    /**
     * @tc.name   testLoop2_002
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_0200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      for (; i < 3; i++) {
        list.push(i);
      }
      expect(list.toString()).assertEqual("0,1,2")
    })

    /**
     * @tc.name   testLoop2_003
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_0300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0;; i++) {
        if (i >= 3) {
          break;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual("0,1,2")
    });

    /**
     * @tc.name   testLoop2_004
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_0400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; ) {
        list.push(i);
        i++;
      }
      expect(list.toString()).assertEqual("0,1,2")
    });

    /**
     * @tc.name   testLoop2_005
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_0500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0, j = 5; i < 3; i++, j--) {
        list.push(i);
        list.push(j);
      }
      expect(list.toString()).assertEqual("0,5,1,4,2,3")
    });

    /**
     * @tc.name   testLoop2_006
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_0600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 3; i > 0; i--) {
        list.push(i);
      }
      expect(list.toString()).assertEqual("3,2,1")
    });

    /**
     * @tc.name   testLoop2_007
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_0700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 10; i += 2) {
        list.push(i);
      }
      expect(list.toString()).assertEqual("0,2,4,6,8")
    });

    /**
     * @tc.name   testLoop2_008
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_0800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; i++) {
        setTimeout(() => list.push(i), 0);
      }
      await sleep(100);
      expect(list.toString()).assertEqual("0,1,2");
    });

    /**
     * @tc.name   testLoop2_009
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_0900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; i++) {
        setTimeout(() => list.push(i), 0);
      }
      await sleep(100);
      expect(list.toString()).assertEqual("0,1,2")
    });

    /**
     * @tc.name   testLoop2_010
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; i++) {
        const double = i * 2;
        list.push(i);
        list.push(double);
      }
      await sleep(100);
      expect(list.toString()).assertEqual("0,0,1,2,2,4");
    });

    /**
     * @tc.name   testLoop2_011
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [1, 2, 3, 4];
      for (let i = 0; i < arr.length && arr[i] < 4; i++) {
        list.push(arr[i]);
      }
      expect(list.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.name   testLoop2_012
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; i++) {
        list.push(i);
      }
      expect(list.toString()).assertEqual("0,1,2");
    });

    /**
     * @tc.name   testLoop2_013
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count = 0;
      for (; count < 5; count++) {
        ;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.name   testLoop2_014
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      for (let i = 0; i < 2; i++) {
        for (let j = 0; j < 2; j++) {
          list.push(`(${i},${j})`)
        }
      }
      expect(list.toString()).assertEqual("(0,0),(0,1),(1,0),(1,1)");
    });

    /**
     * @tc.name   testLoop2_015
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 5; i++) {
        if (i === 3) {
          break;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual("0,1,2");
    });

    /**
     * @tc.name   testLoop2_016
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 5; i++) {
        if (i === 3) {
          continue;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual("0,1,2,4");
    });

    /**
     * @tc.name   testLoop2_017
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = getStart(); i < 4; i++) {
        list.push(i);
      }
      expect(list.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.name   testLoop2_018
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 1; i < 10; i++) {
        if (!isLessThan4(i)) {
          break;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.name   testLoop2_019
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_1900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      i = 0;
      let list = new Array<number>();
      for (; i < 3; increment()) {
        list.push(i);
      }
      expect(list.toString()).assertEqual("0,1,2");
    });

    /**
     * @tc.name   testLoop2_020
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [10, 20, 30];
      for (let i = 0; i < arr.length; i++) {
        list.push(arr[i]);
      }
      expect(list.toString()).assertEqual("10,20,30");
    });

    /**
     * @tc.name   testLoop2_021
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      do {
        list.push(i);
        i++;
      } while (i < 3);
      expect(list.toString()).assertEqual("0,1,2");
    });

    /**
     * @tc.name   testLoop2_022
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 3;
      do {
        list.push(i);
        i++;
      } while (i < 3);
      expect(list.toString()).assertEqual("3");
    });

    /**
     * @tc.name   testLoop2_023
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      let i = 0;
      do {
        const square = i * i;
        list.push(`i=${i}, square=${square}`);
        i++;
      } while (i < 4);
      expect(list.toString()).assertEqual('i=0, square=0,i=1, square=1,i=2, square=4,i=3, square=9');
    });

    /**
     * @tc.name   testLoop2_024
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      do {
        if (i === 2) {
          break;
        }
        list.push(i);
        i++;
      } while (i < 5);
      expect(list.toString()).assertEqual('0,1');
    });

    /**
     * @tc.name   testLoop2_025
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.name   testLoop2_026
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0, j = 5;
      do {
        list.push(i);
        list.push(j);
        i++;
        j--;
      } while (i < 3 && j > 2);
      expect(list.toString()).assertEqual('0,5,1,4,2,3');
    });

    /**
     * @tc.name   testLoop2_027
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let count = 0;
      let flag = true;
      do {
        count++;
        if (count === 3) {
          flag = false;
        }
      } while (flag);
      list.push(count);
      expect(list.toString()).assertEqual('3');
    });

    /**
     * @tc.name   testLoop2_028
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
     * @tc.name   testLoop2_029
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_2900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [1, 2, 3];
      let i = arr.length - 1;
      do {
        list.push(arr[i]);
        i--;
      } while (i >= 0);
      expect(list.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.name   testLoop2_030
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let num = 1;
      do {
        num *= 2;
        list.push(num);
      } while (num < 10);
      expect(list.toString()).assertEqual('2,4,8,16');
    });

    /**
     * @tc.name   testLoop2_031
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (i < 3) {
        list.push(i);
        i++;
      }
      expect(list.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.name   testLoop2_032
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 3;
      while (i < 3) {
        list.push(i);
        i++;
      }
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop2_033
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      let i = 0;
      while (i < 4) {
        const triple = i * 3;
        list.push(`i=${i}, triple=${triple}`);
        i++;
      }
      expect(list.toString()).assertEqual('i=0, triple=0,i=1, triple=3,i=2, triple=6,i=3, triple=9');
    });

    /**
     * @tc.name   testLoop2_034
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (i < 5) {
        if (i === 2) {
          break;
        }
        list.push(i);
        i++;
      }
      expect(list.toString()).assertEqual('0,1');
    });

    /**
     * @tc.name   testLoop2_035
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (i < 5) {
        i++;
        if (i === 2) {
          continue;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual('1,3,4,5');
    });

    /**
     * @tc.name   testLoop2_036
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      let times = 0;
      while (hasNext() && times < 5) {
        list.push(`Execute ${times}`);
        times++;
      }
      expect(typeof times).assertEqual("number");
    });

    /**
     * @tc.name   testLoop2_037
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (true) {
        if (i >= 3) {
          break;
        }
        list.push(i);
        i++;
      }
      expect(list.toString()).assertEqual("0,1,2");
    });

    /**
     * @tc.name   testLoop2_038
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (i < 2) {
        let j = 0;
        while (j < 2) {
          list.push(i);
          list.push(j);
          j++;
        }
        i++;
      }
      expect(list.toString()).assertEqual("0,0,0,1,1,0,1,1");
    });

    /**
     * @tc.name   testLoop2_039
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_3900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper2Fn8();
      expect(list.toString()).assertEqual("1,2,3");
    });

    /**
     * @tc.name   testLoop2_040
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_4000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let sum = 0;
      let num = 1;
      while (sum < 10) {
        sum += num;
        num++;
        list.push(sum);
      }
      expect(list.toString()).assertEqual("1,3,6,10");
    });
    /**
     * @tc.name   testLoop2_041
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_4100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outerLoop: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (i === 1 && j === 1) {
            break outerLoop;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual("0,0,0,1,0,2,1,0");
    });

    /**
     * @tc.name   testLoop2_044
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_4400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outerLoop: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (i === 1 && j === 1) {
            continue outerLoop;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual("0,0,0,1,0,2,1,0,2,0,2,1,2,2");
    });

    /**
     * @tc.name   testLoop2_046
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_4600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outer: for (let i = 0; i < 2; i++) {
        middle: for (let j = 0; j < 2; j++) {
          inner: for (let k = 0; k < 2; k++) {
            if (i === 0 && j === 1 && k === 0) {
              break middle;
            }
            list.push(i);
            list.push(j);
            list.push(k);
          }
        }
      }
      expect(list.toString()).assertEqual("0,0,0,0,0,1,1,0,0,1,0,1,1,1,0,1,1,1");
    });

    /**
     * @tc.name   testLoop2_047
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_4700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      codeBlock: {
        list.push("Start");
        if (true) {
          break codeBlock;
        }
        list.push("End");
      }
      expect(list.toString()).assertEqual("Start");
    });

    /**
     * @tc.name   testLoop2_051
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_5100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 5; i++) {
        if (i === 2) {
          break;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual("0,1");
    });

    /**
     * @tc.name   testLoop2_052
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_5200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (i < 5) {
        if (i === 2) {
          break;
        }
        list.push(i);
        i++;
      }
      expect(list.toString()).assertEqual("0,1");
    });

    /**
     * @tc.name   testLoop2_053
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_5300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      do {
        if (i === 2) {
          break;
        }
        list.push(i);
        i++;
      } while (i < 5);
      expect(list.toString()).assertEqual("0,1");
    });

    /**
     * @tc.name   testLoop2_054
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_5400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      for (let i = 0; i < 3; i++) {
        switch (i) {
          case 1:
            list.push("Case 1");
            break;
          default:
            list.push("Default");
        }
      }
      expect(list.toString()).assertEqual("Default,Case 1,Default");
    });

    /**
     * @tc.name   testLoop2_055
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_5500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outer: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (j === 1) {
            break outer;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual("0,0");
    });

    /**
     * @tc.name   testLoop2_057
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_5700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (j === 1) {
            break;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual("0,0,1,0,2,0");
    });

    /**
     * @tc.name   testLoop2_058
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_5800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string> = getLooper2Fn9();
      expect(list.toString()).assertEqual('x');
    });

    /**
     * @tc.name   testLoop2_059
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_5900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [10, 20, 30, 40];
      for (let val of arr) {
        if (val === 30) {
          break;
        }
        list.push(val);
      }
      expect(list.toString()).assertEqual('10,20');
    });

    /**
     * @tc.name   testLoop2_061
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_6100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 5; i++) {
        if (i === 2) {
          continue;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual('0,1,3,4');
    });

    /**
     * @tc.name   testLoop2_062
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_6200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      while (i < 5) {
        i++;
        if (i === 2) {
          continue;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual('1,3,4,5');
    });

    /**
     * @tc.name   testLoop2_063
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_6300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      let i = 0;
      do {
        i++;
        if (i === 2) {
          continue;
        }
        list.push(i);
      } while (i < 5);
      expect(list.toString()).assertEqual('1,3,4,5');
    });

    /**
     * @tc.name   testLoop2_064
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_6400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      outer: for (let i = 0; i < 3; i++) {
        for (let j = 0; j < 3; j++) {
          if (j === 1) {
            j++;
            continue outer;
          }
          list.push(i);
          list.push(j);
        }
      }
      expect(list.toString()).assertEqual('0,0,1,0,2,0');
    });

    /**
     * @tc.name   testLoop2_066
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_6600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 5; i++) {
        if (i === 2) {
          continue;
        }
        list.push(i);
      }
      expect(list.toString()).assertEqual('0,1,3,4');
    });

    /**
     * @tc.name   testLoop2_067
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_6700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn10();
      expect(list.toString()).assertEqual('a,1,c,3,d,4');
    });

    /**
     * @tc.name   testLoop2_068
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_6800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [1, 2, 3, 4, 5];
      for (let val of arr) {
        if (val % 2 === 0) {
          continue;
        }
        list.push(val);
      }
      expect(list.toString()).assertEqual('1,3,5');
    });

    /**
     * @tc.name   testLoop2_069
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_6900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      for (let i = 0; i < 5; ) {
        if (i === 2) {
          i++;
          continue;
        }
        list.push(i);
        i++;
      }
      expect(list.toString()).assertEqual('0,1,3,4');
    });


    /**
     * @tc.name   testLoop2_071
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_7100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn11();
      expect(list.toString()).assertEqual('name,Alice,age,30');
    });

    /**
     * @tc.name   testLoop2_072
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_7200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn12();
      expect(list.toString()).assertEqual('y,x');
    });

    /**
     * @tc.name   testLoop2_073
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_7300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn13();
      expect(list.toString()).assertEqual('y');
    });

    /**
     * @tc.name   testLoop2_074
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_7400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn14();
      expect(list.toString()).assertEqual('0,1,2,foo');
    });

    /**
     * @tc.name   testLoop2_075
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_7500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string | number>();
      const arr = [10, 20];
      for (let idx of arr) {
        list.push(typeof idx);
      }
      expect(list.toString()).assertEqual('number,number');
    });

    /**
     * @tc.name   testLoop2_077
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_7700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn16();
      expect(list.toString()).assertEqual('a');
    });

    /**
     * @tc.name   testLoop2_078
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_7800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string | number>();
      const arr = [3, 1, 2];
      arr[5] = 5;
      for (let idx of arr) {
        list.push(idx);
        list.push(arr[idx]);
      }
      let res: Array<string | number> = getLooper2Fn17();
      expect(res.toString()).assertEqual('0 -> 3,1 -> 1,2 -> 2,5 -> 5');
      expect(list.toString()).assertEqual('3,,1,1,2,2,,,,,5,5');
    });

    /**
     * @tc.name   testLoop2_079
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_7900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn18();
      expect(list.toString()).assertEqual('a');
    });

    /**
     * @tc.name   testLoop2_080
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_8000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn19();
      expect(list.toString()).assertEqual('a,c,d');
    });

    /**
     * @tc.name   testLoop2_081
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_8100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn20();
      expect(list.toString()).assertEqual('');
    });

    /**
     * @tc.name   testLoop2_082
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_8200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn21();
      expect(list.toString()).assertEqual('0->h,1->e,2->l,3->l,4->o');
    });

    /**
     * @tc.name   testLoop2_085
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_8500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn23();
      expect(list.toString()).assertEqual('for...in:,a,b,Object.keys:,a,b');
    });

    /**
     * @tc.name   testLoop2_086
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_8600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [1, 2, 3];
      for (let val of arr) {
        list.push(val);
      }
      expect(list.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testLoop2_087
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_8700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number | Array<number>>();
      const arr = [1, 2, 3];
      for (let val of arr) {
        val = val * 2;
        list.push(val);
      }
      list.push(arr);
      expect(list.toString()).assertEqual('2,4,6,1,2,3');
    });

    /**
     * @tc.name   testLoop2_088
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_8800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [10, 20, 30];
      for (const val of arr) {
        list.push(val);
      }
      expect(list.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.name   testLoop2_089
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_8900
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<string | number> = getLooper2Fn24();
      expect(list.toString()).assertEqual('a,1,b,2');
    });

    /**
     * @tc.name   testLoop2_090
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_9000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const set = new Set([1, 2, 2, 3]);
      for (let val of set) {
        list.push(val);
      }
      expect(list.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testLoop2_091
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_9100
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<string>();
      const str = 'world';
      for (let char of str) {
        list.push(char);
      }
      expect(list.toString()).assertEqual('w,o,r,l,d');
    });

    /**
     * @tc.name   testLoop2_092
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_9200
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a = getSum([1, 2, 3]);
      expect(a).assertEqual(6);
    });

    /**
     * @tc.name   testLoop2_093
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_9300
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [1, 2, 3, 4];
      for (let val of arr) {
        if (val === 3) {
          break;
        }
        list.push(val);
      }
      expect(list.toString()).assertEqual('1,2');
    });

    /**
     * @tc.name   testLoop2_094
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_9400
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const arr = [1, 2, 3, 4, 5];
      for (let val of arr) {
        if (val % 2 === 0) {
          continue;
        }
        list.push(val);
      }
      expect(list.toString()).assertEqual('1,3,5');
    });

    /**
     * @tc.name   testLoop2_095
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_9500
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper2Fn25();
      expect(list.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testLoop2_096
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_9600
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number> = getLooper2Fn26();
      expect(list.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.name   testLoop2_097
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_9700
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array<number | string> = getLooper2Fn27();
      expect(list.toString()).assertEqual('for...of:,1,2,3,for...in:,0,1,2,foo');
    });

    /**
     * @tc.name   testLoop2_098
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_9800
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list = new Array<number>();
      const typedArr = new Uint8Array([10, 20, 30]);
      for (let val of typedArr) {
        list.push(val);
      }
      expect(list.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.name   testLoop2_100
     * @tc.number SUB_COMMONLIBRARY_LOOPER2_10000
     * @tc.desc   Test looper
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testLoop2_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: Array< string> =getLooper2Fn28();
      expect(list.toString()).assertEqual('0->a,1->b,2->c');
    });


  })
}

function getStart() {
  return 1;
}

function isLessThan4(num: number) {
  return num < 4;
}

let i = 0;

function increment() {
  i++;
}

function hasNext() {
  return Math.random() > 0.5;
}

function getSum(nums: number[]) {
  let total = 0;
  for (let num of nums) {
    total += num;
  }
  return total;
}