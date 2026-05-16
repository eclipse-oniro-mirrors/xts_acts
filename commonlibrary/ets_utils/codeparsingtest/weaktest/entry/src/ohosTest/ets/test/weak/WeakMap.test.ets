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
import { WeakMapTestUtils } from './WeakMapTestUtils.js'; // 导入JS验证工具
export async function sleep(ms: number): Promise<void> {
  return new Promise((resolve) => setTimeout(resolve, ms));
}
// Define specific interfaces for object literals (ArkTS requires explicit types)
interface KeyWithId {
  id: number;
}

interface KeyWithName {
  name: string;
}

interface KeyWithData {
  data: number[];
  type: string;
}

interface NumericInput {
  x: number;
  y: number;
  id: number;
}


export default function WeakMapTest() {
  describe('WeakMapTest', () => {
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
     * @tc.name   WeakMapValidKeyTest001
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_0100
     * @tc.desc   Verify WeakMap supports object keys with explicit types; ensure valid key operations work
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapValidKeyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const wm: WeakMap<KeyWithId | KeyWithName, string> = new WeakMap<KeyWithId | KeyWithName, string>();
      const validObjKey1: KeyWithId = { id: 1 };
      const validObjKey2: KeyWithName = { name: 'test-key' };
      const validObjKey3: KeyWithId = { id: 3 };
      const validObjKey4: KeyWithName = { name: 'func-key' };

      expect(wm.set(validObjKey1, 'obj-val1')).assertEqual(wm);
      expect(wm.set(validObjKey2, 'obj-val2')).assertEqual(wm);
      expect(wm.set(validObjKey3, 'obj-val3')).assertEqual(wm);
      expect(wm.set(validObjKey4, 'obj-val4')).assertEqual(wm);


      expect(wm.has(validObjKey1)).assertTrue();
      expect(wm.has(validObjKey2)).assertTrue();
      expect(wm.get(validObjKey3)).assertEqual('obj-val3');
      expect(wm.get(validObjKey4)).assertEqual('obj-val4');
    });

    /**
     * @tc.name   WeakMapCoreMethodFunctionalityTest002
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_0200
     * @tc.desc   Verify correctness of WeakMap core methods: set, get, has, delete
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapCoreMethodFunctionalityTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const wm: WeakMap<KeyWithId, number> = new WeakMap<KeyWithId, number>();
      const testKey: KeyWithId = { id: 1 };
      const anotherKey: KeyWithId = { id: 2 };

      expect(wm.set(testKey, 100)).assertEqual(wm);
      expect(wm.has(testKey)).assertTrue();
      expect(wm.get(testKey)).assertEqual(100);
      expect(wm.delete(testKey)).assertTrue();
      expect(wm.has(testKey)).assertFalse();
      expect(wm.get(testKey)).assertUndefined();
      expect(wm.delete(anotherKey)).assertFalse();
    });

    /**
     * @tc.name   WeakMapKeyNonEnumerabilityTest003
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_0300
     * @tc.desc   Verify WeakMap keys are non-enumerable: no iteration methods, cannot traverse via common ways
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapKeyNonEnumerabilityTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const wm: WeakMap<KeyWithId | KeyWithData, string> = new WeakMap<KeyWithId | KeyWithData, string>();
      const key1: KeyWithId = { id: 1 };
      const key2: KeyWithData = { type: 'array', data: [1, 2] };
      const key3: KeyWithId = { id: 3 };

      wm.set(key1, 'val1');
      wm.set(key2, 'val2');
      wm.set(key3, 'val3');

      expect(Object.keys(wm)).assertDeepEquals([]);
    });

    /**
     * @tc.name   WeakMapConstructorInitializationTest004
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_0400
     * @tc.desc   Verify WeakMap constructor initializes correctly with valid iterable (explicit type keys) and null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapConstructorInitializationTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const validObjKey1: KeyWithId = { id: 1 };
      const validObjKey2: KeyWithName = { name: 'init-key2' };
      const validObjKey3: KeyWithId = { id: 3 };
      const validInitData: [KeyWithId | KeyWithName, string][] = [
        [validObjKey1, 'val1'],
        [validObjKey2, 'val2'],
        [validObjKey3, 'val3']
      ];
      const wm1: WeakMap<KeyWithId | KeyWithName, string> = new WeakMap<KeyWithId | KeyWithName, string>(validInitData);

      expect(wm1.get(validObjKey1)).assertEqual('val1');
      expect(wm1.get(validObjKey2)).assertEqual('val2');
      expect(wm1.get(validObjKey3)).assertEqual('val3');

      const wm2: WeakMap<KeyWithId, string> = new WeakMap<KeyWithId, string>(null);
      const emptyCheckKey: KeyWithId = { id: 0 };
      expect(wm2.has(emptyCheckKey)).assertFalse();
      expect(wm2.get(emptyCheckKey)).assertUndefined();
    });

    /**
     * @tc.name   WeakMapObjectKeyUniquenessTest005
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_0500
     * @tc.desc   Verify different object instances (same type, same structure) are distinct keys in WeakMap
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapObjectKeyUniquenessTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const wm: WeakMap<KeyWithId, number> = new WeakMap<KeyWithId, number>();
      const objA: KeyWithId = { id: 1 };
      const objB: KeyWithId = { id: 1 };
      const objC: KeyWithId = { id: 2 };
      const objD: KeyWithId = { id: 2 };

      wm.set(objA, 50);
      expect(wm.get(objA)).assertEqual(50);
      expect(wm.has(objA)).assertTrue();
      expect(wm.get(objB)).assertUndefined();
      expect(wm.has(objB)).assertFalse();

      wm.set(objC, 80);
      expect(wm.get(objC)).assertEqual(80);
      expect(wm.has(objC)).assertTrue();
      expect(wm.get(objD)).assertUndefined();
      expect(wm.has(objD)).assertFalse();

      wm.delete(objA);
      wm.delete(objC);
      expect(wm.has(objA)).assertFalse();
      expect(wm.has(objC)).assertFalse();
      expect(wm.has(objB)).assertFalse();
      expect(wm.has(objD)).assertFalse();
    });



    /**
     * @tc.name   WeakMapPureFunctionCacheTest007
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_0700
     * @tc.desc   Verify WeakMap caches pure function results: same NumericInput instance reuses cache, different instances recalculate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapPureFunctionCacheTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const resultCache: WeakMap<NumericInput, number> = new WeakMap<NumericInput, number>();

      const sumObjectValues = (input: NumericInput): number => {
        if (resultCache.has(input)) {
          return resultCache.get(input)!;
        }
        const sum: number = input.x + input.y + input.id;
        resultCache.set(input, sum);
        return sum;
      };

      const inputA: NumericInput = { x: 10, y: 20, id: 1 };
      const firstCallResult: number = sumObjectValues(inputA);
      expect(firstCallResult).assertEqual(31);
      expect(resultCache.has(inputA)).assertTrue();

      const secondCallResult: number = sumObjectValues(inputA);
      expect(secondCallResult).assertEqual(31);

      const inputB: NumericInput = { x: 10, y: 20, id: 2 };
      const thirdCallResult: number = sumObjectValues(inputB);
      expect(thirdCallResult).assertEqual(32);
      expect(resultCache.has(inputB)).assertTrue();
      expect(resultCache.has(inputA)).assertTrue();
    });

    /**
     * @tc.name   WeakMapWeakReferenceGCBehaviorTest009
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_0900
     * @tc.desc   Verify WeakMap's weak reference behavior: KeyWithId keys GC via ArkTools.forceFullGC() when no references
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapWeakReferenceGCBehaviorTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      const wm: WeakMap<KeyWithId, string> = new WeakMap<KeyWithId, string>();
      let tempKey: KeyWithId | null = { id: 1 };

      wm.set(tempKey, 'weak-ref-test');
      expect(wm.has(tempKey)).assertTrue();
      expect(wm.get(tempKey)).assertEqual('weak-ref-test');

      tempKey = null;

      if (globalThis.ArkTools?.forceFullGC) {
        globalThis.ArkTools.forceFullGC();
        await new Promise<void>((resolve) => setTimeout(resolve, 100));

        const newKey: KeyWithId = { id: 1 };
        expect(wm.has(newKey)).assertFalse();
        expect(wm.get(newKey)).assertUndefined();
      } else {
        console.warn('globalThis.ArkTools.forceFullGC() is not available; skip GC assertions');
      
      }

    });

    /**
     * @tc.name   WeakMapESStandardCompatibilityTest010
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1000
     * @tc.desc   Verify WeakMap complies with ES6+ standards (ArkTS compatible): explicit type keys, methods, initialization
     * @tc.type   COMPATIBILITY
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapESStandardCompatibilityTest010', TestType.COMPATIBILITY | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      expect(typeof WeakMap).assertEqual('function');

      const wm: WeakMap<KeyWithId, string> = new WeakMap<KeyWithId, string>();
      expect(typeof wm.set).assertEqual('function');
      expect(typeof wm.get).assertEqual('function');
      expect(typeof wm.has).assertEqual('function');
      expect(typeof wm.delete).assertEqual('function');

      expect(wm.set.length).assertEqual(2);
      expect(wm.get.length).assertEqual(1);
      expect(wm.has.length).assertEqual(1);
      expect(wm.delete.length).assertEqual(1);

      let supportsIterableInit: boolean = true;
      try {
        const testKey: KeyWithId = { id: 1 };
        new WeakMap<KeyWithId, string>([[testKey, 'init-val']]);
      } catch {
        supportsIterableInit = false;
      }
      expect(supportsIterableInit).assertTrue();

      const keyA: KeyWithId = { id: 1 };
      const keyB: KeyWithId = { id: 1 };
      wm.set(keyA, 'valA');
      expect(wm.get(keyB)).assertUndefined();
    });

    /**
     * @tc.name   WeakMapFrozenSealedKeyTest011
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1100
     * @tc.desc   Verify that frozen (Object.freeze) and sealed (Object.seal) objects can be used as WeakMap keys, and set/get/has/delete work correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapFrozenSealedKeyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test1100_FrozenSealedKey();
      expect(result).assertEqual("Test Passed: WeakMapFrozenSealedKeyTest011");
    });

    /**
     * @tc.name   WeakMapSetChainingTest012
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1200
     * @tc.desc   Verify that WeakMap.set supports method chaining (returns instance itself), and multiple key-value pairs set via chaining are accessible/modifiable correctly.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapSetChainingTest012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test1200_SetChaining();
      expect(result).assertEqual("Test Passed: WeakMapSetChainingTest012");
    });

    /**
     * @tc.name   WeakMapArrayKeyUniquenessTest013
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1300
     * @tc.desc   Verify uniqueness of array instances as WeakMap keys: same elements but different references = different keys; same reference (even modified) = same key.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapArrayKeyUniquenessTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test1300_ArrayKeyUniqueness();
      expect(result).assertEqual("Test Passed: WeakMapArrayKeyUniquenessTest013");
    });

    /**
     * @tc.name   WeakMapMassKeyGCTest014
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1400
     * @tc.desc   Verify that after 50 key objects are GC'd, corresponding key-value pairs in WeakMap become invalid, and WeakMap works normally with new keys.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapMassKeyGCTest014', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test1400_MassKeyGC();
      expect(result).assertEqual("Test Passed: WeakMapMassKeyGCTest014");
    });

    /**
     * @tc.name   WeakMapDeleteSubsequentTest015
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1500
     * @tc.desc   Verify that after deleting a WeakMap key, has() returns false and get() returns undefined; re-setting a key with same structure but different reference works as new key; deleting non-existent key returns false.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapDeleteSubsequentTest015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test1500_DeleteSubsequent();
      expect(result).assertEqual("Test Passed: WeakMapDeleteSubsequentTest015");
    });

    /**
     * @tc.name   WeakMapClosurePrivateStoreTest016
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1600
     * @tc.desc   Verify that WeakMap works as private data storage for classes in closures: inaccessible from outside, and private data is operable only via public methods of the class.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapClosurePrivateStoreTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test1600_ClosurePrivateStore();
      expect(result).assertEqual("Test Passed: WeakMapClosurePrivateStoreTest016");
    });

    /**
     * @tc.name   WeakMapFunctionKeyTest017
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1700
     * @tc.desc   Verify uniqueness of function instances as WeakMap keys: same logic but different references = different keys; same reference = same key; key becomes invalid after deletion.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapFunctionKeyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test1700_FunctionKey();
      expect(result).assertEqual("Test Passed: WeakMapFunctionKeyTest017");
    });

    /**
     * @tc.name   WeakMapPrototypeChainKeyTest018
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1800
     * @tc.desc   Verify prototype chain objects as WeakMap keys: only instances are associated with key-value pairs (prototype objects are not); modifying prototype properties has no impact on instance keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapPrototypeChainKeyTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test1800_PrototypeChainKey();
      expect(result).assertEqual("Test Passed: WeakMapPrototypeChainKeyTest018");
    });

    /**
     * @tc.name   WeakMapCrossScopeAccessTest019
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_1900
     * @tc.desc   Verify that the same WeakMap instance maintains consistent state for set/get/delete operations across different scopes (global/anonymous functions).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapCrossScopeAccessTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test1900_CrossScopeAccess();
      expect(result).assertEqual("Test Passed: WeakMapCrossScopeAccessTest019");
    });

    /**
     * @tc.name   WeakMapEmptyArrayKeyTest020
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2000
     * @tc.desc   Verify uniqueness of empty arrays as WeakMap keys: different empty array instances = different keys; same empty array instance = same key; key becomes invalid after deletion.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapEmptyArrayKeyTest020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2000_EmptyArrayKey();
      expect(result).assertEqual("Test Passed: WeakMapEmptyArrayKeyTest020");
    });

    /**
     * @tc.name   WeakMapNonObjectKeyErrorTest2100
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2100
     * @tc.desc   Verify WeakMap.set() throws TypeError when non-object (primitive values like number/string/null) are used as keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapNonObjectKeyErrorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2100_NonObjectKeyError();
      expect(result).assertEqual("Test Passed: WeakMapNonObjectKeyErrorTest2100");
    });

    /**
     * @tc.name   WeakMapSymbolWrapperKeyTest2110
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2110
     * @tc.desc   Verify wrapped Symbol objects (Object(Symbol())) have uniqueness as WeakMap keys (different wrappers = different keys).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapSymbolWrapperKeyTest2110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2110_SymbolWrapperKeyUniqueness();
      expect(result).assertEqual("Test Passed: WeakMapSymbolWrapperKeyTest2110");
    });

    /**
     * @tc.name   WeakMapClassInstanceKeyTest2120
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2120
     * @tc.desc   Verify class instances as WeakMap keys: modifying instance properties (existing/new) does not break key association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapClassInstanceKeyTest2120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2120_ClassInstanceKeyPropertyMod();
      expect(result).assertEqual("Test Passed: WeakMapClassInstanceKeyTest2120");
    });

    /**
     * @tc.name   WeakMapSetSameKeyOverwriteTest2130
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2130
     * @tc.desc   Verify WeakMap.set() overwrites existing value when the same key is set multiple times (including undefined value).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapSetSameKeyOverwriteTest2130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2130_SetSameKeyOverwrite();
      expect(result).assertEqual("Test Passed: WeakMapSetSameKeyOverwriteTest2130");
    });

    /**
     * @tc.name   WeakMapGetValueTypeTest2140
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2140
     * @tc.desc   Verify WeakMap.get() preserves exact value types (null, NaN, function, array reference) for existing keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapGetValueTypeTest2140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2140_GetValueTypePreserve();
      expect(result).assertEqual("Test Passed: WeakMapGetValueTypeTest2140");
    });

    /**
     * @tc.name   WeakMapNoSizePropertyTest2150
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2150
     * @tc.desc   Verify WeakMap has no 'size' property (returns undefined when accessed, cannot be assigned).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapNoSizePropertyTest2150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2150_NoSizeProperty();
      expect(result).assertEqual("Test Passed: WeakMapNoSizePropertyTest2150");
    });

    /**
     * @tc.name   WeakMapNoIterationTest2160
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2160
     * @tc.desc   Verify WeakMap cannot be iterated with for...of (throws TypeError) and has no entries()/keys()/values() methods.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapNoIterationTest2160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2160_NoIterationSupport();
      expect(result).assertEqual("Test Passed: WeakMapNoIterationTest2160");
    });

    /**
     * @tc.name   WeakMapNestedWeakMapKeyTest2170
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2170
     * @tc.desc   Verify nested WeakMap instances can be used as WeakMap keys (different WeakMaps = different keys).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapNestedWeakMapKeyTest2170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2170_NestedWeakMapAsKey();
      expect(result).assertEqual("Test Passed: WeakMapNestedWeakMapKeyTest2170");
    });

    /**
     * @tc.name   WeakMapKeyPrototypeRedefineTest2180
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2180
     * @tc.desc   Verify redefining a key object's prototype (via Object.setPrototypeOf) does not break WeakMap key association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapKeyPrototypeRedefineTest2180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2180_KeyPrototypeRedefine();
      expect(result).assertEqual("Test Passed: WeakMapKeyPrototypeRedefineTest2180");
    });

    /**
     * @tc.name   WeakMapTemporaryKeyGCTest2190
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2190
     * @tc.desc   Verify temporary key objects (no remaining strong references) are GC'd, making their WeakMap values inaccessible.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapTemporaryKeyGCTest2190', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2190_TemporaryKeyGC();
      expect(result).assertEqual("Test Passed: WeakMapTemporaryKeyGCTest2190");
    });

    /**
     * @tc.name   WeakMapProxyKeyTest2200
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2200
     * @tc.desc   Verify Proxy-wrapped objects as WeakMap keys: different Proxies (even with same target) are different keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapProxyKeyTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2200_ProxyWrappedKeyUniqueness();
      expect(result).assertEqual("Test Passed: WeakMapProxyKeyTest2200");
    });

    /**
     * @tc.name   WeakMapDeleteGCdKeyTest2210
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2210
     * @tc.desc   Verify WeakMap.delete() returns false for keys that have been GC'd (no remaining strong references).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapDeleteGCdKeyTest2210', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2210_DeleteGCdKey();
      expect(result).assertEqual("Test Passed: WeakMapDeleteGCdKeyTest2210");
    });

    /**
     * @tc.name   WeakMapHasStrictBooleanTest2220
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2220
     * @tc.desc   Verify WeakMap.has() returns strict boolean values (true/false, not truthy/falsy like 1/0) for existing/non-existing keys.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapHasStrictBooleanTest2220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2220_HasReturnStrictBoolean();
      expect(result).assertEqual("Test Passed: WeakMapHasStrictBooleanTest2220");
    });

    /**
     * @tc.name   WeakMapGetNonExistingKeyTest2230
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2230
     * @tc.desc   Verify WeakMap.get() returns undefined (not null/NaN) for non-existing keys and keys deleted earlier.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapGetNonExistingKeyTest2230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2230_GetNonExistingKeyReturnsUndefined();
      expect(result).assertEqual("Test Passed: WeakMapGetNonExistingKeyTest2230");
    });

    /**
     * @tc.name   WeakMapAsObjectPropertyTest2240
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2240
     * @tc.desc   Verify WeakMap can be used as a property of another object, with consistent state via object methods and direct access.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapAsObjectPropertyTest2240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2240_WeakMapAsObjectProperty();
      expect(result).assertEqual("Test Passed: WeakMapAsObjectPropertyTest2240");
    });

    /**
     * @tc.name   WeakMapCrossModuleSharedTest2250
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2250
     * @tc.desc   Verify cross-module shared WeakMap maintains consistent state (simulated with IIFE modules for set/update/delete).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapCrossModuleSharedTest2250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2250_CrossModuleSharedWeakMap();
      expect(result).assertEqual("Test Passed: WeakMapCrossModuleSharedTest2250");
    });

    /**
     * @tc.name   WeakMapFrozenKeyProtoTest2260
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2260
     * @tc.desc   Verify frozen key objects with modified prototype chain (via prototype objects) still maintain WeakMap key association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapFrozenKeyProtoTest2260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2260_FrozenKeyPrototypeMod();
      expect(result).assertEqual("Test Passed: WeakMapFrozenKeyProtoTest2260");
    });

    /**
     * @tc.name   WeakMapEmptyObjectKeyPropsTest2270
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2270
     * @tc.desc   Verify empty objects as WeakMap keys: adding/modifying/deleting properties after set does not break key association.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapEmptyObjectKeyPropsTest2270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2270_EmptyObjectKeyAddProps();
      expect(result).assertEqual("Test Passed: WeakMapEmptyObjectKeyPropsTest2270");
    });

    /**
     * @tc.name   WeakMapFunctionKeyModifyPropsTest2280
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2280
     * @tc.desc   Verify function keys with modified properties/prototype still maintain WeakMap key association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapFunctionKeyModifyPropsTest2280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2280_FunctionKeyModifyProps();
      expect(result).assertEqual("Test Passed: WeakMapFunctionKeyModifyPropsTest2280");
    });

    /**
     * @tc.name   WeakMapVsMapGCTest2290
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2290
     * @tc.desc   Verify WeakMap vs Map difference: WeakMap key GC makes value inaccessible, while Map retains key/value (strong reference).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapVsMapGCTest2290', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2290_WeakMapVsMapGC();
      expect(result).assertEqual("Test Passed: WeakMapVsMapGCTest2290");
    });
    /**
     * @tc.name   WeakMapCircularRefKeyGCTest2300
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2300
     * @tc.desc   Verify circular-referenced objects as WeakMap keys are GC'd after all external strong references are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapCircularRefKeyGCTest2300', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2300_CircularRefKeyGC();
      expect(result).assertEqual("Test Passed: WeakMapCircularRefKeyGCTest2300");
    });

    /**
     * @tc.name   WeakMapWithFinalizationRegistryTest2310
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2310
     * @tc.desc   Verify WeakMap works with FinalizationRegistry: key GC triggers the registry's callback and invalidates the key.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapWithFinalizationRegistryTest2310', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2310_WeakMapWithFinalizationRegistry();
      expect(result).assertEqual("Test Passed: WeakMapWithFinalizationRegistryTest2310");
    });

    /**
     * @tc.name   WeakMapNonExtensibleKeyTest2320
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2320
     * @tc.desc   Verify non-extensible objects (Object.preventExtensions) as WeakMap keys work normally (modify existing props, delete, etc.).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapNonExtensibleKeyTest2320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2320_NonExtensibleKey();
      expect(result).assertEqual("Test Passed: WeakMapNonExtensibleKeyTest2320");
    });

    /**
     * @tc.name   WeakMapSameKeyMultipleMapsTest2330
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2330
     * @tc.desc   Verify the same key object used in multiple WeakMaps maintains independent associations (values are not confused).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapSameKeyMultipleMapsTest2330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2330_SameKeyMultipleWeakMaps();
      expect(result).assertEqual("Test Passed: WeakMapSameKeyMultipleMapsTest2330");
    });

    /**
     * @tc.name   WeakMapKeyInArrayGCTest2340
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2340
     * @tc.desc   Verify key objects stored in arrays are GC'd after being removed from the array (losing strong references).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapKeyInArrayGCTest2340', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2340_KeyInArrayGC();
      expect(result).assertEqual("Test Passed: WeakMapKeyInArrayGCTest2340");
    });

    /**
     * @tc.name   WeakMapInSetTimeoutTest2350
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2350
     * @tc.desc   Verify WeakMap state is consistent in setTimeout callbacks (async delay does not break key association or GC).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapInSetTimeoutTest2350', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2350_WeakMapInSetTimeout();
      expect(result).assertEqual("Test Passed: WeakMapInSetTimeoutTest2350");
    });

    /**
     * @tc.name   WeakMapKeySymbolPropTest2360
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2360
     * @tc.desc   Verify modifying/adding/deleting Symbol properties of key objects does not break WeakMap key association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapKeySymbolPropTest2360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2360_KeySymbolPropModify();
      expect(result).assertEqual("Test Passed: WeakMapKeySymbolPropTest2360");
    });

    /**
     * @tc.name   WeakMapMapInstanceKeyTest2370
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2370
     * @tc.desc   Verify Map instances as WeakMap keys: modifying Map content (add/delete/clear) does not break key association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapMapInstanceKeyTest2370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2370_MapInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakMapMapInstanceKeyTest2370");
    });

    /**
     * @tc.name   WeakMapFrozenKeyMultiMapsGCTest2380
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2380
     * @tc.desc   Verify frozen key objects used in multiple WeakMaps are GC'd consistently across all WeakMaps.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapFrozenKeyMultiMapsGCTest2380', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2380_FrozenKeyMultipleMapsGC();
      expect(result).assertEqual("Test Passed: WeakMapFrozenKeyMultiMapsGCTest2380");
    });

    /**
     * @tc.name   WeakMapArrowFunctionKeyGCTest2390
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2390
     * @tc.desc   Verify arrow function keys are GC'd after their strong references are released (no remaining references).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapArrowFunctionKeyGCTest2390', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2390_ArrowFunctionKeyGC();
      expect(result).assertEqual("Test Passed: WeakMapArrowFunctionKeyGCTest2390");
    });

    /**
     * @tc.name   WeakMapNullProtoKeyTest2400
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2400
     * @tc.desc   Verify key objects with null prototype (Object.create(null)) work normally as WeakMap keys (set/get/delete).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapNullProtoKeyTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2400_NullProtoKey();
      expect(result).assertEqual("Test Passed: WeakMapNullProtoKeyTest2400");
    });

    /**
     * @tc.name   WeakMapInPromiseTest2410
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2410
     * @tc.desc   Verify WeakMap state is consistent in Promise resolve/reject callbacks (async operations do not break state).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapInPromiseTest2410', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2410_WeakMapInPromise();
      expect(result).assertEqual("Test Passed: WeakMapInPromiseTest2410");
    });

    /**
     * @tc.name   WeakMapSealedKeyNonConfigTest2420
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2420
     * @tc.desc   Verify sealed key objects with non-configurable properties work as WeakMap keys (modify writable props, etc.).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapSealedKeyNonConfigTest2420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2420_SealedKeyNonConfigProp();
      expect(result).assertEqual("Test Passed: WeakMapSealedKeyNonConfigTest2420");
    });

    /**
     * @tc.name   WeakMapBatchTempKeysGCTest2430
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2430
     * @tc.desc   Verify batch GC of 10+ temporary key objects in WeakMap (all keys are GC'd after strong reference release).
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapBatchTempKeysGCTest2430', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2430_BatchTempKeysGC();
      expect(result).assertEqual("Test Passed: WeakMapBatchTempKeysGCTest2430");
    });

    /**
     * @tc.name   WeakMapDOMLikeKeyGCTest2440
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2440
     * @tc.desc   Verify DOM-like objects (simulated tree structure) as WeakMap keys are GC'd after being removed from the "DOM tree".
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapDOMLikeKeyGCTest2440', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2440_DOMLikeObjectKeyGC();
      expect(result).assertEqual("Test Passed: WeakMapDOMLikeKeyGCTest2440");
    });

    /**
     * @tc.name   WeakMapKeyWithInnerWeakMapTest2450
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2450
     * @tc.desc   Verify key objects containing WeakMap properties do not affect their own WeakMap association (modify inner WeakMap freely).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapKeyWithInnerWeakMapTest2450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2450_KeyWithWeakMapProp();
      expect(result).assertEqual("Test Passed: WeakMapKeyWithInnerWeakMapTest2450");
    });

    /**
     * @tc.name   WeakMapClassStaticWeakMapTest2460
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2460
     * @tc.desc   Verify static WeakMap in class works with class instance keys (set/get/delete instance data).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapClassStaticWeakMapTest2460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2460_ClassStaticWeakMap();
      expect(result).assertEqual("Test Passed: WeakMapClassStaticWeakMapTest2460");
    });

    /**
     * @tc.name   WeakMapFrozenKeyDeleteNonConfigTest2470
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2470
     * @tc.desc   Verify attempting to delete non-configurable properties of frozen keys does not break WeakMap key association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapFrozenKeyDeleteNonConfigTest2470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2470_FrozenKeyDeleteNonConfigProp();
      expect(result).assertEqual("Test Passed: WeakMapFrozenKeyDeleteNonConfigTest2470");
    });



    /**
     * @tc.name   WeakMapKeyInClosureGCTest2490
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2490
     * @tc.desc   Verify key references in closures are released after closure execution, leading to key GC in WeakMap.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapKeyInClosureGCTest2490', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2490_WeakMapKeyInClosureGC();
      expect(result).assertEqual("Test Passed: WeakMapKeyInClosureGCTest2490");
    });
  
    /**
     * @tc.name   WeakMapTypedArrayKeyTest2500
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2500
     * @tc.desc   Verify TypedArray instances (e.g., Uint8Array) as WeakMap keys: modifying content does not break association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapTypedArrayKeyTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2500_TypedArrayAsKey();
      expect(result).assertEqual("Test Passed: WeakMapTypedArrayKeyTest2500");
    });

    /**
     * @tc.name   WeakMapErrorInstanceKeyTest2510
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2510
     * @tc.desc   Verify Error instances as WeakMap keys: modifying message/stack does not break association.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapErrorInstanceKeyTest2510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2510_ErrorInstanceAsKey();
      expect(result).assertEqual("Test Passed: WeakMapErrorInstanceKeyTest2510");
    });


    /**
     * @tc.name   WeakMapKeyInWeakSetGCTest2530
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2530
     * @tc.desc   Verify key objects stored in WeakSet are GC'd after WeakSet loses all references.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapKeyInWeakSetGCTest2530', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2530_KeyInWeakSetGC();
      expect(result).assertEqual("Test Passed: WeakMapKeyInWeakSetGCTest2530");
    });

    /**
     * @tc.name   WeakMapSetUndefinedNullValueTest2540
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2540
     * @tc.desc   Verify WeakMap.set() accepts undefined/null as values and stores them correctly.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapSetUndefinedNullValueTest2540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2540_SetUndefinedNullValue();
      expect(result).assertEqual("Test Passed: WeakMapSetUndefinedNullValueTest2540");
    });

    /**
     * @tc.name   WeakMapPrivateFieldKeyGCTest2550
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2550
     * @tc.desc   Verify key objects as private class fields are GC'd after class instance is destroyed.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapPrivateFieldKeyGCTest2550', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2550_PrivateFieldKeyGC();
      expect(result).assertEqual("Test Passed: WeakMapPrivateFieldKeyGCTest2550");
    });

    /**
     * @tc.name   WeakMapRepeatAddDeleteTest2560
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2560
     * @tc.desc   Verify repeated add/delete (150+ times) of the same key does not break WeakMap state.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapRepeatAddDeleteTest2560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2560_RepeatAddDeleteSameKey();
      expect(result).assertEqual("Test Passed: WeakMapRepeatAddDeleteTest2560");
    });

    /**
     * @tc.name   WeakMapAsyncIteratorTest2570
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2570
     * @tc.desc   Verify WeakMap has no async iterator and for await...of throws TypeError as expected.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapAsyncIteratorTest2570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2570_WeakMapInAsyncIterator();
      expect(result).assertEqual("Test Passed: WeakMapAsyncIteratorTest2570");
    });

    /**
     * @tc.name   WeakMapKeyWithFrozenPropsTest2580
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2580
     * @tc.desc   Verify key objects with partially frozen properties (not full freeze) work as WeakMap keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapKeyWithFrozenPropsTest2580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2580_KeyWithFrozenProps();
      expect(result).assertEqual("Test Passed: WeakMapKeyWithFrozenPropsTest2580");
    });

    /**
     * @tc.name   WeakMapNestedRefKeysGCTest2590
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2590
     * @tc.desc   Verify batch GC of keys with nested references (key contains array of objects) after strong ref release.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapNestedRefKeysGCTest2590', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2590_NestedRefKeysBatchGC();
      expect(result).assertEqual("Test Passed: WeakMapNestedRefKeysGCTest2590");
    });

    /**
     * @tc.name   WeakMapMethodsCallApplyTest2600
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2600
     * @tc.desc   Verify WeakMap methods (set/get/has/delete) called via call/apply work correctly.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapMethodsCallApplyTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2600_WeakMapMethodsCallApply();
      expect(result).assertEqual("Test Passed: WeakMapMethodsCallApplyTest2600");
    });

    /**
     * @tc.name   WeakMapKeyAsEventListenerGCTest2610
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2610
     * @tc.desc   Verify key objects used as event listeners are GC'd after removal from event target.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapKeyAsEventListenerGCTest2610', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2610_KeyAsEventListenerGC();
      expect(result).assertEqual("Test Passed: WeakMapKeyAsEventListenerGCTest2610");
    });

    /**
     * @tc.name   WeakMapValueCircularRefGCTest2620
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2620
     * @tc.desc   Verify WeakMap does not retain keys when values contain circular references.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapValueCircularRefGCTest2620', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2620_ValueCircularRefGC();
      expect(result).assertEqual("Test Passed: WeakMapValueCircularRefGCTest2620");
    });

    /**
     * @tc.name   WeakMapKeyWithSymbolPrototypeTest2630
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2630
     * @tc.desc   Verify key objects with Symbol as prototype (Object.setPrototypeOf) work as WeakMap keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapKeyWithSymbolPrototypeTest2630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2630_KeyWithSymbolPrototype();
      expect(result).assertEqual("Test Passed: WeakMapKeyWithSymbolPrototypeTest2630");
    });

    /**
     * @tc.name   WeakMapCrossContextTest2640
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2640
     * @tc.desc   Verify WeakMap maintains consistent state across simulated cross-context scopes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('WeakMapCrossContextTest2640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2640_WeakMapCrossContext();
      expect(result).assertEqual("Test Passed: WeakMapCrossContextTest2640");
    });

    /**
     * @tc.name   WeakMapKeyWithNonWritablePropsTest2650
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2650
     * @tc.desc   Verify key objects with non-writable properties (Object.defineProperty) work as WeakMap keys.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapKeyWithNonWritablePropsTest2650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2650_KeyWithNonWritableProps();
      expect(result).assertEqual("Test Passed: WeakMapKeyWithNonWritablePropsTest2650");
    });

    /**
     * @tc.name   WeakMapBatchSameStructKeysGCTest2660
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2660
     * @tc.desc   Verify batch GC of keys with identical structure (different references) after strong ref release.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapBatchSameStructKeysGCTest2660', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2660_BatchSameStructKeysGC();
      expect(result).assertEqual("Test Passed: WeakMapBatchSameStructKeysGCTest2660");
    });

    /**
     * @tc.name   WeakMapSetMaxSafeIntValueTest2670
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2670
     * @tc.desc   Verify WeakMap.set() works with maximum safe integer and beyond as values.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapSetMaxSafeIntValueTest2670', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2670_SetMaxSafeIntValue();
      expect(result).assertEqual("Test Passed: WeakMapSetMaxSafeIntValueTest2670");
    });

    /**
     * @tc.name   WeakMapKeyInMultipleClosuresGCTest2680
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2680
     * @tc.desc   Verify key objects referenced by multiple closures are GC'd after all closures are released.
     * @tc.type   FUNCTION
     * @tc.size   LARGETEST
     * @tc.level  LEVEL2
     */
    it('WeakMapKeyInMultipleClosuresGCTest2680', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const result = await WeakMapTestUtils.test2680_KeyInMultipleClosuresGC();
      expect(result).assertEqual("Test Passed: WeakMapKeyInMultipleClosuresGCTest2680");
    });

    /**
     * @tc.name   WeakMapSetBigIntValueTest2690
     * @tc.number SUB_BUILTINS_WEAKMAP_TEST_2690
     * @tc.desc   Verify WeakMap.set() correctly stores and retrieves BigInt values (small and large).
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('WeakMapSetBigIntValueTest2690', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = await WeakMapTestUtils.test2690_SetBigIntValue();
      expect(result).assertEqual("Test Passed: WeakMapSetBigIntValueTest2690");
    });
  })
}