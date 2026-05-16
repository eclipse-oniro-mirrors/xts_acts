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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { WeakSetTestUtils } from './WeakSetTestUtils.js'; // 导入JS验证工具
export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}


export default function WeakSetTest() {
  describe('WeakSetTest', () => {
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

    /**
     * @tc.name   WeakSetPrimitiveKeyThrowErrorTest001
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_001
     * @tc.desc   Verify WeakSet throws TypeError when adding primitive values (number/string/symbol/null/undefined/BigInt) as keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetPrimitiveKeyThrowErrorTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test001_PrimitiveKeyThrowError();
      expect(result).assertEqual("Test Passed: WeakSetPrimitiveKeyThrowErrorTest001");
    });

    /**
     * @tc.name   WeakSetWeakRefKeyGCTest002
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_002
     * @tc.desc   Verify WeakSet holds weak references: key is GC'd when no strong references exist, has() returns false.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetWeakRefKeyGCTest002', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test002_WeakRefKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetWeakRefKeyGCTest002");
    });

    /**
     * @tc.name   WeakSetAddDuplicateKeyTest003
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_003
     * @tc.desc   Verify WeakSet.add() does not throw error or duplicate entries when adding the same key (same reference) multiple times.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetAddDuplicateKeyTest003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test003_AddDuplicateKey();
      expect(result).assertEqual("Test Passed: WeakSetAddDuplicateKeyTest003");
    });

    /**
     * @tc.name   WeakSetDeleteReturnTest004
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_004
     * @tc.desc   Verify WeakSet.delete() returns true for existing keys and false for non-existing/deleted keys.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetDeleteReturnTest004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test004_DeleteReturnCorrectness();
      expect(result).assertEqual("Test Passed: WeakSetDeleteReturnTest004");
    });

    /**
     * @tc.name   WeakSetHasDetectionTest005
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_005
     * @tc.desc   Verify WeakSet.has() correctly detects key presence (true after add, false after delete).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetHasDetectionTest005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test005_HasCorrectDetection();
      expect(result).assertEqual("Test Passed: WeakSetHasDetectionTest005");
    });

    /**
     * @tc.name   WeakSetNoSizePropertyTest006
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_006
     * @tc.desc   Verify WeakSet has no 'size' property (returns undefined, cannot be assigned, not in own properties).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetNoSizePropertyTest006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test006_NoSizeProperty();
      expect(result).assertEqual("Test Passed: WeakSetNoSizePropertyTest006");
    });

    /**
     * @tc.name   WeakSetNotIterableTest007
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_007
     * @tc.desc   Verify WeakSet is not iterable: no [Symbol.iterator]/forEach/entries/keys/values methods, for...of throws TypeError.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetNotIterableTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test007_NotIterable();
      expect(result).assertEqual("Test Passed: WeakSetNotIterableTest007");
    });

    /**
     * @tc.name   WeakSetAddChainingTest008
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_008
     * @tc.desc   Verify WeakSet.add() returns the WeakSet instance itself, supporting method chaining (add multiple keys in sequence).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetAddChainingTest008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test008_AddChaining();
      expect(result).assertEqual("Test Passed: WeakSetAddChainingTest008");
    });

    /**
     * @tc.name   WeakSetNullKeyThrowErrorTest009
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_009
     * @tc.desc   Verify WeakSet throws TypeError when adding null as a key (null is typeof 'object' but invalid for WeakSet).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetNullKeyThrowErrorTest009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test009_NullKeyThrowError();
      expect(result).assertEqual("Test Passed: WeakSetNullKeyThrowErrorTest009");
    });

    /**
     * @tc.name   WeakSetClosurePrivateStorageTest010
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_010
     * @tc.desc   Verify WeakSet works as closure-private storage: external code cannot access the WeakSet, only internal class methods can operate it.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetClosurePrivateStorageTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test010_ClosurePrivateStorage();
      expect(result).assertEqual("Test Passed: WeakSetClosurePrivateStorageTest010");
    });



    /**
     * @tc.name   WeakSetFrozenKeyPrototypeModTest012
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_012
     * @tc.desc   Verify frozen object keys retain WeakSet association after prototype modification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetFrozenKeyPrototypeModTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test012_FrozenKeyPrototypeMod();
      expect(result).assertEqual("Test Passed: WeakSetFrozenKeyPrototypeModTest012");
    });

    /**
     * @tc.name   WeakSetSealedKeyOperationsTest013
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_013
     * @tc.desc   Verify sealed object keys support normal WeakSet operations (add/has/delete) despite sealed restrictions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetSealedKeyOperationsTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test013_SealedKeyOperations();
      expect(result).assertEqual("Test Passed: WeakSetSealedKeyOperationsTest013");
    });

    /**
     * @tc.name   WeakSetClassInstanceProtoModTest014
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_014
     * @tc.desc   Verify class instance keys retain WeakSet association after prototype chain modification.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetClassInstanceProtoModTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test014_ClassInstanceProtoMod();
      expect(result).assertEqual("Test Passed: WeakSetClassInstanceProtoModTest014");
    });

    /**
     * @tc.name   WeakSetEmptyObjectKeyPropsTest015
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_015
     * @tc.desc   Verify empty object keys retain WeakSet association after adding properties.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetEmptyObjectKeyPropsTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test015_EmptyObjectKeyProps();
      expect(result).assertEqual("Test Passed: WeakSetEmptyObjectKeyPropsTest015");
    });

    /**
     * @tc.name   WeakSetSharedKeyMultiSetsGCTest016
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_016
     * @tc.desc   Verify shared keys across multiple WeakSets are GC'd in all WeakSets when strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetSharedKeyMultiSetsGCTest016', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test016_SharedKeyMultiWeakSetsGC();
      expect(result).assertEqual("Test Passed: WeakSetSharedKeyMultiSetsGCTest016");
    });

    /**
     * @tc.name   WeakSetKeyInWeakMapGCTest017
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_017
     * @tc.desc   Verify keys in both WeakSet and WeakMap are GC'd in both when strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetKeyInWeakMapGCTest017', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test017_KeyInWeakMapWeakSetGC();
      expect(result).assertEqual("Test Passed: WeakSetKeyInWeakMapGCTest017");
    });

    /**
     * @tc.name   WeakSetWithFinalizationRegistryTest018
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_018
     * @tc.desc   Verify WeakSet key GC triggers FinalizationRegistry callback.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetWithFinalizationRegistryTest018', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test018_WeakSetWithFinalizationRegistry();
      expect(result).assertEqual("Test Passed: WeakSetWithFinalizationRegistryTest018");
    });

    /**
     * @tc.name   WeakSetComplexAddChainingTest019
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_019
     * @tc.desc   Verify complex add() chaining (add → delete → add) returns WeakSet instance consistently.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetComplexAddChainingTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test019_ComplexAddChaining();
      expect(result).assertEqual("Test Passed: WeakSetComplexAddChainingTest019");
    });

    /**
     * @tc.name   WeakSetHasGCdKeyTest020
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_020
     * @tc.desc   Verify has() returns false (no error) for GC'd keys.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetHasGCdKeyTest020', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test020_HasGCdKey();
      expect(result).assertEqual("Test Passed: WeakSetHasGCdKeyTest020");
    });

    /**
     * @tc.name   WeakSetDeleteGCdKeyTest021
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_021
     * @tc.desc   Verify delete() returns false (no error) for GC'd keys.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetDeleteGCdKeyTest021', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test021_DeleteGCdKey();
      expect(result).assertEqual("Test Passed: WeakSetDeleteGCdKeyTest021");
    });



    /**
     * @tc.name   WeakSetCrossScopeTest023
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_023
     * @tc.desc   Verify WeakSet maintains consistent state across different function scopes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetCrossScopeTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test023_CrossScopeWeakSet();
      expect(result).assertEqual("Test Passed: WeakSetCrossScopeTest023");
    });

    /**
     * @tc.name   WeakSetStaticClassTest024
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_024
     * @tc.desc   Verify static class WeakSet tracks instances consistently across class methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetStaticClassTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test024_StaticClassWeakSet();
      expect(result).assertEqual("Test Passed: WeakSetStaticClassTest024");
    });

    /**
     * @tc.name   WeakSetBatchKeyGCTest025
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_025
     * @tc.desc   Verify 10+ batch keys are GC'd when all strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetBatchKeyGCTest025', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test025_BatchKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetBatchKeyGCTest025");
    });

    /**
     * @tc.name   WeakSetCircularRefKeyGCTest026
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_026
     * @tc.desc   Verify circular reference keys are GC'd when external strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetCircularRefKeyGCTest026', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test026_CircularRefKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetCircularRefKeyGCTest026");
    });

    /**
     * @tc.name   WeakSetWrappedSymbolKeyTest027
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_027
     * @tc.desc   Verify wrapped Symbol objects (Object(Symbol())) are valid WeakSet keys, while primitive Symbols are not.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetWrappedSymbolKeyTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test027_WrappedSymbolAsKey();
      expect(result).assertEqual("Test Passed: WeakSetWrappedSymbolKeyTest027");
    });

    /**
     * @tc.name   WeakSetOverriddenProtoMethodsTest028
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_028
     * @tc.desc   Verify overridden WeakSet prototype methods affect instance behavior (e.g., add() call tracking).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetOverriddenProtoMethodsTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test028_OverriddenProtoMethods();
      expect(result).assertEqual("Test Passed: WeakSetOverriddenProtoMethodsTest028");
    });

    /**
     * @tc.name   WeakSetMethodThisBindingTest029
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_029
     * @tc.desc   Verify WeakSet methods (add/has/delete) throw when called with non-WeakSet `this` (via call()).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetMethodThisBindingTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test029_MethodThisBinding();
      expect(result).assertEqual("Test Passed: WeakSetMethodThisBindingTest029");
    });

    /**
     * @tc.name   WeakSetTypedArrayAsKeyTest031
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_031
     * @tc.desc   Verify TypedArray instances as WeakSet keys: modifying buffer does not break association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetTypedArrayAsKeyTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test031_TypedArrayAsKey();
      expect(result).assertEqual("Test Passed: WeakSetTypedArrayAsKeyTest031");
    });

    /**
     * @tc.name   WeakSetErrorInstanceAsKeyTest032
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_032
     * @tc.desc   Verify Error instances as WeakSet keys: modifying message/stack does not break association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetErrorInstanceAsKeyTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test032_ErrorInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakSetErrorInstanceAsKeyTest032");
    });



    /**
     * @tc.name   WeakSetKeyInMultipleArraysGCTest034
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_034
     * @tc.desc   Verify key referenced by multiple arrays is GC'd when all arrays are cleared.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetKeyInMultipleArraysGCTest034', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test034_KeyInMultipleArraysGC();
      expect(result).assertEqual("Test Passed: WeakSetKeyInMultipleArraysGCTest034");
    });

    /**
     * @tc.name   WeakSetAddMultipleArgsTest035
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_035
     * @tc.desc   Verify WeakSet.add() with multiple arguments processes only the first (valid) argument.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetAddMultipleArgsTest035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test035_AddMultipleArguments();
      expect(result).assertEqual("Test Passed: WeakSetAddMultipleArgsTest035");
    });

    /**
     * @tc.name   WeakSetJsonStringifyTest036
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_036
     * @tc.desc   Verify JSON.stringify(WeakSet) throws TypeError (WeakSet cannot be serialized).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetJsonStringifyTest036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test036_WeakSetJsonStringify();
      expect(result).assertEqual("Test Passed: WeakSetJsonStringifyTest036");
    });

    /**
     * @tc.name   WeakSetKeyWithNullPrototypeTest037
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_037
     * @tc.desc   Verify key objects with null prototype (Object.create(null)) work normally in WeakSet.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetKeyWithNullPrototypeTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test037_KeyWithNullPrototype();
      expect(result).assertEqual("Test Passed: WeakSetKeyWithNullPrototypeTest037");
    });

    /**
     * @tc.name   WeakSetTrackEventListenersTest038
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_038
     * @tc.desc   Verify WeakSet tracks event listeners to avoid duplicate bindings (practical use case).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetTrackEventListenersTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test038_WeakSetTrackEventListeners();
      expect(result).assertEqual("Test Passed: WeakSetTrackEventListenersTest038");
    });

    /**
     * @tc.name   WeakSetSameKeyTwoSetsGCTest039
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_039
     * @tc.desc   Verify same key in two WeakSets is GC'd in both when strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetSameKeyTwoSetsGCTest039', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test039_SameKeyTwoWeakSetsGC();
      expect(result).assertEqual("Test Passed: WeakSetSameKeyTwoSetsGCTest039");
    });

    /**
     * @tc.name   WeakSetDeleteNonObjectTest040
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_040
     * @tc.desc   Verify WeakSet.delete() with non-object arguments returns false and does not throw.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetDeleteNonObjectTest040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test040_DeleteNonObject();
      expect(result).assertEqual("Test Passed: WeakSetDeleteNonObjectTest040");
    });



    /**
     * @tc.name   WeakSetAsyncFunctionKeyGCTest042
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_042
     * @tc.desc   Verify AsyncFunction instances as WeakSet keys are GC'd when strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAsyncFunctionKeyGCTest042', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test042_AsyncFunctionAsKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetAsyncFunctionKeyGCTest042");
    });

    /**
     * @tc.name   WeakSetBatchSameStructKeysGCTest043
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_043
     * @tc.desc   Verify batch same-structure (different references) keys are all GC'd when references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetBatchSameStructKeysGCTest043', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test043_BatchSameStructKeysGC();
      expect(result).assertEqual("Test Passed: WeakSetBatchSameStructKeysGCTest043");
    });

    /**
     * @tc.name   WeakSetInPromiseAllTest044
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_044
     * @tc.desc   Verify WeakSet maintains consistent state when modified in parallel via Promise.all.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetInPromiseAllTest044', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test044_WeakSetInPromiseAll();
      expect(result).assertEqual("Test Passed: WeakSetInPromiseAllTest044");
    });

    /**
     * @tc.name   WeakSetProxyWrappedKeyTest045
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_045
     * @tc.desc   Verify Proxy-wrapped keys retain WeakSet association when their target is modified.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetProxyWrappedKeyTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test045_ProxyWrappedKeyTargetMod();
      expect(result).assertEqual("Test Passed: WeakSetProxyWrappedKeyTest045");
    });

    /**
     * @tc.name   WeakSetAsTemporaryCacheGCTest046
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_046
     * @tc.desc   Verify WeakSet used as temporary cache releases objects via GC (avoids memory leaks).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAsTemporaryCacheGCTest046', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test046_WeakSetAsTemporaryCacheGC();
      expect(result).assertEqual("Test Passed: WeakSetAsTemporaryCacheGCTest046");
    });

    /**
     * @tc.name   WeakSetInStrictModeTest047
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_047
     * @tc.desc   Verify WeakSet behaves consistently in strict mode (no unexpected errors).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetInStrictModeTest047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test047_WeakSetInStrictMode();
      expect(result).assertEqual("Test Passed: WeakSetInStrictModeTest047");
    });

    /**
     * @tc.name   WeakSetGeneratorFunctionKeyGCTest048
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_048
     * @tc.desc   Verify GeneratorFunction instances as WeakSet keys are GC'd when strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetGeneratorFunctionKeyGCTest048', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test048_GeneratorFunctionAsKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetGeneratorFunctionKeyGCTest048");
    });

    /**
     * @tc.name   WeakSetAddImmediateDeleteTest049
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_049
     * @tc.desc   Verify WeakSet.add() followed by immediate delete() results in the key not being present.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetAddImmediateDeleteTest049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test049_AddImmediateDelete();
      expect(result).assertEqual("Test Passed: WeakSetAddImmediateDeleteTest049");
    });

    /**
     * @tc.name   WeakSetKeyWithFrozenPropsTest050
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_050
     * @tc.desc   Verify key objects with partially frozen properties (not full object) retain WeakSet association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetKeyWithFrozenPropsTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test050_KeyWithFrozenProps();
      expect(result).assertEqual("Test Passed: WeakSetKeyWithFrozenPropsTest050");
    });

    /**
     * @tc.name   WeakSetMapInstanceAsKeyTest051
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_051
     * @tc.desc   Verify Map instances as WeakSet keys: modifying entries (add/delete/update) does not break association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetMapInstanceAsKeyTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test051_MapInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakSetMapInstanceAsKeyTest051");
    });

    /**
     * @tc.name   WeakSetSetInstanceAsKeyTest052
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_052
     * @tc.desc   Verify Set instances as WeakSet keys: modifying values (add/delete) does not break association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetSetInstanceAsKeyTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test052_SetInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakSetSetInstanceAsKeyTest052");
    });

    /**
     * @tc.name   WeakSetKeyInternalCircularRefGCTest053
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_053
     * @tc.desc   Verify keys with internal circular references (obj.self = obj) are GC'd when strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetKeyInternalCircularRefGCTest053', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test053_KeyWithInternalCircularRefGC();
      expect(result).assertEqual("Test Passed: WeakSetKeyInternalCircularRefGCTest053");
    });

    /**
     * @tc.name   WeakSetFrozenKeyMultiSetsGCTest054
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_054
     * @tc.desc   Verify frozen keys shared across 3+ WeakSets are GC'd in all WeakSets when strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetFrozenKeyMultiSetsGCTest054', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test054_FrozenKeyMultiWeakSetsGC();
      expect(result).assertEqual("Test Passed: WeakSetFrozenKeyMultiSetsGCTest054");
    });

    /**
     * @tc.name   WeakSetSubclassInstanceAsKeyTest055
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_055
     * @tc.desc   Verify subclass instances as WeakSet keys: parent method modifications do not break association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetSubclassInstanceAsKeyTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test055_SubclassInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakSetSubclassInstanceAsKeyTest055");
    });

    /**
     * @tc.name   WeakSetBigIntObjectAsKeyTest056
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_056
     * @tc.desc   Verify wrapped BigInt objects (Object(BigInt())) are valid WeakSet keys; primitive BigInt throws.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetBigIntObjectAsKeyTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test056_BigIntObjectAsKey();
      expect(result).assertEqual("Test Passed: WeakSetBigIntObjectAsKeyTest056");
    });

    /**
     * @tc.name   WeakSetKeyProtoArrayTest057
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_057
     * @tc.desc   Verify keys with Array as prototype retain WeakSet association after prototype modifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetKeyProtoArrayTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test057_KeyPrototypeSetToArr();
      expect(result).assertEqual("Test Passed: WeakSetKeyProtoArrayTest057");
    });

    /**
     * @tc.name   WeakSetCrossModuleTest058
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_058
     * @tc.desc   Verify simulated cross-module WeakSet maintains consistent state (add in ModuleA, delete in ModuleB).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetCrossModuleTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test058_CrossModuleWeakSet();
      expect(result).assertEqual("Test Passed: WeakSetCrossModuleTest058");
    });

    /**
     * @tc.name   WeakSetRepeatAddSameKeyTest059
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_059
     * @tc.desc   Verify 150+ repeated add() of the same key does not create duplicates or throw errors.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetRepeatAddSameKeyTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test059_RepeatAddSameKey();
      expect(result).assertEqual("Test Passed: WeakSetRepeatAddSameKeyTest059");
    });

    /**
     * @tc.name   WeakSetRepeatDeleteDeletedKeyTest060
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_060
     * @tc.desc   Verify 10+ repeated delete() of deleted/GC'd keys consistently returns false and does not throw.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL1
     */
    it('WeakSetRepeatDeleteDeletedKeyTest060', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test060_RepeatDeleteDeletedKey();
      expect(result).assertEqual("Test Passed: WeakSetRepeatDeleteDeletedKeyTest060");
    });

    /**
     * @tc.name   WeakSetSimulatedDomTextNodeGCTest061
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_061
     * @tc.desc   Verify simulated DOM Text nodes as WeakSet keys are GC'd after node removal.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetSimulatedDomTextNodeGCTest061', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test061_SimulatedDomTextNodeGC();
      expect(result).assertEqual("Test Passed: WeakSetSimulatedDomTextNodeGCTest061");
    });

    /**
     * @tc.name   WeakSetKeyInSetAndMapGCTest062
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_062
     * @tc.desc   Verify keys present in both WeakSet and WeakMap are GC'd in both when strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetKeyInSetAndMapGCTest062', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test062_KeyInWeakSetAndWeakMapGC();
      expect(result).assertEqual("Test Passed: WeakSetKeyInSetAndMapGCTest062");
    });

    /**
     * @tc.name   WeakSetSealedKeyWritablePropsTest063
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_063
     * @tc.desc   Verify sealed keys with writable properties retain WeakSet association after property modifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetSealedKeyWritablePropsTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test063_SealedKeyWithWritableProps();
      expect(result).assertEqual("Test Passed: WeakSetSealedKeyWritablePropsTest063");
    });

    /**
     * @tc.name   WeakSetAsObjectPoolGCTest064
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_064
     * @tc.desc   Verify WeakSet used as an object pool recycles unused objects via GC.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAsObjectPoolGCTest064', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test064_WeakSetAsObjectPoolGC();
      expect(result).assertEqual("Test Passed: WeakSetAsObjectPoolGCTest064");
    });

    /**
     * @tc.name   WeakSetProxyWrappedFrozenKeyGCTest065
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_065
     * @tc.desc   Verify Proxy-wrapped frozen objects as WeakSet keys are GC'd when strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetProxyWrappedFrozenKeyGCTest065', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test065_ProxyWrappedFrozenKeyGC();
      expect(result).assertEqual("Test Passed: WeakSetProxyWrappedFrozenKeyGCTest065");
    });

    /**
     * @tc.name   WeakSetSimulatedWorkerTest066
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_066
     * @tc.desc   Verify simulated Worker thread WeakSet maintains weak reference behavior (GC when no refs).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetSimulatedWorkerTest066', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test066_SimulatedWorkerWeakSet();
      expect(result).assertEqual("Test Passed: WeakSetSimulatedWorkerTest066");
    });

    /**
     * @tc.name   WeakSetKeyOverriddenToStringTest067
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_067
     * @tc.desc   Verify keys with overridden toString() retain WeakSet association after id modifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakSetKeyOverriddenToStringTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakSetTestUtils.test067_KeyWithOverriddenToString();
      expect(result).assertEqual("Test Passed: WeakSetKeyOverriddenToStringTest067");
    });



    /**
     * @tc.name   WeakSetHasSameStructGCdKeyTest069
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_069
     * @tc.desc   Verify has() returns false consistently for same-structure keys of a GC'd original key.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakSetHasSameStructGCdKeyTest069', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test069_HasSameStructGCdKey();
      expect(result).assertEqual("Test Passed: WeakSetHasSameStructGCdKeyTest069");
    });

    /**
     * @tc.name   WeakSetArrayBufferAsKeyTest070
     * @tc.number SUB_BUILTINS_WEAKSET_TEST_070
     * @tc.desc   Verify ArrayBuffer instances as WeakSet keys: modifying buffer content does not break association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetArrayBufferAsKeyTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test070_ArrayBufferAsKey();
      expect(result).assertEqual("Test Passed: WeakSetArrayBufferAsKeyTest070");
    });

    /**
     * @tc.name   WeakSetAddPlainObjectTest071
     * @tc.number SUB_WEAKSET_TEST_071
     * @tc.desc   Verify WeakSet.add() stores plain object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddPlainObjectTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test071_WeakSetAddPlainObject();
      expect(result).assertEqual("Test Passed: WeakSetAddPlainObjectTest071");
    });

    /**
     * @tc.name   WeakSetAddPrimitiveNumberTest072
     * @tc.number SUB_WEAKSET_TEST_072
     * @tc.desc   Verify WeakSet.add() throws TypeError when adding primitive number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddPrimitiveNumberTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test072_WeakSetAddPrimitiveNumber();
      expect(result).assertEqual("Test Passed: WeakSetAddPrimitiveNumberTest072");
    });

    /**
     * @tc.name   WeakSetAddDuplicateObjectTest073
     * @tc.number SUB_WEAKSET_TEST_073
     * @tc.desc   Verify WeakSet.add() same object multiple times, has() still returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddDuplicateObjectTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test073_WeakSetAddDuplicateObject();
      expect(result).assertEqual("Test Passed: WeakSetAddDuplicateObjectTest073");
    });

    /**
     * @tc.name   WeakSetDeleteExistingObjectTest074
     * @tc.number SUB_WEAKSET_TEST_074
     * @tc.desc   Verify WeakSet.delete() existing object returns true, has() returns false afterward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetDeleteExistingObjectTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test074_WeakSetDeleteExistingObject();
      expect(result).assertEqual("Test Passed: WeakSetDeleteExistingObjectTest074");
    });

    /**
     * @tc.name   WeakSetDeleteNonExistingObjectTest075
     * @tc.number SUB_WEAKSET_TEST_075
     * @tc.desc   Verify WeakSet.delete() non-existing object returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetDeleteNonExistingObjectTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test075_WeakSetDeleteNonExistingObject();
      expect(result).assertEqual("Test Passed: WeakSetDeleteNonExistingObjectTest075");
    });

    /**
     * @tc.name   WeakSetAddChainingTest076
     * @tc.number SUB_WEAKSET_TEST_076
     * @tc.desc   Verify WeakSet.add() returns instance, supporting method chaining
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddChainingTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test076_WeakSetAddChaining();
      expect(result).assertEqual("Test Passed: WeakSetAddChainingTest076");
    });

    /**
     * @tc.name   WeakSetIgnorePrototypeObjectsTest077
     * @tc.number SUB_WEAKSET_TEST_077
     * @tc.desc   Verify WeakSet ignores objects from prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetIgnorePrototypeObjectsTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test077_WeakSetIgnorePrototypeObjects();
      expect(result).assertEqual("Test Passed: WeakSetIgnorePrototypeObjectsTest077");
    });

    /**
     * @tc.name   WeakSetAddArrayObjectTest078
     * @tc.number SUB_WEAKSET_TEST_078
     * @tc.desc   Verify WeakSet.add() array object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddArrayObjectTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test078_WeakSetAddArrayObject();
      expect(result).assertEqual("Test Passed: WeakSetAddArrayObjectTest078");
    });

    /**
     * @tc.name   WeakSetAddFunctionObjectTest079
     * @tc.number SUB_WEAKSET_TEST_079
     * @tc.desc   Verify WeakSet.add() function object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddFunctionObjectTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test079_WeakSetAddFunctionObject();
      expect(result).assertEqual("Test Passed: WeakSetAddFunctionObjectTest079");
    });

    /**
     * @tc.name   WeakSetAddProxyObjectTest080
     * @tc.number SUB_WEAKSET_TEST_080
     * @tc.desc   Verify WeakSet.add() Proxy object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddProxyObjectTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test080_WeakSetAddProxyObject();
      expect(result).assertEqual("Test Passed: WeakSetAddProxyObjectTest080");
    });

    /**
     * @tc.name   WeakSetAddNullTest081
     * @tc.number SUB_WEAKSET_TEST_081
     * @tc.desc   Verify WeakSet.add() null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddNullTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test081_WeakSetAddNull();
      expect(result).assertEqual("Test Passed: WeakSetAddNullTest081");
    });

    /**
     * @tc.name   WeakSetAddUndefinedTest082
     * @tc.number SUB_WEAKSET_TEST_082
     * @tc.desc   Verify WeakSet.add() undefined throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddUndefinedTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test082_WeakSetAddUndefined();
      expect(result).assertEqual("Test Passed: WeakSetAddUndefinedTest082");
    });

    /**
     * @tc.name   WeakSetAddWrappedBigIntTest083
     * @tc.number SUB_WEAKSET_TEST_083
     * @tc.desc   Verify WeakSet.add() wrapped BigInt object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddWrappedBigIntTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test083_WeakSetAddWrappedBigInt();
      expect(result).assertEqual("Test Passed: WeakSetAddWrappedBigIntTest083");
    });

    /**
     * @tc.name   WeakSetAddStringObjectTest084
     * @tc.number SUB_WEAKSET_TEST_084
     * @tc.desc   Verify WeakSet.add() String object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddStringObjectTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test084_WeakSetAddStringObject();
      expect(result).assertEqual("Test Passed: WeakSetAddStringObjectTest084");
    });

    /**
     * @tc.name   WeakSetIndependentInstancesTest085
     * @tc.number SUB_WEAKSET_TEST_085
     * @tc.desc   Verify two WeakSet instances store same object independently
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetIndependentInstancesTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test085_WeakSetIndependentInstances();
      expect(result).assertEqual("Test Passed: WeakSetIndependentInstancesTest085");
    });

    /**
     * @tc.name   WeakSetNoForEachTest086
     * @tc.number SUB_WEAKSET_TEST_086
     * @tc.desc   Verify WeakSet.forEach() throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetNoForEachTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test086_WeakSetNoForEach();
      expect(result).assertEqual("Test Passed: WeakSetNoForEachTest086");
    });

    /**
     * @tc.name   WeakSetNoSizePropertyTest087
     * @tc.number SUB_WEAKSET_TEST_087
     * @tc.desc   Verify WeakSet.size returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetNoSizePropertyTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test087_WeakSetNoSizeProperty();
      expect(result).assertEqual("Test Passed: WeakSetNoSizePropertyTest087");
    });


    /**
     * @tc.name   WeakSetAddArrayBufferTest089
     * @tc.number SUB_WEAKSET_TEST_089
     * @tc.desc   Verify WeakSet.add() ArrayBuffer object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddArrayBufferTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test089_WeakSetAddArrayBuffer();
      expect(result).assertEqual("Test Passed: WeakSetAddArrayBufferTest089");
    });

    /**
     * @tc.name   WeakSetAddDataViewTest090
     * @tc.number SUB_WEAKSET_TEST_090
     * @tc.desc   Verify WeakSet.add() DataView object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddDataViewTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test090_WeakSetAddDataView();
      expect(result).assertEqual("Test Passed: WeakSetAddDataViewTest090");
    });


    /**
     * @tc.name   WeakSetAddFrozenObjectTest092
     * @tc.number SUB_WEAKSET_TEST_092
     * @tc.desc   Verify WeakSet.add() frozen object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddFrozenObjectTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test092_WeakSetAddFrozenObject();
      expect(result).assertEqual("Test Passed: WeakSetAddFrozenObjectTest092");
    });

    /**
     * @tc.name   WeakSetAddSealedObjectTest093
     * @tc.number SUB_WEAKSET_TEST_093
     * @tc.desc   Verify WeakSet.add() sealed object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddSealedObjectTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test093_WeakSetAddSealedObject();
      expect(result).assertEqual("Test Passed: WeakSetAddSealedObjectTest093");
    });

    /**
     * @tc.name   WeakSetAddDistinctEmptyObjectsTest094
     * @tc.number SUB_WEAKSET_TEST_094
     * @tc.desc   Verify WeakSet.add() two distinct empty objects, has() returns true for each
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddDistinctEmptyObjectsTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test094_WeakSetAddDistinctEmptyObjects();
      expect(result).assertEqual("Test Passed: WeakSetAddDistinctEmptyObjectsTest094");
    });

    /**
     * @tc.name   WeakSetConstructorNonIterableTest095
     * @tc.number SUB_WEAKSET_TEST_095
     * @tc.desc   Verify WeakSet constructor throws TypeError with non-iterable argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetConstructorNonIterableTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test095_WeakSetConstructorNonIterable();
      expect(result).assertEqual("Test Passed: WeakSetConstructorNonIterableTest095");
    });

    /**
     * @tc.name   WeakSetConstructorIterableObjectsTest096
     * @tc.number SUB_WEAKSET_TEST_096
     * @tc.desc   Verify WeakSet constructor initializes with iterable of objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetConstructorIterableObjectsTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test096_WeakSetConstructorIterableObjects();
      expect(result).assertEqual("Test Passed: WeakSetConstructorIterableObjectsTest096");
    });

    /**
     * @tc.name   WeakSetConstructorIterableWithPrimitiveTest097
     * @tc.number SUB_WEAKSET_TEST_097
     * @tc.desc   Verify WeakSet constructor throws TypeError with iterable containing primitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetConstructorIterableWithPrimitiveTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test097_WeakSetConstructorIterableWithPrimitive();
      expect(result).assertEqual("Test Passed: WeakSetConstructorIterableWithPrimitiveTest097");
    });




    /**
     * @tc.name   WeakSetNoForOfIterationTest100
     * @tc.number SUB_WEAKSET_TEST_100
     * @tc.desc   Verify for...of loop on WeakSet throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetNoForOfIterationTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test100_WeakSetNoForOfIteration();
      expect(result).assertEqual("Test Passed: WeakSetNoForOfIterationTest100");
    });


    /**
     * @tc.name   WeakSetConstructorEmptyIterableTest102
     * @tc.number SUB_WEAKSET_TEST_102
     * @tc.desc   Verify WeakSet constructor with empty iterable initializes empty WeakSet
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetConstructorEmptyIterableTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test102_WeakSetConstructorEmptyIterable();
      expect(result).assertEqual("Test Passed: WeakSetConstructorEmptyIterableTest102");
    });



    /**
     * @tc.name   WeakSetDeleteMultipleTimesTest104
     * @tc.number SUB_WEAKSET_TEST_104
     * @tc.desc   Verify WeakSet.delete() same object multiple times returns false after first call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetDeleteMultipleTimesTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test104_WeakSetDeleteMultipleTimes();
      expect(result).assertEqual("Test Passed: WeakSetDeleteMultipleTimesTest104");
    });

    /**
     * @tc.name   WeakSetHasPrimitiveStringTest105
     * @tc.number SUB_WEAKSET_TEST_105
     * @tc.desc   Verify WeakSet.has() returns false for primitive string, true for String object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetHasPrimitiveStringTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test105_WeakSetHasPrimitiveString();
      expect(result).assertEqual("Test Passed: WeakSetHasPrimitiveStringTest105");
    });

    /**
     * @tc.name   WeakSetAddTypedArrayTest106
     * @tc.number SUB_WEAKSET_TEST_106
     * @tc.desc   Verify WeakSet.add() TypedArray (Uint8Array) object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddTypedArrayTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test106_WeakSetAddTypedArray();
      expect(result).assertEqual("Test Passed: WeakSetAddTypedArrayTest106");
    });

    /**
     * @tc.name   WeakSetSubclassBehaviorTest107
     * @tc.number SUB_WEAKSET_TEST_107
     * @tc.desc   Verify inherited WeakSet subclass retains add/has/delete behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetSubclassBehaviorTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test107_WeakSetSubclassBehavior();
      expect(result).assertEqual("Test Passed: WeakSetSubclassBehaviorTest107");
    });

    /**
     * @tc.name   WeakSetConstructorGeneratorTest108
     * @tc.number SUB_WEAKSET_TEST_108
     * @tc.desc   Verify WeakSet constructor with generator function (iterable) initializes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetConstructorGeneratorTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test108_WeakSetConstructorGenerator();
      expect(result).assertEqual("Test Passed: WeakSetConstructorGeneratorTest108");
    });

    /**
     * @tc.name   WeakSetStoreItselfTest109
     * @tc.number SUB_WEAKSET_TEST_109
     * @tc.desc   Verify WeakSet can store itself without circular reference error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetStoreItselfTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test109_WeakSetStoreItself();
      expect(result).assertEqual("Test Passed: WeakSetStoreItselfTest109");
    });

    /**
     * @tc.name   WeakSetAddFrozenArrayTest110
     * @tc.number SUB_WEAKSET_TEST_110
     * @tc.desc   Verify WeakSet.add() frozen array object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddFrozenArrayTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test110_WeakSetAddFrozenArray();
      expect(result).assertEqual("Test Passed: WeakSetAddFrozenArrayTest110");
    });

    /**
     * @tc.name   WeakSetConstructorIterableWithNullTest111
     * @tc.number SUB_WEAKSET_TEST_111
     * @tc.desc   Verify WeakSet constructor with iterable containing null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetConstructorIterableWithNullTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test111_WeakSetConstructorIterableWithNull();
      expect(result).assertEqual("Test Passed: WeakSetConstructorIterableWithNullTest111");
    });

    /**
     * @tc.name   WeakSetHasAfterGCTest112
     * @tc.number SUB_WEAKSET_TEST_112
     * @tc.desc   Verify WeakSet.has() returns false after object is GC (tracked via WeakRef)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('WeakSetHasAfterGCTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const result = await WeakSetTestUtils.test112_WeakSetHasAfterGC();
      expect(result).assertEqual("Test Passed: WeakSetHasAfterGCTest112 (GC behavior consistent with has())");
    });

    /**
     * @tc.name   WeakSetAddPromiseObjectTest113
     * @tc.number SUB_WEAKSET_TEST_113
     * @tc.desc   Verify WeakSet.add() Promise object, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddPromiseObjectTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test113_WeakSetAddPromiseObject();
      expect(result).assertEqual("Test Passed: WeakSetAddPromiseObjectTest113");
    });

    /**
     * @tc.name   WeakSetDeletePrimitiveBooleanTest114
     * @tc.number SUB_WEAKSET_TEST_114
     * @tc.desc   Verify WeakSet.delete() returns false for primitive boolean, true for Boolean object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetDeletePrimitiveBooleanTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test114_WeakSetDeletePrimitiveBoolean();
      expect(result).assertEqual("Test Passed: WeakSetDeletePrimitiveBooleanTest114");
    });

    /**
     * @tc.name   WeakSetConstructorNonIterableWeakMapTest115
     * @tc.number SUB_WEAKSET_TEST_115
     * @tc.desc   Verify WeakSet constructor with non-iterable WeakMap throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetConstructorNonIterableWeakMapTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test115_WeakSetConstructorNonIterableWeakMap();
      expect(result).assertEqual("Test Passed: WeakSetConstructorNonIterableWeakMapTest115");
    });

    /**
     * @tc.name   WeakSetAddSlicedArrayBufferTest116
     * @tc.number SUB_WEAKSET_TEST_116
     * @tc.desc   Verify WeakSet.add() sliced ArrayBuffer (new object), has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddSlicedArrayBufferTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test116_WeakSetAddSlicedArrayBuffer();
      expect(result).assertEqual("Test Passed: WeakSetAddSlicedArrayBufferTest116");
    });

    /**
     * @tc.name   WeakSetSubclassOverriddenAddTest117
     * @tc.number SUB_WEAKSET_TEST_117
     * @tc.desc   Verify WeakSet subclass with overridden add() retains parent has() behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetSubclassOverriddenAddTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test117_WeakSetSubclassOverriddenAdd();
      expect(result).assertEqual("Test Passed: WeakSetSubclassOverriddenAddTest117");
    });

    /**
     * @tc.name   WeakSetConstructorNonIterableEmptyStringTest118
     * @tc.number SUB_WEAKSET_TEST_118
     * @tc.desc   Verify WeakSet constructor with non-iterable empty string throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetConstructorNonIterableEmptyStringTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test118_WeakSetConstructorNonIterableEmptyString();
      expect(result).assertEqual("Test Passed: WeakSetConstructorNonIterableEmptyStringTest118");
    });



    /**
     * @tc.name   WeakSetAddWeakMapInstanceTest120
     * @tc.number SUB_WEAKSET_TEST_120
     * @tc.desc   Verify WeakSet.add() WeakMap instance, has() returns true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakSetAddWeakMapInstanceTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakSetTestUtils.test120_WeakSetAddWeakMapInstance();
      expect(result).assertEqual("Test Passed: WeakSetAddWeakMapInstanceTest120");
    });
  })
}