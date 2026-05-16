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

interface GeneratedObjectLiteralInterface_1 {
  name: string;
  age: number;
}

interface GeneratedObjectLiteralInterface_2 {
  name: string;
}

export default function BuiltinsRuntimeNarrowAnyTest(): void {
  describe("BuiltinsRuntimeNarrowAnyTest", () => {
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
     * @tc.name    BuiltinsRuntimeNarrowAnyTest0100
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_0100
     * @tc.desc    Verify narrowAny with number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeNarrowAnyTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: number = 42;
      const result = __narrowAny<number>(value);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest0200
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_0200
     * @tc.desc    Verify narrowAny with string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeNarrowAnyTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: Any = 'Hello';
      const result = __narrowAny<string>(value);
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest0300
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_0300
     * @tc.desc    Verify narrowAny with boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeNarrowAnyTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: Any = true;
      const result = __narrowAny<boolean>(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest0400
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_0400
     * @tc.desc    Verify narrowAny with object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeNarrowAnyTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: GeneratedObjectLiteralInterface_1 = { name: 'test', age: 10 };
      const result = __narrowAny(value) as GeneratedObjectLiteralInterface_1;

      expect(result.name).assertEqual('test');
      expect(result.age).assertEqual(10);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest0500
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_0500
     * @tc.desc    Verify narrowAny with null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeNarrowAnyTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: Any = null;
      const result = __narrowAny<null>(value);
      expect(result).assertEqual(null);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest0600
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_0600
     * @tc.desc    Verify narrowAny with undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeNarrowAnyTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: Any = undefined;
      const result = __narrowAny<undefined>(value);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest0700
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_0700
     * @tc.desc    Verify narrowAny with array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeNarrowAnyTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: number[] = [1, 2, 3];
      const result = __narrowAny<number[]>(value);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest0800
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_0800
     * @tc.desc    Verify narrowAny with function type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeNarrowAnyTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: Any = (a: number, b: number) => a + b;
      const result = __narrowAny<(a: number, b: number) => number>(value);
      expect(result(1, 2)).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest0900
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_0900
     * @tc.desc    Verify narrowAny with default type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsRuntimeNarrowAnyTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const value: GeneratedObjectLiteralInterface_2 = { name: 'test' };
      const result = __narrowAny<GeneratedObjectLiteralInterface_2>(value);
      expect(result.name).assertEqual('test');
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1000
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1000
     * @tc.desc    Verify narrowAny with Number.MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeNarrowAnyTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: number = Number.MAX_VALUE;
      const result = __narrowAny<number>(value);
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1100
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1100
     * @tc.desc    Verify narrowAny with Number.MIN_VALUE
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeNarrowAnyTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: number = Number.MIN_VALUE;
      const result = __narrowAny<number>(value);
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1200
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1200
     * @tc.desc    Verify narrowAny with Infinity
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeNarrowAnyTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: number = Infinity;
      const result = __narrowAny<number>(value);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1300
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1300
     * @tc.desc    Verify narrowAny with NaN
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeNarrowAnyTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: number = NaN;
      const result = __narrowAny<number>(value);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1400
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1400
     * @tc.desc    Verify narrowAny with empty string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeNarrowAnyTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: string = "";
      const result = __narrowAny<string>(value);
      expect(result).assertEqual("");
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1500
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1500
     * @tc.desc    Verify narrowAny with zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsRuntimeNarrowAnyTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const value: number = 0;
      const result = __narrowAny<number>(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1600
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1600
     * @tc.desc    Verify narrowAny with negative zero
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeNarrowAnyTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const value: number = -0;
      const result = __narrowAny<number>(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1700
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1700
     * @tc.desc    Verify narrowAny with Number.MAX_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeNarrowAnyTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const value: number = Number.MAX_SAFE_INTEGER;
      const result = __narrowAny<number>(value);
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1800
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1800
     * @tc.desc    Verify narrowAny with Number.MIN_SAFE_INTEGER
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeNarrowAnyTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const value: number = Number.MIN_SAFE_INTEGER;
      const result = __narrowAny<number>(value);
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest1900
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_1900
     * @tc.desc    Verify narrowAny with empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeNarrowAnyTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const value: number[] = [];
      const result = __narrowAny<number[]>(value);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsRuntimeNarrowAnyTest2000
     * @tc.number  SUB_BUILTINS_RUNTIME_NARROW_ANY_TEST_2000
     * @tc.desc    Verify narrowAny with large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsRuntimeNarrowAnyTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const value: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      const result = __narrowAny<number[]>(value);
      expect(result.length).assertEqual(10);
      expect(result[0]).assertEqual(1);
      expect(result[9]).assertEqual(10);
    });

  })
}
