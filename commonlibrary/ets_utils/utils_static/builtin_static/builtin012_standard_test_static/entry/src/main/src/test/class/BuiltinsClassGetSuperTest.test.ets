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

class TestBaseClass {}
class TestSubClass extends TestBaseClass {}

export default function BuiltinsClassGetSuperTest(): void {
  describe("BuiltinsClassGetSuperTest", () => {
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
     * @tc.name    BuiltinsClassGetSuperTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_0100
     * @tc.desc    Verify getSuper for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      expect(booleanClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_0200
     * @tc.desc    Verify getSuper for primitive byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      expect(byteClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_0300
     * @tc.desc    Verify getSuper for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      expect(charClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_0400
     * @tc.desc    Verify getSuper for primitive short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      expect(shortClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_0500
     * @tc.desc    Verify getSuper for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intClass = Class.PRIMITIVE_INT;
      expect(intClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_0600
     * @tc.desc    Verify getSuper for primitive long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longClass = Class.PRIMITIVE_LONG;
      expect(longClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_0700
     * @tc.desc    Verify getSuper for primitive float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      expect(floatClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_0800
     * @tc.desc    Verify getSuper for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      expect(doubleClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_0900
     * @tc.desc    Verify getSuper for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberClass = Class.PRIMITIVE_NUMBER;
      expect(numberClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_1000
     * @tc.desc    Verify getSuper for primitive void type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetSuperTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      expect(voidClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_1100
     * @tc.desc    Verify getSuper for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetSuperTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      expect(objClass.getSuper()).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_1200
     * @tc.desc    Verify getSuper for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetSuperTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = new Array<number>();
      const arrClass = Class.of(arr);
      expect(arrClass.getSuper()?.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_1300
     * @tc.desc    Verify getSuper for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetSuperTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'test';
      const strClass = Class.of(str);
      expect(strClass.getSuper()?.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_1400
     * @tc.desc    Verify getSuper for current class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetSuperTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      expect(currentClass.getSuper()?.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_1500
     * @tc.desc    Verify getSuper for custom base class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetSuperTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const baseClass = Class.from<TestBaseClass>();
      expect(baseClass.getSuper()?.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.name    BuiltinsClassGetSuperTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_SUPER_TEST_1600
     * @tc.desc    Verify getSuper for custom subclass (inheritance scenario)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetSuperTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const subClass = Class.from<TestSubClass>();
      const baseClass = Class.from<TestBaseClass>();

      expect(subClass.getSuper()).assertEqual(baseClass);

      expect(subClass.isSubtypeOf(baseClass)).assertTrue();
      expect(baseClass.isSubtypeOf(subClass)).assertFalse();
    });

  })
}
