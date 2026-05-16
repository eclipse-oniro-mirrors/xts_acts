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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

import { FinalizationRegistryConstructorUtils } from './finalizationRegistryConstructorUtils.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function finalizationRegistryConstructorTest() {
  describe('FinalizationRegistryConstructorTest', () => {
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
     * @tc.name   MustUseNewConstructorTest001
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_001
     * @tc.desc   Verify FinalizationRegistry must be constructed with new (direct call throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MustUseNewConstructorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test001_MustUseNewConstructor();
      expect(result).assertEqual("Test Passed: MustUseNewConstructorTest001");
    });

    /**
     * @tc.name   ConstructorParamMustBeFunctionTest002
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_002
     * @tc.desc   Verify constructor parameter must be function (non-function throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConstructorParamMustBeFunctionTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test002_ConstructorParamMustBeFunction();
      expect(result).assertEqual("Test Passed: ConstructorParamMustBeFunctionTest002");
    });

    /**
     * @tc.name   ConstructorCreatesValidInstanceTest003
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_003
     * @tc.desc   Verify constructor creates valid FinalizationRegistry instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConstructorCreatesValidInstanceTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test003_ConstructorCreatesValidInstance();
      expect(result).assertEqual("Test Passed: ConstructorCreatesValidInstanceTest003");
    });

    /**
     * @tc.name   CallbackReceivesHeldValueTest004
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_004
     * @tc.desc   Verify callback function receives heldValue parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CallbackReceivesHeldValueTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test004_CallbackReceivesHeldValue();
      expect(result).assertEqual("Test Passed: CallbackReceivesHeldValueTest004");
    });

    /**
     * @tc.name   CallbackReturnValueIgnoredTest005
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_005
     * @tc.desc   Verify callback function return value is ignored
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CallbackReturnValueIgnoredTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test005_CallbackReturnValueIgnored();
      expect(result).assertEqual("Test Passed: CallbackReturnValueIgnoredTest005");
    });

    /**
     * @tc.name   NoParamConstructorThrowsTest006
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_006
     * @tc.desc   Verify constructor throws TypeError when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NoParamConstructorThrowsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test006_NoParamConstructorThrows();
      expect(result).assertEqual("Test Passed: NoParamConstructorThrowsTest006");
    });

    /**
     * @tc.name   ArrowFunctionAsCallbackTest007
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_007
     * @tc.desc   Verify arrow function can be used as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrowFunctionAsCallbackTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test007_ArrowFunctionAsCallback();
      expect(result).assertEqual("Test Passed: ArrowFunctionAsCallbackTest007");
    });

    /**
     * @tc.name   MultipleInstancesIndependentTest008
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_008
     * @tc.desc   Verify multiple FinalizationRegistry instances are independent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleInstancesIndependentTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test008_MultipleInstancesIndependent();
      expect(result).assertEqual("Test Passed: MultipleInstancesIndependentTest008");
    });


    /**
     * @tc.name   AsyncFunctionAsCallbackTest010
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_010
     * @tc.desc   Verify async function can be used as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncFunctionAsCallbackTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test010_AsyncFunctionAsCallback();
      expect(result).assertEqual("Test Passed: AsyncFunctionAsCallbackTest010");
    });


    /**
     * @tc.name   ObjectMethodAsCallbackTest013
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_013
     * @tc.desc   Verify object method can be used as callback function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ObjectMethodAsCallbackTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test013_ObjectMethodAsCallback();
      expect(result).assertEqual("Test Passed: ObjectMethodAsCallbackTest013");
    });

    /**
     * @tc.name   ConstructorWithExtraParamsTest014
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_014
     * @tc.desc   Verify constructor ignores extra parameters (only first param is effective)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConstructorWithExtraParamsTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test014_ConstructorWithExtraParams();
      expect(result).assertEqual("Test Passed: ConstructorWithExtraParamsTest014");
    });

    /**
     * @tc.name   CallbackModifiedAfterInstanceCreationTest015
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_015
     * @tc.desc   Verify modifying callback reference after instance creation doesn't affect registered logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CallbackModifiedAfterInstanceCreationTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test015_CallbackModifiedAfterInstanceCreation();
      expect(result).assertEqual("Test Passed: CallbackModifiedAfterInstanceCreationTest015");
    });

    /**
     * @tc.name   PrototypeMethodsNonEnumerableTest016
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_016
     * @tc.desc   Verify prototype methods (register/unregister) are non-enumerable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PrototypeMethodsNonEnumerableTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test016_PrototypeMethodsNonEnumerable();
      expect(result).assertEqual("Test Passed: PrototypeMethodsNonEnumerableTest016");
    });

    /**
     * @tc.name   ClassInstanceMethodAsCallbackTest017
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_017
     * @tc.desc   Verify ES6 class instance method can be used as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ClassInstanceMethodAsCallbackTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test017_ClassInstanceMethodAsCallback();
      expect(result).assertEqual("Test Passed: ClassInstanceMethodAsCallbackTest017");
    });

    /**
     * @tc.name   GeneratorFunctionAsCallbackTest018
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_018
     * @tc.desc   Verify generator function can be used as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('GeneratorFunctionAsCallbackTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test018_GeneratorFunctionAsCallback();
      expect(result).assertEqual("Test Passed: GeneratorFunctionAsCallbackTest018");
    });


    /**
     * @tc.name   RegisterMethodFromPrototypeTest020
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_020
     * @tc.desc   Verify instance's register method is from FinalizationRegistry.prototype
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegisterMethodFromPrototypeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test020_RegisterMethodFromPrototype();
      expect(result).assertEqual("Test Passed: RegisterMethodFromPrototypeTest020");
    });

    /**
     * @tc.name   ConstructorNamePropertyTest021
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_021
     * @tc.desc   Verify FinalizationRegistry constructor has correct name property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConstructorNamePropertyTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test021_ConstructorNameProperty();
      expect(result).assertEqual("Test Passed: ConstructorNamePropertyTest021");
    });

    /**
     * @tc.name   ClosureCallbackRetainsStateTest022
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_022
     * @tc.desc   Verify closure callback retains external variable state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ClosureCallbackRetainsStateTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test022_ClosureCallbackRetainsState();
      expect(result).assertEqual("Test Passed: ClosureCallbackRetainsStateTest022");
    });


    /**
     * @tc.name   AsyncGeneratorFunctionAsCallbackTest025
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_025
     * @tc.desc   Verify async generator function can be used as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AsyncGeneratorFunctionAsCallbackTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test025_AsyncGeneratorFunctionAsCallback();
      expect(result).assertEqual("Test Passed: AsyncGeneratorFunctionAsCallbackTest025");
    });


    /**
     * @tc.name   NamedFunctionExpressionAsCallbackTest027
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_027
     * @tc.desc   Verify named function expression can be used as callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NamedFunctionExpressionAsCallbackTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test027_NamedFunctionExpressionAsCallback();
      expect(result).assertEqual("Test Passed: NamedFunctionExpressionAsCallbackTest027");
    });

    /**
     * @tc.name   CoreMethodsUndeletableTest028
     * @tc.number SUB_FINALIZATION_REGISTRY_CONSTRUCTOR_TEST_028
     * @tc.desc   Verify core methods (register/unregister) cannot be deleted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CoreMethodsUndeletableTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryConstructorUtils.test028_CoreMethodsUndeletable();
      expect(result).assertEqual("Test Passed: CoreMethodsUndeletableTest028");
    });


  })
}