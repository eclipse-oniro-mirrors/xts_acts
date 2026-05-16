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

import { FinalizationRegistryUnregisterUtils } from './finalizationRegistryUnregisterUtils.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function finalizationRegistryUnregisterTest() {
  describe('FinalizationUnregisterRegisterTest', () => {
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
     * @tc.name   ValidUnregisterWithObjectTokenTest001
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_001
     * @tc.desc   Verify valid unregistration: use object token from registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithObjectTokenTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test001_ValidUnregisterWithObjectToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithObjectTokenTest001");
    });

    /**
     * @tc.name   ValidUnregisterWithSymbolTokenTest002
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_002
     * @tc.desc   Verify valid unregistration: use non-registered Symbol token from registration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithSymbolTokenTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test002_ValidUnregisterWithSymbolToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithSymbolTokenTest002");
    });

    /**
     * @tc.name   InvalidUnregisterWithPrimitiveTokenTest003
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_003
     * @tc.desc   Verify invalid unregistration: primitive type token (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidUnregisterWithPrimitiveTokenTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test003_InvalidUnregisterWithPrimitiveToken();
      expect(result).assertEqual("Test Passed: InvalidUnregisterWithPrimitiveTokenTest003");
    });

    /**
     * @tc.name   InvalidUnregisterNonExistentTokenTest004
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_004
     * @tc.desc   Verify invalid unregistration: non-existent token (silent failure)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidUnregisterNonExistentTokenTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test004_InvalidUnregisterNonExistentToken();
      expect(result).assertEqual("Test Passed: InvalidUnregisterNonExistentTokenTest004");
    });

    /**
     * @tc.name   ValidUnregisterMultipleTargetsWithSameTokenTest005
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_005
     * @tc.desc   Verify valid unregistration: multiple targets with same token (cancels all)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterMultipleTargetsWithSameTokenTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test005_ValidUnregisterMultipleTargetsWithSameToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterMultipleTargetsWithSameTokenTest005");
    });

    /**
     * @tc.name   ValidUnregisterWithFrozenTokenTest006
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_006
     * @tc.desc   Verify valid unregistration: use frozen object as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithFrozenTokenTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test006_ValidUnregisterWithFrozenToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithFrozenTokenTest006");
    });

    /**
     * @tc.name   InvalidUnregisterThisBindingTest007
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_007
     * @tc.desc   Verify invalid unregistration: incorrect this binding (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidUnregisterThisBindingTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test007_InvalidUnregisterThisBinding();
      expect(result).assertEqual("Test Passed: InvalidUnregisterThisBindingTest007");
    });

    /**
     * @tc.name   ValidUnregisterAfterReregisterTest008
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_008
     * @tc.desc   Verify valid unregistration: reregister after unregistration (still effective)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterAfterReregisterTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test008_ValidUnregisterAfterReregister();
      expect(result).assertEqual("Test Passed: ValidUnregisterAfterReregisterTest008");
    });

    /**
     * @tc.name   InvalidUnregisterWithNullTokenTest009
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_009
     * @tc.desc   Verify invalid unregistration: null as token (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidUnregisterWithNullTokenTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test009_InvalidUnregisterWithNullToken();
      expect(result).assertEqual("Test Passed: InvalidUnregisterWithNullTokenTest009");
    });

    /**
     * @tc.name   ValidRepeatUnregisterSameTokenTest010
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_010
     * @tc.desc   Verify valid repeat unregistration: same token (second call silent failure)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidRepeatUnregisterSameTokenTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test010_ValidRepeatUnregisterSameToken();
      expect(result).assertEqual("Test Passed: ValidRepeatUnregisterSameTokenTest010");
    });

    /**
     * @tc.name   ValidUnregisterWithSealedTokenTest011
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_011
     * @tc.desc   Verify valid unregistration: use sealed object as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithSealedTokenTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test011_ValidUnregisterWithSealedToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithSealedTokenTest011");
    });

    /**
     * @tc.name   InvalidUnregisterWithUndefinedTokenTest012
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_012
     * @tc.desc   Verify invalid unregistration: undefined as token (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidUnregisterWithUndefinedTokenTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test012_InvalidUnregisterWithUndefinedToken();
      expect(result).assertEqual("Test Passed: InvalidUnregisterWithUndefinedTokenTest012");
    });

    /**
     * @tc.name   ValidUnregisterWithArrayTokenTest013
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_013
     * @tc.desc   Verify valid unregistration: use Array instance as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithArrayTokenTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test013_ValidUnregisterWithArrayToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithArrayTokenTest013");
    });

    /**
     * @tc.name   ValidUnregisterLastTokenForSameTargetTest014
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_014
     * @tc.desc   Verify valid unregistration: same target with different tokens (cancel last token)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterLastTokenForSameTargetTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test014_ValidUnregisterLastTokenForSameTarget();
      expect(result).assertEqual("Test Passed: ValidUnregisterLastTokenForSameTargetTest014");
    });

    /**
     * @tc.name   InvalidUnregisterCallWithWrongThisTest015
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_015
     * @tc.desc   Verify invalid unregistration: call with wrong this binding (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidUnregisterCallWithWrongThisTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test015_InvalidUnregisterCallWithWrongThis();
      expect(result).assertEqual("Test Passed: InvalidUnregisterCallWithWrongThisTest015");
    });

    /**
     * @tc.name   ValidUnregisterWithDateTokenTest016
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_016
     * @tc.desc   Verify valid unregistration: use Date instance as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithDateTokenTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test016_ValidUnregisterWithDateToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithDateTokenTest016");
    });


    /**
     * @tc.name   ValidUnregisterWithFrozenSymbolTokenTest018
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_018
     * @tc.desc   Verify valid unregistration: use frozen non-registered Symbol as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithFrozenSymbolTokenTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test018_ValidUnregisterWithFrozenSymbolToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithFrozenSymbolTokenTest018");
    });

    /**
     * @tc.name   ValidUnregisterWithWeakMapTokenTest019
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_019
     * @tc.desc   Verify valid unregistration: use WeakMap instance as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithWeakMapTokenTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test019_ValidUnregisterWithWeakMapToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithWeakMapTokenTest019");
    });


    /**
     * @tc.name   ValidUnregisterTokenModifiedAfterTest021
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_021
     * @tc.desc   Verify valid unregistration: token modified after unregistration (state unchanged)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterTokenModifiedAfterTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test021_ValidUnregisterTokenModifiedAfter();
      expect(result).assertEqual("Test Passed: ValidUnregisterTokenModifiedAfterTest021");
    });

    /**
     * @tc.name   InvalidUnregisterApplyWithWrongThisTest022
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_022
     * @tc.desc   Verify invalid unregistration: apply with wrong this binding (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidUnregisterApplyWithWrongThisTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test022_InvalidUnregisterApplyWithWrongThis();
      expect(result).assertEqual("Test Passed: InvalidUnregisterApplyWithWrongThisTest022");
    });

    /**
     * @tc.name   ValidUnregisterWithClassInstanceTokenTest023
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_023
     * @tc.desc   Verify valid unregistration: use custom class instance as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithClassInstanceTokenTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test023_ValidUnregisterWithClassInstanceToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithClassInstanceTokenTest023");
    });

    /**
     * @tc.name   ValidUnregisterTokenAcrossRegistriesTest024
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_024
     * @tc.desc   Verify valid unregistration: same token across registries (no cross-instance effect)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterTokenAcrossRegistriesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test024_ValidUnregisterTokenAcrossRegistries();
      expect(result).assertEqual("Test Passed: ValidUnregisterTokenAcrossRegistriesTest024");
    });

    /**
     * @tc.name   InvalidUnregisterWithBooleanTokenTest025
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_025
     * @tc.desc   Verify invalid unregistration: boolean as token (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidUnregisterWithBooleanTokenTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test025_InvalidUnregisterWithBooleanToken();
      expect(result).assertEqual("Test Passed: InvalidUnregisterWithBooleanTokenTest025");
    });

    /**
     * @tc.name   ValidUnregisterWithRegExpTokenTest026
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_026
     * @tc.desc   Verify valid unregistration: use RegExp instance as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithRegExpTokenTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test026_ValidUnregisterWithRegExpToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithRegExpTokenTest026");
    });

    /**
     * @tc.name   ValidUnregisterWithCircularTokenTest027
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_027
     * @tc.desc   Verify valid unregistration: use circular reference object as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithCircularTokenTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test027_ValidUnregisterWithCircularToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithCircularTokenTest027");
    });

    /**
     * @tc.name   InvalidUnregisterWithoutParamsTest028
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_028
     * @tc.desc   Verify invalid unregistration: no parameters (throws TypeError)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InvalidUnregisterWithoutParamsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test028_InvalidUnregisterWithoutParams();
      expect(result).assertEqual("Test Passed: InvalidUnregisterWithoutParamsTest028");
    });

    /**
     * @tc.name   ValidUnregisterWithMapTokenTest029
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_029
     * @tc.desc   Verify valid unregistration: use Map instance as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithMapTokenTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test029_ValidUnregisterWithMapToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithMapTokenTest029");
    });

    /**
     * @tc.name   ValidUnregisterWithBigIntObjectTokenTest030
     * @tc.number SUB_FINALIZATION_REGISTRY_UNREGISTER_TEST_030
     * @tc.desc   Verify valid unregistration: use BigInt object wrapper as token
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ValidUnregisterWithBigIntObjectTokenTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryUnregisterUtils.test030_ValidUnregisterWithBigIntObjectToken();
      expect(result).assertEqual("Test Passed: ValidUnregisterWithBigIntObjectTokenTest030");
    });
  })
}