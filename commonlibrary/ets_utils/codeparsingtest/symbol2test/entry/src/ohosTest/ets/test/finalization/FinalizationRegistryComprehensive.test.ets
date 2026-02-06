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

import { FinalizationRegistryComprehensiveUtils } from './finalizationRegistryComprehensiveUtils.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function finalizationRegistryComprehensiveTest() {
  describe('FinalizationRegistryComprehensiveTest', () => {
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
     * @tc.name   ConstructorRegisterGCCallbackTest001
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_001
     * @tc.desc   Comprehensive: Constructor + register + GC (callback triggers with heldValue)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConstructorRegisterGCCallbackTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test001_ConstructorRegisterGCCallback();
      expect(result).assertEqual("Test Passed: ConstructorRegisterGCCallbackTest001");
    });

    /**
     * @tc.name   RegisterUnregisterGCTest002
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_002
     * @tc.desc   Comprehensive: Register + unregister + GC (callback not triggered after unregister)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegisterUnregisterGCTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test002_RegisterUnregisterGC();
      expect(result).assertEqual("Test Passed: RegisterUnregisterGCTest002");
    });

    /**
     * @tc.name   StrongReferenceHeldValueGCTest003
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_003
     * @tc.desc   Comprehensive: Strong reference to heldValue (accessible after GC)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StrongReferenceHeldValueGCTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test003_StrongReferenceHeldValueGC();
      expect(result).assertEqual("Test Passed: StrongReferenceHeldValueGCTest003");
    });

    /**
     * @tc.name   MultipleRegisterSameTargetGCTest004
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_004
     * @tc.desc   Comprehensive: Multiple register same target + GC (last heldValue effective)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleRegisterSameTargetGCTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test004_MultipleRegisterSameTargetGC();
      expect(result).assertEqual("Test Passed: MultipleRegisterSameTargetGCTest004");
    });

    /**
     * @tc.name   SymbolTargetTokenUnregisterGCTest005
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_005
     * @tc.desc   Comprehensive: Symbol target + Symbol token + unregister + GC
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolTargetTokenUnregisterGCTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test005_SymbolTargetTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: SymbolTargetTokenUnregisterGCTest005");
    });

    /**
     * @tc.name   NoTokenRegisterGCTest006
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_006
     * @tc.desc   Comprehensive: Register without token + GC (callback triggers, cannot unregister)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NoTokenRegisterGCTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test006_NoTokenRegisterGC();
      expect(result).assertEqual("Test Passed: NoTokenRegisterGCTest006");
    });

    /**
     * @tc.name   CircularReferenceTargetGCTest007
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_007
     * @tc.desc   Comprehensive: Circular reference target + GC (target recyclable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CircularReferenceTargetGCTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test007_CircularReferenceTargetGC();
      expect(result).assertEqual("Test Passed: CircularReferenceTargetGCTest007");
    });

    /**
     * @tc.name   MultipleInstancesGCTest008
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_008
     * @tc.desc   Comprehensive: Multiple instances + register + GC (independent callbacks)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleInstancesGCTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test008_MultipleInstancesGC();
      expect(result).assertEqual("Test Passed: MultipleInstancesGCTest008");
    });

    /**
     * @tc.name   TargetLifecycleEndGCTest009
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_009
     * @tc.desc   Comprehensive: Target lifecycle end + GC (original target recycled)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TargetLifecycleEndGCTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test009_TargetLifecycleEndGC();
      expect(result).assertEqual("Test Passed: TargetLifecycleEndGCTest009");
    });

    /**
     * @tc.name   FrozenTargetRegisterGCTest010
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_010
     * @tc.desc   Comprehensive: Frozen object target + register + GC (callback triggers)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenTargetRegisterGCTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test010_FrozenTargetRegisterGC();
      expect(result).assertEqual("Test Passed: FrozenTargetRegisterGCTest010");
    });

    /**
     * @tc.name   MultipleTargetsSameTokenUnregisterGCTest011
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_011
     * @tc.desc   Comprehensive: Multiple targets + same token + unregister + GC (no trigger)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleTargetsSameTokenUnregisterGCTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test011_MultipleTargetsSameTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: MultipleTargetsSameTokenUnregisterGCTest011");
    });

    /**
     * @tc.name   HeldValueAsNullRegisterGCTest012
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_012
     * @tc.desc   Comprehensive: HeldValue as null (≠target) + register + GC (receives null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsNullRegisterGCTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test012_HeldValueAsNullRegisterGC();
      expect(result).assertEqual("Test Passed: HeldValueAsNullRegisterGCTest012");
    });

    /**
     * @tc.name   ClassInstanceTargetRegisterGCTest013
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_013
     * @tc.desc   Comprehensive: Class instance target + register + GC (recyclable)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ClassInstanceTargetRegisterGCTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test013_ClassInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ClassInstanceTargetRegisterGCTest013");
    });

    /**
     * @tc.name   RegisterUnregisterReregisterGCTest014
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_014
     * @tc.desc   Comprehensive: Register + unregister + reregister + GC (triggers)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegisterUnregisterReregisterGCTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test014_RegisterUnregisterReregisterGC();
      expect(result).assertEqual("Test Passed: RegisterUnregisterReregisterGCTest014");
    });

    /**
     * @tc.name   HeldValueAsNonRegisteredSymbolGCTest015
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_015
     * @tc.desc   Comprehensive: HeldValue as non-registered Symbol + GC (receives Symbol)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsNonRegisteredSymbolGCTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test015_HeldValueAsNonRegisteredSymbolGC();
      expect(result).assertEqual("Test Passed: HeldValueAsNonRegisteredSymbolGCTest015");
    });

    /**
     * @tc.name   MultipleRoundRegisterUnregisterGCTest016
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_016
     * @tc.desc   Comprehensive: Multiple rounds register-unregister + GC (no trigger)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleRoundRegisterUnregisterGCTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test016_MultipleRoundRegisterUnregisterGC();
      expect(result).assertEqual("Test Passed: MultipleRoundRegisterUnregisterGCTest016");
    });

    /**
     * @tc.name   WeakSetTargetRegisterGCTest017
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_017
     * @tc.desc   Comprehensive: WeakSet instance target + register + GC (triggers)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetTargetRegisterGCTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test017_WeakSetTargetRegisterGC();
      expect(result).assertEqual("Test Passed: WeakSetTargetRegisterGCTest017");
    });

    /**
     * @tc.name   CallbackModifyExternalVarGCTest018
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_018
     * @tc.desc   Comprehensive: Callback modifies external variable + GC (var updated)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CallbackModifyExternalVarGCTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test018_CallbackModifyExternalVarGC();
      expect(result).assertEqual("Test Passed: CallbackModifyExternalVarGCTest018");
    });

    /**
     * @tc.name   DifferentTypeTargetsSameRegistryGCTest019
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_019
     * @tc.desc   Comprehensive: Different type targets + same registry + GC (independent triggers)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DifferentTypeTargetsSameRegistryGCTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test019_DifferentTypeTargetsSameRegistryGC();
      expect(result).assertEqual("Test Passed: DifferentTypeTargetsSameRegistryGCTest019");
    });

    /**
     * @tc.name   ClassInstanceTokenUnregisterGCTest020
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_020
     * @tc.desc   Comprehensive: Class instance token + unregister + GC (no trigger)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ClassInstanceTokenUnregisterGCTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test020_ClassInstanceTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ClassInstanceTokenUnregisterGCTest020");
    });

    /**
     * @tc.name   ProxyTargetRegisterGCTest021
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_021
     * @tc.desc   ProxyTargetRegisterGCTest021
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ProxyTargetRegisterGCTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test021_ProxyTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ProxyTargetRegisterGCTest021");
    });

    /**
     * @tc.name   HeldValueAsResolvedPromiseGCTest022
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_022
     * @tc.desc   HeldValueAsResolvedPromiseGCTest022
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsResolvedPromiseGCTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test022_HeldValueAsResolvedPromiseGC();
      expect(result).assertEqual("Test Passed: HeldValueAsResolvedPromiseGCTest022");
    });

    /**
     * @tc.name   SealedTargetRegisterGCTest023
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_023
     * @tc.desc   SealedTargetRegisterGCTest023
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SealedTargetRegisterGCTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test023_SealedTargetRegisterGC();
      expect(result).assertEqual("Test Passed: SealedTargetRegisterGCTest023");
    });

    /**
     * @tc.name   ProxyTokenUnregisterGCTest024
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_024
     * @tc.desc   ProxyTokenUnregisterGCTest024
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ProxyTokenUnregisterGCTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test024_ProxyTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ProxyTokenUnregisterGCTest024");
    });



    /**
     * @tc.name   UnregisterEarlyTokenForSameTargetGCTest026
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_026
     * @tc.desc   UnregisterEarlyTokenForSameTargetGCTest026
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UnregisterEarlyTokenForSameTargetGCTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test026_UnregisterEarlyTokenForSameTargetGC();
      expect(result).assertEqual("Test Passed: UnregisterEarlyTokenForSameTargetGCTest026");
    });

    /**
     * @tc.name   ErrorInstanceTargetRegisterGCTest027
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_027
     * @tc.desc   ErrorInstanceTargetRegisterGCTest027
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ErrorInstanceTargetRegisterGCTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test027_ErrorInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ErrorInstanceTargetRegisterGCTest027");
    });



    /**
     * @tc.name   ErrorInstanceTokenUnregisterGCTest029
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_029
     * @tc.desc   ErrorInstanceTokenUnregisterGCTest029
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ErrorInstanceTokenUnregisterGCTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test029_ErrorInstanceTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ErrorInstanceTokenUnregisterGCTest029");
    });

    /**
     * @tc.name   SetInstanceTargetRegisterGCTest030
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_030
     * @tc.desc   SetInstanceTargetRegisterGCTest030
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetInstanceTargetRegisterGCTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test030_SetInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: SetInstanceTargetRegisterGCTest030");
    });

    /**
     * @tc.name   HeldValueAsBigIntGCTest031
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_031
     * @tc.desc   HeldValueAsBigIntGCTest031
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsBigIntGCTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test031_HeldValueAsBigIntGC();
      expect(result).assertEqual("Test Passed: HeldValueAsBigIntGCTest031");
    });



    /**
     * @tc.name   HeldValueAsNaNGCTest034
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_034
     * @tc.desc   HeldValueAsNaNGCTest034
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsNaNGCTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test034_HeldValueAsNaNGCC();
      expect(result).assertEqual("Test Passed: HeldValueAsNaNGCTest034");
    });

    /**
     * @tc.name   RegExpInstanceTargetRegisterGCTest035
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_035
     * @tc.desc   RegExpInstanceTargetRegisterGCTest035
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpInstanceTargetRegisterGCTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test035_RegExpInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: RegExpInstanceTargetRegisterGCTest035");
    });

    /**
     * @tc.name   CallbackThrowsErrorGCTest036
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_036
     * @tc.desc   CallbackThrowsErrorGCTest036
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CallbackThrowsErrorGCTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test036_CallbackThrowsErrorGC();
      expect(result).assertEqual("Test Passed: CallbackThrowsErrorGCTest036");
    });

    /**
     * @tc.name   HeldValueAsInfinityGCTest037
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_037
     * @tc.desc   HeldValueAsInfinityGCTest037
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsInfinityGCTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test037_HeldValueAsInfinityGC();
      expect(result).assertEqual("Test Passed: HeldValueAsInfinityGCTest037");
    });

    /**
     * @tc.name   NestedFrozenTargetRegisterGCTest038
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_038
     * @tc.desc   NestedFrozenTargetRegisterGCTest038
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NestedFrozenTargetRegisterGCTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test038_NestedFrozenTargetRegisterGC();
      expect(result).assertEqual("Test Passed: NestedFrozenTargetRegisterGCTest038");
    });

    /**
     * @tc.name   NestedSealedTokenUnregisterGCTest039
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_039
     * @tc.desc   NestedSealedTokenUnregisterGCTest039
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NestedSealedTokenUnregisterGCTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test039_NestedSealedTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: NestedSealedTokenUnregisterGCTest039");
    });

    /**
     * @tc.name   HeldValueAsNestedObjectGCTest040
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_040
     * @tc.desc   HeldValueAsNestedObjectGCTest040
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsNestedObjectGCTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test040_HeldValueAsNestedObjectGC();
      expect(result).assertEqual("Test Passed: HeldValueAsNestedObjectGCTest040");
    });

    /**
     * @tc.name   RejectedPromiseTargetRegisterGCTest041
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_041
     * @tc.desc   RejectedPromiseTargetRegisterGCTest041
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RejectedPromiseTargetRegisterGCTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test041_RejectedPromiseTargetRegisterGC();
      expect(result).assertEqual("Test Passed: RejectedPromiseTargetRegisterGCTest041");
    });

    /**
     * @tc.name   ResolvedPromiseTokenUnregisterGCTest042
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_042
     * @tc.desc   ResolvedPromiseTokenUnregisterGCTest042
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ResolvedPromiseTokenUnregisterGCTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test042_ResolvedPromiseTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ResolvedPromiseTokenUnregisterGCTest042");
    });

    /**
     * @tc.name   HeldValueAsCircularObjectGCTest043
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_043
     * @tc.desc   HeldValueAsCircularObjectGCTest043
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsCircularObjectGCTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test043_HeldValueAsCircularObjectGC();
      expect(result).assertEqual("Test Passed: HeldValueAsCircularObjectGCTest043");
    });



    /**
     * @tc.name   HeldValueAsParamFunctionGCTest046
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_046
     * @tc.desc   HeldValueAsParamFunctionGCTest046
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsParamFunctionGCTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test046_HeldValueAsParamFunctionGC();
      expect(result).assertEqual("Test Passed: HeldValueAsParamFunctionGCTest046");
    });




    /**
     * @tc.name   MultipleRegistriesSameTokenUnregisterGCTest049
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_049
     * @tc.desc   MultipleRegistriesSameTokenUnregisterGCTest049
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleRegistriesSameTokenUnregisterGCTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test049_MultipleRegistriesSameTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: MultipleRegistriesSameTokenUnregisterGCTest049");
    });

    /**
     * @tc.name   HeldValueAsUndefinedGCTest050
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_050
     * @tc.desc   HeldValueAsUndefinedGCTest050
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsUndefinedGCTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test050_HeldValueAsUndefinedGC();
      expect(result).assertEqual("Test Passed: HeldValueAsUndefinedGCTest050");
    });




    /**
     * @tc.name   HeldValueAsRegisteredSymbolGCTest053
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_053
     * @tc.desc   HeldValueAsRegisteredSymbolGCTest053
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsRegisteredSymbolGCTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test053_HeldValueAsRegisteredSymbolGC();
      expect(result).assertEqual("Test Passed: HeldValueAsRegisteredSymbolGCTest053");
    });



    /**
     * @tc.name   TargetReferencedByWeakMapThenReleasedGCTest055
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_055
     * @tc.desc   TargetReferencedByWeakMapThenReleasedGCTest055
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TargetReferencedByWeakMapThenReleasedGCTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test055_TargetReferencedByWeakMapThenReleasedGC();
      expect(result).assertEqual("Test Passed: TargetReferencedByWeakMapThenReleasedGCTest055");
    });

    /**
     * @tc.name   HeldValueReferencedByWeakSetGCTest056
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_056
     * @tc.desc   HeldValueReferencedByWeakSetGCTest056
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueReferencedByWeakSetGCTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test056_HeldValueReferencedByWeakSetGC();
      expect(result).assertEqual("Test Passed: HeldValueReferencedByWeakSetGCTest056");
    });

    /**
     * @tc.name   TokenDeepModifiedPropertiesUnregisterGCTest057
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_057
     * @tc.desc   TokenDeepModifiedPropertiesUnregisterGCTest057
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TokenDeepModifiedPropertiesUnregisterGCTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test057_TokenDeepModifiedPropertiesUnregisterGC();
      expect(result).assertEqual("Test Passed: TokenDeepModifiedPropertiesUnregisterGCTest057");
    });

    /**
     * @tc.name   HeldValueReplacePrototypeChainGCTest058
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_058
     * @tc.desc   HeldValueReplacePrototypeChainGCTest058
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueReplacePrototypeChainGCTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test058_HeldValueReplacePrototypeChainGC();
      expect(result).assertEqual("Test Passed: HeldValueReplacePrototypeChainGCTest058");
    });

    /**
     * @tc.name   NonExtensibleTargetRegisterGCTest059
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_059
     * @tc.desc   NonExtensibleTargetRegisterGCTest059
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NonExtensibleTargetRegisterGCTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test059_NonExtensibleTargetRegisterGC();
      expect(result).assertEqual("Test Passed: NonExtensibleTargetRegisterGCTest059");
    });

    /**
     * @tc.name   NonExtensibleTokenUnregisterGCTest060
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_060
     * @tc.desc   NonExtensibleTokenUnregisterGCTest060
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NonExtensibleTokenUnregisterGCTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test060_NonExtensibleTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: NonExtensibleTokenUnregisterGCTest060");
    });

    /**
     * @tc.name   MultipleTargetsSequentialReleaseGCTest061
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_061
     * @tc.desc   MultipleTargetsSequentialReleaseGCTest061
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleTargetsSequentialReleaseGCTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test061_MultipleTargetsSequentialReleaseGC();
      expect(result).assertEqual("Test Passed: MultipleTargetsSequentialReleaseGCTest061");
    });



    /**
     * @tc.name   Delayed20msUnregisterGCTest064
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_064
     * @tc.desc   Delayed20msUnregisterGCTest064
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('Delayed20msUnregisterGCTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test064_Delayed20msUnregisterGC();
      expect(result).assertEqual("Test Passed: Delayed20msUnregisterGCTest064");
    });



    /**
     * @tc.name   ComplexIntlDateTimeFormatTargetRegisterGCTest068
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_068
     * @tc.desc   ComplexIntlDateTimeFormatTargetRegisterGCTest068
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ComplexIntlDateTimeFormatTargetRegisterGCTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test068_ComplexIntlDateTimeFormatTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ComplexIntlDateTimeFormatTargetRegisterGCTest068");
    });



    /**
     * @tc.name   ComplexIntlCollatorTokenUnregisterGCTest070
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_070
     * @tc.desc   ComplexIntlCollatorTokenUnregisterGCTest070
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ComplexIntlCollatorTokenUnregisterGCTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test070_ComplexIntlCollatorTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ComplexIntlCollatorTokenUnregisterGCTest070");
    });

    /**
     * @tc.name   MultiLangIntlPluralRulesTargetRegisterGCTest071
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_071
     * @tc.desc   MultiLangIntlPluralRulesTargetRegisterGCTest071
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultiLangIntlPluralRulesTargetRegisterGCTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test071_MultiLangIntlPluralRulesTargetRegisterGC();
      expect(result).assertEqual("Test Passed: MultiLangIntlPluralRulesTargetRegisterGCTest071");
    });


    /**
     * @tc.name   MultiFormatIntlListFormatTokenUnregisterGCTest073
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_073
     * @tc.desc   MultiFormatIntlListFormatTokenUnregisterGCTest073
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultiFormatIntlListFormatTokenUnregisterGCTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test073_MultiFormatIntlListFormatTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: MultiFormatIntlListFormatTokenUnregisterGCTest073");
    });

    /**
     * @tc.name   LargeUint16ArrayTargetRegisterGCTest074
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_074
     * @tc.desc   LargeUint16ArrayTargetRegisterGCTest074
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('LargeUint16ArrayTargetRegisterGCTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test074_LargeUint16ArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: LargeUint16ArrayTargetRegisterGCTest074");
    });

    /**
     * @tc.name   HeldValueAsFilledInt32ArrayGCTest075
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_075
     * @tc.desc   HeldValueAsFilledInt32ArrayGCTest075
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsFilledInt32ArrayGCTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test075_HeldValueAsFilledInt32ArrayGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFilledInt32ArrayGCTest075");
    });

    /**
     * @tc.name   RandomDataUint32ArrayTokenUnregisterGCTest076
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_076
     * @tc.desc   RandomDataUint32ArrayTokenUnregisterGCTest076
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RandomDataUint32ArrayTokenUnregisterGCTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test076_RandomDataUint32ArrayTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: RandomDataUint32ArrayTokenUnregisterGCTest076");
    });

    /**
     * @tc.name   PrecisionFloat32ArrayTargetRegisterGCTest077
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_077
     * @tc.desc   PrecisionFloat32ArrayTargetRegisterGCTest077
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PrecisionFloat32ArrayTargetRegisterGCTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test077_PrecisionFloat32ArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: PrecisionFloat32ArrayTargetRegisterGCTest077");
    });

    /**
     * @tc.name   HeldValueAsBigUint64ArrayWithLargeNumbersGCTest078
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_078
     * @tc.desc   HeldValueAsBigUint64ArrayWithLargeNumbersGCTest078
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsBigUint64ArrayWithLargeNumbersGCTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test078_HeldValueAsBigUint64ArrayWithLargeNumbersGC();
      expect(result).assertEqual("Test Passed: HeldValueAsBigUint64ArrayWithLargeNumbersGCTest078");
    });

    /**
     * @tc.name   BigInt64ArrayWithPosNegTokenUnregisterGCTest079
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_079
     * @tc.desc   BigInt64ArrayWithPosNegTokenUnregisterGCTest079
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('BigInt64ArrayWithPosNegTokenUnregisterGCTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test079_BigInt64ArrayWithPosNegTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: BigInt64ArrayWithPosNegTokenUnregisterGCTest079");
    });

    /**
     * @tc.name   ArrayBufferWithSharedDataTargetRegisterGCTest080
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_080
     * @tc.desc   ArrayBufferWithSharedDataTargetRegisterGCTest080
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferWithSharedDataTargetRegisterGCTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test080_ArrayBufferWithSharedDataTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ArrayBufferWithSharedDataTargetRegisterGCTest080");
    });

    /**
     * @tc.name   HeldValueAsSharedArrayBufferWithAtomicsGCTest081
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_081
     * @tc.desc   HeldValueAsSharedArrayBufferWithAtomicsGCTest081
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsSharedArrayBufferWithAtomicsGCTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test081_HeldValueAsSharedArrayBufferWithAtomicsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsSharedArrayBufferWithAtomicsGCTest081");
    });

    /**
     * @tc.name   ArrayBufferWithMultiViewTokenUnregisterGCTest082
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_082
     * @tc.desc   ArrayBufferWithMultiViewTokenUnregisterGCTest082
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayBufferWithMultiViewTokenUnregisterGCTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test082_ArrayBufferWithMultiViewTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ArrayBufferWithMultiViewTokenUnregisterGCTest082");
    });

    /**
     * @tc.name   ProxyMapWithInterceptorTargetRegisterGCTest083
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_083
     * @tc.desc   ProxyMapWithInterceptorTargetRegisterGCTest083
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ProxyMapWithInterceptorTargetRegisterGCTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test083_ProxyMapWithInterceptorTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ProxyMapWithInterceptorTargetRegisterGCTest083");
    });


    /**
     * @tc.name   UnregisterMiddleTokenForSameTargetGCTest086
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_086
     * @tc.desc   UnregisterMiddleTokenForSameTargetGCTest086
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UnregisterMiddleTokenForSameTargetGCTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test086_UnregisterMiddleTokenForSameTargetGC();
      expect(result).assertEqual("Test Passed: UnregisterMiddleTokenForSameTargetGCTest086");
    });

    /**
     * @tc.name   HeldValueAsFunctionWithClosureGCTest087
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_087
     * @tc.desc   HeldValueAsFunctionWithClosureGCTest087
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsFunctionWithClosureGCTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test087_HeldValueAsFunctionWithClosureGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFunctionWithClosureGCTest087");
    });

    /**
     * @tc.name   CustomPrototypeChainTargetRegisterGCTest088
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_088
     * @tc.desc   CustomPrototypeChainTargetRegisterGCTest088
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPrototypeChainTargetRegisterGCTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test088_CustomPrototypeChainTargetRegisterGC();
      expect(result).assertEqual("Test Passed: CustomPrototypeChainTargetRegisterGCTest088");
    });

    /**
     * @tc.name   TokenWithModifiedMethodUnregisterGCTest089
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_089
     * @tc.desc   TokenWithModifiedMethodUnregisterGCTest089
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('TokenWithModifiedMethodUnregisterGCTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test089_TokenWithModifiedMethodUnregisterGC();
      expect(result).assertEqual("Test Passed: TokenWithModifiedMethodUnregisterGCTest089");
    });

    /**
     * @tc.name   HeldValueAsWeakSetWithMultiObjectsGCTest090
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_090
     * @tc.desc   HeldValueAsWeakSetWithMultiObjectsGCTest090
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsWeakSetWithMultiObjectsGCTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test090_HeldValueAsWeakSetWithMultiObjectsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsWeakSetWithMultiObjectsGCTest090");
    });

    /**
     * @tc.name   AggregateErrorWithMultiErrorTypesTargetRegisterGCTest091
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_091
     * @tc.desc   AggregateErrorWithMultiErrorTypesTargetRegisterGCTest091
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('AggregateErrorWithMultiErrorTypesTargetRegisterGCTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test091_AggregateErrorWithMultiErrorTypesTargetRegisterGC();
      expect(result).assertEqual("Test Passed: AggregateErrorWithMultiErrorTypesTargetRegisterGCTest091");
    });

    /**
     * @tc.name   ReferenceErrorTokenWithModifiedPropsUnregisterGCTest092
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_092
     * @tc.desc   ReferenceErrorTokenWithModifiedPropsUnregisterGCTest092
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ReferenceErrorTokenWithModifiedPropsUnregisterGCTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test092_ReferenceErrorTokenWithModifiedPropsUnregisterGC();
      expect(result).assertEqual("Test Passed: ReferenceErrorTokenWithModifiedPropsUnregisterGCTest092");
    });

    /**
     * @tc.name   HeldValueAsDateWithModifiedTimeGCTest093
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_093
     * @tc.desc   HeldValueAsDateWithModifiedTimeGCTest093
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsDateWithModifiedTimeGCTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test093_HeldValueAsDateWithModifiedTimeGC();
      expect(result).assertEqual("Test Passed: HeldValueAsDateWithModifiedTimeGCTest093");
    });

    /**
     * @tc.name   RegExpWithMULTILINECaseInsensitiveTargetRegisterGCTest094
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_094
     * @tc.desc   RegExpWithMULTILINECaseInsensitiveTargetRegisterGCTest094
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpWithMULTILINECaseInsensitiveTargetRegisterGCTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test094_RegExpWithMULTILINECaseInsensitiveTargetRegisterGC();
      expect(result).assertEqual("Test Passed: RegExpWithMULTILINECaseInsensitiveTargetRegisterGCTest094");
    });

    /**
     * @tc.name   SetWithRemovedElementsTokenUnregisterGCTest095
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_095
     * @tc.desc   SetWithRemovedElementsTokenUnregisterGCTest095
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetWithRemovedElementsTokenUnregisterGCTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test095_SetWithRemovedElementsTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: SetWithRemovedElementsTokenUnregisterGCTest095");
    });

    /**
     * @tc.name   HeldValueAsMapWithModifiedEntriesGCTest096
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_096
     * @tc.desc   HeldValueAsMapWithModifiedEntriesGCTest096
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsMapWithModifiedEntriesGCTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test096_HeldValueAsMapWithModifiedEntriesGC();
      expect(result).assertEqual("Test Passed: HeldValueAsMapWithModifiedEntriesGCTest096");
    });

    /**
     * @tc.name   WeakMapWithRemovedKeysTargetRegisterGCTest097
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_097
     * @tc.desc   WeakMapWithRemovedKeysTargetRegisterGCTest097
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapWithRemovedKeysTargetRegisterGCTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test097_WeakMapWithRemovedKeysTargetRegisterGC();
      expect(result).assertEqual("Test Passed: WeakMapWithRemovedKeysTargetRegisterGCTest097");
    });

    /**
     * @tc.name   NonGlobalSymbolTokenUnregisterGCTest098
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_098
     * @tc.desc   NonGlobalSymbolTokenUnregisterGCTest098
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NonGlobalSymbolTokenUnregisterGCTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test098_NonGlobalSymbolTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: NonGlobalSymbolTokenUnregisterGCTest098");
    });

    /**
     * @tc.name   HeldValueAsArrowFunctionWithDefaultParamsGCTest099
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_099
     * @tc.desc   HeldValueAsArrowFunctionWithDefaultParamsGCTest099
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsArrowFunctionWithDefaultParamsGCTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test099_HeldValueAsArrowFunctionWithDefaultParamsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsArrowFunctionWithDefaultParamsGCTest099");
    });

    /**
     * @tc.name   DynamicMultiMethodObjectTargetRegisterGCTest100
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_100
     * @tc.desc   DynamicMultiMethodObjectTargetRegisterGCTest100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('DynamicMultiMethodObjectTargetRegisterGCTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test100_DynamicMultiMethodObjectTargetRegisterGC();
      expect(result).assertEqual("Test Passed: DynamicMultiMethodObjectTargetRegisterGCTest100");
    });

    /**
     * @tc.name   FrozenObjectTokenUnregisterGCTest101
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_101
     * @tc.desc   FrozenObjectTokenUnregisterGCTest101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenObjectTokenUnregisterGCTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test101_FrozenObjectTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: FrozenObjectTokenUnregisterGCTest101");
    });

    /**
     * @tc.name   HeldValueAsComplexCircularObjectGCTest102
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_102
     * @tc.desc   HeldValueAsComplexCircularObjectGCTest102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsComplexCircularObjectGCTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test102_HeldValueAsComplexCircularObjectGC();
      expect(result).assertEqual("Test Passed: HeldValueAsComplexCircularObjectGCTest102");
    });

    /**
     * @tc.name   ObjectWithGetterSetterTargetRegisterGCTest103
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_103
     * @tc.desc   ObjectWithGetterSetterTargetRegisterGCTest103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ObjectWithGetterSetterTargetRegisterGCTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test103_ObjectWithGetterSetterTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ObjectWithGetterSetterTargetRegisterGCTest103");
    });

    /**
     * @tc.name   CustomClassWithStaticMethodTokenUnregisterGCTest104
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_104
     * @tc.desc   CustomClassWithStaticMethodTokenUnregisterGCTest104
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomClassWithStaticMethodTokenUnregisterGCTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test104_CustomClassWithStaticMethodTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: CustomClassWithStaticMethodTokenUnregisterGCTest104");
    });

    /**
     * @tc.name   HeldValueAsRejectedPromiseErrorGCTest105
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_105
     * @tc.desc   HeldValueAsRejectedPromiseErrorGCTest105
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsRejectedPromiseErrorGCTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test105_HeldValueAsRejectedPromiseErrorGC();
      expect(result).assertEqual("Test Passed: HeldValueAsRejectedPromiseErrorGCTest105");
    });

    /**
     * @tc.name   NestedArrayWithMixedValuesTargetRegisterGCTest106
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_106
     * @tc.desc   NestedArrayWithMixedValuesTargetRegisterGCTest106
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NestedArrayWithMixedValuesTargetRegisterGCTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test106_NestedArrayWithMixedValuesTargetRegisterGC();
      expect(result).assertEqual("Test Passed: NestedArrayWithMixedValuesTargetRegisterGCTest106");
    });

    /**
     * @tc.name   RegExpWithGlobalFlagUsedTokenUnregisterGCTest107
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_107
     * @tc.desc   RegExpWithGlobalFlagUsedTokenUnregisterGCTest107
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpWithGlobalFlagUsedTokenUnregisterGCTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test107_RegExpWithGlobalFlagUsedTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: RegExpWithGlobalFlagUsedTokenUnregisterGCTest107");
    });

    /**
     * @tc.name   HeldValueAsCustomClassSingletonGCTest108
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_108
     * @tc.desc   HeldValueAsCustomClassSingletonGCTest108
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsCustomClassSingletonGCTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test108_HeldValueAsCustomClassSingletonGC();
      expect(result).assertEqual("Test Passed: HeldValueAsCustomClassSingletonGCTest108");
    });

    /**
     * @tc.name   ObjectMethodWithClosureTargetRegisterGCTest109
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_109
     * @tc.desc   ObjectMethodWithClosureTargetRegisterGCTest109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ObjectMethodWithClosureTargetRegisterGCTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test109_ObjectMethodWithClosureTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ObjectMethodWithClosureTargetRegisterGCTest109");
    });

    /**
     * @tc.name   UTCDateTokenUnregisterGCTest110
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_110
     * @tc.desc   UTCDateTokenUnregisterGCTest110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('UTCDateTokenUnregisterGCTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test110_UTCDateTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: UTCDateTokenUnregisterGCTest110");
    });

    /**
     * @tc.name   HeldValueAsSetWithSymbolAndObjectsGCTest111
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_111
     * @tc.desc   HeldValueAsSetWithSymbolAndObjectsGCTest111
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsSetWithSymbolAndObjectsGCTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test111_HeldValueAsSetWithSymbolAndObjectsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsSetWithSymbolAndObjectsGCTest111");
    });

    /**
     * @tc.name   MapWithDateKeysTargetRegisterGCTest112
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_112
     * @tc.desc   MapWithDateKeysTargetRegisterGCTest112
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapWithDateKeysTargetRegisterGCTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test112_MapWithDateKeysTargetRegisterGC();
      expect(result).assertEqual("Test Passed: MapWithDateKeysTargetRegisterGCTest112");
    });

    /**
     * @tc.name   WeakSetWithCustomClassInstancesTokenUnregisterGCTest113
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_113
     * @tc.desc   WeakSetWithCustomClassInstancesTokenUnregisterGCTest113
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetWithCustomClassInstancesTokenUnregisterGCTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test113_WeakSetWithCustomClassInstancesTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: WeakSetWithCustomClassInstancesTokenUnregisterGCTest113");
    });

    /**
     * @tc.name   HeldValueAsFunctionWithRestParamsGCTest114
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_114
     * @tc.desc   HeldValueAsFunctionWithRestParamsGCTest114
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsFunctionWithRestParamsGCTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test114_HeldValueAsFunctionWithRestParamsGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFunctionWithRestParamsGCTest114");
    });

    /**
     * @tc.name   NonExtensibleAndSealedTargetRegisterGCTest115
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_115
     * @tc.desc   NonExtensibleAndSealedTargetRegisterGCTest115
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NonExtensibleAndSealedTargetRegisterGCTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test115_NonExtensibleAndSealedTargetRegisterGC();
      expect(result).assertEqual("Test Passed: NonExtensibleAndSealedTargetRegisterGCTest115");
    });

    /**
     * @tc.name   HeldValueAsBoundFunctionGCTest116
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_116
     * @tc.desc   HeldValueAsBoundFunctionGCTest116
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsBoundFunctionGCTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test116_HeldValueAsBoundFunctionGC();
      expect(result).assertEqual("Test Passed: HeldValueAsBoundFunctionGCTest116");
    });

    /**
     * @tc.name   CustomErrorClassInstanceTargetRegisterGCTest117
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_117
     * @tc.desc   CustomErrorClassInstanceTargetRegisterGCTest117
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomErrorClassInstanceTargetRegisterGCTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test117_CustomErrorClassInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: CustomErrorClassInstanceTargetRegisterGCTest117");
    });


    /**
     * @tc.name   HeldValueAsClassPrivateMethodViaClosureGCTest119
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_119
     * @tc.desc   HeldValueAsClassPrivateMethodViaClosureGCTest119
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsClassPrivateMethodViaClosureGCTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test119_HeldValueAsClassPrivateMethodViaClosureGC();
      expect(result).assertEqual("Test Passed: HeldValueAsClassPrivateMethodViaClosureGCTest119");
    });

    /**
     * @tc.name   FlattenedNestedArrayTargetRegisterGCTest120
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_120
     * @tc.desc   FlattenedNestedArrayTargetRegisterGCTest120
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FlattenedNestedArrayTargetRegisterGCTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test120_FlattenedNestedArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: FlattenedNestedArrayTargetRegisterGCTest120");
    });

    /**
     * @tc.name   WeakMapWithCustomClassKeysTokenUnregisterGCTest121
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_121
     * @tc.desc   WeakMapWithCustomClassKeysTokenUnregisterGCTest121
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapWithCustomClassKeysTokenUnregisterGCTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test121_WeakMapWithCustomClassKeysTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: WeakMapWithCustomClassKeysTokenUnregisterGCTest121");
    });

    /**
     * @tc.name   HeldValueAsLargeBigIntGCTest122
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_122
     * @tc.desc   HeldValueAsLargeBigIntGCTest122
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsLargeBigIntGCTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test122_HeldValueAsLargeBigIntGC();
      expect(result).assertEqual("Test Passed: HeldValueAsLargeBigIntGCTest122");
    });

    /**
     * @tc.name   FilledFixedValueArrayTargetRegisterGCTest123
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_123
     * @tc.desc   FilledFixedValueArrayTargetRegisterGCTest123
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FilledFixedValueArrayTargetRegisterGCTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test123_FilledFixedValueArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: FilledFixedValueArrayTargetRegisterGCTest123");
    });

    /**
     * @tc.name   ObjectWithSymbolPropertiesTokenUnregisterGCTest124
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_124
     * @tc.desc   ObjectWithSymbolPropertiesTokenUnregisterGCTest124
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ObjectWithSymbolPropertiesTokenUnregisterGCTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test124_ObjectWithSymbolPropertiesTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ObjectWithSymbolPropertiesTokenUnregisterGCTest124");
    });

    /**
     * @tc.name   HeldValueAsPromiseFinallyBoundFunctionGCTest125
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_125
     * @tc.desc   HeldValueAsPromiseFinallyBoundFunctionGCTest125
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsPromiseFinallyBoundFunctionGCTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test125_HeldValueAsPromiseFinallyBoundFunctionGC();
      expect(result).assertEqual("Test Passed: HeldValueAsPromiseFinallyBoundFunctionGCTest125");
    });

    /**
     * @tc.name   InheritedMapCustomClassInstanceTargetRegisterGCTest126
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_126
     * @tc.desc   InheritedMapCustomClassInstanceTargetRegisterGCTest126
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InheritedMapCustomClassInstanceTargetRegisterGCTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test126_InheritedMapCustomClassInstanceTargetRegisterGC();
      expect(result).assertEqual("Test Passed: InheritedMapCustomClassInstanceTargetRegisterGCTest126");
    });

    /**
     * @tc.name   RegExpUnicodeComplexPatternTokenUnregisterGCTest127
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_127
     * @tc.desc   RegExpUnicodeComplexPatternTokenUnregisterGCTest127
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpUnicodeComplexPatternTokenUnregisterGCTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test127_RegExpUnicodeComplexPatternTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: RegExpUnicodeComplexPatternTokenUnregisterGCTest127");
    });

    /**
     * @tc.name   HeldValueAsFilteredArrayGCTest128
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_128
     * @tc.desc   HeldValueAsFilteredArrayGCTest128
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsFilteredArrayGCTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test128_HeldValueAsFilteredArrayGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFilteredArrayGCTest128");
    });

    /**
     * @tc.name   CustomClassWithStaticPropertiesTargetRegisterGCTest129
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_129
     * @tc.desc   CustomClassWithStaticPropertiesTargetRegisterGCTest129
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomClassWithStaticPropertiesTargetRegisterGCTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test129_CustomClassWithStaticPropertiesTargetRegisterGC();
      expect(result).assertEqual("Test Passed: CustomClassWithStaticPropertiesTargetRegisterGCTest129");
    });

    /**
     * @tc.name   WeakSetWithErrorInstancesTokenUnregisterGCTest130
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_130
     * @tc.desc   WeakSetWithErrorInstancesTokenUnregisterGCTest130
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetWithErrorInstancesTokenUnregisterGCTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test130_WeakSetWithErrorInstancesTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: WeakSetWithErrorInstancesTokenUnregisterGCTest130");
    });

    /**
     * @tc.name   HeldValueAsMappedArrayGCTest131
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_131
     * @tc.desc   HeldValueAsMappedArrayGCTest131
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsMappedArrayGCTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test131_HeldValueAsMappedArrayGC();
      expect(result).assertEqual("Test Passed: HeldValueAsMappedArrayGCTest131");
    });

    /**
     * @tc.name   ArrayOfDateObjectsTargetRegisterGCTest132
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_132
     * @tc.desc   ArrayOfDateObjectsTargetRegisterGCTest132
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayOfDateObjectsTargetRegisterGCTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test132_ArrayOfDateObjectsTargetRegisterGC();
      expect(result).assertEqual("Test Passed: ArrayOfDateObjectsTargetRegisterGCTest132");
    });

    /**
     * @tc.name   MapWithBigIntKeysTokenUnregisterGCTest133
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_133
     * @tc.desc   MapWithBigIntKeysTokenUnregisterGCTest133
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapWithBigIntKeysTokenUnregisterGCTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test133_MapWithBigIntKeysTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: MapWithBigIntKeysTokenUnregisterGCTest133");
    });
    /**
     * @tc.name   HeldValueAsReducedArrayResultGCTest134
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_134
     * @tc.desc   HeldValueAsReducedArrayResultGCTest134
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsReducedArrayResultGCTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test134_HeldValueAsReducedArrayResultGC();
      expect(result).assertEqual("Test Passed: HeldValueAsReducedArrayResultGCTest134");
    });

    /**
     * @tc.name   InheritedClassWithPrivateFieldsTargetRegisterGCTest135
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_135
     * @tc.desc   InheritedClassWithPrivateFieldsTargetRegisterGCTest135
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InheritedClassWithPrivateFieldsTargetRegisterGCTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test135_InheritedClassWithPrivateFieldsTargetRegisterGC();
      expect(result).assertEqual("Test Passed: InheritedClassWithPrivateFieldsTargetRegisterGCTest135");
    });

    /**
     * @tc.name   SetWithBigIntSymbolMixedTokenUnregisterGCTest136
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_136
     * @tc.desc   SetWithBigIntSymbolMixedTokenUnregisterGCTest136
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetWithBigIntSymbolMixedTokenUnregisterGCTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test136_SetWithBigIntSymbolMixedTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: SetWithBigIntSymbolMixedTokenUnregisterGCTest136");
    });

    /**
     * @tc.name   HeldValueAsFunctionCallBoundContextGCTest137
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_137
     * @tc.desc   HeldValueAsFunctionCallBoundContextGCTest137
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsFunctionCallBoundContextGCTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test137_HeldValueAsFunctionCallBoundContextGC();
      expect(result).assertEqual("Test Passed: HeldValueAsFunctionCallBoundContextGCTest137");
    });

    /**
     * @tc.name   SortedArrayTargetRegisterGCTest138
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_138
     * @tc.desc   SortedArrayTargetRegisterGCTest138
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SortedArrayTargetRegisterGCTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test138_SortedArrayTargetRegisterGC();
      expect(result).assertEqual("Test Passed: SortedArrayTargetRegisterGCTest138");
    });

    /**
     * @tc.name   ArrayWithPrototypeMethodsTokenUnregisterGCTest139
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_139
     * @tc.desc   ArrayWithPrototypeMethodsTokenUnregisterGCTest139
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayWithPrototypeMethodsTokenUnregisterGCTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test139_ArrayWithPrototypeMethodsTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: ArrayWithPrototypeMethodsTokenUnregisterGCTest139");
    });

    /**
     * @tc.name   HeldValueAsCustomIteratorGCTest140
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_140
     * @tc.desc   HeldValueAsCustomIteratorGCTest140
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsCustomIteratorGCTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test140_HeldValueAsCustomIteratorGC();
      expect(result).assertEqual("Test Passed: HeldValueAsCustomIteratorGCTest140");
    });


    /**
     * @tc.name   WeakMapWithDateKeysTokenUnregisterGCTest142
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_142
     * @tc.desc   WeakMapWithDateKeysTokenUnregisterGCTest142
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapWithDateKeysTokenUnregisterGCTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test142_WeakMapWithDateKeysTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: WeakMapWithDateKeysTokenUnregisterGCTest142");
    });

    /**
     * @tc.name   HeldValueAsArrayJoinedStringGCTest143
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_143
     * @tc.desc   HeldValueAsArrayJoinedStringGCTest143
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('HeldValueAsArrayJoinedStringGCTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test143_HeldValueAsArrayJoinedStringGC();
      expect(result).assertEqual("Test Passed: HeldValueAsArrayJoinedStringGCTest143");
    });



    /**
     * @tc.name   SetWithDateObjectsTokenUnregisterGCTest145
     * @tc.number SUB_FINALIZATION_REGISTRY_COMPREHENSIVE_TEST_145
     * @tc.desc   SetWithDateObjectsTokenUnregisterGCTest145
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetWithDateObjectsTokenUnregisterGCTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await FinalizationRegistryComprehensiveUtils.test145_SetWithDateObjectsTokenUnregisterGC();
      expect(result).assertEqual("Test Passed: SetWithDateObjectsTokenUnregisterGCTest145");
    });
  })
}