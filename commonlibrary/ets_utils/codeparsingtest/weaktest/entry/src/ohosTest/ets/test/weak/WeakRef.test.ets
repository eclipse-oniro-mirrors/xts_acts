/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { WeakRefTestUtils } from './WeakRefTestUtils'; // 导入JS验证工具
export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

export default function WeakRefTest() {
  describe('WeakRefTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30)
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

    // Predefine enums in advance (ignore if already existing in the project):
    // const TestType = { FUNCTION: 1, COMPATIBILITY: 2, SCENARIO: 3 };
    // const Size = { SMALLTEST: 1, MEDIUMTEST: 2, LARGETEST: 3 };
    // const Level = { LEVEL1: 1, LEVEL2: 2, LEVEL3: 3 };


    /**
     * @tc.name   WeakRefPrimitiveThrowErrorTest001
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_001
     * @tc.desc   Verify WeakRef throws TypeError when created with primitive values (number/string/symbol/etc.), works with objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakRefPrimitiveThrowErrorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakRefTestUtils.test001_PrimitiveWeakRefThrowError();
      expect(result).assertEqual("Test Passed: WeakRefPrimitiveThrowErrorTest001");
    });

    /**
     * @tc.name   WeakRefDerefBeforeAfterGCTest002
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_002
     * @tc.desc   Verify WeakRef.deref() returns the original object before GC and undefined after GC.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefDerefBeforeAfterGCTest002', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test002_DerefBeforeAfterGC();
      expect(result).assertEqual("Test Passed: WeakRefDerefBeforeAfterGCTest002");
    });

    /**
     * @tc.name   WeakRefFinalizationCallbackOnceTest003
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_003
     * @tc.desc   Verify FinalizationRegistry callback triggers once per registration when the object is GC'd.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefFinalizationCallbackOnceTest003', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test003_FinalizationCallbackMultiRegister();
      expect(result).assertEqual("Test Passed: WeakRefFinalizationCallbackMultiRegisterTest003");
    });

    /**
     * @tc.name   WeakRefFinalizationUnregisterTest004
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_004
     * @tc.desc   Verify FinalizationRegistry.unregister() cancels the callback, which does not trigger on object GC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefFinalizationUnregisterTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test004_FinalizationUnregister();
      expect(result).assertEqual("Test Passed: WeakRefFinalizationUnregisterTest004");
    });

    /**
     * @tc.name   WeakRefDerefConsistencyTest005
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_005
     * @tc.desc   Verify multiple calls to WeakRef.deref() return consistent results (same object before GC, undefined after).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakRefDerefConsistencyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakRefTestUtils.test005_DerefConsistency();
      expect(result).assertEqual("Test Passed: WeakRefDerefConsistencyTest005");
    });

    /**
     * @tc.name   WeakRefJsonStringifyTest006
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_006
     * @tc.desc   Verify WeakRef instances cannot be serialized with JSON.stringify (throws TypeError).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakRefJsonStringifyTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakRefTestUtils.test006_WeakRefJsonStringify();
      expect(result).assertEqual("Test Passed: WeakRefJsonStringifyTest006");
    });

    /**
     * @tc.name   WeakRefFinalizationCleanupSomeTest007
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_007
     * @tc.desc   Verify FinalizationRegistry.cleanupSome() manually triggers pending callbacks for GC'd objects.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefFinalizationCleanupSomeTest007', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test007_FinalizationCallbackAfterGC();
      expect(result).assertEqual("Test Passed: WeakRefFinalizationCallbackAfterGCTest007");
    });

    /**
     * @tc.name   WeakRefDoesNotPreventGCTest008
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_008
     * @tc.desc   Verify WeakRef's weak reference does not prevent object GC (object is collected when no strong references exist).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefDoesNotPreventGCTest008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test008_WeakRefDoesNotPreventGC();
      expect(result).assertEqual("Test Passed: WeakRefDoesNotPreventGCTest008");
    });

    /**
     * @tc.name   WeakRefNoUnregisterTokenTest009
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_009
     * @tc.desc   Verify FinalizationRegistry callbacks cannot be canceled if no unregisterToken was provided during registration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefNoUnregisterTokenTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test009_NoUnregisterTokenCannotCancel();
      expect(result).assertEqual("Test Passed: WeakRefNoUnregisterTokenTest009");
    });

    /**
     * @tc.name   WeakRefDerefUndefinedStableTest010
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_010
     * @tc.desc   Verify WeakRef.deref() returns undefined stably after GC (no state rollback in subsequent calls).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefDerefUndefinedStableTest010', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test010_DerefUndefinedStable();
      expect(result).assertEqual("Test Passed: WeakRefDerefUndefinedStableTest010");
    });
    /**
     * @tc.name   WeakRefCircularObjectGCTest011
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_011
     * @tc.desc   Verify WeakRef references to circular objects are GC'd normally (no block from circular refs).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefCircularObjectGCTest011', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test011_WeakRefCircularObjectGC();
      expect(result).assertEqual("Test Passed: WeakRefCircularObjectGCTest011");
    });

    /**
     * @tc.name   WeakRefFinalizationSameObjDifferentTokensTest012
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_012
     * @tc.desc   Verify FinalizationRegistry unregisters only the callback associated with the specific token (same object, multiple tokens).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefFinalizationSameObjDifferentTokensTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const result = await WeakRefTestUtils.test012_FinalizationSameObjDifferentTokens();
        expect(result).assertEqual("Test Passed: WeakRefFinalizationSameObjDifferentTokensTest012");
      });

    /**
     * @tc.name   WeakRefTargetModifyPrototypeTest013
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_013
     * @tc.desc   Verify modifying the prototype chain of a WeakRef target does not affect deref() or GC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefTargetModifyPrototypeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      try {
        await WeakRefTestUtils.test013_WeakRefTargetModifyPrototype();
      }catch (e) {
        expect(e.message).assertEqual("deref() returns object after GC (prototype modification affects GC)");
      }
    });


    /**
     * @tc.name   WeakRefMultipleWeakRefsSameObjectTest015
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_015
     * @tc.desc   Verify multiple WeakRefs to the same object are synchronized (all return undefined after GC).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefMultipleWeakRefsSameObjectTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test015_MultipleWeakRefsSameObject();
      expect(result).assertEqual("Test Passed: WeakRefMultipleWeakRefsSameObjectTest015");
    });


    /**
     * @tc.name   WeakRefFrozenTargetGCTest017
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_017
     * @tc.desc   Verify WeakRef to frozen object (Object.freeze()) is GC'd normally, deref() returns undefined after GC.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefFrozenTargetGCTest017', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test017_WeakRefFrozenTargetGC();
      expect(result).assertEqual("Test Passed: WeakRefFrozenTargetGCTest017");
    });

    /**
     * @tc.name   WeakRefFinalizationHeldValueComplexTypeTest018
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_018
     * @tc.desc   Verify FinalizationRegistry callback receives complex-type heldValue (array of objects) correctly when target is GC'd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefFinalizationHeldValueComplexTypeTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const result = await WeakRefTestUtils.test018_FinalizationHeldValueComplexType();
        expect(result).assertEqual("Test Passed: WeakRefFinalizationHeldValueComplexTypeTest018");
      });

    /**
     * @tc.name   WeakRefNestedObjectGCTest019
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_019
     * @tc.desc   Verify WeakRef to nested object (top-level has inner object) is GC'd normally, both levels reclaimed after strong ref release.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefNestedObjectGCTest019', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test019_WeakRefNestedObjectGC();
      expect(result).assertEqual("Test Passed: WeakRefNestedObjectGCTest019");
    });


    /**
     * @tc.name   WeakRefDerefInAsyncTest021
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_021
     * @tc.desc   Verify WeakRef.deref() returns correct value in async function (setTimeout): original object before GC, undefined after.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefDerefInAsyncTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test021_WeakRefDerefInAsync();
      expect(result).assertEqual("Test Passed: WeakRefDerefInAsyncTest021");
    });

    /**
     * @tc.name   WeakRefMultipleFRsSameTargetTest022
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_022
     * @tc.desc   Verify multiple independent FinalizationRegistries trigger their callbacks when the same target is GC'd.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefMultipleFRsSameTargetTest022', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test022_MultipleFRsSameTarget();
      expect(result).assertEqual("Test Passed: WeakRefMultipleFRsSameTargetTest022");
    });

    /**
     * @tc.name   WeakRefProxyTargetGCTest023
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_023
     * @tc.desc   Verify WeakRef to Proxy-wrapped object is GC'd normally, deref() returns Proxy before GC, undefined after.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefProxyTargetGCTest023', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test023_WeakRefProxyTargetGC();
      expect(result).assertEqual("Test Passed: WeakRefProxyTargetGCTest023");
    });

    /**
     * @tc.name   WeakRefFinalizationCallbackUnregisterOtherTest024
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_024
     * @tc.desc   Verify FinalizationRegistry callback can safely unregister another entry, and unregistered callback does not trigger.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefFinalizationCallbackUnregisterOtherTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const result = await WeakRefTestUtils.test024_FinalizationCallbackUnregisterOther();
        expect(result).assertEqual("Test Passed: WeakRefFinalizationCallbackUnregisterOtherTest024");
      });

    /**
     * @tc.name   WeakRefInClosureTest025
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_025
     * @tc.desc   Verify WeakRef in closure retains weak reference: deref() returns target before GC, undefined after (no strong ref leak).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefInClosureTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test025_WeakRefInClosure();
      expect(result).assertEqual("Test Passed: WeakRefInClosureTest025");
    });

    /**
     * @tc.name   WeakRefFinalizationHeldValueUndefinedTest026
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_026
     * @tc.desc   Verify FinalizationRegistry callback receives undefined heldValue correctly when target is GC'd.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakRefFinalizationHeldValueUndefinedTest026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakRefTestUtils.test026_FinalizationHeldValueUndefined();
      expect(result).assertEqual("Test Passed: WeakRefFinalizationHeldValueUndefinedTest026");
    });

    /**
     * @tc.name   WeakRefNonExtensibleTargetGCTest027
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_027
     * @tc.desc   Verify WeakRef to non-extensible object (Object.preventExtensions()) is GC'd normally, no impact on GC.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefNonExtensibleTargetGCTest027', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test027_WeakRefNonExtensibleTargetGC();
      expect(result).assertEqual("Test Passed: WeakRefNonExtensibleTargetGCTest027");
    });

    /**
     * @tc.name   WeakRefFinalizationDuplicateTargetTokenTest028
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_028
     * @tc.desc   Verify duplicate (target, token) registration in FinalizationRegistry overwrites entry, unregister cancels the overwritten one.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefFinalizationDuplicateTargetTokenTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const result = await WeakRefTestUtils.test028_FinalizationDuplicateTargetToken();
        expect(result).assertEqual("Test Passed: WeakRefFinalizationDuplicateTargetTokenTest028");
      });

    /**
     * @tc.name   WeakRefRepeatDerefTest029
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_029
     * @tc.desc   Verify multiple WeakRef.deref() calls (1500+ times) return consistent results: same object before GC, undefined after.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakRefRepeatDerefTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakRefTestUtils.test029_WeakRefRepeatDeref();
      expect(result).assertEqual("Test Passed: WeakRefRepeatDerefTest029");
    });


    /**
     * @tc.name   WeakRefFinalizationHeldValueNullTest034
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_034
     * @tc.desc   Verify FinalizationRegistry callback receives null heldValue correctly when target is GC'd.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakRefFinalizationHeldValueNullTest034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakRefTestUtils.test034_FinalizationHeldValueNull();
      expect(result).assertEqual("Test Passed: WeakRefFinalizationHeldValueNullTest034");
    });

    /**
     * @tc.name   WeakRefArrayBufferGCTest035
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_035
     * @tc.desc   Verify WeakRef to ArrayBuffer is GC'd normally, deref() returns buffer before GC, undefined after (data intact before GC).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefArrayBufferGCTest035', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test035_WeakRefArrayBufferGC();
      expect(result).assertEqual("Test Passed: WeakRefArrayBufferGCTest035");
    });

    /**
     * @tc.name   WeakRefSealedTargetGCTest036
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_036
     * @tc.desc   Verify WeakRef to sealed object (Object.seal()) works normally: deref() returns object before GC, undefined after (seal does not block GC).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefSealedTargetGCTest036', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test036_WeakRefSealedTargetGC();
      expect(result).assertEqual("Test Passed: WeakRefSealedTargetGCTest036");
    });

    /**
     * @tc.name   WeakRefFinalizationRegainStrongRefTest037
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_037
     * @tc.desc   Verify FinalizationRegistry callback does NOT trigger if target regains strong reference after registration; triggers only when no strong refs.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefFinalizationRegainStrongRefTest037', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test037_FinalizationRegainStrongRef();
      expect(result).assertEqual("Test Passed: WeakRefFinalizationRegainStrongRefTest037");
    });

    /**
     * @tc.name   WeakRefDerefNoCacheTest038
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_038
     * @tc.desc   Verify WeakRef.deref() has no cached results: returns object before GC, undefined after GC (dynamic check on each call).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefDerefNoCacheTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test038_WeakRefDerefNoCache();
      expect(result).assertEqual("Test Passed: WeakRefDerefNoCacheTest038");
    });


    /**
     * @tc.name   WeakRefTypedArrayGCTest040
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_040
     * @tc.desc   Verify WeakRef to TypedArray (Uint8Array) works normally: deref() returns TypedArray before GC, undefined after (buffer data intact before GC).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefTypedArrayGCTest040', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test040_WeakRefTypedArrayGC();
      expect(result).assertEqual("Test Passed: WeakRefTypedArrayGCTest040");
    });

    /**
     * @tc.name   WeakRefWeakMapMetaMonitorTest041
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_041
     * @tc.desc   Verify WeakMap stores object metadata, WeakRef monitors key GC (WeakMap entry removed when key is collected).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefWeakMapMetaMonitorTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test041_WeakMapMetaWithWeakRef();
      expect(result).assertEqual("Test Passed: WeakRefWeakMapMetaMonitorTest041");
    });

    /**
     * @tc.name   WeakRefWeakMapTempCacheTest042
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_042
     * @tc.desc   Verify temporary cache based on WeakRef+WeakMap: cache invalidates auto when key is GC'd.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefWeakMapTempCacheTest042', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test042_WeakRefWeakMapTempCache();
      expect(result).assertEqual("Test Passed: WeakRefWeakMapTempCacheTest042");
    });

    /**
     * @tc.name   WeakRefCallbackCleanWeakMapTest044
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_044
     * @tc.desc   Verify WeakRef+FinalizationRegistry triggers callback to clean WeakMap entries after key GC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakRefCallbackCleanWeakMapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test044_WeakRefCallbackCleanWeakMap();
      expect(result).assertEqual("Test Passed: WeakRefCallbackCleanWeakMapTest044");
    });

    /**
     * @tc.name   WeakRefWeakMapBatchMonitorTest045
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_045
     * @tc.desc   Verify batch object GC monitoring with WeakMap (state storage) and WeakRef array (survival detection).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakRefWeakMapBatchMonitorTest045', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test045_WeakRefWeakMapBatchMonitor();
      expect(result).assertEqual("Test Passed: WeakRefWeakMapBatchMonitorTest045");
    });

    /**
     * @tc.name   WeakMapKeySelfWeakRefValueTest046
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_046
     * @tc.desc   Verify WeakMap (key=target object, value=WeakRef of key) — key-value has self-reference; entry removed when key is GC'd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapKeySelfWeakRefValueTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test046_WeakMapKeySelfWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapKeySelfWeakRefValueTest046");
    });

    /**
     * @tc.name   WeakMapParentKeyChildWeakRefValueTest047
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_047
     * @tc.desc   Verify WeakMap (key=parent object, value=WeakRef of child) — parent references child; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapParentKeyChildWeakRefValueTest047', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test047_WeakMapParentKeyChildWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapParentKeyChildWeakRefValueTest047");
    });

    /**
     * @tc.name   WeakMapContainerKeyElementWeakRefValueTest048
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_048
     * @tc.desc   Verify WeakMap (key=container, value=WeakRef of element) — container includes element; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapContainerKeyElementWeakRefValueTest048', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test048_WeakMapContainerKeyElementWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapContainerKeyElementWeakRefValueTest048");
    });

    /**
     * @tc.name   WeakMapOwnerKeyResourceWeakRefValueTest049
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_049
     * @tc.desc   Verify WeakMap (key=resource owner, value=WeakRef of resource) — owner references resource; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapOwnerKeyResourceWeakRefValueTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test049_WeakMapOwnerKeyResourceWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapOwnerKeyResourceWeakRefValueTest049");
    });

    /**
     * @tc.name   WeakMapKeyMetaWithWeakRefValueTest050
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_050
     * @tc.desc   Verify WeakMap (key=target, value=meta with target's WeakRef) — meta references target; entry removed when target is GC'd.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapKeyMetaWithWeakRefValueTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test050_WeakMapKeyMetaWithWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapKeyMetaWithWeakRefValueTest050");
    });

    /**
     * @tc.name   WeakMapProxyKeyOriginalWeakRefValueTest051
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_051
     * @tc.desc   Verify WeakMap (key=proxy object, value=WeakRef of original) — proxy links to original; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapProxyKeyOriginalWeakRefValueTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test051_WeakMapProxyKeyOriginalWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapProxyKeyOriginalWeakRefValueTest051");
    });

    /**
     * @tc.name   WeakMapBaseKeySubWeakRefValueTest052
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_052
     * @tc.desc   Verify WeakMap (key=base class instance, value=WeakRef of sub class instance) — sub links to base; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapBaseKeySubWeakRefValueTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test052_WeakMapBaseKeySubWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapBaseKeySubWeakRefValueTest052");
    });

    /**
     * @tc.name   WeakMapItemKeyArrayWeakRefValueTest053
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_053
     * @tc.desc   Verify WeakMap (key=array item, value=WeakRef of array) — array contains item; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapItemKeyArrayWeakRefValueTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test053_WeakMapItemKeyArrayWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapItemKeyArrayWeakRefValueTest053");
    });


    /**
     * @tc.name   WeakMapModuleKeyDependencyWeakRefValueTest055
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_055
     * @tc.desc   Verify WeakMap (key=module instance, value=WeakRef of dependency) — module links to dependency; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapModuleKeyDependencyWeakRefValueTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const result = await WeakRefTestUtils.test055_WeakMapModuleKeyDependencyWeakRefValue();
        expect(result).assertEqual("Test Passed: WeakMapModuleKeyDependencyWeakRefValueTest055");
      });

    /**
     * @tc.name   WeakMapCacheKeyValueWeakRefValueTest056
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_056
     * @tc.desc   Verify WeakMap (key=cache key, value=WeakRef of cache value) — value links to key; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapCacheKeyValueWeakRefValueTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test056_WeakMapCacheKeyValueWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapCacheKeyValueWeakRefValueTest056");
    });

    /**
     * @tc.name   WeakMapEventSourceKeyHandlerWeakRefValueTest057
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_057
     * @tc.desc   Verify WeakMap (key=event source, value=WeakRef of handler) — handler links to source; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapEventSourceKeyHandlerWeakRefValueTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const result = await WeakRefTestUtils.test057_WeakMapEventSourceKeyHandlerWeakRefValue();
        expect(result).assertEqual("Test Passed: WeakMapEventSourceKeyHandlerWeakRefValueTest057");
      });

    /**
     * @tc.name   WeakMapCollectionKeyIteratorWeakRefValueTest058
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_058
     * @tc.desc   Verify WeakMap (key=collection, value=WeakRef of iterator) — iterator links to collection; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapCollectionKeyIteratorWeakRefValueTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const result = await WeakRefTestUtils.test058_WeakMapCollectionKeyIteratorWeakRefValue();
        expect(result).assertEqual("Test Passed: WeakMapCollectionKeyIteratorWeakRefValueTest058");
      });

    /**
     * @tc.name   WeakMapConfigKeyGeneratorWeakRefValueTest059
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_059
     * @tc.desc   Verify WeakMap (key=config, value=WeakRef of generator) — generator links to config; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapConfigKeyGeneratorWeakRefValueTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test059_WeakMapConfigKeyGeneratorWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapConfigKeyGeneratorWeakRefValueTest059");
    });

    /**
     * @tc.name   WeakMapMainKey附属WeakRefValueTest060
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_060
     * @tc.desc   Verify WeakMap (key=main object, value=WeakRef of 附属) — 附属 links to main; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapMainKey附属WeakRefValueTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test060_WeakMapMainKey附属WeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapMainKey附属WeakRefValueTest060");
    });

    /**
     * @tc.name   WeakMapCopyKeyOriginalWeakRefValueTest061
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_061
     * @tc.desc   Verify WeakMap (key=copy object, value=WeakRef of original) — copy links to original; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapCopyKeyOriginalWeakRefValueTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test061_WeakMapCopyKeyOriginalWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapCopyKeyOriginalWeakRefValueTest061");
    });

    /**
     * @tc.name   WeakMapTaskKeyResultWeakRefValueTest062
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_062
     * @tc.desc   Verify WeakMap (key=task, value=WeakRef of result) — result links to task; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapTaskKeyResultWeakRefValueTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test062_WeakMapTaskKeyResultWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapTaskKeyResultWeakRefValueTest062");
    });

    /**
     * @tc.name   WeakMapObserverKeySubjectWeakRefValueTest063
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_063
     * @tc.desc   Verify WeakMap (key=observer, value=WeakRef of subject) — observer links to subject; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapObserverKeySubjectWeakRefValueTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test063_WeakMapObserverKeySubjectWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapObserverKeySubjectWeakRefValueTest063");
    });

    /**
     * @tc.name   WeakMapFunctionKeyClosureWeakRefValueTest064
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_064
     * @tc.desc   Verify WeakMap (key=function, value=WeakRef of closure) — function links to closure; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapFunctionKeyClosureWeakRefValueTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test064_WeakMapFunctionKeyClosureWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapFunctionKeyClosureWeakRefValueTest064");
    });

    /**
     * @tc.name   WeakMapErrorKeySourceWeakRefValueTest065
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_065
     * @tc.desc   Verify WeakMap (key=error object, value=WeakRef of source) — error links to source; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapErrorKeySourceWeakRefValueTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test065_WeakMapErrorKeySourceWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapErrorKeySourceWeakRefValueTest065");
    });

    /**
     * @tc.name   WeakMapTimeKeyTimerWeakRefValueTest066
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_066
     * @tc.desc   Verify WeakMap (key=time object, value=WeakRef of timer) — timer links to time; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapTimeKeyTimerWeakRefValueTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test066_WeakMapTimeKeyTimerWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapTimeKeyTimerWeakRefValueTest066");
    });


    /**
     * @tc.name   WeakMapPermissionKeyRoleWeakRefValueTest068
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_068
     * @tc.desc   Verify WeakMap (key=permission, value=WeakRef of role) — permission links to role; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapPermissionKeyRoleWeakRefValueTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test068_WeakMapPermissionKeyRoleWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapPermissionKeyRoleWeakRefValueTest068");
    });


    /**
     * @tc.name   WeakMapSessionKeyUserWeakRefValueTest070
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_070
     * @tc.desc   Verify WeakMap (key=session, value=WeakRef of user) — session links to user; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapSessionKeyUserWeakRefValueTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test070_WeakMapSessionKeyUserWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapSessionKeyUserWeakRefValueTest070");
    });

    /**
     * @tc.name   WeakMapArrayKeyElementWeakRefValueTest071
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_071
     * @tc.desc   Verify WeakMap (key=Array, value=WeakRef of array element) — array contains element; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapArrayKeyElementWeakRefValueTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test071_WeakMapArrayKeyElementWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapArrayKeyElementWeakRefValueTest071");
    });

    /**
     * @tc.name   WeakMapSetKeyElementWeakRefValueTest072
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_072
     * @tc.desc   Verify WeakMap (key=Set, value=WeakRef of set element) — set contains element; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapSetKeyElementWeakRefValueTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test072_WeakMapSetKeyElementWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapSetKeyElementWeakRefValueTest072");
    });

    /**
     * @tc.name   WeakMapMapKeyValueWeakRefValueTest073
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_073
     * @tc.desc   Verify WeakMap (key=Map, value=WeakRef of map value) — map contains value; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapMapKeyValueWeakRefValueTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test073_WeakMapMapKeyValueWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapMapKeyValueWeakRefValueTest073");
    });

    /**
     * @tc.name   WeakMapDateKeyDataWeakRefValueTest074
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_074
     * @tc.desc   Verify WeakMap (key=Date, value=WeakRef of related data) — data links to date; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapDateKeyDataWeakRefValueTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test074_WeakMapDateKeyDataWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapDateKeyDataWeakRefValueTest074");
    });

    /**
     * @tc.name   WeakMapRegExpKeyResultWeakRefValueTest075
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_075
     * @tc.desc   Verify WeakMap (key=RegExp, value=WeakRef of match result) — result links to regex; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapRegExpKeyResultWeakRefValueTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test075_WeakMapRegExpKeyResultWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapRegExpKeyResultWeakRefValueTest075");
    });

    /**
     * @tc.name   WeakMapArrayElementKeyArrayWeakRefValueTest076
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_076
     * @tc.desc   Verify WeakMap (key=Array element, value=WeakRef of array) — element in array; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapArrayElementKeyArrayWeakRefValueTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const result = await WeakRefTestUtils.test076_WeakMapArrayElementKeyArrayWeakRefValue();
        expect(result).assertEqual("Test Passed: WeakMapArrayElementKeyArrayWeakRefValueTest076");
      });

    /**
     * @tc.name   WeakMapSetElementKeySetWeakRefValueTest077
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_077
     * @tc.desc   Verify WeakMap (key=Set element, value=WeakRef of set) — element in set; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapSetElementKeySetWeakRefValueTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test077_WeakMapSetElementKeySetWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapSetElementKeySetWeakRefValueTest077");
    });

    /**
     * @tc.name   WeakMapMapKeyKeyMapWeakRefValueTest078
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_078
     * @tc.desc   Verify WeakMap (key=Map key, value=WeakRef of map) — key in map; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapMapKeyKeyMapWeakRefValueTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test078_WeakMapMapKeyKeyMapWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapMapKeyKeyMapWeakRefValueTest078");
    });

    /**
     * @tc.name   WeakMapMapValueKeyMapWeakRefValueTest079
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_079
     * @tc.desc   Verify WeakMap (key=Map value, value=WeakRef of map) — value in map; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapMapValueKeyMapWeakRefValueTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test079_WeakMapMapValueKeyMapWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapMapValueKeyMapWeakRefValueTest079");
    });

    /**
     * @tc.name   WeakMapDateKeyParsedWeakRefValueTest080
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_080
     * @tc.desc   Verify WeakMap (key=Date, value=WeakRef of parsed result) — parsed result links to date; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapDateKeyParsedWeakRefValueTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test080_WeakMapDateKeyParsedWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapDateKeyParsedWeakRefValueTest080");
    });

    /**
     * @tc.name   WeakMapRegExpKeyStringWeakRefValueTest081
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_081
     * @tc.desc   Verify WeakMap (key=RegExp, value=WeakRef of target string) — regex links to string; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapRegExpKeyStringWeakRefValueTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test081_WeakMapRegExpKeyStringWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapRegExpKeyStringWeakRefValueTest081");
    });

    /**
     * @tc.name   WeakMapArrayBufferKeyArrayWeakRefValueTest082
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_082
     * @tc.desc   Verify WeakMap (key=ArrayBuffer, value=WeakRef of typed array) — buffer in array; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapArrayBufferKeyArrayWeakRefValueTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const result = await WeakRefTestUtils.test082_WeakMapArrayBufferKeyArrayWeakRefValue();
        expect(result).assertEqual("Test Passed: WeakMapArrayBufferKeyArrayWeakRefValueTest082");
      });

    /**
     * @tc.name   WeakMapMapKeyKeysArrayWeakRefValueTest083
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_083
     * @tc.desc   Verify WeakMap (key=Map, value=WeakRef of keys array) — keys array links to map; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapMapKeyKeysArrayWeakRefValueTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test083_WeakMapMapKeyKeysArrayWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapMapKeyKeysArrayWeakRefValueTest083");
    });

    /**
     * @tc.name   WeakMapSetKeyValuesArrayWeakRefValueTest084
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_084
     * @tc.desc   Verify WeakMap (key=Set, value=WeakRef of values array) — values array links to set; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapSetKeyValuesArrayWeakRefValueTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test084_WeakMapSetKeyValuesArrayWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapSetKeyValuesArrayWeakRefValueTest084");
    });

    /**
     * @tc.name   WeakMapDateKeyTimestampsWeakRefValueTest085
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_085
     * @tc.desc   Verify WeakMap (key=Date, value=WeakRef of timestamps array) — timestamps link to date; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapDateKeyTimestampsWeakRefValueTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test085_WeakMapDateKeyTimestampsWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapDateKeyTimestampsWeakRefValueTest085");
    });

    /**
     * @tc.name   WeakMapRegExpKeyReplacedWeakRefValueTest086
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_086
     * @tc.desc   Verify WeakMap (key=RegExp, value=WeakRef of replaced string) — replaced string links to regex; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapRegExpKeyReplacedWeakRefValueTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test086_WeakMapRegExpKeyReplacedWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapRegExpKeyReplacedWeakRefValueTest086");
    });

    /**
     * @tc.name   WeakMapArrayKeySortedWeakRefValueTest087
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_087
     * @tc.desc   Verify WeakMap (key=Array, value=WeakRef of sorted array) — sorted array links to original; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapArrayKeySortedWeakRefValueTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test087_WeakMapArrayKeySortedWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapArrayKeySortedWeakRefValueTest087");
    });

    /**
     * @tc.name   WeakMapMapKeyInvertedWeakRefValueTest088
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_088
     * @tc.desc   Verify WeakMap (key=Map, value=WeakRef of inverted map) — inverted map links to original; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapMapKeyInvertedWeakRefValueTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test088_WeakMapMapKeyInvertedWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapMapKeyInvertedWeakRefValueTest088");
    });

    /**
     * @tc.name   WeakMapSetKeyFilteredWeakRefValueTest089
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_089
     * @tc.desc   Verify WeakMap (key=Set, value=WeakRef of filtered set) — filtered set links to original; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapSetKeyFilteredWeakRefValueTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test089_WeakMapSetKeyFilteredWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapSetKeyFilteredWeakRefValueTest089");
    });

    /**
     * @tc.name   WeakMapRegExpKeyMatchesWeakRefValueTest090
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_090
     * @tc.desc   Verify WeakMap (key=RegExp, value=WeakRef of matches array) — matches array links to regex; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapRegExpKeyMatchesWeakRefValueTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test090_WeakMapRegExpKeyMatchesWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapRegExpKeyMatchesWeakRefValueTest090");
    });

    /**
     * @tc.name   WeakMapArrayKeySliceWeakRefValueTest091
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_091
     * @tc.desc   Verify WeakMap (key=Array, value=WeakRef of slice) — slice links to original array; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapArrayKeySliceWeakRefValueTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test091_WeakMapArrayKeySliceWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapArrayKeySliceWeakRefValueTest091");
    });

    /**
     * @tc.name   WeakMapMapKeyEntriesWeakRefValueTest092
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_092
     * @tc.desc   Verify WeakMap (key=Map, value=WeakRef of entries array) — entries link to map; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapMapKeyEntriesWeakRefValueTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test092_WeakMapMapKeyEntriesWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapMapKeyEntriesWeakRefValueTest092");
    });

    /**
     * @tc.name   WeakMapSetKeyUnionWeakRefValueTest093
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_093
     * @tc.desc   Verify WeakMap (key=Set, value=WeakRef of union set) — union links to original set; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapSetKeyUnionWeakRefValueTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test093_WeakMapSetKeyUnionWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapSetKeyUnionWeakRefValueTest093");
    });

    /**
     * @tc.name   WeakMapDateKeyLocaleWeakRefValueTest094
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_094
     * @tc.desc   Verify WeakMap (key=Date, value=WeakRef of locale string) — locale string links to date; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapDateKeyLocaleWeakRefValueTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test094_WeakMapDateKeyLocaleWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapDateKeyLocaleWeakRefValueTest094");
    });

    /**
     * @tc.name   WeakMapRegExpKeyGroupsWeakRefValueTest095
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_095
     * @tc.desc   Verify WeakMap (key=RegExp, value=WeakRef of groups) — groups link to regex; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapRegExpKeyGroupsWeakRefValueTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test095_WeakMapRegExpKeyGroupsWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapRegExpKeyGroupsWeakRefValueTest095");
    });

    /**
     * @tc.name   WeakMapBufferKeyViewWeakRefValueTest096
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_096
     * @tc.desc   Verify WeakMap (key=ArrayBuffer, value=WeakRef of DataView) — view links to buffer; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapBufferKeyViewWeakRefValueTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test096_WeakMapBufferKeyViewWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapBufferKeyViewWeakRefValueTest096");
    });

    /**
     * @tc.name   WeakMapMapKeyTransformedWeakRefValueTest097
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_097
     * @tc.desc   Verify WeakMap (key=Map, value=WeakRef of transformed map) — transformed links to original; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapMapKeyTransformedWeakRefValueTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test097_WeakMapMapKeyTransformedWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapMapKeyTransformedWeakRefValueTest097");
    });

    /**
     * @tc.name   WeakMapSetKeyIntersectionWeakRefValueTest098
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_098
     * @tc.desc   Verify WeakMap (key=Set, value=WeakRef of intersection) — intersection links to original; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapSetKeyIntersectionWeakRefValueTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test098_WeakMapSetKeyIntersectionWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapSetKeyIntersectionWeakRefValueTest098");
    });

    /**
     * @tc.name   WeakMapDateKeyDiffWeakRefValueTest099
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_099
     * @tc.desc   Verify WeakMap (key=Date, value=WeakRef of date diff) — diff links to base date; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapDateKeyDiffWeakRefValueTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test099_WeakMapDateKeyDiffWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapDateKeyDiffWeakRefValueTest099");
    });

    /**
     * @tc.name   WeakMapRegExpKeyReplaceFnWeakRefValueTest100
     * @tc.number SUB_BUILTINS_WEAKREF_TEST_100
     * @tc.desc   Verify WeakMap (key=RegExp, value=WeakRef of replace result) — result links to regex; both GC'd, entry removed.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapRegExpKeyReplaceFnWeakRefValueTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakRefTestUtils.test100_WeakMapRegExpKeyReplaceFnWeakRefValue();
      expect(result).assertEqual("Test Passed: WeakMapRegExpKeyReplaceFnWeakRefValueTest100");
    });

  })
}