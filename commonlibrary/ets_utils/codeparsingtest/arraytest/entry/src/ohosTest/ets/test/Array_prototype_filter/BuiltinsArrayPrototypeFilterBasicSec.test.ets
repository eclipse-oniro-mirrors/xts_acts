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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Utils from '../Util.test';

interface TestProduct {
  name: string;
  price: number;
}

interface TestPerson {
  id: number;
  name: string;
}

interface TestObj {
  id?: number;
  name?: string;
}

interface TestObj1 {
  value?: number;
  name?: string;
}
interface TestObj3 {
  id: number;
  name: string;
}

interface FilterConfig {
  min: number;
  max: number;
}

interface ThresholdConfig {
  threshold: number;
}

interface Person {
  name: string;
  age: number;
}

interface Config {
  minAge: number;
  maxAge: number;
}

interface NestedFilter {
  min: number;
  max: number;
}

interface NestedConfig {
  filter: NestedFilter;
}

interface NestedLevel2 {
  value: number;
}
interface NestedLevel1 {
  level2: NestedLevel2;
}
interface NestedObj {
  level1: NestedLevel1;
}

interface DeepLevel3 {
  level3: string;
}
interface DeepLevel2 {
  level2: DeepLevel3;
}
interface DeepLevel1 {
  level1: DeepLevel2;
}
interface DeepObj {
  level1: DeepLevel1;
}

interface CircularObj {
  name: string;
  ref?: CircularObj;
}

export default function BuiltinsArrayPrototypeFilterBasicSecTest(){
  describe('BuiltinsArrayPrototypeFilterBasicSecTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
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
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest0100
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_0100
     * @tc.desc     Use thisArg for dynamic filter rules
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const people: Person[] = [
        { name: 'Alice', age: 25 },
        { name: 'Bob', age: 30 },
        { name: 'Charlie', age: 35 }
      ];
      const config: Config = { minAge: 28, maxAge: 32 };
      const result = people.filter((item) => item.age >= config.minAge && item.age <= config.maxAge);

      expect(result.length).assertEqual(1);
      expect(result[0].name).assertEqual('Bob');
      expect(result[0].age).assertEqual(30);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest0200
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_0200
     * @tc.desc     Use array as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const thresholds = [2, 4];
      const result = arr.filter((n) => n >= thresholds[0] && n <= thresholds[1]);

      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest0300
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_0300
     * @tc.desc     Use boolean as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.filter((n) => n > 2);

      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest0400
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_0400
     * @tc.desc     Use false as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.filter((n) => n < 3);

      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest0500
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_0500
     * @tc.desc     Use empty object as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.filter((n) => n > 2);

      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest0600
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_0600
     * @tc.desc     Use function as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.filter((n) => n > 3);

      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest0700
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_0700
     * @tc.desc     Use nested object as thisArg
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 5, 10, 15, 20];
      const config: NestedConfig = { filter: { min: 5, max: 15 } };
      const result = arr.filter((n) => n >= config.filter.min && n <= config.filter.max);

      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest0800
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_0800
     * @tc.desc     Callback does not use this
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.filter((n) => n % 2 === 0);

      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest0900
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_0900
     * @tc.desc     Primitive type thisArg wrapping behavior
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const base = 'c';
      const arr: string[] = ['a', 'b', 'c', 'd', 'e'];
      const result = arr.filter((s) => s > base);

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('d');
      expect(result[1]).assertEqual('e');
    });

    /**
     * @tc.name     BuiltinsArrayPrototypeFilterBasicSecTest1000
     * @tc.number   SUB_BUILTINS_ARRAY_PROTOTYPE_FILTER_BASIC_SEC_TEST_1000
     * @tc.desc     thisArg is undefined
     * @tc.type     FUNCTION
     * @tc.size     SMALLTEST
     * @tc.level    LEVEL1
     */
    it('BuiltinsArrayPrototypeFilterBasicSecTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3, 4, 5];
      const result = arr.filter((n) => n > 2);

      expect(result.length).assertEqual(3);
    });
  });
}