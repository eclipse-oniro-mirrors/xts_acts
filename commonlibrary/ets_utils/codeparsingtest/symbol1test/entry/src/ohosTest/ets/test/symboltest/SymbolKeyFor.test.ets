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
import { SymbolKeyForStandaloneTestUtils } from './symbolKeyForStandaloneTests.js';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function symbolKeyForTestTest() {
  describe('SymbolKeyForTest', () => {
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
     * @tc.name   SymbolKeyForGlobalSymbolTest001
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_001
     * @tc.desc   Verify Symbol.keyFor() returns key for global Symbol from Symbol.for()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForGlobalSymbolTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test001_SymbolKeyForGlobalSymbol();
      expect(result).assertEqual("Test Passed: SymbolKeyForGlobalSymbolTest001");
    });

    /**
     * @tc.name   SymbolKeyForNonGlobalSymbolTest002
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_002
     * @tc.desc   Verify Symbol.keyFor() returns undefined for non-global Symbol
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForNonGlobalSymbolTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test002_SymbolKeyForNonGlobalSymbol();
      expect(result).assertEqual("Test Passed: SymbolKeyForNonGlobalSymbolTest002");
    });

    /**
     * @tc.name   SymbolKeyForCaseSensitiveTest003
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_003
     * @tc.desc   Verify Symbol.keyFor() is case-sensitive for registry keys
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForCaseSensitiveTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test003_SymbolKeyForCaseSensitive();
      expect(result).assertEqual("Test Passed: SymbolKeyForCaseSensitiveTest003");
    });

    /**
     * @tc.name   SymbolKeyForNullKeyTest004
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_004
     * @tc.desc   Verify Symbol.keyFor() returns "null" for Symbol.for(null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForNullKeyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test004_SymbolKeyForNullKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForNullKeyTest004");
    });

    /**
     * @tc.name   SymbolKeyForUndefinedKeyTest005
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_005
     * @tc.desc   Verify Symbol.keyFor() returns "undefined" for Symbol.for(undefined)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForUndefinedKeyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test005_SymbolKeyForUndefinedKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForUndefinedKeyTest005");
    });

    /**
     * @tc.name   SymbolKeyForEmptyStringKeyTest006
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_006
     * @tc.desc   Verify Symbol.keyFor() returns empty string for Symbol.for("")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForEmptyStringKeyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test006_SymbolKeyForEmptyStringKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForEmptyStringKeyTest006");
    });





    /**
     * @tc.name   SymbolKeyForConsistentCallsTest009
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_009
     * @tc.desc   Verify Symbol.keyFor() returns consistent key across multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForConsistentCallsTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test009_SymbolKeyForConsistentCalls();
      expect(result).assertEqual("Test Passed: SymbolKeyForConsistentCallsTest009");
    });

    /**
     * @tc.name   SymbolKeyForBuiltInSymbolTest010
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_010
     * @tc.desc   Verify Symbol.keyFor() returns undefined for built-in Symbols
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForBuiltInSymbolTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test010_SymbolKeyForBuiltInSymbol();
      expect(result).assertEqual("Test Passed: SymbolKeyForBuiltInSymbolTest010");
    });

    /**
     * @tc.name   SymbolKeyForObjectAsKeyTest011
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_011
     * @tc.desc   Verify Symbol.keyFor() returns object's toString() for Symbol.for(object)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForObjectAsKeyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test011_SymbolKeyForObjectAsKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForObjectAsKeyTest011");
    });

    /**
     * @tc.name   SymbolKeyForArrayAsKeyTest012
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_012
     * @tc.desc   Verify Symbol.keyFor() returns array's toString() for Symbol.for(array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForArrayAsKeyTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test012_SymbolKeyForArrayAsKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForArrayAsKeyTest012");
    });

    /**
     * @tc.name   SymbolKeyForFunctionAsKeyTest013
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_013
     * @tc.desc   Verify Symbol.keyFor() returns function's toString() for Symbol.for(function)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForFunctionAsKeyTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test013_SymbolKeyForFunctionAsKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForFunctionAsKeyTest013");
    });

    /**
     * @tc.name   SymbolKeyForRegExpAsKeyTest014
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_014
     * @tc.desc   Verify Symbol.keyFor() returns RegExp's toString() for Symbol.for(RegExp)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForRegExpAsKeyTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test014_SymbolKeyForRegExpAsKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForRegExpAsKeyTest014");
    });

    /**
     * @tc.name   SymbolKeyForDateAsKeyTest015
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_015
     * @tc.desc   Verify Symbol.keyFor() returns Date's toString() for Symbol.for(Date)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForDateAsKeyTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test015_SymbolKeyForDateAsKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForDateAsKeyTest015");
    });

    /**
     * @tc.name   SymbolKeyForNestedScopesTest016
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_016
     * @tc.desc   Verify Symbol.keyFor() consistent across nested scopes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForNestedScopesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test016_SymbolKeyForNestedScopes();
      expect(result).assertEqual("Test Passed: SymbolKeyForNestedScopesTest016");
    });

    /**
     * @tc.name   SymbolKeyForSpecialCharKeyTest017
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_017
     * @tc.desc   Verify Symbol.keyFor() returns special char key as-is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForSpecialCharKeyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test017_SymbolKeyForSpecialCharKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForSpecialCharKeyTest017");
    });

    /**
     * @tc.name   SymbolKeyForSpacedKeyTest018
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_018
     * @tc.desc   Verify Symbol.keyFor() returns key with spaces as-is
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForSpacedKeyTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test018_SymbolKeyForSpacedKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForSpacedKeyTest018");
    });

    /**
     * @tc.name   SymbolKeyForNumberObjectAsKeyTest019
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_019
     * @tc.desc   Verify Symbol.keyFor() returns Number object's string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForNumberObjectAsKeyTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test019_SymbolKeyForNumberObjectAsKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForNumberObjectAsKeyTest019");
    });

    /**
     * @tc.name   SymbolKeyForBooleanObjectAsKeyTest020
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_020
     * @tc.desc   Verify Symbol.keyFor() returns Boolean object's string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForBooleanObjectAsKeyTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test020_SymbolKeyForBooleanObjectAsKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForBooleanObjectAsKeyTest020");
    });

    /**
     * @tc.name   SymbolKeyForReturnTypeStrictTest021
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_021
     * @tc.desc   Verify Symbol.keyFor() return type is string or undefined (strict check)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForReturnTypeStrictTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test021_SymbolKeyForReturnTypeStrict();
      expect(result).assertEqual("Test Passed: SymbolKeyForReturnTypeStrictTest021");
    });

    /**
     * @tc.name   SymbolKeyForMultipleSymbolForCallsTest022
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_022
     * @tc.desc   Verify Symbol.keyFor() consistent for multiple Symbol.for() calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForMultipleSymbolForCallsTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test022_SymbolKeyForMultipleSymbolForCalls();
      expect(result).assertEqual("Test Passed: SymbolKeyForMultipleSymbolForCallsTest022");
    });

    /**
     * @tc.name   SymbolKeyForAfterReferenceDeleteTest023
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_023
     * @tc.desc   Verify Symbol.keyFor() works after deleting global Symbol reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForAfterReferenceDeleteTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test023_SymbolKeyForAfterReferenceDelete();
      expect(result).assertEqual("Test Passed: SymbolKeyForAfterReferenceDeleteTest023");
    });

    /**
     * @tc.name   SymbolKeyForInStrictModeTest024
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_024
     * @tc.desc   Verify Symbol.keyFor() works in strict mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForInStrictModeTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test024_SymbolKeyForInStrictMode();
      expect(result).assertEqual("Test Passed: SymbolKeyForInStrictModeTest024");
    });

    /**
     * @tc.name   SymbolKeyForGlobalSymbolInMapTest025
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_025
     * @tc.desc   Verify Symbol.keyFor() works for global Symbol in Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForGlobalSymbolInMapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test025_SymbolKeyForGlobalSymbolInMap();
      expect(result).assertEqual("Test Passed: SymbolKeyForGlobalSymbolInMapTest025");
    });

    /**
     * @tc.name   SymbolKeyForGlobalSymbolInSetTest026
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_026
     * @tc.desc   Verify Symbol.keyFor() works for global Symbol in Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForGlobalSymbolInSetTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test026_SymbolKeyForGlobalSymbolInSet();
      expect(result).assertEqual("Test Passed: SymbolKeyForGlobalSymbolInSetTest026");
    });

    /**
     * @tc.name   SymbolKeyForGlobalSymbolInPromiseTest027
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_027
     * @tc.desc   Verify Symbol.keyFor() works for global Symbol from Promise.resolve()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForGlobalSymbolInPromiseTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test027_SymbolKeyForGlobalSymbolInPromise();
      expect(result).assertEqual("Test Passed: SymbolKeyForGlobalSymbolInPromiseTest027");
    });

    /**
     * @tc.name   SymbolKeyForNestedObjectAsKeyTest028
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_028
     * @tc.desc   Verify Symbol.keyFor() returns nested object's toString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForNestedObjectAsKeyTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test028_SymbolKeyForNestedObjectAsKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForNestedObjectAsKeyTest028");
    });

    /**
     * @tc.name   SymbolKeyForTypedArrayAsKeyTest029
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_029
     * @tc.desc   Verify Symbol.keyFor() returns TypedArray's toString()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForTypedArrayAsKeyTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test029_SymbolKeyForTypedArrayAsKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForTypedArrayAsKeyTest029");
    });

    /**
     * @tc.name   SymbolKeyForBuiltInNameUserKeyTest030
     * @tc.number SUB_SYMBOL_KEYFOR_STANDALONE_TEST_030
     * @tc.desc   Verify Symbol.keyFor() returns user key for built-in Symbol name
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolKeyForBuiltInNameUserKeyTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolKeyForStandaloneTestUtils.test030_SymbolKeyForBuiltInNameUserKey();
      expect(result).assertEqual("Test Passed: SymbolKeyForBuiltInNameUserKeyTest030");
    });
  })
}