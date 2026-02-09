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

import { FinalizationRegistryTestUtils } from './finalizationRegistryStandaloneUtils.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function finalizationRegistryTest() {
  describe('FinalizationRegistryTest', () => {
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
     * @tc.name   CreateFinalizationRegistryInstanceTest001
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_001
     * @tc.desc   Verify FinalizationRegistry constructor creates valid instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CreateFinalizationRegistryInstanceTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test001_CreateValidInstance();
      expect(result).assertEqual("Test Passed: CreateFinalizationRegistryInstanceTest001");
    });

    /**
     * @tc.name   RegisterTargetWithHeldValueTest002
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_002
     * @tc.desc   Verify register() associates target with held value (strong reference)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegisterTargetWithHeldValueTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test002_RegisterTargetAndHeldValue();
      expect(result).assertEqual("Test Passed: RegisterTargetWithHeldValueTest002");
    });

    /**
     * @tc.name   UnregisterTargetTest003
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_003
     * @tc.desc   Verify unregister() cancels registration (no callback trigger)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UnregisterTargetTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test003_UnregisterTargetSuccess();
      expect(result).assertEqual("Test Passed: UnregisterTargetTest003");
    });

    /**
     * @tc.name   WeakReferenceToTargetTest004
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_004
     * @tc.desc   Verify FinalizationRegistry holds weak reference to target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakReferenceToTargetTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test004_WeakReferenceToTarget();
      expect(result).assertEqual("Test Passed: WeakReferenceToTargetTest004");
    });

    /**
     * @tc.name   StrongReferenceToHeldValueTest005
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_005
     * @tc.desc   Verify FinalizationRegistry holds strong reference to held value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StrongReferenceToHeldValueTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test005_StrongReferenceToHeldValue();
      expect(result).assertEqual("Test Passed: StrongReferenceToHeldValueTest005");
    });

    /**
     * @tc.name   UnregisterWithCustomTokenTest006
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_006
     * @tc.desc   Verify unregistration with custom token (not target)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UnregisterWithCustomTokenTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test006_UnregisterWithCustomToken();
      expect(result).assertEqual("Test Passed: UnregisterWithCustomTokenTest006");
    });

    /**
     * @tc.name   CallbackNotSynchronousTest007
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_007
     * @tc.desc   Verify callback is not called synchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CallbackNotSynchronousTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test007_CallbackAsynchronousExecution();
      expect(result).assertEqual("Test Passed: CallbackNotSynchronousTest007");
    });

    /**
     * @tc.name   RegisterSymbolAsTargetTest008
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_008
     * @tc.desc   Verify non-registered Symbol can be used as target
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegisterSymbolAsTargetTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test008_RegisterSymbolAsTarget();
      expect(result).assertEqual("Test Passed: RegisterSymbolAsTargetTest008");
    });

    /**
     * @tc.name   UnreachableRegistryTest009
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_009
     * @tc.desc   Verify unreachable FinalizationRegistry may not trigger callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UnreachableRegistryTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test009_UnreachableRegistryCallback();
      expect(result).assertEqual("Test Passed: UnreachableRegistryTest009");
    });

    /**
     * @tc.name   MultipleRegisterSameTargetTest010
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_010
     * @tc.desc   Verify multiple register calls for same target are allowed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleRegisterSameTargetTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test010_MultipleRegisterSameTarget();
      expect(result).assertEqual("Test Passed: MultipleRegisterSameTargetTest010");
    });

    /**
     * @tc.name   RegisterNullAsTargetTest011
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_011
     * @tc.desc   Verify registering null as target throws TypeError (target must be object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegisterNullAsTargetTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test011_RegisterNullAsTarget();
      expect(result).assertEqual("Test Passed: RegisterNullAsTargetTest011");
    });

    /**
     * @tc.name   HeldValueAsSymbolTest012
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_012
     * @tc.desc   Verify Symbol as held value is strongly referenced (valid registration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsSymbolTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test012_HeldValueAsSymbol();
      expect(result).assertEqual("Test Passed: HeldValueAsSymbolTest012");
    });


    /**
     * @tc.name   RepeatUnregisterSameTokenTest014
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_014
     * @tc.desc   Verify repeating unregister on same token throws no error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RepeatUnregisterSameTokenTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test014_RepeatUnregisterSameToken();
      expect(result).assertEqual("Test Passed: RepeatUnregisterSameTokenTest014");
    });

    /**
     * @tc.name   TargetReassignedAfterRegisterTest015
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_015
     * @tc.desc   Verify target variable reassignment doesn't affect registry's weak reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TargetReassignedAfterRegisterTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test015_TargetReassignedAfterRegister();
      expect(result).assertEqual("Test Passed: TargetReassignedAfterRegisterTest015");
    });

    /**
     * @tc.name   HeldValueWithCircularReferenceTest016
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_016
     * @tc.desc   Verify circular reference object as held value is strongly referenced
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueWithCircularReferenceTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test016_HeldValueWithCircularReference();
      expect(result).assertEqual("Test Passed: HeldValueWithCircularReferenceTest016");
    });


    /**
     * @tc.name   SameTokenForMultipleTargetsTest018
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_018
     * @tc.desc   Verify same token for multiple targets supports unregistration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SameTokenForMultipleTargetsTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test018_SameTokenForMultipleTargets();
      expect(result).assertEqual("Test Passed: SameTokenForMultipleTargetsTest018");
    });

    /**
     * @tc.name   TargetAsArrayInstanceTest019
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_019
     * @tc.desc   Verify Array instance as target supports registration (weak reference)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TargetAsArrayInstanceTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test019_TargetAsArrayInstance();
      expect(result).assertEqual("Test Passed: TargetAsArrayInstanceTest019");
    });

    /**
     * @tc.name   HeldValueAsUndefinedTest020
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_020
     * @tc.desc   Verify undefined as held value is strongly referenced (valid registration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsUndefinedTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test020_HeldValueAsUndefined();
      expect(result).assertEqual("Test Passed: HeldValueAsUndefinedTest020");
    });

    /**
     * @tc.name   UnregisterNonExistentTokenTest021
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_021
     * @tc.desc   Verify unregistering non-existent token throws no error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UnregisterNonExistentTokenTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test021_UnregisterNonExistentToken();
      expect(result).assertEqual("Test Passed: UnregisterNonExistentTokenTest021");
    });

    /**
     * @tc.name   CallbackThrowsErrorTest022
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_022
     * @tc.desc   Verify callback throwing error doesn't affect registry functionality
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CallbackThrowsErrorTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test022_CallbackThrowsError();
      expect(result).assertEqual("Test Passed: CallbackThrowsErrorTest022");
    });

    /**
     * @tc.name   HeldValueAsFunctionTest023
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_023
     * @tc.desc   Verify function as held value is strongly referenced (valid registration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsFunctionTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test023_HeldValueAsFunction();
      expect(result).assertEqual("Test Passed: HeldValueAsFunctionTest023");
    });



    /**
     * @tc.name   TargetAsMapInstanceTest025
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_025
     * @tc.desc   Verify Map instance as target supports registration (weak reference)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TargetAsMapInstanceTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test025_TargetAsMapInstance();
      expect(result).assertEqual("Test Passed: TargetAsMapInstanceTest025");
    });

    /**
     * @tc.name   HeldValueAsBigIntTest026
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_026
     * @tc.desc   Verify BigInt as held value is strongly referenced (valid registration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsBigIntTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test026_HeldValueAsBigInt();
      expect(result).assertEqual("Test Passed: HeldValueAsBigIntTest026");
    });

    /**
     * @tc.name   MultipleRegisterSameTargetDifferentTokensTest027
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_027
     * @tc.desc   Verify multiple registrations of same target with different tokens (last token effective)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleRegisterSameTargetDifferentTokensTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test027_MultipleRegisterSameTargetDifferentTokens();
      expect(result).assertEqual("Test Passed: MultipleRegisterSameTargetDifferentTokensTest027");
    });

    /**
     * @tc.name   RegisterUndefinedAsTargetTest028
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_028
     * @tc.desc   Verify registering undefined as target throws TypeError (target must be object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegisterUndefinedAsTargetTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test028_RegisterUndefinedAsTarget();
      expect(result).assertEqual("Test Passed: RegisterUndefinedAsTargetTest028");
    });

    /**
     * @tc.name   HeldValueAsRegExpTest029
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_029
     * @tc.desc   Verify RegExp instance as held value is strongly referenced (valid registration)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsRegExpTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test029_HeldValueAsRegExp();
      expect(result).assertEqual("Test Passed: HeldValueAsRegExpTest029");
    });

    /**
     * @tc.name   ReregisterAfterUnregisterTest030
     * @tc.number SUB_FINALIZATION_REGISTRY_STANDALONE_TEST_030
     * @tc.desc   Verify reregistering target after unregistration works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ReregisterAfterUnregisterTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = FinalizationRegistryTestUtils.test030_ReregisterAfterUnregister();
      expect(result).assertEqual("Test Passed: ReregisterAfterUnregisterTest030");
    });
  })
}