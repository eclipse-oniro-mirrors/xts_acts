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

export default function BuiltinsClassOfAnyTest(): void {
  describe("BuiltinsClassOfAnyTest", () => {
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
     * @tc.name    BuiltinsClassOfAnyTest0100
     * @tc.number  SUB_BUILTINS_CLASS_OF_ANY_TEST_0100
     * @tc.desc    Verify ofAny for boolean type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfAnyTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const boolValue = true;
      const boolClass = Class.ofAny(boolValue);
      expect(boolClass !== null).assertTrue();
      if (boolClass !== undefined) {
        expect(boolClass.getName()).assertEqual('std.core.Boolean');
      }
    });

    /**
     * @tc.name    BuiltinsClassOfAnyTest0200
     * @tc.number  SUB_BUILTINS_CLASS_OF_ANY_TEST_0200
     * @tc.desc    Verify ofAny for number type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfAnyTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const numValue = 123;
      const numClass = Class.ofAny(numValue);
      expect(numClass !== null).assertTrue();
      if (numClass !== undefined) {
        expect(numClass.getName()).assertEqual('std.core.Int');
      }
    });

    /**
     * @tc.name    BuiltinsClassOfAnyTest0300
     * @tc.number  SUB_BUILTINS_CLASS_OF_ANY_TEST_0300
     * @tc.desc    Verify ofAny for string type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsClassOfAnyTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const strValue = 'test';
      const strClass = Class.ofAny(strValue);
      expect(strClass !== null).assertTrue();
      if (strClass !== undefined) {
        expect(strClass.getName()).assertEqual('std.core.String');
      }
    });

    /**
     * @tc.name    BuiltinsClassOfAnyTest0400
     * @tc.number  SUB_BUILTINS_CLASS_OF_ANY_TEST_0400
     * @tc.desc    Verify ofAny for object type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfAnyTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const objValue = new Object();
      const objClass = Class.ofAny(objValue);
      expect(objClass !== null).assertTrue();
      if (objClass !== undefined) {
        expect(objClass.getName()).assertEqual('std.core.Object');
      }
    });

    /**
     * @tc.name    BuiltinsClassOfAnyTest0500
     * @tc.number  SUB_BUILTINS_CLASS_OF_ANY_TEST_0500
     * @tc.desc    Verify ofAny for array type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfAnyTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arrValue = new Array<number>();
      const arrClass = Class.ofAny(arrValue);
      expect(arrClass !== null).assertTrue();
      if (arrClass !== undefined) {
        expect(arrClass.getName()).assertEqual('std.core.Array');
      }
    });

    /**
     * @tc.name    BuiltinsClassOfAnyTest0600
     * @tc.number  SUB_BUILTINS_CLASS_OF_ANY_TEST_0600
     * @tc.desc    Verify ofAny for custom class type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsClassOfAnyTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const testValue = new TestClass();
      const testClass = Class.ofAny(testValue);
      expect(testClass !== null).assertTrue();
      if (testClass !== undefined) {
        const className = testClass.getName();
        expect(className.endsWith('.TestClass')).assertTrue();
      }
    });

    /**
     * @tc.name    BuiltinsClassOfAnyTest0700
     * @tc.number  SUB_BUILTINS_CLASS_OF_ANY_TEST_0700
     * @tc.desc    Verify ofAny for null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassOfAnyTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nullValue = null;
      const nullClass = Class.ofAny(nullValue);
      expect(nullClass !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsClassOfAnyTest0800
     * @tc.number  SUB_BUILTINS_CLASS_OF_ANY_TEST_0800
     * @tc.desc    Verify ofAny for undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsClassOfAnyTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const undefinedValue = undefined;
      const undefinedClass = Class.ofAny(undefinedValue);
      expect(undefinedClass).assertUndefined()
    });

  })
}
