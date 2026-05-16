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

export default function BuiltinsClassCurrentTest(): void {
  describe("BuiltinsClassCurrentTest", () => {
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
     * @tc.name    BuiltinsClassCurrentTest0100
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_0100
     * @tc.desc    Verify current() returns a non-null Class instance
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassCurrentTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const currentClass = Class.current();
      expect(currentClass !== undefined && currentClass !== null).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassCurrentTest0200
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_0200
     * @tc.desc    Verify current() returns the same instance when called multiple times
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCurrentTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass1 = Class.current();
      const currentClass2 = Class.current();
      const currentClass3 = Class.current();

      expect(currentClass1).assertEqual(currentClass2);
      expect(currentClass2).assertEqual(currentClass3);
    });

    /**
     * @tc.name    BuiltinsClassCurrentTest0300
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_0300
     * @tc.desc    Verify current() returns a Class instance with valid name
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCurrentTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const className = currentClass.getName();

      expect(className !== undefined && className !== null).assertTrue();
      expect(typeof className).assertEqual('string');
      expect(className.length > 0).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassCurrentTest0400
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_0400
     * @tc.desc    Verify current() returns a Class instance with correct isSubtypeOf behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassCurrentTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const currentClass = Class.current();
      expect(currentClass.isSubtypeOf(currentClass)).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassCurrentTest0500
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_0500
     * @tc.desc    Verify current() returns a Class instance with correct getInterfaces behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCurrentTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const interfaces = currentClass.getInterfaces();
      expect(interfaces !== undefined).assertTrue();
      expect(interfaces.length).assertEqual(0);
    });

    /**
     * @tc.name    BuiltinsClassCurrentTest0600
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_0600
     * @tc.desc    Verify current() returns a Class instance with correct getLinker behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCurrentTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const linker = currentClass.getLinker();
      expect(linker !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassCurrentTest0700
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_0700
     * @tc.desc    Verify current() returns a Class instance with correct isNamespace behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCurrentTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      expect(typeof currentClass.isNamespace()).assertEqual('boolean');
    });

    /**
     * @tc.name    BuiltinsClassCurrentTest0800
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_0800
     * @tc.desc    Verify current() returns a Class instance with correct initialize behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCurrentTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      let error: Error | null = null;
      try {
        currentClass.initialize();
      } catch (e) {
        error = e;
      }
      expect(error).assertEqual(null);
    });

    /**
     * @tc.name    BuiltinsClassCurrentTest0900
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_0900
     * @tc.desc    Verify current() returns a Class instance with correct getFixedArrayComponentType behavior
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassCurrentTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const currentClass = Class.current();
      const componentType = currentClass.getFixedArrayComponentType();
      expect(componentType).assertEqual(undefined);
    });

    /**
     * @tc.name    BuiltinsClassCurrentTest1000
     * @tc.number  SUB_BUILTINS_CLASS_CURRENT_TEST_1000
     * @tc.desc    Verify current() returns Class that can be used with isSubtypeOf
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassCurrentTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const currentClass = Class.current();
      const objectClass = Class.of(new Object());

      const isSubtype = currentClass.isSubtypeOf(objectClass);
      expect(typeof isSubtype).assertEqual('boolean');
    });

  })
}
