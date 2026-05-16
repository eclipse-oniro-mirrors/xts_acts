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

type TestUnionType = string | number | boolean;
type TestComplexUnionType = string | number | TestClass | TestInterface;

export default function BuiltinsClassGetUnionConstituentTypesTest(): void {
  describe("BuiltinsClassGetUnionConstituentTypesTest", () => {
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
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_0100
     * @tc.desc    Verify getUnionConstituentTypes for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetUnionConstituentTypesTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      const types = boolClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_0200
     * @tc.desc    Verify getUnionConstituentTypes for number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetUnionConstituentTypesTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      const types = numClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_0300
     * @tc.desc    Verify getUnionConstituentTypes for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetUnionConstituentTypesTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      const types = strClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_0400
     * @tc.desc    Verify getUnionConstituentTypes for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetUnionConstituentTypesTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      const types = objClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_0500
     * @tc.desc    Verify getUnionConstituentTypes for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetUnionConstituentTypesTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrClass = Class.from<Array<number>>();
      const types = arrClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_0600
     * @tc.desc    Verify getUnionConstituentTypes for custom class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetUnionConstituentTypesTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClass>();
      const types = testClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_0700
     * @tc.desc    Verify getUnionConstituentTypes for interface type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetUnionConstituentTypesTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      const types = interfaceClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_0800
     * @tc.desc    Verify getUnionConstituentTypes for union type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetUnionConstituentTypesTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const unionClass = Class.from<TestUnionType>();
      const types = unionClass.getUnionConstituentTypes();
      if (types !== undefined && types !== null) {
        expect(types.length > 0).assertTrue();

        let hasStringType = false;
        let hasNumberType = false;
        let hasBooleanType = false;

        for (let i = 0; i < types.length; i++) {
          const type = types[i];
          const typeName = type.getName();
          if (typeName.includes('String')) {
            hasStringType = true;
          } else if (typeName.includes('Number') || typeName.includes('Double')) {
            hasNumberType = true;
          } else if (typeName.includes('Boolean')) {
            hasBooleanType = true;
          }
        }

        expect(hasStringType).assertTrue();
        expect(hasNumberType).assertTrue();
        expect(hasBooleanType).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_0900
     * @tc.desc    Verify getUnionConstituentTypes for complex union type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetUnionConstituentTypesTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const complexUnionClass = Class.from<TestComplexUnionType>();
      const types = complexUnionClass.getUnionConstituentTypes();
      if (types !== undefined && types !== null) {
        expect(types.length > 0).assertTrue();

        let hasStringType = false;
        let hasNumberType = false;
        let hasTestClassType = false;
        let hasTestInterfaceType = false;

        for (let i = 0; i < types.length; i++) {
          const type = types[i];
          const typeName = type.getName();
          if (typeName.includes('String')) {
            hasStringType = true;
          } else if (typeName.includes('Number')) {
            hasNumberType = true;
          } else if (typeName.includes('TestClass')) {
            hasTestClassType = true;
          } else if (typeName.includes('TestInterface')) {
            hasTestInterfaceType = true;
          }
        }

        expect(hasStringType).assertTrue();
        expect(hasNumberType).assertFalse();
        expect(hasTestClassType).assertTrue();
        expect(hasTestInterfaceType).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_1000
     * @tc.desc    Verify getUnionConstituentTypes for byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetUnionConstituentTypesTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const types = byteClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_1100
     * @tc.desc    Verify getUnionConstituentTypes for short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetUnionConstituentTypesTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const types = shortClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_1200
     * @tc.desc    Verify getUnionConstituentTypes for int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetUnionConstituentTypesTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass = Class.PRIMITIVE_INT;
      const types = intClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_1300
     * @tc.desc    Verify getUnionConstituentTypes for long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetUnionConstituentTypesTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const types = longClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_1400
     * @tc.desc    Verify getUnionConstituentTypes for float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetUnionConstituentTypesTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const types = floatClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassGetUnionConstituentTypesTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_UNION_CONSTITUENT_TYPES_TEST_1500
     * @tc.desc    Verify getUnionConstituentTypes for double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetUnionConstituentTypesTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const types = doubleClass.getUnionConstituentTypes();
      expect(types).assertEqual(undefined);
    });

  })
}
