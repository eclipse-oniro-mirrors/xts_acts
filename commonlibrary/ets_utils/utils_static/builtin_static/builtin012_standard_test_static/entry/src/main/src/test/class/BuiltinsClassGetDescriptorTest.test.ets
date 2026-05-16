/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

class TestClass {}
class TestClassForDescriptor {}

export default function BuiltinsClassGetDescriptorTest(): void {
  describe("BuiltinsClassGetDescriptorTest", () => {
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
     * @tc.name    BuiltinsClassGetDescriptorTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_0100
     * @tc.desc    Verify getDescriptor for primitive boolean type returns "Z"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.PRIMITIVE_BOOLEAN;
      const descriptor = booleanClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('Z');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_0200
     * @tc.desc    Verify getDescriptor for primitive int type returns "I"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const intClass = Class.PRIMITIVE_INT;
      const descriptor = intClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('I');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_0300
     * @tc.desc    Verify getDescriptor for primitive double type returns "D"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const descriptor = doubleClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('D');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_0400
     * @tc.desc    Verify getDescriptor for object type returns valid descriptor format
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetDescriptorTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj = new Object();
      const objClass = Class.of(obj);
      const descriptor = objClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor.startsWith('L')).assertTrue();
      expect(descriptor.endsWith(';')).assertTrue();
      expect(descriptor.includes('Object')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_0500
     * @tc.desc    Verify getDescriptor for array type returns array descriptor format
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetDescriptorTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const arrClass = Class.of(arr);
      const descriptor = arrClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor.startsWith('L')).assertTrue();
      expect(descriptor.endsWith(';')).assertTrue();
      expect(descriptor.includes('Array')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_0600
     * @tc.desc    Verify getDescriptor for string type returns "Ljava/lang/String;"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetDescriptorTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const str = 'test';
      const strClass = Class.of(str);
      const descriptor = strClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor.startsWith('L')).assertTrue();
      expect(descriptor.endsWith(';')).assertTrue();
      expect(descriptor.includes('String')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_0700
     * @tc.desc    Verify getDescriptor for current class returns valid descriptor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetDescriptorTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const descriptor = currentClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor.startsWith('L')).assertTrue();
      expect(descriptor.endsWith(';')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_0800
     * @tc.desc    Verify getDescriptor for custom class returns correct descriptor format
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetDescriptorTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testObj = new TestClass();
      const testClass = Class.of(testObj);
      const descriptor = testClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor.startsWith('L')).assertTrue();
      expect(descriptor.endsWith(';')).assertTrue();
      expect(descriptor.includes('TestClass')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_0900
     * @tc.desc    Verify getDescriptor for primitive byte type returns "B"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const descriptor = byteClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('B');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1000
     * @tc.desc    Verify getDescriptor for primitive char type returns "C"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const descriptor = charClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('C');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1100
     * @tc.desc    Verify getDescriptor for primitive short type returns "S"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const descriptor = shortClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('S');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1200
     * @tc.desc    Verify getDescriptor for primitive long type returns "J"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const descriptor = longClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('J');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1300
     * @tc.desc    Verify getDescriptor for primitive float type returns "F"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const descriptor = floatClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('F');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1400
     * @tc.desc    Verify getDescriptor for primitive number type returns "D"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberClass = Class.PRIMITIVE_NUMBER;
      const descriptor = numberClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('D');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1500
     * @tc.desc    Verify getDescriptor for primitive void type returns "V"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetDescriptorTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const voidClass = Class.PRIMITIVE_VOID;
      const descriptor = voidClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor).assertEqual('V');
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1600
     * @tc.desc    Verify getDescriptor for null type returns "null"
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetDescriptorTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullClass = Class.of(null);
      const descriptor = nullClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor.startsWith('L')).assertTrue();
      expect(descriptor.endsWith(';')).assertTrue();
      expect(descriptor.includes('Null')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1700
     * @tc.desc    Verify getDescriptor for multi-dimensional array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetDescriptorTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr2D = [[1, 2], [3, 4]];
      const arr2DClass = Class.of(arr2D);
      const descriptor = arr2DClass.getDescriptor();
      expect(descriptor !== null).assertTrue();
      expect(typeof descriptor).assertEqual('string');
      expect(descriptor.startsWith('L') || descriptor.startsWith('[')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1800
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1800
     * @tc.desc    Verify getDescriptor returns same result for repeated calls
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetDescriptorTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const intClass = Class.PRIMITIVE_INT;
      const descriptor1 = intClass.getDescriptor();
      const descriptor2 = intClass.getDescriptor();
      expect(descriptor1).assertEqual(descriptor2);
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest1900
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_1900
     * @tc.desc    Verify getDescriptor for different primitive types return different values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetDescriptorTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const booleanDesc = Class.PRIMITIVE_BOOLEAN.getDescriptor();
      const intDesc = Class.PRIMITIVE_INT.getDescriptor();
      const doubleDesc = Class.PRIMITIVE_DOUBLE.getDescriptor();

      expect(booleanDesc).assertEqual('Z');
      expect(intDesc).assertEqual('I');
      expect(doubleDesc).assertEqual('D');
      expect(booleanDesc).not().assertEqual(intDesc);
      expect(intDesc).not().assertEqual(doubleDesc);
    });

    /**
     * @tc.name    BuiltinsClassGetDescriptorTest2000
     * @tc.number  SUB_BUILTINS_CLASS_GET_DESCRIPTOR_TEST_2000
     * @tc.desc    Verify getDescriptor for class and its instance return same descriptor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetDescriptorTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {

      const instance = new TestClassForDescriptor();
      const classFromType = Class.from<TestClassForDescriptor>();
      const classFromInstance = Class.of(instance);

      const descriptor1 = classFromType.getDescriptor();
      const descriptor2 = classFromInstance.getDescriptor();

      expect(descriptor1).assertEqual(descriptor2);
    });

  })
}
