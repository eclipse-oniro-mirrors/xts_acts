/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import Utils from './../Util.test';

interface GeneratedObjectLiteralInterface_3 {
  value: number;
}

class Person087 {
  public name: string;
  public age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

export default function ArrayShiftTest() {
  describe('ArrayShiftTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0001
     * @tc.name testArrayShift0001
     * @tc.desc Verify Array shift on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * * @tc.level Level 2
     */
    it('testArrayShift0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.shift();
      expect(arr.length).assertEqual(0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0002
     * @tc.name testArrayShift0002
     * @tc.desc Verify Array shift on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(42, (i) => 0);
      const result = arr.shift();
      expect(arr.length).assertEqual(41);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0003
     * @tc.name testArrayShift0003
     * @tc.desc Verify Array shift on string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('first', 'second', 'third');
      const result = arr.shift();
      expect(arr).assertDeepEquals(['second', 'third']);
      expect(result).assertEqual('first');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0004
     * @tc.name testArrayShift0004
     * @tc.desc Verify Array shift on boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.shift();
      expect(arr).assertDeepEquals([false, true]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0005
     * @tc.name testArrayShift0005
     * @tc.desc Verify Array shift on mixed type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(1, 'hello', true);
      const result = arr.shift();
      expect(arr).assertDeepEquals(['hello', true]);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0006
     * @tc.name testArrayShift0006
     * @tc.desc Verify Array shift on nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number[]>([1, 2], [3, 4], [5, 6]);
      const result = arr.shift();
      expect(arr.length).assertEqual(2);
      expect(result).assertDeepEquals([1, 2] as Array<number>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0007
     * @tc.name testArrayShift0007
     * @tc.desc Verify Array shift multiple times consecutively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result1 = arr.shift();
      const result2 = arr.shift();
      const result3 = arr.shift();
      expect(arr).assertDeepEquals([4, 5] as Array<number>);
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(2);
      expect(result3).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0008
     * @tc.name testArrayShift0008
     * @tc.desc Verify Array shift on large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result = arr.shift();
      expect(arr.length).assertEqual(9);
      expect(result).assertEqual(1);
      expect(arr[0]).assertEqual(2);
      expect(arr[8]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0009
     * @tc.name testArrayShift0009
     * @tc.desc Verify Array shift on array with null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(null, 1, undefined, 2);
      const result = arr.shift();
      expect(arr).assertDeepEquals([1, undefined, 2] as Array<number | null | undefined>);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_SHIFT_0010
     * @tc.name testArrayShift0010
     * @tc.desc Verify Array shift on BigInt array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big1 = BigInt(100);
      const big2 = BigInt(200);
      const arr = new Array<bigint>(big1, big2);
      const result = arr.shift();
      expect(arr.length).assertEqual(1);
      expect(result).assertEqual(big1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0001
     * @tc.name testArrayUnshift0001
     * @tc.desc Verify Array unshift on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.unshift(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0002
     * @tc.name testArrayUnshift0002
     * @tc.desc Verify Array unshift single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      const result = arr.unshift(1);
      expect(arr).assertDeepEquals([1, 2, 3] as Array<number>);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0003
     * @tc.name testArrayUnshift0003
     * @tc.desc Verify Array unshift multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5);
      const result = arr.unshift(1, 2, 3);
      expect(arr).assertDeepEquals([1, 2, 3, 4, 5] as Array<number>);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0004
     * @tc.name testArrayUnshift0004
     * @tc.desc Verify Array unshift on string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('c', 'd');
      const result = arr.unshift('a', 'b');
      expect(arr).assertDeepEquals(['a', 'b', 'c', 'd']);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0005
     * @tc.name testArrayUnshift0005
     * @tc.desc Verify Array unshift on boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true);
      const result = arr.unshift(false, false);
      expect(arr).assertDeepEquals([false, false, true]);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0006
     * @tc.name testArrayUnshift0006
     * @tc.desc Verify Array unshift on mixed type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(true, 2);
      const result = arr.unshift('start', 1);
      expect(arr).assertDeepEquals(['start', 1, true, 2] as Array<number | string | boolean>);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0007
     * @tc.name testArrayUnshift0007
     * @tc.desc Verify Array unshift multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.push(3);
      arr.unshift(2);
      arr.unshift(1);
      expect(arr).assertDeepEquals([1, 2, 3] as Array<number>);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0008
     * @tc.name testArrayUnshift0008
     * @tc.desc Verify Array unshift with null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(1, 2);
      const result = arr.unshift(null, undefined);
      expect(arr).assertDeepEquals([null, undefined, 1, 2] as Array<number | null | undefined>);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0009
     * @tc.name testArrayUnshift0009
     * @tc.desc Verify Array unshift on BigInt array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big1 = BigInt(100);
      const big2 = BigInt(200);
      const arr = new Array<bigint>(big2);
      const result = arr.unshift(big1);
      expect(arr.length).assertEqual(2);
      expect(result).assertEqual(2);
      expect(arr[0]).assertEqual(big1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_UNSHIFT_0010
     * @tc.name testArrayUnshift0010
     * @tc.desc Verify Array unshift on object array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayUnshift0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: GeneratedObjectLiteralInterface_3 = { value: 10 };
      const obj2: GeneratedObjectLiteralInterface_3 = { value: 20 };
      const arr = new Array<GeneratedObjectLiteralInterface_3>(obj2);
      const result = arr.unshift(obj1);
      expect(arr.length).assertEqual(2);
      expect(result).assertEqual(2);
      expect(arr[0].value).assertEqual(10);
    });

  });
}
