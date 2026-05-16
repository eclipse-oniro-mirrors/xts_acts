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

export default function ArrayReverseTest() {
  describe('ArrayReverseTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0001
     * @tc.name testArrayReverse0001
     * @tc.desc Verify Array reverse on single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.push(1);
      const result = arr.reverse();
      expect(arr).assertDeepEquals([1] as Array<number>);
      expect(result).assertDeepEquals([1] as Array<number>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0002
     * @tc.name testArrayReverse0002
     * @tc.desc Verify Array reverse on number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.reverse();
      expect(arr).assertDeepEquals([5, 4, 3, 2, 1] as Array<number>);
      expect(result).assertDeepEquals([5, 4, 3, 2, 1] as Array<number>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0003
     * @tc.name testArrayReverse0003
     * @tc.desc Verify Array reverse on string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const result = arr.reverse();
      expect(arr).assertDeepEquals(['d', 'c', 'b', 'a']);
      expect(result).assertDeepEquals(['d', 'c', 'b', 'a']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0004
     * @tc.name testArrayReverse0004
     * @tc.desc Verify Array reverse on boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.reverse();
      expect(arr).assertDeepEquals([true, false, true] as Array<boolean>);
      expect(result).assertDeepEquals([true, false, true] as Array<boolean>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0005
     * @tc.name testArrayReverse0005
     * @tc.desc Verify Array reverse on mixed type array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(1, 'hello', true);
      const result = arr.reverse();
      expect(arr).assertDeepEquals([true, 'hello', 1] as Array<number | string | boolean>);
      expect(result).assertDeepEquals([true, 'hello', 1] as Array<number | string | boolean>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0006
     * @tc.name testArrayReverse0006
     * @tc.desc Verify Array reverse on object array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: GeneratedObjectLiteralInterface_3 = { value: 10 };
      const obj2: GeneratedObjectLiteralInterface_3 = { value: 20 };
      const arr = new Array<GeneratedObjectLiteralInterface_3>(obj1, obj2);
      const result = arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[0].value).assertEqual(20);
      expect(arr[1].value).assertEqual(10);
      expect(result[0].value).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0007
     * @tc.name testArrayReverse0007
     * @tc.desc Verify Array reverse on nested array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number[]>([1, 2], [3, 4], [5, 6]);
      const result = arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertDeepEquals([5, 6] as Array<number>);
      expect(arr[2]).assertDeepEquals([1, 2] as Array<number>);
      expect(result[0]).assertDeepEquals([5, 6] as Array<number>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0008
     * @tc.name testArrayReverse0008
     * @tc.desc Verify Array reverse on Date object array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-02-01');
      const date3 = new Date('2024-03-01');
      const arr = new Array<Date>(date1, date2, date3);
      const result = arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0].toISOString()).assertEqual('2024-03-01T00:00:00.000Z');
      expect(arr[2].toISOString()).assertEqual('2024-01-01T00:00:00.000Z');
      expect(result[0].toISOString()).assertEqual('2024-03-01T00:00:00.000Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0009
     * @tc.name testArrayReverse0009
     * @tc.desc Verify Array reverse on large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result = arr.reverse();
      expect(arr.length).assertEqual(10);
      expect(arr[0]).assertEqual(10);
      expect(arr[9]).assertEqual(1);
      expect(result[0]).assertEqual(10);
      expect(result[9]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0010
     * @tc.name testArrayReverse0010
     * @tc.desc Verify Array reverse on array with NaN and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, Infinity, -Infinity, 0);
      const result = arr.reverse();
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(0);
      expect(isNaN(arr[3])).assertTrue();
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0011
     * @tc.name testArrayReverse0011
     * @tc.desc Verify Array reverse on BigInt array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big1 = BigInt(100);
      const big2 = BigInt(200);
      const big3 = BigInt(300);
      const arr = new Array<bigint>(big1, big2, big3);
      const result = arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(big3);
      expect(arr[2]).assertEqual(big1);
      expect(result[0]).assertEqual(big3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_REVERSE_0012
     * @tc.name testArrayReverse0012
     * @tc.desc Verify Array reverse on class instance array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person1 = new Person087('Alice', 30);
      const person2 = new Person087('Bob', 25);
      const person3 = new Person087('Charlie', 35);
      const arr = new Array<Person087>(person1, person2, person3);
      const result = arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0].name).assertEqual('Charlie');
      expect(arr[2].name).assertEqual('Alice');
      expect(result[0].name).assertEqual('Charlie');
      expect(result[2].name).assertEqual('Alice');
    });

  });
}
