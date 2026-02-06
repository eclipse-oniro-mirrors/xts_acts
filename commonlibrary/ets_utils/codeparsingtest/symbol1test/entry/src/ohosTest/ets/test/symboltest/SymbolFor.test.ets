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
import { SymbolForStandaloneTestUtils } from './symbolForStandaloneTests.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function symbolForTestTest() {
  describe('SymbolForTest', () => {
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
     * @tc.name   SymbolForCaseSensitiveKeysTest001
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_001
     * @tc.desc   Verify Symbol.for() is case-sensitive for string keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForCaseSensitiveKeysTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test001_SymbolForCaseSensitiveKeys();
      expect(result).assertEqual("Test Passed: SymbolForCaseSensitiveKeysTest001");
    });

    /**
     * @tc.name   SymbolForEmptyStringKeyTest002
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_002
     * @tc.desc   Verify Symbol.for("") uses empty string as valid key
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForEmptyStringKeyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test002_SymbolForEmptyStringKey();
      expect(result).assertEqual("Test Passed: SymbolForEmptyStringKeyTest002");
    });

    /**
     * @tc.name   SymbolForObjectKeyTest003
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_003
     * @tc.desc   Verify Object as key is coerced to "[object Object]"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForObjectKeyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test003_SymbolForObjectKey();
      expect(result).assertEqual("Test Passed: SymbolForObjectKeyTest003");
    });



    /**
     * @tc.name   SymbolForArrayKeyTest005
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_005
     * @tc.desc   Verify Array as key uses array's toString() result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForArrayKeyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test005_SymbolForArrayKey();
      expect(result).assertEqual("Test Passed: SymbolForArrayKeyTest005");
    });

    /**
     * @tc.name   SymbolForNestedScopePersistenceTest006
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_006
     * @tc.desc   Verify Symbol.for() persists across nested scopes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForNestedScopePersistenceTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test006_SymbolForNestedScopePersistence();
      expect(result).assertEqual("Test Passed: SymbolForNestedScopePersistenceTest006");
    });

    /**
     * @tc.name   SymbolForFunctionKeyTest007
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_007
     * @tc.desc   Verify Function as key uses function's toString() result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForFunctionKeyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test007_SymbolForFunctionKey();
      expect(result).assertEqual("Test Passed: SymbolForFunctionKeyTest007");
    });

    /**
     * @tc.name   SymbolKeyForNonGlobalSymbolTest008
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_008
     * @tc.desc   Verify Symbol.keyFor() returns undefined for non-global Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForNonGlobalSymbolTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test008_SymbolKeyForNonGlobalSymbol();
      expect(result).assertEqual("Test Passed: SymbolKeyForNonGlobalSymbolTest008");
    });

    /**
     * @tc.name   SymbolForDateKeyTest009
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_009
     * @tc.desc   Verify Date object as key uses Date's toString() result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForDateKeyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test009_SymbolForDateKey();
      expect(result).assertEqual("Test Passed: SymbolForDateKeyTest009");
    });

    /**
     * @tc.name   SymbolForNoConflictWithBuiltInTest010
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_010
     * @tc.desc   Verify Symbol.for() does not conflict with built-in Symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForNoConflictWithBuiltInTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test010_SymbolForNoConflictWithBuiltIn();
      expect(result).assertEqual("Test Passed: SymbolForNoConflictWithBuiltInTest010");
    });


    /**
     * @tc.name   SymbolForNestedObjectKeyTest011
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_011
     * @tc.desc   Verify nested object as key uses flattened toString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForNestedObjectKeyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test011_SymbolForNestedObjectKey();
      expect(result).assertEqual("Test Passed: SymbolForNestedObjectKeyTest011");
    });

    /**
     * @tc.name   SymbolForRegExpKeyTest012
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_012
     * @tc.desc   Verify RegExp as key uses RegExp's toString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForRegExpKeyTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test012_SymbolForRegExpKey();
      expect(result).assertEqual("Test Passed: SymbolForRegExpKeyTest012");
    });



    /**
     * @tc.name   SymbolForUndefinedKeyTest014
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_014
     * @tc.desc   Verify undefined as key is coerced to "undefined"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForUndefinedKeyTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test014_SymbolForUndefinedKey();
      expect(result).assertEqual("Test Passed: SymbolForUndefinedKeyTest014");
    });

    /**
     * @tc.name   SymbolForNullKeyTest015
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_015
     * @tc.desc   Verify null as key is coerced to "null"
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForNullKeyTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test015_SymbolForNullKey();
      expect(result).assertEqual("Test Passed: SymbolForNullKeyTest015");
    });



    /**
     * @tc.name   SymbolForCrossModuleSharingTest017
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_017
     * @tc.desc   Verify cross-module simulation with global Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForCrossModuleSharingTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test017_SymbolForCrossModuleSharing();
      expect(result).assertEqual("Test Passed: SymbolForCrossModuleSharingTest017");
    });

    /**
     * @tc.name   SymbolForAsMapKeyTest018
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_018
     * @tc.desc   Verify global Symbol as Map key retains identity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForAsMapKeyTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test018_SymbolForAsMapKey();
      expect(result).assertEqual("Test Passed: SymbolForAsMapKeyTest018");
    });

    /**
     * @tc.name   SymbolForInSetTest019
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_019
     * @tc.desc   Verify global Symbol in Set retains uniqueness
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForInSetTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test019_SymbolForInSet();
      expect(result).assertEqual("Test Passed: SymbolForInSetTest019");
    });

    /**
     * @tc.name   SymbolForInStrictModeTest020
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_020
     * @tc.desc   Verify Symbol.for() works in strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForInStrictModeTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test020_SymbolForInStrictMode();
      expect(result).assertEqual("Test Passed: SymbolForInStrictModeTest020");
    });

    /**
     * @tc.name   SymbolForKeyWithSpacesTest021
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_021
     * @tc.desc   Verify key with leading/trailing spaces is case-sensitive
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForKeyWithSpacesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test021_SymbolForKeyWithSpaces();
      expect(result).assertEqual("Test Passed: SymbolForKeyWithSpacesTest021");
    });

    /**
     * @tc.name   SymbolForSpecialCharKeyTest022
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_022
     * @tc.desc   Verify special character key is valid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForSpecialCharKeyTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test022_SymbolForSpecialCharKey();
      expect(result).assertEqual("Test Passed: SymbolForSpecialCharKeyTest022");
    });

    /**
     * @tc.name   SymbolForNumberObjectKeyTest023
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_023
     * @tc.desc   Verify Number object as key is coerced to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForNumberObjectKeyTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test023_SymbolForNumberObjectKey();
      expect(result).assertEqual("Test Passed: SymbolForNumberObjectKeyTest023");
    });

    /**
     * @tc.name   SymbolForBooleanObjectKeyTest024
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_024
     * @tc.desc   Verify Boolean object as key is coerced to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForBooleanObjectKeyTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test024_SymbolForBooleanObjectKey();
      expect(result).assertEqual("Test Passed: SymbolForBooleanObjectKeyTest024");
    });

    /**
     * @tc.name   SymbolKeyForReturnTypeTest025
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_025
     * @tc.desc   Verify Symbol.keyFor() returns string or undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForReturnTypeTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test025_SymbolKeyForReturnType();
      expect(result).assertEqual("Test Passed: SymbolKeyForReturnTypeTest025");
    });

    /**
     * @tc.name   SymbolForKeyReuseAfterDeleteTest026
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_026
     * @tc.desc   Verify reuse key after deleting global Symbol reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForKeyReuseAfterDeleteTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test026_SymbolForKeyReuseAfterDelete();
      expect(result).assertEqual("Test Passed: SymbolForKeyReuseAfterDeleteTest026");
    });

    /**
     * @tc.name   SymbolForAsObjectPropertyTest027
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_027
     * @tc.desc   Verify global Symbol as object property is non-enumerable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForAsObjectPropertyTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test027_SymbolForAsObjectProperty();
      expect(result).assertEqual("Test Passed: SymbolForAsObjectPropertyTest027");
    });

    /**
     * @tc.name   SymbolForTypedArrayKeyTest028
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_028
     * @tc.desc   Verify TypedArray as key uses its toString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForTypedArrayKeyTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test028_SymbolForTypedArrayKey();
      expect(result).assertEqual("Test Passed: SymbolForTypedArrayKeyTest028");
    });


    /**
     * @tc.name   SymbolForInPromiseTest030
     * @tc.number SUB_SYMBOL_FOR_STANDALONE_TEST_030
     * @tc.desc   Verify global Symbol with Promise.resolve retains identity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolForInPromiseTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolForStandaloneTestUtils.test030_SymbolForInPromise();
      expect(result).assertEqual("Test Passed: SymbolForInPromiseTest030");
    });
  })
}