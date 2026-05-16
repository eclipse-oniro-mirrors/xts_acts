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

class TestClass {
  method(): void {}
}

interface TestInterface {
  method(): void;
}

export default function BuiltinsClassIsPrimitiveTest(): void {
  describe("BuiltinsClassIsPrimitiveTest", () => {
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
     * @tc.name    BuiltinsClassIsPrimitiveTest0100
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_0100
     * @tc.desc    Verify isPrimitive for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsPrimitiveTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      expect(boolClass.isPrimitive()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest0200
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_0200
     * @tc.desc    Verify isPrimitive for number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsPrimitiveTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      expect(numClass.isPrimitive()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest0300
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_0300
     * @tc.desc    Verify isPrimitive for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsPrimitiveTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      expect(strClass.isPrimitive()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest0400
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_0400
     * @tc.desc    Verify isPrimitive for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsPrimitiveTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      expect(objClass.isPrimitive()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest0500
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_0500
     * @tc.desc    Verify isPrimitive for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsPrimitiveTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrClass = Class.from<Array<number>>();
      expect(arrClass.isPrimitive()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest0600
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_0600
     * @tc.desc    Verify isPrimitive for custom class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsPrimitiveTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClass>();
      expect(testClass.isPrimitive()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest0700
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_0700
     * @tc.desc    Verify isPrimitive for interface type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsPrimitiveTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      expect(interfaceClass.isPrimitive()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest0800
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_0800
     * @tc.desc    Verify isPrimitive for byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsPrimitiveTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      expect(byteClass.isPrimitive()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest0900
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_0900
     * @tc.desc    Verify isPrimitive for short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsPrimitiveTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      expect(shortClass.isPrimitive()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest1000
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_1000
     * @tc.desc    Verify isPrimitive for int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsPrimitiveTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass = Class.PRIMITIVE_INT;
      expect(intClass.isPrimitive()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest1100
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_1100
     * @tc.desc    Verify isPrimitive for long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsPrimitiveTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass = Class.PRIMITIVE_LONG;
      expect(longClass.isPrimitive()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest1200
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_1200
     * @tc.desc    Verify isPrimitive for float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsPrimitiveTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      expect(floatClass.isPrimitive()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsPrimitiveTest1300
     * @tc.number  SUB_BUILTINS_CLASS_IS_PRIMITIVE_TEST_1300
     * @tc.desc    Verify isPrimitive for double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsPrimitiveTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      expect(doubleClass.isPrimitive()).assertTrue();
    });

  })
}
