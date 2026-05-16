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

class TestClassWithStaticMethods {
  static staticMethod1(): void {}
  static staticMethod2(param: string): string { return param; }
  static staticMethod3(): number { return 42; }

  static staticField: string = 'static';

  instanceMethod(): void {}
  instanceField: string = 'instance';
}

class TestClassWithoutStaticMethods {
  instanceMethod(): void {}
  instanceField: string = 'instance';
}

class ParentClassWithStaticMethods {
  static parentStaticMethod(): void {}
}

class TestClassWithInheritedStaticMethods extends ParentClassWithStaticMethods {
  static inheritedStaticMethod(): void {}
}

interface TestInterface {
  method(): void;
}

export default function BuiltinsClassGetStaticMethodsTest(): void {
  describe("BuiltinsClassGetStaticMethodsTest", () => {
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
     * @tc.name    BuiltinsClassGetStaticMethodsTest0100
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_0100
     * @tc.desc    Verify getStaticMethods for primitive boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticMethodsTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolClass = Class.PRIMITIVE_BOOLEAN;
      const staticMethods = boolClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest0200
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_0200
     * @tc.desc    Verify getStaticMethods for primitive number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticMethodsTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numClass = Class.PRIMITIVE_NUMBER;
      const staticMethods = numClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest0300
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_0300
     * @tc.desc    Verify getStaticMethods for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassGetStaticMethodsTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strClass = Class.from<string>();
      const staticMethods = strClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest0400
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_0400
     * @tc.desc    Verify getStaticMethods for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodsTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objClass = Class.from<Object>();
      const staticMethods = objClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest0500
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_0500
     * @tc.desc    Verify getStaticMethods for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodsTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = [1, 2, 3];
      const arrClass = Class.of(arr);
      const staticMethods = arrClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest0600
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_0600
     * @tc.desc    Verify getStaticMethods for class with static methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodsTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const staticMethods = testClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();

      const methodNames: string[] = [];
      for (let i = 0; i < staticMethods!.length; i++) {
        methodNames.push(staticMethods![i].getName());
      }

      expect(methodNames.includes('staticMethod1')).assertTrue();
      expect(methodNames.includes('staticMethod2')).assertTrue();
      expect(methodNames.includes('staticMethod3')).assertTrue();
      expect(methodNames.includes('staticField')).assertFalse();
      expect(methodNames.includes('instanceMethod')).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest0700
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_0700
     * @tc.desc    Verify getStaticMethods for class without static methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodsTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithoutStaticMethods>();
      const staticMethods = testClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest0800
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_0800
     * @tc.desc    Verify getStaticMethods for class with inherited static methods
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodsTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithInheritedStaticMethods>();
      const staticMethods = testClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();

      const methodNames: string[] = [];
      for (let i = 0; i < staticMethods!.length; i++) {
        methodNames.push(staticMethods![i].getName());
      }

      expect(methodNames.includes('inheritedStaticMethod')).assertTrue();
      expect(methodNames.includes('parentStaticMethod')).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest0900
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_0900
     * @tc.desc    Verify getStaticMethods for interface
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodsTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      const staticMethods = interfaceClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest1000
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_1000
     * @tc.desc    Verify getStaticMethods for primitive byte type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodsTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const byteClass = Class.PRIMITIVE_BYTE;
      const staticMethods = byteClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest1100
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_1100
     * @tc.desc    Verify getStaticMethods for primitive short type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodsTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const shortClass = Class.PRIMITIVE_SHORT;
      const staticMethods = shortClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest1200
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_1200
     * @tc.desc    Verify getStaticMethods for primitive int type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodsTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intClass = Class.PRIMITIVE_INT;
      const staticMethods = intClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest1300
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_1300
     * @tc.desc    Verify getStaticMethods for primitive long type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodsTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const longClass = Class.PRIMITIVE_LONG;
      const staticMethods = longClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest1400
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_1400
     * @tc.desc    Verify getStaticMethods for primitive float type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodsTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const floatClass = Class.PRIMITIVE_FLOAT;
      const staticMethods = floatClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest1500
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_1500
     * @tc.desc    Verify getStaticMethods for primitive double type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodsTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const doubleClass = Class.PRIMITIVE_DOUBLE;
      const staticMethods = doubleClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest1600
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_1600
     * @tc.desc    Verify getStaticMethods return consistent results
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassGetStaticMethodsTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClassWithStaticMethods>();
      const staticMethods1 = testClass.getStaticMethods();
      const staticMethods2 = testClass.getStaticMethods();

      expect(staticMethods1 !== null).assertTrue();
      expect(staticMethods2 !== null).assertTrue();
      expect(staticMethods1!.length).assertEqual(staticMethods2!.length);

      for (let i = 0; i < staticMethods1!.length; i++) {
        expect(staticMethods1![i].getName()).assertEqual(staticMethods2![i].getName());
      }
    });

    /**
     * @tc.name    BuiltinsClassGetStaticMethodsTest1700
     * @tc.number  SUB_BUILTINS_CLASS_GET_STATIC_METHODS_TEST_1700
     * @tc.desc    Verify getStaticMethods for primitive char type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassGetStaticMethodsTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const charClass = Class.PRIMITIVE_CHAR;
      const staticMethods = charClass.getStaticMethods();
      expect(staticMethods !== null).assertTrue();
      expect(staticMethods!.length).assertEqual(0);
    });

  });
}
