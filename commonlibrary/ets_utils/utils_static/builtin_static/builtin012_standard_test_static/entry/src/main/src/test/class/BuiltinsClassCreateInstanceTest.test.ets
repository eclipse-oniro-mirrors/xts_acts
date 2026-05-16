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
}

class TestClassWithFields {
  name: string = "default";
  age: number = 18;
  active: boolean = true;
}

class TestClassWithMethod {
  method(): string {
    return "test";
  }
}

class TestClassWithStatic {
  static staticValue: number = 100;
  instanceValue: number = 0;

  constructor() {
    this.instanceValue = TestClassWithStatic.staticValue;
  }
}

class ThrowingConstructorClass {
  constructor() {
    throw new Error("Constructor error");
  }
}

export default function BuiltinsClassCreateInstanceTest(): void {
  describe("BuiltinsClassCreateInstanceTest", () => {
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
     * @tc.name    BuiltinsClassCreateInstanceTest0100
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_0100
     * @tc.desc    Verify createInstance() for custom class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCreateInstanceTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClass>();
      const instance = testClass.createInstance();
      expect(instance !== null).assertTrue();
      expect(instance instanceof TestClass).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassCreateInstanceTest0200
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_0200
     * @tc.desc    Verify createInstance() for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCreateInstanceTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objectClass = Class.from<Object>();
      const instance = objectClass.createInstance();
      expect(instance !== null).assertTrue();
      expect(instance instanceof Object).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassCreateInstanceTest0300
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_0300
     * @tc.desc    Verify createInstance() initializes instance fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCreateInstanceTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithFields>();
      const instance = testClass.createInstance() as TestClassWithFields;

      expect(instance.name).assertEqual("default");
      expect(instance.age).assertEqual(18);
      expect(instance.active).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassCreateInstanceTest0400
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_0400
     * @tc.desc    Verify createInstance() throws for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCreateInstanceTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const intClass = Class.PRIMITIVE_INT;

      expect(() => {
        intClass.createInstance();
      }).assertThrow('Cannot instantiate I');
    });

    /**
     * @tc.name    BuiltinsClassCreateInstanceTest0500
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_0500
     * @tc.desc    Verify createInstance() throws for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCreateInstanceTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;

      expect(() => {
        doubleClass.createInstance();
      }).assertThrow('Cannot instantiate D');
    });

    /**
     * @tc.name    BuiltinsClassCreateInstanceTest0600
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_0600
     * @tc.desc    Verify createInstance() for primitive string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCreateInstanceTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const stringClass = Class.from<string>();
      const instance = stringClass.createInstance();

      expect(instance !== null).assertTrue();
      expect(typeof instance).assertEqual('string');
    });

    /**
     * @tc.name    BuiltinsClassCreateInstanceTest0700
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_0700
     * @tc.desc    Verify createInstance() for class with constructor that throws
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassCreateInstanceTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const testClass = Class.from<ThrowingConstructorClass>();

      expect(() => {
        testClass.createInstance();
      }).assertThrow('Constructor error');
    });

    /**
     * @tc.name    BuiltinsClassCreateInstanceTest0800
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_0800
     * @tc.desc    Verify createInstance() returns same type as original class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCreateInstanceTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithMethod>();
      const instance = testClass.createInstance() as TestClassWithMethod;

      expect(typeof instance.method).assertEqual('function');
      expect(instance.method()).assertEqual('test');
    });

    /**
     * @tc.name    BuiltinsClassCreateInstanceTest0900
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_0900
     * @tc.desc    Verify createInstance() for class with static fields
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCreateInstanceTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStatic>();
      const instance = testClass.createInstance() as TestClassWithStatic;

      expect(instance.instanceValue).assertEqual(100);
      expect(TestClassWithStatic.staticValue).assertEqual(100);
    });

    /**
     * @tc.name    BuiltinsClassCreateInstanceTest1000
     * @tc.number  SUB_BUILTINS_CLASS_CREATE_INSTANCE_TEST_1000
     * @tc.desc    Verify createInstance() throws for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCreateInstanceTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const charClass = Class.PRIMITIVE_CHAR;

      expect(() => {
        charClass.createInstance();
      }).assertThrow('Cannot instantiate C');
    });

  })
}
