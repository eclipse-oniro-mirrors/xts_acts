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

class TestClassWithInstanceFields {
  instanceField1: string = 'value1';
  instanceField2: number = 42;
  instanceField3: boolean = true;

  static staticField: string = 'static';

  instanceMethod(): void {}
  static staticMethod(): void {}
}

class TestClassWithoutInstanceFields {
  static staticField: string = 'static';
  static staticMethod(): void {}
}

class ParentClassWithInstanceFields {
  instanceField1: string = 'parent';
  instanceField2: number = 100;
  instanceField3: boolean = false;
}

class TestClassWithInheritedInstanceFields extends ParentClassWithInstanceFields {
  inheritedInstanceField: string = 'child';
}

interface TestInterface {
  method(): void;
}

export default function BuiltinsClassGetStaticFieldsTest(): void {
  describe("BuiltinsClassGetStaticFieldsTest", () => {
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
     * @tc.name    BuiltinsClassGetStaticFieldsTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_0100
     * @tc.desc    Verify getInstanceFields for boolean primitive class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticFieldsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      const instanceFields = boolClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_0200
     * @tc.desc    Verify getInstanceFields for number primitive class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticFieldsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      const instanceFields = numClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_0300
     * @tc.desc    Verify getInstanceFields for string class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticFieldsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      const instanceFields = strClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length == 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_0400
     * @tc.desc    Verify getInstanceFields for object class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      const instanceFields = objClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length == 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_0500
     * @tc.desc    Verify getInstanceFields for array class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const arrClass = Class.of(arr);
      const instanceFields = arrClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length == 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_0600
     * @tc.desc    Verify getInstanceFields for class with instance fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const instanceFields = testClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(3);

      const fieldNames: string[] = [];
      for (let i = 0; i < instanceFields!.length; i++) {
        fieldNames.push(instanceFields![i].getName());
      }

      expect(fieldNames.includes('instanceField1')).assertTrue();
      expect(fieldNames.includes('instanceField2')).assertTrue();
      expect(fieldNames.includes('instanceField3')).assertTrue();
      expect(fieldNames.includes('staticField')).assertFalse();
      expect(fieldNames.includes('instanceMethod')).assertFalse();
      expect(fieldNames.includes('staticMethod')).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_0700
     * @tc.desc    Verify getInstanceFields for class without instance fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithoutInstanceFields>();
      const instanceFields = testClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_0800
     * @tc.desc    Verify getInstanceFields for class with inherited instance fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInheritedInstanceFields>();
      const instanceFields = testClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(1);

      const fieldNames: string[] = [];
      for (let i = 0; i < instanceFields!.length; i++) {
        fieldNames.push(instanceFields![i].getName());
      }

      expect(fieldNames.includes('instanceField1')).assertFalse();
      expect(fieldNames.includes('instanceField2')).assertFalse();
      expect(fieldNames.includes('instanceField3')).assertFalse();
      expect(fieldNames.includes('inheritedInstanceField')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_0900
     * @tc.desc    Verify getInstanceFields for interface class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      const instanceFields = interfaceClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_1000
     * @tc.desc    Verify getInstanceFields for byte primitive class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const instanceFields = byteClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_1100
     * @tc.desc    Verify getInstanceFields for short primitive class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const instanceFields = shortClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_1200
     * @tc.desc    Verify getInstanceFields for int primitive class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass = Class.PRIMITIVE_INT;
      const instanceFields = intClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_1300
     * @tc.desc    Verify getInstanceFields for long primitive class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const instanceFields = longClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_1400
     * @tc.desc    Verify getInstanceFields for float primitive class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const instanceFields = floatClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_1500
     * @tc.desc    Verify getInstanceFields for double primitive class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const instanceFields = doubleClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_1600
     * @tc.desc    Verify getInstanceFields for char primitive class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticFieldsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const instanceFields = charClass.getInstanceFields();
      expect(instanceFields !== null).assertTrue();
      expect(instanceFields!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticFieldsTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_FIELDS_TEST_1700
     * @tc.desc    Verify getInstanceFields consistency
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticFieldsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInstanceFields>();
      const instanceFields1 = testClass.getInstanceFields();
      const instanceFields2 = testClass.getInstanceFields();

      expect(instanceFields1 !== null).assertTrue();
      expect(instanceFields2 !== null).assertTrue();
      expect(instanceFields1!.length).assertEqual(instanceFields2!.length);

      for (let i = 0; i < instanceFields1!.length; i++) {
        expect(instanceFields1![i].getName()).assertEqual(instanceFields2![i].getName());
      }
    });

  })
}
