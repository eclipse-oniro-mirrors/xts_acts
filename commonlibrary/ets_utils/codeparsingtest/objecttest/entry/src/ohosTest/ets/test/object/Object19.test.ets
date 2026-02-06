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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import {
  test10_ObjectAssignWithGetOnly,
  test11_DefinePropertyWithNumber,
  test12_DefinePropertyWithNegativeNumber,
  test13_DefinePropertyGetOnly,
  test14_DefinePropertySetOnly,
  test15_SpreadOperatorWithNumberAccessors,
  test16_SpreadMultipleObjects,
  test17_ObjectCreateWithNumberAccessors,
  test18_ObjectCreateShadowProperty,
  test19_JSONStringifyWithNumberGetter,
  test1_BasicNumberProperty,
  test20_JSONStringifyWithValue,
  test21_ForInWithNumberAccessors,
  test22_ObjectKeysWithNumberAccessors,
  test23_GetOwnPropertyDescriptor,
  test24_PropertyDescriptorForDefinedAccessor,
  test25_ObjectEntriesWithNumberAccessors,
  test26_ObjectValuesWithNumberAccessors,
  test27_ObjectFromEntriesWithNumber,
  test28_SameNumberDifferentProperties,
  test29_ArrayLikeObjectWithNumberSetter,
  test2_LargeNumberProperty,
  test30_ClassWithNumberAccessors,
  test3_NegativeNumberProperty,
  test4_DecimalNumberProperty,
  test5_ZeroProperty,
  test6_ObjectAssignDoesNotCopyAccessors,
  test7_ObjectAssignMultipleSources,
  test8_ObjectAssignToExistingObject,
  test9_ObjectAssignAfterSettingValue,
} from './Object19';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object19Test() {
  describe('Object19Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.name   Object19Test001
     * @tc.number SUB_BUILTINS_Object19_TEST_0001
     * @tc.desc   test basic number property setter/getter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test1_BasicNumberProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test002
     * @tc.number SUB_BUILTINS_Object19_TEST_0002
     * @tc.desc   test large number as property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test2_LargeNumberProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test003
     * @tc.number SUB_BUILTINS_Object19_TEST_0003
     * @tc.desc   test negative number as property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test3_NegativeNumberProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test004
     * @tc.number SUB_BUILTINS_Object19_TEST_0004
     * @tc.desc   test decimal number as property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test4_DecimalNumberProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test005
     * @tc.number SUB_BUILTINS_Object19_TEST_0005
     * @tc.desc   test zero as property name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test5_ZeroProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test006
     * @tc.number SUB_BUILTINS_Object19_TEST_0006
     * @tc.desc   test Object.assign does not copy accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test6_ObjectAssignDoesNotCopyAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test007
     * @tc.number SUB_BUILTINS_Object19_TEST_0007
     * @tc.desc   test Object.assign with multiple sources containing number properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test7_ObjectAssignMultipleSources();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test008
     * @tc.number SUB_BUILTINS_Object19_TEST_0008
     * @tc.desc   test Object.assign to existing object with number setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test8_ObjectAssignToExistingObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test009
     * @tc.number SUB_BUILTINS_Object19_TEST_0009
     * @tc.desc   test Object.assign copies value not getter/setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test9_ObjectAssignAfterSettingValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test010
     * @tc.number SUB_BUILTINS_Object19_TEST_0010
     * @tc.desc   test Object.assign with get-only number property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test10_ObjectAssignWithGetOnly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test011
     * @tc.number SUB_BUILTINS_Object19_TEST_0011
     * @tc.desc   test Object.defineProperty with number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test11_DefinePropertyWithNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test012
     * @tc.number SUB_BUILTINS_Object19_TEST_0012
     * @tc.desc   test Object.defineProperty with negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test12_DefinePropertyWithNegativeNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test013
     * @tc.number SUB_BUILTINS_Object19_TEST_0013
     * @tc.desc   test get-only property defined by Object.defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test13_DefinePropertyGetOnly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test014
     * @tc.number SUB_BUILTINS_Object19_TEST_0014
     * @tc.desc   test set-only property defined by Object.defineProperty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test14_DefinePropertySetOnly();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test015
     * @tc.number SUB_BUILTINS_Object19_TEST_0015
     * @tc.desc   test spread operator with number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test15_SpreadOperatorWithNumberAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test016
     * @tc.number SUB_BUILTINS_Object19_TEST_0016
     * @tc.desc   test spread operator with multiple objects containing number properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test16_SpreadMultipleObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test017
     * @tc.number SUB_BUILTINS_Object19_TEST_0017
     * @tc.desc   test Object.create with number accessors in prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test17_ObjectCreateWithNumberAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test018
     * @tc.number SUB_BUILTINS_Object19_TEST_0018
     * @tc.desc   test shadowing properties in Object.create
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test18_ObjectCreateShadowProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test019
     * @tc.number SUB_BUILTINS_Object19_TEST_0019
     * @tc.desc   test JSON.stringify with number getters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test19_JSONStringifyWithNumberGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test020
     * @tc.number SUB_BUILTINS_Object19_TEST_0020
     * @tc.desc   test JSON.stringify with internal values of number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test20_JSONStringifyWithValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test021
     * @tc.number SUB_BUILTINS_Object19_TEST_0021
     * @tc.desc   test for...in enumeration with number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test21_ForInWithNumberAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test022
     * @tc.number SUB_BUILTINS_Object19_TEST_0022
     * @tc.desc   test Object.keys with number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test22_ObjectKeysWithNumberAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test023
     * @tc.number SUB_BUILTINS_Object19_TEST_0023
     * @tc.desc   test Object.getOwnPropertyDescriptor with number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test23_GetOwnPropertyDescriptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test024
     * @tc.number SUB_BUILTINS_Object19_TEST_0024
     * @tc.desc   test property descriptor for defined number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test24_PropertyDescriptorForDefinedAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test025
     * @tc.number SUB_BUILTINS_Object19_TEST_0025
     * @tc.desc   test Object.entries with number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test25_ObjectEntriesWithNumberAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test026
     * @tc.number SUB_BUILTINS_Object19_TEST_0026
     * @tc.desc   test Object.values with number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test26_ObjectValuesWithNumberAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test027
     * @tc.number SUB_BUILTINS_Object19_TEST_0027
     * @tc.desc   test Object.fromEntries with number keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test27_ObjectFromEntriesWithNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test028
     * @tc.number SUB_BUILTINS_Object19_TEST_0028
     * @tc.desc   test same number different properties (setter vs string property)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test28_SameNumberDifferentProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test029
     * @tc.number SUB_BUILTINS_Object19_TEST_0029
     * @tc.desc   test array-like object with number setter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test29_ArrayLikeObjectWithNumberSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object19Test030
     * @tc.number SUB_BUILTINS_Object19_TEST_0030
     * @tc.desc   test class with number accessors
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object19Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = test30_ClassWithNumberAccessors();
      expect(result).assertEqual(true);
    });

  })
}