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

export default function ArrayConcatTest() {
  describe('ArrayConcatTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0001
     * @tc.name testArrayConcat0001
     * @tc.desc Verify Array concat single element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConcat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arr1: number[] = [1];
      const arr2: number[] = [2];
      const result = arr1.concat(arr2);
      expect(arr1).assertDeepEquals([1] as Array<number>);
      expect(arr2).assertDeepEquals([2] as Array<number>);
      expect(result).assertDeepEquals([1, 2] as Array<number>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0002
     * @tc.name testArrayConcat0002
     * @tc.desc Verify Array concat multiple number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConcat0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const arr2 = new Array<number>(4, 5);
      const result = arr1.concat(arr2);
      expect(arr1).assertDeepEquals([1, 2, 3] as Array<number>);
      expect(arr2).assertDeepEquals([4, 5] as Array<number>);
      expect(result).assertDeepEquals([1, 2, 3, 4, 5] as Array<number>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0003
     * @tc.name testArrayConcat0003
     * @tc.desc Verify Array concat string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConcat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arr1 = new Array<string>('a', 'b');
      const arr2 = new Array<string>('c', 'd');
      const result = arr1.concat(arr2);
      expect(arr1).assertDeepEquals(['a', 'b']);
      expect(arr2).assertDeepEquals(['c', 'd']);
      expect(result).assertDeepEquals(['a', 'b', 'c', 'd']);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0004
     * @tc.name testArrayConcat0004
     * @tc.desc Verify Array concat boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testArrayConcat0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const arr1 = new Array<boolean>(true, false);
      const arr2 = new Array<boolean>(true);
      const result = arr1.concat(arr2);
      expect(arr1).assertDeepEquals([true, false]);
      expect(arr2).assertDeepEquals([true]);
      expect(result).assertDeepEquals([true, false, true]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0005
     * @tc.name testArrayConcat0005
     * @tc.desc Verify Array concat multiple arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1: number[] = [1];
      const arr2: number[] = [2];
      const arr3: number[] = [3];
      const result = arr1.concat(arr2, arr3);
      expect(arr1).assertDeepEquals([1] as Array<number>);
      expect(arr2).assertDeepEquals([2] as Array<number>);
      expect(arr3).assertDeepEquals([3] as Array<number>);
      expect(result).assertDeepEquals([1, 2, 3] as Array<number>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0006
     * @tc.name testArrayConcat0006
     * @tc.desc Verify Array concat on object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: GeneratedObjectLiteralInterface_3 = { value: 10 };
      const obj2: GeneratedObjectLiteralInterface_3 = { value: 20 };
      const obj3: GeneratedObjectLiteralInterface_3 = { value: 30 };
      const arr1 = new Array<GeneratedObjectLiteralInterface_3>(obj1);
      const arr2 = new Array<GeneratedObjectLiteralInterface_3>(obj2, obj3);
      const result = arr1.concat(arr2);
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(2);
      expect(result.length).assertEqual(3);
      expect(result[0].value).assertEqual(10);
      expect(result[2].value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0007
     * @tc.name testArrayConcat0007
     * @tc.desc Verify Array concat on nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number[]>([1, 2]);
      const arr2 = new Array<number[]>([3, 4], [5, 6]);
      const result = arr1.concat(arr2);
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertDeepEquals([1, 2] as Array<number>);
      expect(result[2]).assertDeepEquals([5, 6] as Array<number>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0008
     * @tc.name testArrayConcat0008
     * @tc.desc Verify Array concat on Date object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2024-01-01');
      const date2 = new Date('2024-02-01');
      const date3 = new Date('2024-03-01');
      const arr1 = new Array<Date>(date1);
      const arr2 = new Array<Date>(date2, date3);
      const result = arr1.concat(arr2);
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(2);
      expect(result.length).assertEqual(3);
      expect(result[0].toISOString()).assertEqual('2024-01-01T00:00:00.000Z');
      expect(result[2].toISOString()).assertEqual('2024-03-01T00:00:00.000Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0009
     * @tc.name testArrayConcat0009
     * @tc.desc Verify Array concat on array with null and undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number | null | undefined>(null, 1);
      const arr2 = new Array<number | null | undefined>(undefined, 2);
      const result = arr1.concat(arr2);
      expect(arr1).assertDeepEquals([null, 1] as Array<number | null | undefined>);
      expect(arr2).assertDeepEquals([undefined, 2] as Array<number | null | undefined>);
      expect(result).assertDeepEquals([null, 1, undefined, 2] as Array<number | null | undefined>);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0010
     * @tc.name testArrayConcat0010
     * @tc.desc Verify Array concat on BigInt arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big1 = BigInt(100);
      const big2 = BigInt(200);
      const big3 = BigInt(300);
      const arr1 = new Array<bigint>(big1);
      const arr2 = new Array<bigint>(big2, big3);
      const result = arr1.concat(arr2);
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(big1);
      expect(result[2]).assertEqual(big3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0011
     * @tc.name testArrayConcat0011
     * @tc.desc Verify Array concat on function arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const func1 = (x: number) => x * 2;
      const func2 = (x: number) => x + 1;
      const func3 = (x: number) => x - 1;
      const arr1 = new Array<(x: number) => number>(func1);
      const arr2 = new Array<(x: number) => number>(func2, func3);
      const result = arr1.concat(arr2);
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(2);
      expect(result.length).assertEqual(3);
      expect(result[0](5)).assertEqual(10);
      expect(result[2](5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_CONCAT_0012
     * @tc.name testArrayConcat0012
     * @tc.desc Verify Array concat on class instance arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person1 = new Person087('Alice', 30);
      const person2 = new Person087('Bob', 25);
      const person3 = new Person087('Charlie', 35);
      const arr1 = new Array<Person087>(person1);
      const arr2 = new Array<Person087>(person2, person3);
      const result = arr1.concat(arr2);
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(2);
      expect(result.length).assertEqual(3);
      expect(result[0].name).assertEqual('Alice');
      expect(result[2].name).assertEqual('Charlie');
    });

  });
}
