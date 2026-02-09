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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { SymbolMatchStandaloneTestUtils } from './symbolMatchStandaloneTests.js';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function symbolMatchTestTest() {
  describe('SymbolMatchTest', () => {
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
     * @tc.name   RegExpDefaultSymbolMatchTest001
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_001
     * @tc.desc   Verify RegExp's default [Symbol.match] works with String.match()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RegExpDefaultSymbolMatchTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test001_RegExpDefaultSymbolMatch();
      expect(result).assertEqual("Test Passed: RegExpDefaultSymbolMatchTest001");
    });

    /**
     * @tc.name   CustomObjectSymbolMatchTest002
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_002
     * @tc.desc   Verify custom object's [Symbol.match] overrides String.match()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomObjectSymbolMatchTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test002_CustomObjectSymbolMatch();
      expect(result).assertEqual("Test Passed: CustomObjectSymbolMatchTest002");
    });

    /**
     * @tc.name   SymbolMatchFalseNonRegexTest003
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_003
     * @tc.desc   Verify [Symbol.match]=false marks object as non-regex for String.startsWith()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchFalseNonRegexTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test003_SymbolMatchFalseNonRegex();
      expect(result).assertEqual("Test Passed: SymbolMatchFalseNonRegexTest003");
    });

    /**
     * @tc.name   SymbolMatchReceivesTargetStringTest004
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_004
     * @tc.desc   Verify [Symbol.match] method receives target string as argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchReceivesTargetStringTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test004_SymbolMatchReceivesTargetString();
      expect(result).assertEqual("Test Passed: SymbolMatchReceivesTargetStringTest004");
    });

    /**
     * @tc.name   SymbolMatchReturnsNullForNoMatchTest005
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_005
     * @tc.desc   Verify [Symbol.match] returns null for no match (consistent with RegExp)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchReturnsNullForNoMatchTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test005_SymbolMatchReturnsNullForNoMatch();
      expect(result).assertEqual("Test Passed: SymbolMatchReturnsNullForNoMatchTest005");
    });

    /**
     * @tc.name   NonFunctionSymbolMatchThrowsTest006
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_006
     * @tc.desc   Verify non-function [Symbol.match] (except false) throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('NonFunctionSymbolMatchThrowsTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test006_NonFunctionSymbolMatchThrows();
      expect(result).assertEqual("Test Passed: NonFunctionSymbolMatchThrowsTest006");
    });

    /**
     * @tc.name   SymbolMatchWithGlobalFlagLogicTest007
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_007
     * @tc.desc   Verify custom [Symbol.match] handles global match logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchWithGlobalFlagLogicTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test007_SymbolMatchWithGlobalFlagLogic();
      expect(result).assertEqual("Test Passed: SymbolMatchWithGlobalFlagLogicTest007");
    });

    /**
     * @tc.name   InheritedSymbolMatchTest008
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_008
     * @tc.desc   Verify [Symbol.match] can be inherited via prototype chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('InheritedSymbolMatchTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test008_InheritedSymbolMatch();
      expect(result).assertEqual("Test Passed: InheritedSymbolMatchTest008");
    });



    /**
     * @tc.name   SymbolMatchTrueTreatAsRegexTest010
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_010
     * @tc.desc   Verify only [Symbol.match]=false marks object as non-regex; true/falsy treat as regex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchTrueTreatAsRegexTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test010_SymbolMatchTrueTreatAsRegex();
      expect(result).assertEqual("Test Passed: SymbolMatchTrueTreatAsRegexTest010");
    });

    /**
     * @tc.name   SymbolMatchReturnsNonArrayTest011
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_011
     * @tc.desc   Verify custom [Symbol.match] returns non-array result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchReturnsNonArrayTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test011_SymbolMatchReturnsNonArray();
      expect(result).assertEqual("Test Passed: SymbolMatchReturnsNonArrayTest011");
    });

    /**
     * @tc.name   SymbolMatchFalseWithEndsWithTest012
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_012
     * @tc.desc   Verify [Symbol.match]=false works with String.endsWith()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchFalseWithEndsWithTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test012_SymbolMatchFalseWithEndsWith();
      expect(result).assertEqual("Test Passed: SymbolMatchFalseWithEndsWithTest012");
    });

    /**
     * @tc.name   SymbolMatchFalseWithIncludesTest013
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_013
     * @tc.desc   Verify [Symbol.match]=false works with String.includes()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchFalseWithIncludesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test013_SymbolMatchFalseWithIncludes();
      expect(result).assertEqual("Test Passed: SymbolMatchFalseWithIncludesTest013");
    });

    /**
     * @tc.name   SymbolMatchThisBindingTest014
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_014
     * @tc.desc   Verify `this` in [Symbol.match] points to the matcher object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchThisBindingTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test014_SymbolMatchThisBinding();
      expect(result).assertEqual("Test Passed: SymbolMatchThisBindingTest014");
    });

    /**
     * @tc.name   OverrideRegExpPrototypeSymbolMatchTest015
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_015
     * @tc.desc   Verify overriding RegExp.prototype[Symbol.match] changes default behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('OverrideRegExpPrototypeSymbolMatchTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test015_OverrideRegExpPrototypeSymbolMatch();
      expect(result).assertEqual("Test Passed: OverrideRegExpPrototypeSymbolMatchTest015");
    });

    /**
     * @tc.name   SymbolMatchWithEmptyTargetTest016
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_016
     * @tc.desc   Verify custom [Symbol.match] handles empty target string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchWithEmptyTargetTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test016_SymbolMatchWithEmptyTarget();
      expect(result).assertEqual("Test Passed: SymbolMatchWithEmptyTargetTest016");
    });

    /**
     * @tc.name   SymbolMatchWithRegexMetacharsTest017
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_017
     * @tc.desc   Verify custom [Symbol.match] treats target as raw text (no regex metachar parsing)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchWithRegexMetacharsTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test017_SymbolMatchWithRegexMetachars();
      expect(result).assertEqual("Test Passed: SymbolMatchWithRegexMetacharsTest017");
    });

    /**
     * @tc.name   SymbolMatchThrowsErrorTest018
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_018
     * @tc.desc   Verify errors in [Symbol.match] are propagated to caller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchThrowsErrorTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test018_SymbolMatchThrowsError();
      expect(result).assertEqual("Test Passed: SymbolMatchThrowsErrorTest018");
    });

    /**
     * @tc.name   MultipleCustomMatchersTest019
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_019
     * @tc.desc   Verify multiple custom matchers retain unique logic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MultipleCustomMatchersTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test019_MultipleCustomMatchers();
      expect(result).assertEqual("Test Passed: MultipleCustomMatchersTest019");
    });

    /**
     * @tc.name   SymbolMatchFalseWithStartsWithPositionTest020
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_020
     * @tc.desc   Verify [Symbol.match]=false works with String.startsWith's position parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchFalseWithStartsWithPositionTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test020_SymbolMatchFalseWithStartsWithPosition();
      expect(result).assertEqual("Test Passed: SymbolMatchFalseWithStartsWithPositionTest020");
    });

    /**
     * @tc.name   SymbolMatchReturnsEmptyArrayTest021
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_021
     * @tc.desc   Verify custom [Symbol.match] returns empty array (vs null)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchReturnsEmptyArrayTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test021_SymbolMatchReturnsEmptyArray();
      expect(result).assertEqual("Test Passed: SymbolMatchReturnsEmptyArrayTest021");
    });

    /**
     * @tc.name   SubclassOverrideInheritedSymbolMatchTest022
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_022
     * @tc.desc   Verify subclass's own [Symbol.match] overrides inherited method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SubclassOverrideInheritedSymbolMatchTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test022_SubclassOverrideInheritedSymbolMatch();
      expect(result).assertEqual("Test Passed: SubclassOverrideInheritedSymbolMatchTest022");
    });

    /**
     * @tc.name   SymbolMatchDelegatesToRegExpExecTest023
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_023
     * @tc.desc   Verify custom [Symbol.match] delegates to RegExp.exec
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchDelegatesToRegExpExecTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test023_SymbolMatchDelegatesToRegExpExec();
      expect(result).assertEqual("Test Passed: SymbolMatchDelegatesToRegExpExecTest023");
    });

    /**
     * @tc.name   SymbolMatchWithUnicodeCharsTest024
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_024
     * @tc.desc   Verify custom [Symbol.match] matches Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchWithUnicodeCharsTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test024_SymbolMatchWithUnicodeChars();
      expect(result).assertEqual("Test Passed: SymbolMatchWithUnicodeCharsTest024");
    });

    /**
     * @tc.name   SymbolMatchFalseObjectToStringTest025
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_025
     * @tc.desc   Verify [Symbol.match]=false objects use toString() for string comparison
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchFalseObjectToStringTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test025_SymbolMatchFalseObjectToString();
      expect(result).assertEqual("Test Passed: SymbolMatchFalseObjectToStringTest025");
    });


    /**
     * @tc.name   SymbolMatchArgumentCountTest027
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_027
     * @tc.desc   Verify [Symbol.match] receives exactly one argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SymbolMatchArgumentCountTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test027_SymbolMatchArgumentCount();
      expect(result).assertEqual("Test Passed: SymbolMatchArgumentCountTest027");
    });

    /**
     * @tc.name   FrozenMatcherSymbolMatchTest028
     * @tc.number SUB_SYMBOL_MATCH_STANDALONE_TEST_028
     * @tc.desc   Verify frozen matcher's [Symbol.match] is callable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FrozenMatcherSymbolMatchTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const result = await SymbolMatchStandaloneTestUtils.test028_FrozenMatcherSymbolMatch();
      expect(result).assertEqual("Test Passed: FrozenMatcherSymbolMatchTest028");
    });



  })
}