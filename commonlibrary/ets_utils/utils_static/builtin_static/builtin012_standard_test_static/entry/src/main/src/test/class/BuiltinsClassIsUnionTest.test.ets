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

type TestUnion = string | number | boolean;
class TestClass {}

export default function BuiltinsClassIsUnionTest(): void {
  describe("BuiltinsClassIsUnionTest", () => {
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
     * @tc.name    BuiltinsClassIsUnionTest0100
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_0100
     * @tc.desc    Verify isUnion for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsUnionTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      expect(boolClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest0200
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_0200
     * @tc.desc    Verify isUnion for number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsUnionTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      expect(numClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest0300
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_0300
     * @tc.desc    Verify isUnion for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassIsUnionTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      expect(strClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest0400
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_0400
     * @tc.desc    Verify isUnion for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsUnionTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      expect(objClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest0500
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_0500
     * @tc.desc    Verify isUnion for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsUnionTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrClass = Class.from<Array<number>>();
      expect(arrClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest0600
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_0600
     * @tc.desc    Verify isUnion for custom class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsUnionTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClass>();
      expect(testClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest0700
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_0700
     * @tc.desc    Verify isUnion for union type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassIsUnionTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const unionClass = Class.from<TestUnion>();
      expect(unionClass.isUnion()).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest0800
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_0800
     * @tc.desc    Verify isUnion for byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsUnionTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      expect(byteClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest0900
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_0900
     * @tc.desc    Verify isUnion for short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsUnionTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      expect(shortClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest1000
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_1000
     * @tc.desc    Verify isUnion for int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsUnionTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass = Class.PRIMITIVE_INT;
      expect(intClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest1100
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_1100
     * @tc.desc    Verify isUnion for long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsUnionTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass = Class.PRIMITIVE_LONG;
      expect(longClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest1200
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_1200
     * @tc.desc    Verify isUnion for float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsUnionTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      expect(floatClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest1300
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_1300
     * @tc.desc    Verify isUnion for double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsUnionTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      expect(doubleClass.isUnion()).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassIsUnionTest1400
     * @tc.number  SUB_BUILTINS_CLASS_IS_UNION_TEST_1400
     * @tc.desc    Verify isUnion for char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassIsUnionTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      expect(charClass.isUnion()).assertFalse();
    });

  })
}
