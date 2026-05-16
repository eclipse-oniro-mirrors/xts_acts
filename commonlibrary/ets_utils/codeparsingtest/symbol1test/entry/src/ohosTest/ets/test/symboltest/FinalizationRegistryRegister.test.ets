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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

import { FinalizationRegistryRegisterUtils } from './finalizationRegistryRegisterUtils.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function finalizationRegistryRegisterTest() {
  describe('FinalizationRegistryRegisterTest', () => {
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
     * @tc.name   ValidRegisterObjectTargetTest001
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_001
     * @tc.desc   Verify valid registration: target is object, heldValue is string (no unregisterToken)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterObjectTargetTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test001_ValidRegisterObjectTarget();
      expect(result).assertEqual("Test Passed: ValidRegisterObjectTargetTest001");
    });

    /**
     * @tc.name   ValidRegisterSymbolTargetTest002
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_002
     * @tc.desc   Verify valid registration: target is non-registered Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterSymbolTargetTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test002_ValidRegisterSymbolTarget();
      expect(result).assertEqual("Test Passed: ValidRegisterSymbolTargetTest002");
    });

    /**
     * @tc.name   InvalidRegisterHeldValueEqualsTargetTest003
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_003
     * @tc.desc   Verify invalid registration: heldValue equals target (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidRegisterHeldValueEqualsTargetTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test003_InvalidRegisterHeldValueEqualsTarget();
      expect(result).assertEqual("Test Passed: InvalidRegisterHeldValueEqualsTargetTest003");
    });

    /**
     * @tc.name   ValidRegisterWithObjectTokenTest004
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_004
     * @tc.desc   Verify valid registration: unregisterToken is object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterWithObjectTokenTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test004_ValidRegisterWithObjectToken();
      expect(result).assertEqual("Test Passed: ValidRegisterWithObjectTokenTest004");
    });

    /**
     * @tc.name   ValidRegisterWithSymbolTokenTest005
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_005
     * @tc.desc   Verify valid registration: unregisterToken is non-registered Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterWithSymbolTokenTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test005_ValidRegisterWithSymbolToken();
      expect(result).assertEqual("Test Passed: ValidRegisterWithSymbolTokenTest005");
    });

    /**
     * @tc.name   InvalidRegisterPrimitiveTargetTest006
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_006
     * @tc.desc   Verify invalid registration: target is primitive type (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidRegisterPrimitiveTargetTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test006_InvalidRegisterPrimitiveTarget();
      expect(result).assertEqual("Test Passed: InvalidRegisterPrimitiveTargetTest006");
    });

    /**
     * @tc.name   InvalidRegisterPrimitiveTokenTest007
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_007
     * @tc.desc   Verify invalid registration: unregisterToken is primitive type (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidRegisterPrimitiveTokenTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test007_InvalidRegisterPrimitiveToken();
      expect(result).assertEqual("Test Passed: InvalidRegisterPrimitiveTokenTest007");
    });

    /**
     * @tc.name   ValidRegisterWithoutTokenTest008
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_008
     * @tc.desc   Verify valid registration: no unregisterToken (returns undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterWithoutTokenTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test008_ValidRegisterWithoutToken();
      expect(result).assertEqual("Test Passed: ValidRegisterWithoutTokenTest008");
    });

    /**
     * @tc.name   ValidRegisterHeldValueAsObjectTest009
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_009
     * @tc.desc   Verify valid registration: heldValue is object (not target)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterHeldValueAsObjectTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test009_ValidRegisterHeldValueAsObject();
      expect(result).assertEqual("Test Passed: ValidRegisterHeldValueAsObjectTest009");
    });

    /**
     * @tc.name   ValidRegisterSameTargetMultipleTimesTest010
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_010
     * @tc.desc   Verify valid registration: same target registered multiple times
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterSameTargetMultipleTimesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test010_ValidRegisterSameTargetMultipleTimes();
      expect(result).assertEqual("Test Passed: ValidRegisterSameTargetMultipleTimesTest010");
    });

    /**
     * @tc.name   ValidRegisterHeldValueAsUndefinedTest011
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_011
     * @tc.desc   Verify valid registration: heldValue is undefined (different from target)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterHeldValueAsUndefinedTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test011_ValidRegisterHeldValueAsUndefined();
      expect(result).assertEqual("Test Passed: ValidRegisterHeldValueAsUndefinedTest011");
    });

    /**
     * @tc.name   InvalidRegisterTokenAsNullTest012
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_012
     * @tc.desc   Verify invalid registration: unregisterToken is null (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidRegisterTokenAsNullTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test012_InvalidRegisterTokenAsNull();
      expect(result).assertEqual("Test Passed: InvalidRegisterTokenAsNullTest012");
    });

    /**
     * @tc.name   ValidRegisterTargetAsArrayTest013
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_013
     * @tc.desc   Verify valid registration: target is Array instance (object type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterTargetAsArrayTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test013_ValidRegisterTargetAsArray();
      expect(result).assertEqual("Test Passed: ValidRegisterTargetAsArrayTest013");
    });

    /**
     * @tc.name   ValidRegisterSameTargetDifferentTokensTest014
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_014
     * @tc.desc   Verify valid registration: same target with different tokens (last token effective)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterSameTargetDifferentTokensTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test014_ValidRegisterSameTargetDifferentTokens();
      expect(result).assertEqual("Test Passed: ValidRegisterSameTargetDifferentTokensTest014");
    });

    /**
     * @tc.name   ValidRegisterHeldValueCircularTest015
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_015
     * @tc.desc   Verify valid registration: heldValue is circular object (different from target)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterHeldValueCircularTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test015_ValidRegisterHeldValueCircular();
      expect(result).assertEqual("Test Passed: ValidRegisterHeldValueCircularTest015");
    });

    /**
     * @tc.name   RegisterReturnValueAlwaysUndefinedTest016
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_016
     * @tc.desc   Verify register() always returns undefined regardless of parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegisterReturnValueAlwaysUndefinedTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test016_RegisterReturnValueAlwaysUndefined();
      expect(result).assertEqual("Test Passed: RegisterReturnValueAlwaysUndefinedTest016");
    });

    /**
     * @tc.name   ValidRegisterTargetAsFrozenObjectTest017
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_017
     * @tc.desc   Verify valid registration: target is frozen object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterTargetAsFrozenObjectTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test017_ValidRegisterTargetAsFrozenObject();
      expect(result).assertEqual("Test Passed: ValidRegisterTargetAsFrozenObjectTest017");
    });


    /**
     * @tc.name   ValidRegisterHeldValueAsBigIntTest019
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_019
     * @tc.desc   Verify valid registration: heldValue is BigInt (different from target)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterHeldValueAsBigIntTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test019_ValidRegisterHeldValueAsBigInt();
      expect(result).assertEqual("Test Passed: ValidRegisterHeldValueAsBigIntTest019");
    });

    /**
     * @tc.name   ValidRegisterTokenAsFrozenObjectTest020
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_020
     * @tc.desc   Verify valid registration: unregisterToken is frozen object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterTokenAsFrozenObjectTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test020_ValidRegisterTokenAsFrozenObject();
      expect(result).assertEqual("Test Passed: ValidRegisterTokenAsFrozenObjectTest020");
    });

    /**
     * @tc.name   ValidRegisterTargetAsDateTest021
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_021
     * @tc.desc   Verify valid registration: target is Date instance (object type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterTargetAsDateTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test021_ValidRegisterTargetAsDate();
      expect(result).assertEqual("Test Passed: ValidRegisterTargetAsDateTest021");
    });

    /**
     * @tc.name   InvalidRegisterTargetAsUndefinedTest022
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_022
     * @tc.desc   Verify invalid registration: target is undefined (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidRegisterTargetAsUndefinedTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test022_InvalidRegisterTargetAsUndefined();
      expect(result).assertEqual("Test Passed: InvalidRegisterTargetAsUndefinedTest022");
    });

    /**
     * @tc.name   ValidRegisterHeldValueAsRegExpTest023
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_023
     * @tc.desc   Verify valid registration: heldValue is RegExp instance (different from target)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterHeldValueAsRegExpTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test023_ValidRegisterHeldValueAsRegExp();
      expect(result).assertEqual("Test Passed: ValidRegisterHeldValueAsRegExpTest023");
    });

    /**
     * @tc.name   ValidRegisterMultipleTargetsWithSameTokenTest024
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_024
     * @tc.desc   Verify valid registration: multiple targets with same unregisterToken
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterMultipleTargetsWithSameTokenTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test024_ValidRegisterMultipleTargetsWithSameToken();
      expect(result).assertEqual("Test Passed: ValidRegisterMultipleTargetsWithSameTokenTest024");
    });

    /**
     * @tc.name   InvalidRegisterThisBindingTest025
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_025
     * @tc.desc   Verify invalid registration: incorrect this binding for register method (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidRegisterThisBindingTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test025_InvalidRegisterThisBinding();
      expect(result).assertEqual("Test Passed: InvalidRegisterThisBindingTest025");
    });

    /**
     * @tc.name   ValidRegisterTargetAsClassInstanceTest026
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_026
     * @tc.desc   Verify valid registration: target is custom class instance (object type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterTargetAsClassInstanceTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test026_ValidRegisterTargetAsClassInstance();
      expect(result).assertEqual("Test Passed: ValidRegisterTargetAsClassInstanceTest026");
    });

    /**
     * @tc.name   ValidRegisterHeldValueAsFunctionTest027
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_027
     * @tc.desc   Verify valid registration: heldValue is function (different from target)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterHeldValueAsFunctionTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test027_ValidRegisterHeldValueAsFunction();
      expect(result).assertEqual("Test Passed: ValidRegisterHeldValueAsFunctionTest027");
    });

    /**
     * @tc.name   ValidRegisterTokenAsFrozenSymbolTest029
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_029
     * @tc.desc   Verify valid registration: unregisterToken is frozen non-registered Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterTokenAsFrozenSymbolTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test029_ValidRegisterTokenAsFrozenSymbol();
      expect(result).assertEqual("Test Passed: ValidRegisterTokenAsFrozenSymbolTest029");
    });

    /**
     * @tc.name   ValidRegisterTargetAsRegExpTest030
     * @tc.number SUB_FINALIZATION_REGISTRY_REGISTER_TEST_030
     * @tc.desc   Verify valid registration: target is RegExp instance (object type)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRegisterTargetAsRegExpTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryRegisterUtils.test030_ValidRegisterTargetAsRegExp();
      expect(result).assertEqual("Test Passed: ValidRegisterTargetAsRegExpTest030");
    });
  })
}