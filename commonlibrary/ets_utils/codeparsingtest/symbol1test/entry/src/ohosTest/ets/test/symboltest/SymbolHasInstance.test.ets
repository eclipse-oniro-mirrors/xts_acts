/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { SymbolHasInstanceStandaloneTestUtils } from './symbolHasInstanceStandaloneTests.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function symbolHasInstanceTest() {
  describe('symbolHasInstanceTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(50);
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
     * @tc.name   CustomInstanceOfBehaviorTest001
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_001
     * @tc.desc   Verify custom instanceof behavior via Symbol.hasInstance override
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomInstanceOfBehaviorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test001_CustomInstanceOfBehavior();
      expect(result).assertEqual("Test Passed: CustomInstanceOfBehaviorTest001");
    });

    /**
     * @tc.name   DefaultInstanceOfBehaviorTest002
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_002
     * @tc.desc   Verify default instanceof behavior without Symbol.hasInstance override
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DefaultInstanceOfBehaviorTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test002_DefaultInstanceOfBehavior();
      expect(result).assertEqual("Test Passed: DefaultInstanceOfBehaviorTest002");
    });

    /**
     * @tc.name   SymbolHasInstanceNonWritableTest003
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_003
     * @tc.desc   Verify Symbol.hasInstance is non-writable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceNonWritableTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test003_SymbolHasInstanceNonWritable();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceNonWritableTest003");
    });



    /**
     * @tc.name   SymbolHasInstanceNonConfigurableTest005
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_005
     * @tc.desc   Verify Symbol.hasInstance is non-configurable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceNonConfigurableTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test005_SymbolHasInstanceNonConfigurable();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceNonConfigurableTest005");
    });

    /**
     * @tc.name   SymbolHasInstanceNonObjectInputTest006
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_006
     * @tc.desc   Verify Symbol.hasInstance handles non-object inputs gracefully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceNonObjectInputTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test006_SymbolHasInstanceNonObjectInput();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceNonObjectInputTest006");
    });

    /**
     * @tc.name   SubclassInheritsSymbolHasInstanceTest007
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_007
     * @tc.desc   Verify subclass inherits parent's Symbol.hasInstance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SubclassInheritsSymbolHasInstanceTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test007_SubclassInheritsSymbolHasInstance();
      expect(result).assertEqual("Test Passed: SubclassInheritsSymbolHasInstanceTest007");
    });

    /**
     * @tc.name   BuiltInConstructorSymbolHasInstanceTest008
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_008
     * @tc.desc   Verify built-in constructors have non-writable Symbol.hasInstance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BuiltInConstructorSymbolHasInstanceTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test008_BuiltInConstructorSymbolHasInstance();
      expect(result).assertEqual("Test Passed: BuiltInConstructorSymbolHasInstanceTest008");
    });

    /**
     * @tc.name   SymbolHasInstanceComplexCheckTest009
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_009
     * @tc.desc   Verify Symbol.hasInstance implements complex type checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceComplexCheckTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test009_SymbolHasInstanceComplexCheck();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceComplexCheckTest009");
    });

    /**
     * @tc.name   SymbolHasInstanceIgnoresPrototypeTest010
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_010
     * @tc.desc   Verify Symbol.hasInstance override ignores prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceIgnoresPrototypeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test010_SymbolHasInstanceIgnoresPrototype();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceIgnoresPrototypeTest010");
    });


    /**
     * @tc.name   SymbolHasInstanceBooleanCoercionTest011
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_011
     * @tc.desc   Verify [Symbol.hasInstance] return value is coerced to boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceBooleanCoercionTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test011_SymbolHasInstanceBooleanCoercion();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceBooleanCoercionTest011");
    });


    /**
     * @tc.name   SubclassOverrideSymbolHasInstanceTest013
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_013
     * @tc.desc   Verify subclass can override parent's [Symbol.hasInstance]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SubclassOverrideSymbolHasInstanceTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test013_SubclassOverrideSymbolHasInstance();
      expect(result).assertEqual("Test Passed: SubclassOverrideSymbolHasInstanceTest013");
    });

    /**
     * @tc.name   SymbolHasInstanceNullUndefinedTest014
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_014
     * @tc.desc   Verify [Symbol.hasInstance] handles null/undefined gracefully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceNullUndefinedTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test014_SymbolHasInstanceNullUndefined();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceNullUndefinedTest014");
    });


    /**
     * @tc.name   SymbolHasInstanceArrayLikeTest016
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_016
     * @tc.desc   Verify [Symbol.hasInstance] identifies array-like objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceArrayLikeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test016_SymbolHasInstanceArrayLike();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceArrayLikeTest016");
    });

    /**
     * @tc.name   SymbolHasInstanceInstancePropertyTest017
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_017
     * @tc.desc   Verify instance [Symbol.hasInstance] is ignored
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceInstancePropertyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test017_SymbolHasInstanceInstanceProperty();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceInstancePropertyTest017");
    });

    /**
     * @tc.name   SymbolHasInstanceMultiLevelInheritanceTest018
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_018
     * @tc.desc   Verify [Symbol.hasInstance] works with multi-level inheritance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceMultiLevelInheritanceTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test018_SymbolHasInstanceMultiLevelInheritance();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceMultiLevelInheritanceTest018");
    });

    /**
     * @tc.name   SymbolHasInstanceStrictModeTest019
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_019
     * @tc.desc   Verify [Symbol.hasInstance] behavior is consistent in strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceStrictModeTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test019_SymbolHasInstanceStrictMode();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceStrictModeTest019");
    });

    /**
     * @tc.name   SymbolHasInstanceFrozenObjectTest020
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_020
     * @tc.desc   Verify [Symbol.hasInstance] works with frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceFrozenObjectTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test020_SymbolHasInstanceFrozenObject();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceFrozenObjectTest020");
    });

    /**
     * @tc.name   SymbolHasInstanceDynamicConditionTest021
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_021
     * @tc.desc   Verify [Symbol.hasInstance] supports dynamic conditions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceDynamicConditionTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test021_SymbolHasInstanceDynamicCondition();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceDynamicConditionTest021");
    });

    /**
     * @tc.name   SymbolHasInstanceWithToStringTest022
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_022
     * @tc.desc   Verify [Symbol.hasInstance] integrates with Object.prototype.toString
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceWithToStringTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test022_SymbolHasInstanceWithToString();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceWithToStringTest022");
    });

    /**
     * @tc.name   SymbolHasInstanceNonDeletableTest023
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_023
     * @tc.desc   Verify [Symbol.hasInstance] is non-deletable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceNonDeletableTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test023_SymbolHasInstanceNonDeletable();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceNonDeletableTest023");
    });

    /**
     * @tc.name   SymbolHasInstanceCircularReferenceTest024
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_024
     * @tc.desc   Verify [Symbol.hasInstance] handles circular reference objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceCircularReferenceTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test024_SymbolHasInstanceCircularReference();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceCircularReferenceTest024");
    });

    /**
     * @tc.name   SymbolHasInstanceBuiltInErrorTest025
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_025
     * @tc.desc   Verify [Symbol.hasInstance] checks specific built-in Error types
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceBuiltInErrorTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test025_SymbolHasInstanceBuiltInError();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceBuiltInErrorTest025");
    });

    /**
     * @tc.name   SymbolHasInstanceNonClassObjectTest026
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_026
     * @tc.desc   Verify non-class objects can have [Symbol.hasInstance]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceNonClassObjectTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test026_SymbolHasInstanceNonClassObject();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceNonClassObjectTest026");
    });

    /**
     * @tc.name   SymbolHasInstanceBatchCheckTest027
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_027
     * @tc.desc   Verify [Symbol.hasInstance] supports batch instance validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceBatchCheckTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test027_SymbolHasInstanceBatchCheck();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceBatchCheckTest027");
    });


    /**
     * @tc.name   SymbolHasInstanceSubclassPrototypeModifyTest029
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_029
     * @tc.desc   Verify subclass prototype modification doesn't affect [Symbol.hasInstance]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceSubclassPrototypeModifyTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test029_SymbolHasInstanceSubclassPrototypeModify();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceSubclassPrototypeModifyTest029");
    });

    /**
     * @tc.name   SymbolHasInstanceOptionalChainingTest030
     * @tc.number SUB_SYMBOL_HASINSTANCE_STANDALONE_TEST_030
     * @tc.desc   Verify [Symbol.hasInstance] uses optional chaining safely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolHasInstanceOptionalChainingTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolHasInstanceStandaloneTestUtils.test030_SymbolHasInstanceOptionalChaining();
      expect(result).assertEqual("Test Passed: SymbolHasInstanceOptionalChainingTest030");
    });

  })
}