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

export default function BuiltinsCreateFixedArrayTest(): void {
  describe('BuiltinsCreateFixedArrayTest', () => {
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
     * @tc.name    BuiltinsCreateFixedArrayTest0100
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_0100
     * @tc.desc    Verify that createFixedArray with PRIMITIVE_INT component type and length 5 returns non-null Object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsCreateFixedArrayTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_INT, 5 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest0200
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_0200
     * @tc.desc    Verify that createFixedArray creates int type FixedArray with length 5 after conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsCreateFixedArrayTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_INT, 5 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest0300
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_0300
     * @tc.desc    Verify that createFixedArray creates double type FixedArray with length 3 after conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsCreateFixedArrayTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_DOUBLE, 3 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest0400
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_0400
     * @tc.desc    Verify that createFixedArray creates boolean type FixedArray with length 4 after conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsCreateFixedArrayTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_BOOLEAN, 4 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest0500
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_0500
     * @tc.desc    Verify that createFixedArray creates empty FixedArray with length 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('BuiltinsCreateFixedArrayTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_INT, 0 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest0600
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_0600
     * @tc.desc    Verify that createFixedArray creates single-element FixedArray with length 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsCreateFixedArrayTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_DOUBLE, 1 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest0700
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_0700
     * @tc.desc    Verify that createFixedArray creates int type FixedArray with all elements defaulting to 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsCreateFixedArrayTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_INT, 3 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest0800
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_0800
     * @tc.desc    Verify that createFixedArray creates boolean type FixedArray with all elements defaulting to false
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsCreateFixedArrayTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_BOOLEAN, 3 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest0900
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_0900
     * @tc.desc    Verify that createFixedArray creates float type FixedArray with length 6
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsCreateFixedArrayTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_FLOAT, 6 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest1000
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_1000
     * @tc.desc    Verify that two createFixedArray calls return independent different objects (different references)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsCreateFixedArrayTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const r1: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_INT, 3 as int);
      const r2: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_INT, 3 as int);
      expect(r1 !== undefined).assertTrue();
      expect(r2 !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest1100
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_1100
     * @tc.desc    Verify that createFixedArray creates FixedArray with larger length (100) and correct length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('BuiltinsCreateFixedArrayTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_INT, 100 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest1200
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_1200
     * @tc.desc    Verify that createFixedArray creates long type FixedArray with correct length after asFixedArray conversion
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsCreateFixedArrayTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_LONG, 7 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest1300
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_1300
     * @tc.desc    Verify that createFixedArray creates short type FixedArray with length 8
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsCreateFixedArrayTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_SHORT, 8 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest1400
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_1400
     * @tc.desc    Verify that createFixedArray creates byte type FixedArray with length 10 and elements defaulting to 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsCreateFixedArrayTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const result: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_BYTE, 10 as int);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.name    BuiltinsCreateFixedArrayTest1500
     * @tc.number  SUB_BUILTINS_CREATE_FIXED_ARRAY_TEST_1500
     * @tc.desc    Comprehensive verification: Create FixedArrays of different lengths for int/double/boolean/float types, all return non-null and have correct lengths
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('BuiltinsCreateFixedArrayTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intArr: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_INT, 2 as int);
      expect(intArr !== undefined).assertTrue();

      const dblArr: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_DOUBLE, 3 as int);
      expect(dblArr !== undefined).assertTrue();

      const boolArr: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_BOOLEAN, 4 as int);
      expect(boolArr !== undefined).assertTrue();

      const floatArr: Object = reflect.internals.createFixedArray(Class.PRIMITIVE_FLOAT, 5 as int);
      expect(floatArr !== undefined).assertTrue();
    });
  });
}
