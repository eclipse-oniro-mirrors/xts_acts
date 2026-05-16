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

class NumberClass {
  value: number;
  constructor(value: number) {
    this.value = value;
  }
}

class StringClass {
  text: string;
  constructor(text: string) {
    this.text = text;
  }
}

class BooleanClass {
  flag: boolean;
  constructor(flag: boolean) {
    this.flag = flag;
  }
}

class ChildNumberClass extends NumberClass {
  extra: string;
  constructor(value: number, extra: string) {
    super(value);
    this.extra = extra;
  }
}

class GrandChildClass extends ChildNumberClass {
  constructor(value: number) {
    super(value, "grand");
  }
}

export default function BuiltinsIsAssignableFromTest(): void {
  describe('BuiltinsIsAssignableFromTest', () => {
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
     * @tc.name    BuiltinsIsAssignableFromTest0100
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_0100
     * @tc.desc    Verify that Number constructor parameter class is assignable to itself, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAssignableFromTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass: Class = Class.of(new NumberClass(0) as Object);
      const result: boolean = reflect.internals.Types.isAssignableFrom(numClass, numClass);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest0200
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_0200
     * @tc.desc    Verify that Number subclass is assignable to Number parent class (subtype), returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAssignableFromTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass: Class = Class.of(new NumberClass(0) as Object);
      const childClass: Class = Class.of(new ChildNumberClass(-1, "child") as Object);
      const result: boolean = reflect.internals.Types.isAssignableFrom(numClass, childClass);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest0300
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_0300
     * @tc.desc    Verify that Number numeric types (PRIMITIVE_DOUBLE and PRIMITIVE_INT) are assignable to each other, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAssignableFromTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_DOUBLE, Class.PRIMITIVE_INT
      );
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest0400
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_0400
     * @tc.desc    Verify that Boolean primitive type is assignable to itself (PRIMITIVE_BOOLEAN), returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAssignableFromTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_BOOLEAN, Class.PRIMITIVE_BOOLEAN
      );
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest0500
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_0500
     * @tc.desc    Verify that char primitive type is assignable to itself (PRIMITIVE_CHAR), returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsIsAssignableFromTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_CHAR, Class.PRIMITIVE_CHAR
      );
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest0600
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_0600
     * @tc.desc    Verify that String constructor parameter class is not assignable to Boolean constructor parameter class, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAssignableFromTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const strClass: Class = Class.of(new StringClass("") as Object);
      const boolClass: Class = Class.of(new BooleanClass(false) as Object);
      const result: boolean = reflect.internals.Types.isAssignableFrom(strClass, boolClass);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest0700
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_0700
     * @tc.desc    Verify that Number subclass is not assignable to Number parent class in reverse direction, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAssignableFromTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const numClass: Class = Class.of(new NumberClass(0) as Object);
      const childClass: Class = Class.of(new ChildNumberClass(Infinity, "inf") as Object);
      const result: boolean = reflect.internals.Types.isAssignableFrom(childClass, numClass);
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest0800
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_0800
     * @tc.desc    Verify that Boolean primitive type is not assignable to Number double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAssignableFromTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_BOOLEAN, Class.PRIMITIVE_DOUBLE
      );
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest0900
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_0900
     * @tc.desc    Verify that Number double type is not assignable to Boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAssignableFromTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_DOUBLE, Class.PRIMITIVE_BOOLEAN
      );
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest1000
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_1000
     * @tc.desc    Verify that char type is not assignable to Boolean type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAssignableFromTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_CHAR, Class.PRIMITIVE_BOOLEAN
      );
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest1100
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_1100
     * @tc.desc    Verify that int and long as Number integer types are assignable to each other, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsIsAssignableFromTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_INT, Class.PRIMITIVE_LONG
      );
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest1200
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_1200
     * @tc.desc    Verify that Number class is assignable to GrandChildClass multi-level inheritance chain, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAssignableFromTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const numClass: Class = Class.of(new NumberClass(Number.MAX_SAFE_INTEGER) as Object);
      const grandClass: Class = Class.of(new GrandChildClass(0) as Object);
      const result: boolean = reflect.internals.Types.isAssignableFrom(numClass, grandClass);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest1300
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_1300
     * @tc.desc    Verify that char type is not assignable to Number double type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAssignableFromTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_CHAR, Class.PRIMITIVE_DOUBLE
      );
      expect(result).assertFalse();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest1400
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_1400
     * @tc.desc    Verify that float and byte as Number numeric types are assignable to each other, returns true
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAssignableFromTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_FLOAT, Class.PRIMITIVE_BYTE
      );
      expect(result).assertTrue();
    });

    /**
     * @tc.name    BuiltinsIsAssignableFromTest1500
     * @tc.number  SUB_BUILTINS_IS_ASSIGNABLE_FROM_TEST_1500
     * @tc.desc    Verify that Number double type is not assignable to char type, returns false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsIsAssignableFromTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const result: boolean = reflect.internals.Types.isAssignableFrom(
        Class.PRIMITIVE_DOUBLE, Class.PRIMITIVE_CHAR
      );
      expect(result).assertFalse();
    });
  });
}
