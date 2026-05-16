/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BuiltinsArrayEntriesTest(): void {
  describe('BuiltinsArrayEntriesTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(100);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name    builtinsArrayEntriesTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0100
     * @tc.desc    Verify entries() - basic functionality with number array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayEntriesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const iterator = arr.entries();

      const first = iterator.next();
      expect(first.done).assertEqual(false);
      const firstValue: [int, number] = first.value as [int, number];
      expect(firstValue[0]).assertEqual(0);
      expect(firstValue[1]).assertEqual(10);

      const second = iterator.next();
      expect(second.done).assertEqual(false);
      const secondValue: [int, number] = second.value as [int, number];
      expect(secondValue[0]).assertEqual(1);
      expect(secondValue[1]).assertEqual(20);

      const third = iterator.next();
      expect(third.done).assertEqual(false);
      const thirdValue: [int, number] = third.value as [int, number];
      expect(thirdValue[0]).assertEqual(2);
      expect(thirdValue[1]).assertEqual(30);

      const fourth = iterator.next();
      expect(fourth.done).assertEqual(false);
      const fourthValue: [int, number] = fourth.value as [int, number];
      expect(fourthValue[0]).assertEqual(3);
      expect(fourthValue[1]).assertEqual(40);

      const fifth = iterator.next();
      expect(fifth.done).assertEqual(false);
      const fifthValue: [int, number] = fifth.value as [int, number];
      expect(fifthValue[0]).assertEqual(4);
      expect(fifthValue[1]).assertEqual(50);

      const end = iterator.next();
      expect(end.done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0200
     * @tc.desc    Verify entries() - empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayEntriesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: string[] = [];
      const iterator = arr.entries();

      const result = iterator.next();
      expect(result.done).assertEqual(true);
      expect(result.value).assertEqual(undefined);
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0300
     * @tc.desc    Verify entries() - traverse iterator via while loop and next()
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEntriesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: string[] = Array.create<string>(3, '');
      arr[0] = 'hello';
      arr[1] = 'world';
      arr[2] = 'test';
      const iterator = arr.entries();
      let count = 0;
      let current = iterator.next();

      while (!current.done) {
        const entry: [int, string] = current.value as [int, string];
        expect(entry[0]).assertEqual(count);
        if (count === 0) {
          expect(entry[1]).assertEqual('hello');
        } else if (count === 1) {
          expect(entry[1]).assertEqual('world');
        } else if (count === 2) {
          expect(entry[1]).assertEqual('test');
        }
        count = count + 1;
        current = iterator.next();
      }

      expect(count).assertEqual(3);
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0400
     * @tc.desc    Verify entries() - boolean array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEntriesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: boolean[] = Array.create<boolean>(4, false);
      arr[0] = true;
      arr[1] = false;
      arr[2] = true;
      arr[3] = false;
      const iterator = arr.entries();

      const first = iterator.next();
      expect(first.done).assertEqual(false);
      const firstValue: [int, boolean] = first.value as [int, boolean];
      expect(firstValue[0]).assertEqual(0);
      expect(firstValue[1]).assertEqual(true);

      const second = iterator.next();
      expect(second.done).assertEqual(false);
      const secondValue: [int, boolean] = second.value as [int, boolean];
      expect(secondValue[0]).assertEqual(1);
      expect(secondValue[1]).assertEqual(false);

      const third = iterator.next();
      expect(third.done).assertEqual(false);
      const thirdValue: [int, boolean] = third.value as [int, boolean];
      expect(thirdValue[0]).assertEqual(2);
      expect(thirdValue[1]).assertEqual(true);

      const fourth = iterator.next();
      expect(fourth.done).assertEqual(false);
      const fourthValue: [int, boolean] = fourth.value as [int, boolean];
      expect(fourthValue[0]).assertEqual(3);
      expect(fourthValue[1]).assertEqual(false);

      const end = iterator.next();
      expect(end.done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0500
     * @tc.desc    Verify entries() - iterator's $_iterator method
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEntriesTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(3, 0);
      arr[0] = 5;
      arr[1] = 10;
      arr[2] = 15;
      const entriesIterator = arr.entries();

      const first = entriesIterator.next();
      expect(first.done).assertEqual(false);
      const firstValue: [int, number] = first.value as [int, number];
      expect(firstValue[0]).assertEqual(0);
      expect(firstValue[1]).assertEqual(5);

      const second = entriesIterator.next();
      expect(second.done).assertEqual(false);
      const secondValue: [int, number] = second.value as [int, number];
      expect(secondValue[0]).assertEqual(1);
      expect(secondValue[1]).assertEqual(10);

      const third = entriesIterator.next();
      expect(third.done).assertEqual(false);
      const thirdValue: [int, number] = third.value as [int, number];
      expect(thirdValue[0]).assertEqual(2);
      expect(thirdValue[1]).assertEqual(15);

      const end = entriesIterator.next();
      expect(end.done).assertEqual(true);
    });

    /**
     * @tc.name    builtinsArrayEntriesTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_ENTRIES_TEST_0600
     * @tc.desc    Verify entries() - multiple calls to next() beyond array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayEntriesTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2];
      const iterator = arr.entries();

      const first = iterator.next();
      expect(first.done).assertEqual(false);
      const firstValue: [int, number] = first.value as [int, number];
      expect(firstValue[0]).assertEqual(0);
      expect(firstValue[1]).assertEqual(1);

      const second = iterator.next();
      expect(second.done).assertEqual(false);
      const secondValue: [int, number] = second.value as [int, number];
      expect(secondValue[0]).assertEqual(1);
      expect(secondValue[1]).assertEqual(2);

      const third = iterator.next();
      expect(third.done).assertEqual(true);

      const fourth = iterator.next();
      expect(fourth.done).assertEqual(true);

      const fifth = iterator.next();
      expect(fifth.done).assertEqual(true);
    });
  });
}