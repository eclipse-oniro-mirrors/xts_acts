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

class TestClass {}

class TestSubClass extends TestClass {}
type TestUnionType = string | number | boolean;
interface TestInterface {
  method(): void;
}

export default function BuiltinsClassFromTest(): void {
  describe("BuiltinsClassFromTest", () => {
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
     * @tc.name    BuiltinsClassFromTest0100
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_0100
     * @tc.desc    Verify from<T>() for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassFromTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const booleanClass = Class.from<boolean>();
      expect(booleanClass !== null).assertTrue();
      expect(booleanClass.getName()).assertEqual('std.core.Boolean');
    });

    /**
     * @tc.name    BuiltinsClassFromTest0200
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_0200
     * @tc.desc    Verify from<T>() for number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassFromTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numberClass = Class.from<number>();
      expect(numberClass !== null).assertTrue();
      expect(numberClass.getName()).assertEqual('std.core.Double');
    });

    /**
     * @tc.name    BuiltinsClassFromTest0300
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_0300
     * @tc.desc    Verify from<T>() for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassFromTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const stringClass = Class.from<string>();
      expect(stringClass !== null).assertTrue();
      expect(stringClass.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.name    BuiltinsClassFromTest0400
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_0400
     * @tc.desc    Verify from<T>() for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassFromTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objectClass = Class.from<Object>();
      expect(objectClass !== null).assertTrue();
      expect(objectClass.getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.name    BuiltinsClassFromTest0500
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_0500
     * @tc.desc    Verify from<T>() for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassFromTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrayClass = Class.from<Array<number>>();
      expect(arrayClass !== null).assertTrue();

      const className = arrayClass.getName();
      expect(className.includes('Array')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassFromTest0600
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_0600
     * @tc.desc    Verify from<T>() for custom class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassFromTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testClass = Class.from<TestClass>();
      expect(testClass !== null).assertTrue();

      const className = testClass.getName();
      expect(className.includes('TestClass')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassFromTest0700
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_0700
     * @tc.desc    Verify from<T>() for subclass type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassFromTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const subClass = Class.from<TestSubClass>();

      expect(subClass !== null).assertTrue();

      const className = subClass.getName();
      expect(className.endsWith('TestSubClass')).assertTrue();

      const parentClass = Class.from<TestClass>();
      expect(subClass.isSubtypeOf(parentClass)).assertTrue();
      expect(parentClass.isSubtypeOf(subClass)).assertFalse();
    });

    /**
     * @tc.name    BuiltinsClassFromTest0800
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_0800
     * @tc.desc    Verify from<T>() for null type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassFromTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullClass = Class.from<null>();
      expect(nullClass !== null).assertTrue();
      expect(nullClass.getName()).assertEqual('std.core.Null');
    });

    /**
     * @tc.name    BuiltinsClassFromTest0900
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_0900
     * @tc.desc    Verify from<T>() for interface type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassFromTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const interfaceClass = Class.from<TestInterface>();
      expect(interfaceClass !== null).assertTrue();

      const className = interfaceClass.getName();
      expect(className.includes('TestInterface')).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassFromTest1000
     * @tc.number  SUB_BUILTINS_CLASS_FROM_TEST_1000
     * @tc.desc    Verify from<T>() for union type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassFromTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const unionClass = Class.from<TestUnionType>();
      expect(unionClass !== null).assertTrue();

      const className = unionClass.getName();
      expect(className.includes('union')).assertFalse();
    });

  })
}
