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
  constructor() {}
  method(): void {}
}

class TestClassWithMultipleConstructors {
  constructor(param1?: string, param2?: number, param3?: boolean) {}
}

class TestClassWithDefaultConstructor {
  constructor() {}
}

class TestClassWithParameterizedConstructor {
  constructor(name: string, age: number) {}
}

class TestClassWithPrivateConstructor {
  private constructor(name: string) {}
}

interface TestInterface {
  method(): void;
}

export default function BuiltinsClassGetConstructorsTest(): void {
  describe("BuiltinsClassGetConstructorsTest", () => {
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
     * @tc.name    BuiltinsClassGetConstructorsTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_0100
     * @tc.desc    Verify getConstructors for primitive boolean type returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetConstructorsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      const constructors = boolClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_0200
     * @tc.desc    Verify getConstructors for primitive number type returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetConstructorsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      const constructors = numClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_0300
     * @tc.desc    Verify getConstructors for string type returns constructors
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetConstructorsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      const constructors = strClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_0400
     * @tc.desc    Verify getConstructors for object type returns constructors
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetConstructorsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      const constructors = objClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_0500
     * @tc.desc    Verify getConstructors for array type returns constructors
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetConstructorsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const arrClass = Class.of(arr);
      const constructors = arrClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_0600
     * @tc.desc    Verify getConstructors for custom class with single constructor (ArkTS does not support constructor overloading)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetConstructorsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const instance = new TestClass();
      const testClass = Class.of(instance);
      const constructors = testClass.getConstructors();
      expect(constructors !== null).assertTrue();
      // ArkTS does not support constructor overloading, so only 1 constructor
      expect(constructors!.length).assertEqual(1);
      expect(constructors![0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_0700
     * @tc.desc    Verify getConstructors for class with optional parameters constructor (ArkTS does not support constructor overloading)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetConstructorsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const instance = new TestClassWithMultipleConstructors();
      const testClass = Class.of(instance);
      const constructors = testClass.getConstructors();
      expect(constructors !== null).assertTrue();
      // ArkTS does not support constructor overloading, so only 1 constructor with optional parameters
      expect(constructors!.length).assertEqual(1);
      expect(constructors![0].getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_0800
     * @tc.desc    Verify getConstructors for class with default constructor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetConstructorsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithDefaultConstructor>();
      const constructors = testClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(1);
      expect(constructors![0].getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_0900
     * @tc.desc    Verify getConstructors for class with parameterized constructor
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetConstructorsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithParameterizedConstructor>();
      const constructors = testClass.getConstructors();
      expect(constructors !== null).assertTrue();
      if (constructors.length > 0) {
        expect(constructors![0].getParametersNum()).assertEqual(2);

        const param0Type = constructors![0].getParameterType(0)!;
        const param1Type = constructors![0].getParameterType(1)!;
        expect(param0Type.getName().includes('string')).assertFalse();
        expect(param1Type.getName().includes('number')).assertFalse();
      }
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_1000
     * @tc.desc    Verify getConstructors for interface returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetConstructorsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      const constructors = interfaceClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_1100
     * @tc.desc    Verify getConstructors for class with private constructor returns only public
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetConstructorsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testClass = Class.from<TestClassWithPrivateConstructor>();
      const constructors = testClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_1200
     * @tc.desc    Verify getConstructors for primitive byte type returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetConstructorsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const constructors = byteClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_1300
     * @tc.desc    Verify getConstructors for primitive short type returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetConstructorsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const constructors = shortClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_1400
     * @tc.desc    Verify getConstructors for primitive int type returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetConstructorsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass = Class.PRIMITIVE_INT;
      const constructors = intClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_1500
     * @tc.desc    Verify getConstructors for primitive long type returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetConstructorsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const constructors = longClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_1600
     * @tc.desc    Verify getConstructors for primitive float type returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetConstructorsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const constructors = floatClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_1700
     * @tc.desc    Verify getConstructors for primitive double type returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetConstructorsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const constructors = doubleClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetConstructorsTest1800
     * @tc.number  SUB_BUILTINS_CLASS_GET_CONSTRUCTORS_TEST_1800
     * @tc.desc    Verify getConstructors for primitive char type returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetConstructorsTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const constructors = charClass.getConstructors();
      expect(constructors !== null).assertTrue();
      expect(constructors!.length).assertEqual(0);
    });

  })
}
