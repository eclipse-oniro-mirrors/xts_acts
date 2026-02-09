/*
* Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';


export default function RegularExpressions12Test() {
  describe('RegularExpressions12Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      await Utils.msSleep(20);
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
     * @tc.number REGEX_POSITIVE_LOOKAHEAD_0100
     * @tc.name testRegexPositiveLookahead0001
     * @tc.desc Verify basic positive lookahead assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPositiveLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re1: RegExp = new RegExp('a(?=b)');
      const match1 = re1.exec("ab");
      const result1 = match1?.[0] ?? null;
      expect(result1).assertEqual("a");
    });

    /**
     * @tc.number REGEX_POSITIVE_LOOKAHEAD_FAIL_0100
     * @tc.name testRegexPositiveLookaheadFail0001
     * @tc.desc Verify positive lookahead failure case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPositiveLookaheadFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re2: RegExp = new RegExp('a(?=b)');
      const match2 = re2.exec("ac");
      const result2 = match2?.[0] ?? null;
      expect(result2).assertNull();
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKAHEAD_0100
     * @tc.name testRegexNegativeLookahead0001
     * @tc.desc Verify basic negative lookahead assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re3: RegExp = new RegExp('a(?!b)');
      const match3 = re3.exec("ac");
      const result3 = match3?.[0] ?? null;
      expect(result3).assertEqual("a");
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKAHEAD_FAIL_0100
     * @tc.name testRegexNegativeLookaheadFail0001
     * @tc.desc Verify negative lookahead failure case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookaheadFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re4: RegExp = new RegExp('a(?!b)');
      const match4 = re4.exec("ab");
      const result4 = match4?.[0] ?? null;
      expect(result4).assertNull();
    });

    /**
     * @tc.number REGEX_POSITIVE_LOOKBEHIND_0100
     * @tc.name testRegexPositiveLookbehind0001
     * @tc.desc Verify basic positive lookbehind assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPositiveLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re5: RegExp = new RegExp('(?<=a)b');
      const match5 = re5.exec("ab");
      const result5 = match5?.[0] ?? null;
      expect(result5).assertEqual("b");
    });

    /**
     * @tc.number REGEX_POSITIVE_LOOKBEHIND_FAIL_0100
     * @tc.name testRegexPositiveLookbehindFail0001
     * @tc.desc Verify positive lookbehind failure case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPositiveLookbehindFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re6: RegExp = new RegExp('(?<=a)b');
      const match6 = re6.exec("cb");
      const result6 = match6?.[0] ?? null;
      expect(result6).assertNull();
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKBEHIND_0100
     * @tc.name testRegexNegativeLookbehind0001
     * @tc.desc Verify basic negative lookbehind assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re7: RegExp = new RegExp('(?<!a)b');
      const match7 = re7.exec("cb");
      const result7 = match7?.[0] ?? null;
      expect(result7).assertEqual("b");
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKBEHIND_FAIL_0100
     * @tc.name testRegexNegativeLookbehindFail0001
     * @tc.desc Verify negative lookbehind failure case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookbehindFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re8: RegExp = new RegExp('(?<!a)b');
      const match8 = re8.exec("ab");
      const result8 = match8?.[0] ?? null;
      expect(result8).assertNull();
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_QUANTIFIER_0100
     * @tc.name testRegexLookaheadQuantifier0001
     * @tc.desc Verify lookahead with quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re9: RegExp = new RegExp('a(?=b+)');
      const match9 = re9.exec("abbb");
      const result9 = match9?.[0] ?? null;
      expect(result9).assertEqual("a");
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_CHARSET_0100
     * @tc.name testRegexLookaheadCharset0001
     * @tc.desc Verify lookahead with character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re10: RegExp = new RegExp('a(?=[0-9])');
      const match10 = re10.exec("a1");
      const result10 = match10?.[0] ?? null;
      expect(result10).assertEqual("a");
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_GROUP_0100
     * @tc.name testRegexLookaheadGroup0001
     * @tc.desc Verify lookahead with capturing group.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re11: RegExp = new RegExp('a(?=(b)(c))');
      const match11 = re11.exec("abc");
      const result11 = match11?.[0] ?? null;
      const group11 = match11?.[1] ?? null;
      expect(result11).assertEqual("a");
      expect(group11).assertEqual("b");
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_BOUNDARY_0100
     * @tc.name testRegexLookaheadBoundary0001
     * @tc.desc Verify lookahead with word boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re12: RegExp = new RegExp('a(?=\\b)');
      const match12 = re12.exec("a test");
      const result12 = match12?.[0] ?? null;
      expect(result12).assertEqual("a");
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_START_0100
     * @tc.name testRegexLookaheadStart0001
     * @tc.desc Verify lookahead with line start assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadStart0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re13: RegExp = new RegExp('a(?=^)');
      const match13 = re13.exec("a\nb");
      const result13 = match13?.[0] ?? null;
      expect(result13).assertNull();
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_END_0100
     * @tc.name testRegexLookaheadEnd0001
     * @tc.desc Verify lookahead with line end assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadEnd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re14: RegExp = new RegExp('a(?=$)');
      const match14 = re14.exec("test a");
      const result14 = match14?.[0] ?? null;
      expect(result14).assertEqual("a");
    });

    /**
     * @tc.number REGEX_MULTIPLE_LOOKAHEAD_0100
     * @tc.name testRegexMultipleLookahead0001
     * @tc.desc Verify multiple lookahead assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultipleLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re15: RegExp = new RegExp('a(?=b)(?=c)');
      const match15 = re15.exec("abc");
      const result15 = match15?.[0] ?? null;
      expect(result15).assertNull();
    });

    /**
     * @tc.number REGEX_MIXED_LOOKAHEAD_0100
     * @tc.name testRegexMixedLookahead0001
     * @tc.desc Verify mixed positive/negative lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMixedLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re16: RegExp = new RegExp('a(?=b)(?!c)');
      const match16 = re16.exec("ab");
      const result16 = match16?.[0] ?? null;
      expect(result16).assertEqual("a");
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_REPLACE_0100
     * @tc.name testRegexLookaheadReplace0001
     * @tc.desc Verify lookahead in string replacement.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadReplace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re17: RegExp = new RegExp('a(?=b)', 'g');
      const result17 = "ab ab".replace(re17, "A");
      expect(result17).assertEqual("Ab Ab");
    });

    /**
     * @tc.number REGEX_EMAIL_USERNAME_0100
     * @tc.name testRegexEmailUsername0001
     * @tc.desc Verify email username extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmailUsername0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re18: RegExp = new RegExp('[\\w.]+(?=@)');
      const match18 = re18.exec("test@example.com");
      const result18 = match18?.[0] ?? null;
      expect(result18).assertEqual("test");
    });

    /**
     * @tc.number REGEX_URL_PROTOCOL_0100
     * @tc.name testRegexUrlProtocol0001
     * @tc.desc Verify URL protocol extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlProtocol0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re19: RegExp = new RegExp('.+(?=:)');
      const match19 = re19.exec("https://example.com");
      const result19 = match19?.[0] ?? null;
      expect(result19).assertEqual("https");
    });

    /**
     * @tc.number REGEX_PASSWORD_LENGTH_0100
     * @tc.name testRegexPasswordLength0001
     * @tc.desc Verify password length validation with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re20: RegExp = new RegExp('^(?=.{8,})');
      const result20: boolean = re20.test("password");
      expect(result20).assertTrue();
    });

    /**
     * @tc.number REGEX_NEGATIVE_CHAR_EXCLUSION_0100
     * @tc.name testRegexNegativeCharExclusion0001
     * @tc.desc Verify exclusion of specific characters using negative lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeCharExclusion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re21: RegExp = new RegExp('^[^<>]*$');
      const result21: boolean = re21.test("test<script>");
      expect(result21).assertFalse();
    });

    /**
     * @tc.number REGEX_WORD_EXCLUSION_0100
     * @tc.name testRegexWordExclusion0001
     * @tc.desc Verify exclusion of specific word using negative lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordExclusion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re22: RegExp = new RegExp('^(?!badword).+$');
      const result22: boolean = re22.test("goodword");
      expect(result22).assertTrue();
    });

    /**
     * @tc.number REGEX_DOLLAR_AMOUNT_0100
     * @tc.name testRegexDollarAmount0001
     * @tc.desc Verify dollar amount matching using positive lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDollarAmount0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re23: RegExp = new RegExp('(?<=\\$)\\d+');
      const match23 = re23.exec("$100");
      const result23 = match23?.[0] ?? null;
      expect(result23).assertEqual("100");
    });

    /**
     * @tc.number REGEX_EMAIL_DOMAIN_0100
     * @tc.name testRegexEmailDomain0001
     * @tc.desc Verify email domain matching using positive lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmailDomain0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re24: RegExp = new RegExp('(?<=@)[\\w.]+');
      const match24 = re24.exec("test@example.com");
      const result24 = match24?.[0] ?? null;
      expect(result24).assertEqual("example.com");
    });

    /**
     * @tc.number REGEX_PORT_NUMBER_0100
     * @tc.name testRegexPortNumber0001
     * @tc.desc Verify port number matching using positive lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPortNumber0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re25: RegExp = new RegExp('(?<=:)\\d+');
      const match25 = re25.exec("localhost:8080");
      const result25 = match25?.[0] ?? null;
      expect(result25).assertEqual("8080");
    });

    /**
     * @tc.number REGEX_LOOKBEHIND_QUANTIFIER_0100
     * @tc.name testRegexLookbehindQuantifier0001
     * @tc.desc Verify lookbehind with quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookbehindQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re26: RegExp = new RegExp('(?<=\\d{3})\\d+');
      const match26 = re26.exec("123456");
      const result26 = match26?.[0] ?? null;
      expect(result26).assertEqual("456");
    });

    /**
     * @tc.number REGEX_LOOKBEHIND_CHARSET_0100
     * @tc.name testRegexLookbehindCharset0001
     * @tc.desc Verify lookbehind with character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookbehindCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re27: RegExp = new RegExp('(?<=[A-Z])[a-z]+');
      const match27 = re27.exec("Hello");
      const result27 = match27?.[0] ?? null;
      expect(result27).assertEqual("ello");
    });

    /**
     * @tc.number REGEX_MULTIPLE_LOOKBEHIND_0100
     * @tc.name testRegexMultipleLookbehind0001
     * @tc.desc Verify multiple lookbehind assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultipleLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re28: RegExp = new RegExp('(?<=a)(?<=ab)b');
      const match28 = re28.exec("ab");
      const result28 = match28?.[0] ?? null;
      expect(result28).assertNull();
    });

    /**
     * @tc.number REGEX_MIXED_LOOKBEHIND_0100
     * @tc.name testRegexMixedLookbehind0001
     * @tc.desc Verify mixed positive/negative lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMixedLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re29: RegExp = new RegExp('(?<=a)(?<!ca)b');
      const match29 = re29.exec("ab");
      const result29 = match29?.[0] ?? null;
      expect(result29).assertEqual("b");
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKBEHIND_PREFIX_0100
     * @tc.name testRegexNegativeLookbehindPrefix0001
     * @tc.desc Verify negative lookbehind for prefix exclusion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookbehindPrefix0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re30: RegExp = new RegExp('(?<!un)happy');
      const match30 = re30.exec("happy");
      const result30 = match30?.[0] ?? null;
      expect(result30).assertEqual("happy");
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKBEHIND_SYMBOL_0100
     * @tc.name testRegexNegativeLookbehindSymbol0001
     * @tc.desc Verify negative lookbehind for symbol exclusion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookbehindSymbol0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re31: RegExp = new RegExp('(?<!\\$)\\d+');
      const match31 = re31.exec("100");
      const result31 = match31?.[0] ?? null;
      expect(result31).assertEqual("100");
    });
    /**
     * @tc.number REGEX_GLOBAL_LOOKAHEAD_0100
     * @tc.name testRegexGlobalLookahead0001
     * @tc.desc Verify global matching with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexGlobalLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re32: RegExp = new RegExp('a(?=b)', 'g');
      const matches32 = "ab ab ab".match(re32);
      const result32 = matches32 ? matches32.length : 0;
      expect(result32).assertEqual(3);
    });

    /**
     * @tc.number REGEX_MULTILINE_LOOKAHEAD_0100
     * @tc.name testRegexMultilineLookahead0001
     * @tc.desc Verify multiline matching with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultilineLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re33: RegExp = new RegExp('^(?=line)', 'gm');
      const matches33 = "line1\nanother line\nline2".match(re33);
      const result33 = matches33 ? matches33.length : 0;
      expect(result33).assertEqual(2);
    });

    /**
     * @tc.number REGEX_CASE_INSENSITIVE_LOOKAHEAD_0100
     * @tc.name testRegexCaseInsensitiveLookahead0001
     * @tc.desc Verify case-insensitive lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCaseInsensitiveLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re34: RegExp = new RegExp('a(?=B)', 'i');
      const match34 = re34.exec("ab");
      const result34 = match34?.[0] ?? null;
      expect(result34).assertEqual("a");
    });

    /**
     * @tc.number REGEX_UNICODE_LOOKAHEAD_0100
     * @tc.name testRegexUnicodeLookahead0001
     * @tc.desc Verify Unicode lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re35: RegExp = new RegExp('\\p{L}(?=\\p{N})', 'u');
      const match35 = re35.exec("a1");
      const result35 = match35?.[0] ?? null;
      expect(result35).assertEqual("a");
    });

    /**
     * @tc.number REGEX_DOTALL_LOOKAHEAD_0100
     * @tc.name testRegexDotallLookahead0001
     * @tc.desc Verify dotAll mode with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDotallLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re36: RegExp = new RegExp('a(?=.b)', 's');
      const match36 = re36.exec("a\nb");
      const result36 = match36?.[0] ?? null;
      expect(result36).assertEqual("a");
    });

    /**
     * @tc.number REGEX_STICKY_LOOKAHEAD_0100
     * @tc.name testRegexStickyLookahead0001
     * @tc.desc Verify sticky mode with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexStickyLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re37: RegExp = new RegExp('a(?=b)', 'y');
      re37.lastIndex = 0;
      const match37 = re37.exec("ab");
      const result37 = match37?.[0] ?? null;
      expect(result37).assertEqual("a");
    });

    /**
     * @tc.number REGEX_NESTED_LOOKAHEAD_0100
     * @tc.name testRegexNestedLookahead0001
     * @tc.desc Verify nested lookahead assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNestedLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re38: RegExp = new RegExp('a(?=b(?=c))');
      const match38 = re38.exec("abc");
      const result38 = match38?.[0] ?? null;
      expect(result38).assertEqual("a");
    });

    /**
     * @tc.number REGEX_NESTED_LOOKBEHIND_0100
     * @tc.name testRegexNestedLookbehind0001
     * @tc.desc Verify nested lookbehind assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNestedLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re39: RegExp = new RegExp('(?<=(?<=a)b)c');
      const match39 = re39.exec("abc");
      const result39 = match39?.[0] ?? null;
      expect(result39).assertEqual("c");
    });

    /**
     * @tc.number REGEX_COMBINED_ASSERTIONS_0100
     * @tc.name testRegexCombinedAssertions0001
     * @tc.desc Verify combined lookahead and lookbehind assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCombinedAssertions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re40: RegExp = new RegExp('(?<=a)b(?=c)');
      const match40 = re40.exec("abc");
      const result40 = match40?.[0] ?? null;
      expect(result40).assertEqual("b");
    });
    /**
     * @tc.number REGEX_EMPTY_STRING_POSITION_0100
     * @tc.name testRegexEmptyStringPosition0001
     * @tc.desc Verify empty string position matching with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyStringPosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re41: RegExp = new RegExp('(?=a)');
      const match41 = re41.exec("a");
      const result41 = match41?.index ?? -1;
      expect(result41).assertEqual(0);
    });

    /**
     * @tc.number REGEX_ZERO_WIDTH_POSITIONS_0100
     * @tc.name testRegexZeroWidthPositions0001
     * @tc.desc Verify zero-width position matching count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexZeroWidthPositions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re42: RegExp = new RegExp('(?=a)|(?=b)', 'g');
      const matches42 = "ab".match(re42);
      const result42 = matches42?.length ?? 0;
      expect(result42).assertEqual(2);
    });

    /**
     * @tc.number REGEX_NEWLINE_POSITION_0100
     * @tc.name testRegexNewlinePosition0001
     * @tc.desc Verify newline position matching with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNewlinePosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re43: RegExp = new RegExp('(?=\\n)');
      const match43 = re43.exec("a\nb");
      const result43 = match43?.index ?? -1;
      expect(result43).assertEqual(1);
    });

    /**
     * @tc.number REGEX_DOLLAR_POSITION_0100
     * @tc.name testRegexDollarPosition0001
     * @tc.desc Verify dollar sign position matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDollarPosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re44: RegExp = new RegExp('(?=\\$)');
      const match44 = re44.exec("$100");
      const result44 = match44?.index ?? -1;
      expect(result44).assertEqual(0);
    });

    /**
     * @tc.number REGEX_UNICODE_SYMBOL_POSITION_0100
     * @tc.name testRegexUnicodeSymbolPosition0001
     * @tc.desc Verify Unicode symbol position matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeSymbolPosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re45: RegExp = new RegExp('(?=€)');
      const match45 = re45.exec("€100");
      const result45 = match45?.index ?? -1;
      expect(result45).assertEqual(0);
    });

    /**
     * @tc.number REGEX_CHINESE_CHAR_POSITION_0100
     * @tc.name testRegexChineseCharPosition0001
     * @tc.desc Verify Chinese character position matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexChineseCharPosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re46: RegExp = new RegExp('(?=中)');
      const match46 = re46.exec("中文");
      const result46 = match46?.index ?? -1;
      expect(result46).assertEqual(0);
    });

    /**
     * @tc.number REGEX_PASSWORD_DIGIT_0100
     * @tc.name testRegexPasswordDigit0001
     * @tc.desc Verify password contains digit using lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordDigit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re47: RegExp = new RegExp('^(?=.*\\d).+$');
      const result47: boolean = re47.test("password1");
      expect(result47).assertTrue();
    });

    /**
     * @tc.number REGEX_PASSWORD_UPPERCASE_0100
     * @tc.name testRegexPasswordUppercase0001
     * @tc.desc Verify password contains uppercase using lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordUppercase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re48: RegExp = new RegExp('^(?=.*[A-Z]).+$');
      const result48: boolean = re48.test("Password");
      expect(result48).assertTrue();
    });

    /**
     * @tc.number REGEX_PASSWORD_LOWERCASE_0100
     * @tc.name testRegexPasswordLowercase0001
     * @tc.desc Verify password contains lowercase using lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordLowercase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re49: RegExp = new RegExp('^(?=.*[a-z]).+$');
      const result49: boolean = re49.test("PASSWORD");
      expect(result49).assertFalse();
    });

    /**
     * @tc.number REGEX_PASSWORD_SPECIAL_0100
     * @tc.name testRegexPasswordSpecial0001
     * @tc.desc Verify password contains special character using lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordSpecial0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re50: RegExp = new RegExp('^(?=.*[!@#$%]).+$');
      const result50: boolean = re50.test("pass@word");
      expect(result50).assertTrue();
    });

    /**
     * @tc.number REGEX_STRONG_PASSWORD_0100
     * @tc.name testRegexStrongPassword0001
     * @tc.desc Verify strong password requirements using multiple lookaheads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexStrongPassword0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re51: RegExp = new RegExp('^(?=.*\\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%]).{8,}$');
      const result51: boolean = re51.test("Passw0rd!");
      expect(result51).assertTrue();
    });

    /**
     * @tc.number REGEX_HTML_CONTENT_0100
     * @tc.name testRegexHtmlContent0001
     * @tc.desc Verify HTML content extraction using lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHtmlContent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re52: RegExp = new RegExp('(?<=>)[^<]+(?=<)');
      const match52 = re52.exec("<div>content</div>");
      const result52 = match52?.[0] ?? null;
      expect(result52).assertEqual("content");
    });

    /**
     * @tc.number REGEX_QUOTED_CONTENT_0100
     * @tc.name testRegexQuotedContent0001
     * @tc.desc Verify quoted content extraction using lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexQuotedContent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re53: RegExp = new RegExp('(?<=")[^"]+(?=")');
      const match53 = re53.exec('name="test"');
      const result53 = match53?.[0] ?? null;
      expect(result53).assertEqual("test");
    });

    /**
     * @tc.number REGEX_PARENTHESES_CONTENT_0100
     * @tc.name testRegexParenthesesContent0001
     * @tc.desc Verify parentheses content extraction using lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexParenthesesContent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re54: RegExp = new RegExp('(?<=\\()[^)]+(?=\\))');
      const match54 = re54.exec("func(param)");
      const result54 = match54?.[0] ?? null;
      expect(result54).assertEqual("param");
    });

    /**
     * @tc.number REGEX_URL_QUERY_0100
     * @tc.name testRegexUrlQuery0001
     * @tc.desc Verify URL query extraction using lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlQuery0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re58: RegExp = new RegExp('(?<=\\?).+');
      const match58 = re58.exec("https://example.com?query=1&page=2");
      const result58 = match58?.[0] ?? null;
      expect(result58).assertEqual("query=1&page=2");
    });

    /**
     * @tc.number REGEX_IP_LAST_OCTET_0100
     * @tc.name testRegexIpLastOctet0001
     * @tc.desc Verify IP last octet extraction using lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpLastOctet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re59: RegExp = new RegExp('(?<=\\.)\\d+$');
      const match59 = re59.exec("192.168.1.100");
      const result59 = match59?.[0] ?? null;
      expect(result59).assertEqual("100");
    });

    /**
     * @tc.number REGEX_VERSION_PATCH_0100
     * @tc.name testRegexVersionPatch0001
     * @tc.desc Verify version patch number extraction using lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexVersionPatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re60: RegExp = new RegExp('(?<=\\.)\\d+$');
      const match60 = re60.exec("1.2.3");
      const result60 = match60?.[0] ?? null;
      expect(result60).assertEqual("3");
    });

    /**
     * @tc.number REGEX_FILENAME_0100
     * @tc.name testRegexFilename0001
     * @tc.desc Verify filename extraction without extension.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFilename0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re61: RegExp = new RegExp('.+(?=\\.)');
      const match61 = re61.exec("document.txt");
      const result61 = match61?.[0] ?? null;
      expect(result61).assertEqual("document");
    });

    /**
     * @tc.number REGEX_FILE_EXTENSION_0100
     * @tc.name testRegexFileExtension0001
     * @tc.desc Verify file extension extraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFileExtension0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re62: RegExp = new RegExp('(?<=\\.)[^.]+$');
      const match62 = re62.exec("image.jpg");
      const result62 = match62?.[0] ?? null;
      expect(result62).assertEqual("jpg");
    });

    /**
     * @tc.number REGEX_YEAR_EXTRACTION_0100
     * @tc.name testRegexYearExtraction0001
     * @tc.desc Verify year extraction from date.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexYearExtraction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re63: RegExp = new RegExp('^\\d+(?=-)');
      const match63 = re63.exec("2023-12-31");
      const result63 = match63?.[0] ?? null;
      expect(result63).assertEqual("2023");
    });

    /**
     * @tc.number REGEX_HOUR_EXTRACTION_0100
     * @tc.name testRegexHourExtraction0001
     * @tc.desc Verify hour extraction from time.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHourExtraction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re64: RegExp = new RegExp('^\\d+(?=:)');
      const match64 = re64.exec("12:34:56");
      const result64 = match64?.[0] ?? null;
      expect(result64).assertEqual("12");
    });

    /**
     * @tc.number REGEX_AREA_CODE_0100
     * @tc.name testRegexAreaCode0001
     * @tc.desc Verify area code extraction from phone number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexAreaCode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re65: RegExp = new RegExp('^\\d+(?=-)');
      const match65 = re65.exec("010-12345678");
      const result65 = match65?.[0] ?? null;
      expect(result65).assertEqual("010");
    });

    /**
     * @tc.number REGEX_ID_BIRTHDATE_0100
     * @tc.name testRegexIdBirthdate0001
     * @tc.desc Verify birthdate extraction from ID number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIdBirthdate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re66: RegExp = new RegExp('(?<=\\d{6})\\d{8}(?=\\d{4})');
      const match66 = re66.exec("110101199001011234");
      const result66 = match66?.[0] ?? null;
      expect(result66).assertEqual("19900101");
    });

    /**
     * @tc.number REGEX_MARKDOWN_TEXT_0100
     * @tc.name testRegexMarkdownText0001
     * @tc.desc Verify text extraction from Markdown link.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMarkdownText0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re67: RegExp = new RegExp('(?<=\\[)[^\\]]+(?=\\])');
      const match67 = re67.exec("[link text](url)");
      const result67 = match67?.[0] ?? null;
      expect(result67).assertEqual("link text");
    });

    /**
     * @tc.number REGEX_MARKDOWN_URL_0100
     * @tc.name testRegexMarkdownUrl0001
     * @tc.desc Verify URL extraction from Markdown link.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMarkdownUrl0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re68: RegExp = new RegExp('(?<=\\()[^)]+(?=\\))');
      const match68 = re68.exec("[text](https://example.com)");
      const result68 = match68?.[0] ?? null;
      expect(result68).assertEqual("https://example.com");
    });

    /**
     * @tc.number REGEX_CSS_CLASS_0100
     * @tc.name testRegexCssClass0001
     * @tc.desc Verify class name extraction from CSS selector.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCssClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re69: RegExp = new RegExp('(?<=\\.)[^. ]+');
      const match69 = re69.exec(".class-name selector");
      const result69 = match69?.[0] ?? null;
      expect(result69).assertEqual("class-name");
    });

    /**
     * @tc.number REGEX_CSS_ID_0100
     * @tc.name testRegexCssId0001
     * @tc.desc Verify ID extraction from CSS selector.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCssId0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re70: RegExp = new RegExp('(?<=#)[^# ]+');
      const match70 = re70.exec("#id-name selector");
      const result70 = match70?.[0] ?? null;
      expect(result70).assertEqual("id-name");
    });

    /**
     * @tc.number REGEX_INSERT_BEFORE_0100
     * @tc.name testRegexInsertBefore0001
     * @tc.desc Verify insertion before matched position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexInsertBefore0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re71: RegExp = new RegExp('(?=\\d)', 'g');
      const result71 = "123".replace(re71, ",");
      expect(result71).assertEqual(",1,2,3");
    });

    /**
     * @tc.number REGEX_REMOVE_AFTER_0100
     * @tc.name testRegexRemoveAfter0001
     * @tc.desc Verify removal after matched position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexRemoveAfter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re72: RegExp = new RegExp('(?<=\\$)\\d+');
      const result72 = "$100".replace(re72, "");
      expect(result72).assertEqual("$");
    });

    /**
     * @tc.number REGEX_TRANSFORM_AFTER_0100
     * @tc.name testRegexTransformAfter0001
     * @tc.desc Verify transformation after matched position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTransformAfter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re73: RegExp = new RegExp('(?<=\\$)\\d+');
      const result73 = "$100".replace(re73, (match) => (Number(match) * 2).toString());
      expect(result73).assertEqual("$200");
    });

    /**
     * @tc.number REGEX_FUNCTION_REPLACE_0100
     * @tc.name testRegexFunctionReplace0001
     * @tc.desc Verify function replacement with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFunctionReplace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re74: RegExp = new RegExp('(?<=[A-Z])(?=[A-Z][a-z])', 'g');
      const result74 = "ABCDefGHIjkl".replace(re74, " ");
      expect(result74).assertEqual("ABC DefGH Ijkl");
    });

    /**
     * @tc.number REGEX_OVERLAPPING_0100
     * @tc.name testRegexOverlapping0001
     * @tc.desc Verify overlapping pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexOverlapping0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re75: RegExp = new RegExp('(?=(\\d{2}))', 'g');
      const matches75 = Array.from("1234".matchAll(re75)).map(m => m[1]);
      const result75 = matches75.join(",");
      expect(result75).assertEqual("12,23,34");
    });

    /**
     * @tc.number REGEX_EMPTY_INPUT_0100
     * @tc.name testRegexEmptyInput0001
     * @tc.desc Verify empty input matching with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyInput0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re76: RegExp = new RegExp('^(?=.*)');
      const result76: boolean = re76.test("");
      expect(result76).assertTrue();
    });

    /**
     * @tc.number REGEX_FULL_STRING_0100
     * @tc.name testRegexFullString0001
     * @tc.desc Verify full string matching with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFullString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re77: RegExp = new RegExp('^(?=.*$)');
      const result77: boolean = re77.test("anything");
      expect(result77).assertTrue();
    });

    /**
     * @tc.number REGEX_BACKREFERENCE_0100
     * @tc.name testRegexBackreference0001
     * @tc.desc Verify backreference with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexBackreference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re78: RegExp = new RegExp('(\\w)(?=\\1)');
      const match78 = re78.exec("aabb");
      const result78 = match78?.[0] ?? null;
      expect(result78).assertEqual("a");
    });

    /**
     * @tc.number REGEX_NAMED_GROUPS_0100
     * @tc.name testRegexNamedGroups0001
     * @tc.desc Verify named groups with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNamedGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re79: RegExp = new RegExp('(?<prefix>\\w+)(?=(?<suffix>\\d+))');
      const match79 = re79.exec("test123");
      const prefix = match79?.groups?.['prefix'] ?? null;
      const suffix = match79?.groups?.['suffix'] ?? null;
      expect(prefix).assertEqual("test12");
      expect(suffix).assertEqual("3");
    });

    /**
     * @tc.number REGEX_CHARACTER_CLASS_0100
     * @tc.name testRegexCharacterClass0001
     * @tc.desc Verify character class with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharacterClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re80: RegExp = new RegExp('[A-Z](?=[a-z])');
      const match80 = re80.exec("Abc");
      const result80 = match80?.[0] ?? null;
      expect(result80).assertEqual("A");
    });

    /**
     * @tc.number REGEX_ALTERNATION_WITH_LOOKAHEAD_0100
     * @tc.name testRegexAlternationWithLookahead0001
     * @tc.desc Verify alternation pattern with lookahead assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexAlternationWithLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re81: RegExp = new RegExp('a(?=b|c)');
      const match81 = re81.exec("ac");
      const result81 = match81?.[0] ?? null;
      expect(result81).assertEqual("a");
    });

    /**
     * @tc.number REGEX_NON_CAPTURING_GROUP_0100
     * @tc.name testRegexNonCapturingGroup0001
     * @tc.desc Verify non-capturing group with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonCapturingGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re82: RegExp = new RegExp('a(?=(?:b|c))');
      const match82 = re82.exec("ab");
      const result82 = match82?.[0] ?? null;
      expect(result82).assertEqual("a");
    });

    /**
     * @tc.number REGEX_GREEDY_QUANTIFIER_0100
     * @tc.name testRegexGreedyQuantifier0001
     * @tc.desc Verify greedy quantifier with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexGreedyQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re83: RegExp = new RegExp('a(?=.*b)');
      const match83 = re83.exec("acccb");
      const result83 = match83?.[0] ?? null;
      expect(result83).assertEqual("a");
    });

    /**
     * @tc.number REGEX_LAZY_QUANTIFIER_0100
     * @tc.name testRegexLazyQuantifier0001
     * @tc.desc Verify lazy quantifier with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLazyQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re84: RegExp = new RegExp('a(?=.*?b)');
      const match84 = re84.exec("acccb");
      const result84 = match84?.[0] ?? null;
      expect(result84).assertEqual("a");
    });

    /**
     * @tc.number REGEX_URL_PARAMETER_0100
     * @tc.name testRegexUrlParameter0001
     * @tc.desc Verify URL parameter extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlParameter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re85: RegExp = new RegExp('(?<=[?&])name=[^&]+');
      const match85 = re85.exec("?age=30&name=test&city=beijing");
      const result85 = match85?.[0] ?? null;
      expect(result85).assertEqual("name=test");
    });

    /**
     * @tc.number REGEX_MULTILINE_COMMENT_0100
     * @tc.name testRegexMultilineComment0001
     * @tc.desc Verify multiline comment extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultilineComment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re86: RegExp = new RegExp('(?<=\\/\\*)([\\s\\S]*?)(?=\\*\\/)');
      const match86 = re86.exec("/* multi-line\ncomment */");
      const result86 = match86?.[1]?.trim() ?? null;
      expect(result86).assertEqual("multi-line\ncomment");
    });

    /**
     * @tc.number REGEX_SINGLELINE_COMMENT_0100
     * @tc.name testRegexSinglelineComment0001
     * @tc.desc Verify single-line comment extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexSinglelineComment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re87: RegExp = new RegExp('(?<=\\/\\/).+');
      const match87 = re87.exec("// this is a comment");
      const result87 = match87?.[0] ?? null;
      expect(result87).assertEqual(" this is a comment");
    });

    /**
     * @tc.number SUB_REGEX_XML_ATTRIBUTE_0100
     * @tc.name testRegexXmlAttribute0001
     * @tc.desc Verify XML attribute extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexXmlAttribute0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re88: RegExp = new RegExp('(?<=\\s)name="[^"]+"');
      const match88 = re88.exec('<tag id="1" name="test" />');
      const result88 = match88?.[0] ?? null;
      expect(result88).assertEqual('name="test"');
    });

    /**
     * @tc.number REGEX_CREDIT_CARD_GROUPS_0100
     * @tc.name testRegexCreditCardGroups0001
     * @tc.desc Verify credit card group extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCreditCardGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re89: RegExp = new RegExp('\\d+(?= )', 'g');
      const matches89 = "1234 5678 9012 3456".match(re89);
      const result89 = matches89?.join(",") ?? null;
      expect(result89).assertEqual("1234,5678,9012");
    });

    /**
     * @tc.number REGEX_UUID_MIDDLE_0100
     * @tc.name testRegexUuidMiddle0001
     * @tc.desc Verify UUID middle section extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUuidMiddle0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re90: RegExp = new RegExp('(?<=-)[0-9a-fA-F]+(?=-)');
      const match90 = re90.exec("550e8400-e29b-41d4-a716-446655440000");
      const result90 = match90?.[0] ?? null;
      expect(result90).assertEqual("e29b");
    });

    /**
     * @tc.number REGEX_IPV6_FIRST_SEGMENT_0100
     * @tc.name testRegexIpv6FirstSegment0001
     * @tc.desc Verify IPv6 first segment extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpv6FirstSegment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re91: RegExp = new RegExp('^[0-9a-fA-F:]+?(?=:)');
      const match91 = re91.exec("2001:0db8:85a3:0000:0000:8a2e:0370:7334");
      const result91 = match91?.[0] ?? null;
      expect(result91).assertEqual("2001");
    });
    /**
     * @tc.number REGEX_MAC_LAST_SEGMENT_0100
     * @tc.name testRegexMacLastSegment0001
     * @tc.desc Verify MAC address last segment extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMacLastSegment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re92: RegExp = new RegExp('(?<=:)[0-9a-fA-F]{2}$');
      const match92 = re92.exec("00:1B:44:11:3A:B7");
      const result92 = match92?.[0] ?? null;
      expect(result92).assertEqual("B7");
    });

    /**
     * @tc.number SUB_REGEX_SCIENTIFIC_NOTATION_0100
     * @tc.name testRegexScientificNotation0001
     * @tc.desc Verify scientific notation exponent extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexScientificNotation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re93: RegExp = new RegExp('(?=[eE][+-]?\\d+).+');
      const match93 = re93.exec("1.23e+45");
      const result93 = match93?.[0] ?? null;
      expect(result93).assertEqual("e+45");
    });

    /**
     * @tc.number REGEX_CURRENCY_VALUE_0100
     * @tc.name testRegexCurrencyValue0001
     * @tc.desc Verify currency value extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCurrencyValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re94: RegExp = new RegExp('(?<=[€$£])\\d+(\\.\\d+)?');
      const match94 = re94.exec("€123.45");
      const result94 = match94?.[0] ?? null;
      expect(result94).assertEqual("123.45");
    });

    /**
     * @tc.number REGEX_PERCENTAGE_VALUE_0100
     * @tc.name testRegexPercentageValue0001
     * @tc.desc Verify percentage value extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPercentageValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re95: RegExp = new RegExp('\\d+(?=%)');
      const match95 = re95.exec("75%");
      const result95 = match95?.[0] ?? null;
      expect(result95).assertEqual("75");
    });

    /**
     * @tc.number REGEX_VERSION_RANGE_0100
     * @tc.name testRegexVersionRange0001
     * @tc.desc Verify version range upper bound extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexVersionRange0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re96: RegExp = new RegExp('(?<=<=)\\d+\\.\\d+\\.\\d+');
      const match96 = re96.exec("1.0.0 <= version <= 2.0.0");
      const result96 = match96?.[0] ?? null;
      expect(result96).assertNull();
    });

    /**
     * @tc.number REGEX_MATH_OPERATOR_0100
     * @tc.name testRegexMathOperator0001
     * @tc.desc Verify math operator extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMathOperator0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re97: RegExp = new RegExp('(?<=\\d)[+\\-*/](?=\\d)');
      const match97 = re97.exec("10+5 * 3");
      const result97 = match97?.[0] ?? null;
      expect(result97).assertEqual("+");
    });

    /**
     * @tc.number REGEX_ARRAY_ELEMENT_0100
     * @tc.name testRegexArrayElement0001
     * @tc.desc Verify array first element extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexArrayElement0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re98: RegExp = new RegExp('(?<=\\[)[^,\\]]+(?=,)');
      const match98 = re98.exec("[1, 2, 3, 4]");
      const result98 = match98?.[0]?.trim() ?? null;
      expect(result98).assertEqual("1");
    });

    /**
     * @tc.number REGEX_COMPLEX_PASSWORD_0100
     * @tc.name testRegexComplexPassword0001
     * @tc.desc Verify complex password validation with multiple assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexComplexPassword0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re99: RegExp = new RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[!@#$%^&*])(?!.*\\s).{8,16}$');
      const result99: boolean = re99.test("Passw0rd!");
      expect(result99).assertTrue();
    });

    /**
     * @tc.number REGEX_NESTED_PARENTHESES_0100
     * @tc.name testRegexNestedParentheses0001
     * @tc.desc Verify nested parentheses content extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNestedParentheses0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const re100: RegExp = new RegExp('(?<=\\()(?:[^()]+|\\((?:[^()]+|\\([^()]*\\))*\\))*(?=\\))');
      const match100 = re100.exec("a(b(c)d)e");
      const result100 = match100?.[0] ?? null;
      expect(result100).assertEqual("b(c)d");
    });
  })
}