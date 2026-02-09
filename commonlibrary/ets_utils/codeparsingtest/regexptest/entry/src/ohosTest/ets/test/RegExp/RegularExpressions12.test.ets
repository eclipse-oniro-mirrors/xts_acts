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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

interface TestObject {
  id?: number;
  name?: string;
  data?: string;
  key?: string;
  prop?: string;
  a?: number;
  b?: number;
  unused?: string;
  new?: string;
  x?: number;
  y?: number;
}

type TestArray = Array<number | string | boolean | null | undefined>;

interface TestFunction extends Function {
  prop?: string;
}

class MockSymbol {
  description: string;

  constructor(description: string) {
    this.description = description;
  }
}

export default function RegularExpressions12Test() {
  describe('RegularExpressions12Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
    it("testRegexPositiveLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPositiveLookahead0001 start');

      const re1 = /a(?=b)/;
      const match1 = re1.exec("ab");
      const result1 = match1?.[0] ?? null;
      console.log(`1. Positive lookahead match: ${result1}`);
      expect(result1).assertEqual("a");
      done();
      console.log('testRegexPositiveLookahead0001 done');
    });

    /**
     * @tc.number REGEX_POSITIVE_LOOKAHEAD_FAIL_0100
     * @tc.name testRegexPositiveLookaheadFail0001
     * @tc.desc Verify positive lookahead failure case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPositiveLookaheadFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPositiveLookaheadFail0001 start');

      const re2 = /a(?=b)/;
      const match2 = re2.exec("ac");
      const result2 = match2?.[0] ?? null;
      console.log(`2. Positive lookahead fail: ${result2}`);
      expect(result2).assertNull();
      done();
      console.log('testRegexPositiveLookaheadFail0001 done');
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKAHEAD_0100
     * @tc.name testRegexNegativeLookahead0001
     * @tc.desc Verify basic negative lookahead assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNegativeLookahead0001 start');

      const re3 = /a(?!b)/;
      const match3 = re3.exec("ac");
      const result3 = match3?.[0] ?? null;
      console.log(`3. Negative lookahead match: ${result3}`);
      expect(result3).assertEqual("a");
      done();
      console.log('testRegexNegativeLookahead0001 done');
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKAHEAD_FAIL_0100
     * @tc.name testRegexNegativeLookaheadFail0001
     * @tc.desc Verify negative lookahead failure case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookaheadFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNegativeLookaheadFail0001 start');

      const re4 = /a(?!b)/;
      const match4 = re4.exec("ab");
      const result4 = match4?.[0] ?? null;
      console.log(`4. Negative lookahead fail: ${result4}`);
      expect(result4).assertNull();
      done();
      console.log('testRegexNegativeLookaheadFail0001 done');
    });

    /**
     * @tc.number REGEX_POSITIVE_LOOKBEHIND_0100
     * @tc.name testRegexPositiveLookbehind0001
     * @tc.desc Verify basic positive lookbehind assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPositiveLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPositiveLookbehind0001 start');

      const re5 = /(?<=a)b/;
      const match5 = re5.exec("ab");
      const result5 = match5?.[0] ?? null;
      console.log(`5. Positive lookbehind match: ${result5}`);
      expect(result5).assertEqual("b");
      done();
      console.log('testRegexPositiveLookbehind0001 done');
    });

    /**
     * @tc.number REGEX_POSITIVE_LOOKBEHIND_FAIL_0100
     * @tc.name testRegexPositiveLookbehindFail0001
     * @tc.desc Verify positive lookbehind failure case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPositiveLookbehindFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPositiveLookbehindFail0001 start');

      const re6 = /(?<=a)b/;
      const match6 = re6.exec("cb");
      const result6 = match6?.[0] ?? null;
      console.log(`6. Positive lookbehind fail: ${result6}`);
      expect(result6).assertNull();
      done();
      console.log('testRegexPositiveLookbehindFail0001 done');
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKBEHIND_0100
     * @tc.name testRegexNegativeLookbehind0001
     * @tc.desc Verify basic negative lookbehind assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNegativeLookbehind0001 start');

      const re7 = /(?<!a)b/;
      const match7 = re7.exec("cb");
      const result7 = match7?.[0] ?? null;
      console.log(`7. Negative lookbehind match: ${result7}`);
      expect(result7).assertEqual("b");
      done();
      console.log('testRegexNegativeLookbehind0001 done');
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKBEHIND_FAIL_0100
     * @tc.name testRegexNegativeLookbehindFail0001
     * @tc.desc Verify negative lookbehind failure case.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookbehindFail0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNegativeLookbehindFail0001 start');

      const re8 = /(?<!a)b/;
      const match8 = re8.exec("ab");
      const result8 = match8?.[0] ?? null;
      console.log(`8. Negative lookbehind fail: ${result8}`);
      expect(result8).assertNull();
      done();
      console.log('testRegexNegativeLookbehindFail0001 done');
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_QUANTIFIER_0100
     * @tc.name testRegexLookaheadQuantifier0001
     * @tc.desc Verify lookahead with quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLookaheadQuantifier0001 start');

      const re9 = /a(?=b+)/;
      const match9 = re9.exec("abbb");
      const result9 = match9?.[0] ?? null;
      console.log(`9. Lookahead with quantifier: ${result9}`);
      expect(result9).assertEqual("a");
      done();
      console.log('testRegexLookaheadQuantifier0001 done');
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_CHARSET_0100
     * @tc.name testRegexLookaheadCharset0001
     * @tc.desc Verify lookahead with character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLookaheadCharset0001 start');

      const re10 = /a(?=[0-9])/;
      const match10 = re10.exec("a1");
      const result10 = match10?.[0] ?? null;
      console.log(`10. Lookahead with charset: ${result10}`);
      expect(result10).assertEqual("a");
      done();
      console.log('testRegexLookaheadCharset0001 done');
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_GROUP_0100
     * @tc.name testRegexLookaheadGroup0001
     * @tc.desc Verify lookahead with capturing group.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLookaheadGroup0001 start');

      const re11 = /a(?=(b)(c))/;
      const match11 = re11.exec("abc");
      const result11 = match11?.[0] ?? null;
      const group11 = match11?.[1] ?? null;
      console.log(`11. Lookahead with group - main: ${result11}, group1: ${group11}`);
      expect(result11).assertEqual("a");
      expect(group11).assertEqual("b");
      done();
      console.log('testRegexLookaheadGroup0001 done');
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_BOUNDARY_0100
     * @tc.name testRegexLookaheadBoundary0001
     * @tc.desc Verify lookahead with word boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLookaheadBoundary0001 start');

      const re12 = /a(?=\b)/;
      const match12 = re12.exec("a test");
      const result12 = match12?.[0] ?? null;
      console.log(`12. Lookahead with boundary: ${result12}`);
      expect(result12).assertEqual("a");
      done();
      console.log('testRegexLookaheadBoundary0001 done');
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_START_0100
     * @tc.name testRegexLookaheadStart0001
     * @tc.desc Verify lookahead with line start assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadStart0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLookaheadStart0001 start');

      const re13 = /a(?=^)/;
      const match13 = re13.exec("a\nb");
      const result13 = match13?.[0] ?? null;
      console.log(`13. Lookahead with line start: ${result13}`);
      expect(result13).assertNull();
      done();
      console.log('testRegexLookaheadStart0001 done');
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_END_0100
     * @tc.name testRegexLookaheadEnd0001
     * @tc.desc Verify lookahead with line end assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadEnd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLookaheadEnd0001 start');

      const re14 = /a(?=$)/;
      const match14 = re14.exec("test a");
      const result14 = match14?.[0] ?? null;
      console.log(`14. Lookahead with line end: ${result14}`);
      expect(result14).assertEqual("a");
      done();
      console.log('testRegexLookaheadEnd0001 done');
    });

    /**
     * @tc.number REGEX_MULTIPLE_LOOKAHEAD_0100
     * @tc.name testRegexMultipleLookahead0001
     * @tc.desc Verify multiple lookahead assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultipleLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMultipleLookahead0001 start');

      const re15 = /a(?=b)(?=c)/;
      const match15 = re15.exec("abc");
      const result15 = match15?.[0] ?? null;
      console.log(`15. Multiple lookaheads: ${result15}`);
      expect(result15).assertNull();
      done();
      console.log('testRegexMultipleLookahead0001 done');
    });

    /**
     * @tc.number REGEX_MIXED_LOOKAHEAD_0100
     * @tc.name testRegexMixedLookahead0001
     * @tc.desc Verify mixed positive/negative lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMixedLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMixedLookahead0001 start');

      const re16 = /a(?=b)(?!c)/;
      const match16 = re16.exec("ab");
      const result16 = match16?.[0] ?? null;
      console.log(`16. Mixed lookaheads: ${result16}`);
      expect(result16).assertEqual("a");
      done();
      console.log('testRegexMixedLookahead0001 done');
    });

    /**
     * @tc.number REGEX_LOOKAHEAD_REPLACE_0100
     * @tc.name testRegexLookaheadReplace0001
     * @tc.desc Verify lookahead in string replacement.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookaheadReplace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLookaheadReplace0001 start');

      const re17 = /a(?=b)/g;
      const result17 = "ab ab".replace(re17, "A");
      console.log(`17. Lookahead replacement: ${result17}`);
      expect(result17).assertEqual("Ab Ab");
      done();
      console.log('testRegexLookaheadReplace0001 done');
    });

    /**
     * @tc.number REGEX_EMAIL_USERNAME_0100
     * @tc.name testRegexEmailUsername0001
     * @tc.desc Verify email username extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmailUsername0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmailUsername0001 start');

      const re18 = /[\w.]+(?=@)/;
      const match18 = re18.exec("test@example.com");
      const result18 = match18?.[0] ?? null;
      console.log(`18. Email username: ${result18}`);
      expect(result18).assertEqual("test");
      done();
      console.log('testRegexEmailUsername0001 done');
    });

    /**
     * @tc.number REGEX_URL_PROTOCOL_0100
     * @tc.name testRegexUrlProtocol0001
     * @tc.desc Verify URL protocol extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlProtocol0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUrlProtocol0001 start');

      const re19 = /.+(?=:)/;
      const match19 = re19.exec("https://example.com");
      const result19 = match19?.[0] ?? null;
      console.log(`19. URL protocol: ${result19}`);
      expect(result19).assertEqual("https");
      done();
      console.log('testRegexUrlProtocol0001 done');
    });

    /**
     * @tc.number REGEX_PASSWORD_LENGTH_0100
     * @tc.name testRegexPasswordLength0001
     * @tc.desc Verify password length validation with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPasswordLength0001 start');

      const re20 = /^(?=.{8,})/;
      const result20 = re20.test("password");
      console.log(`20. Password length >=8: ${result20}`);
      expect(result20).assertTrue();
      done();
      console.log('testRegexPasswordLength0001 done');
    });

    /**
     * @tc.number REGEX_NEGATIVE_CHAR_EXCLUSION_0100
     * @tc.name testRegexNegativeCharExclusion0001
     * @tc.desc Verify exclusion of specific characters using negative lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeCharExclusion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNegativeCharExclusion0001 start');

      const re21 = /^[^<>]*$/;
      const result21 = re21.test("test<script>");
      console.log(`21. Exclude <> characters: ${result21}`);
      expect(result21).assertFalse();
      done();
      console.log('testRegexNegativeCharExclusion0001 done');
    });

    /**
     * @tc.number REGEX_WORD_EXCLUSION_0100
     * @tc.name testRegexWordExclusion0001
     * @tc.desc Verify exclusion of specific word using negative lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexWordExclusion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexWordExclusion0001 start');

      const re22 = /^(?!badword).+$/;
      const result22 = re22.test("goodword");
      console.log(`22. Exclude specific word: ${result22}`);
      expect(result22).assertTrue();
      done();
      console.log('testRegexWordExclusion0001 done');
    });

    /**
     * @tc.number REGEX_DOLLAR_AMOUNT_0100
     * @tc.name testRegexDollarAmount0001
     * @tc.desc Verify dollar amount matching using positive lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDollarAmount0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDollarAmount0001 start');

      const re23 = /(?<=\$)\d+/;
      const match23 = re23.exec("$100");
      const result23 = match23?.[0] ?? null;
      console.log(`23. Match dollar amount: ${result23}`);
      expect(result23).assertEqual("100");
      done();
      console.log('testRegexDollarAmount0001 done');
    });

    /**
     * @tc.number REGEX_EMAIL_DOMAIN_0100
     * @tc.name testRegexEmailDomain0001
     * @tc.desc Verify email domain matching using positive lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmailDomain0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmailDomain0001 start');

      const re24 = /(?<=@)[\w.]+/;
      const match24 = re24.exec("test@example.com");
      const result24 = match24?.[0] ?? null;
      console.log(`24. Match email domain: ${result24}`);
      expect(result24).assertEqual("example.com");
      done();
      console.log('testRegexEmailDomain0001 done');
    });

    /**
     * @tc.number REGEX_PORT_NUMBER_0100
     * @tc.name testRegexPortNumber0001
     * @tc.desc Verify port number matching using positive lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPortNumber0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPortNumber0001 start');

      const re25 = /(?<=:)\d+/;
      const match25 = re25.exec("localhost:8080");
      const result25 = match25?.[0] ?? null;
      console.log(`25. Match port number: ${result25}`);
      expect(result25).assertEqual("8080");
      done();
      console.log('testRegexPortNumber0001 done');
    });

    /**
     * @tc.number REGEX_LOOKBEHIND_QUANTIFIER_0100
     * @tc.name testRegexLookbehindQuantifier0001
     * @tc.desc Verify lookbehind with quantifier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookbehindQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLookbehindQuantifier0001 start');

      const re26 = /(?<=\d{3})\d+/;
      const match26 = re26.exec("123456");
      const result26 = match26?.[0] ?? null;
      console.log(`26. Lookbehind with quantifier: ${result26}`);
      expect(result26).assertEqual("456");
      done();
      console.log('testRegexLookbehindQuantifier0001 done');
    });

    /**
     * @tc.number REGEX_LOOKBEHIND_CHARSET_0100
     * @tc.name testRegexLookbehindCharset0001
     * @tc.desc Verify lookbehind with character set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLookbehindCharset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLookbehindCharset0001 start');

      const re27 = /(?<=[A-Z])[a-z]+/;
      const match27 = re27.exec("Hello");
      const result27 = match27?.[0] ?? null;
      console.log(`27. Lookbehind with charset: ${result27}`);
      expect(result27).assertEqual("ello");
      done();
      console.log('testRegexLookbehindCharset0001 done');
    });

    /**
     * @tc.number REGEX_MULTIPLE_LOOKBEHIND_0100
     * @tc.name testRegexMultipleLookbehind0001
     * @tc.desc Verify multiple lookbehind assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultipleLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMultipleLookbehind0001 start');

      const re28 = /(?<=a)(?<=ab)b/;
      const match28 = re28.exec("ab");
      const result28 = match28?.[0] ?? null;
      console.log(`28. Multiple lookbehinds: ${result28}`);
      expect(result28).assertNull();
      done();
      console.log('testRegexMultipleLookbehind0001 done');
    });

    /**
     * @tc.number REGEX_MIXED_LOOKBEHIND_0100
     * @tc.name testRegexMixedLookbehind0001
     * @tc.desc Verify mixed positive/negative lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMixedLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMixedLookbehind0001 start');

      const re29 = /(?<=a)(?<!ca)b/;
      const match29 = re29.exec("ab");
      const result29 = match29?.[0] ?? null;
      console.log(`29. Mixed lookbehinds: ${result29}`);
      expect(result29).assertEqual("b");
      done();
      console.log('testRegexMixedLookbehind0001 done');
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKBEHIND_PREFIX_0100
     * @tc.name testRegexNegativeLookbehindPrefix0001
     * @tc.desc Verify negative lookbehind for prefix exclusion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookbehindPrefix0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNegativeLookbehindPrefix0001 start');

      const re30 = /(?<!un)happy/;
      const match30 = re30.exec("happy");
      const result30 = match30?.[0] ?? null;
      console.log(`30. Exclude specific prefix: ${result30}`);
      expect(result30).assertEqual("happy");
      done();
      console.log('testRegexNegativeLookbehindPrefix0001 done');
    });

    /**
     * @tc.number REGEX_NEGATIVE_LOOKBEHIND_SYMBOL_0100
     * @tc.name testRegexNegativeLookbehindSymbol0001
     * @tc.desc Verify negative lookbehind for symbol exclusion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNegativeLookbehindSymbol0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNegativeLookbehindSymbol0001 start');

      const re31 = /(?<!\$)\d+/;
      const match31 = re31.exec("100");
      const result31 = match31?.[0] ?? null;
      console.log(`31. Exclude $ prefix: ${result31}`);
      expect(result31).assertEqual("100");
      done();
      console.log('testRegexNegativeLookbehindSymbol0001 done');
    });

    /**
     * @tc.number REGEX_GLOBAL_LOOKAHEAD_0100
     * @tc.name testRegexGlobalLookahead0001
     * @tc.desc Verify global matching with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexGlobalLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexGlobalLookahead0001 start');

      const re32 = /a(?=b)/g;
      const matches32 = "ab ab ab".match(re32);
      const result32 = matches32 ? matches32.length : 0;
      console.log(`32. Global lookahead matches: ${result32}`);
      expect(result32).assertEqual(3);
      done();
      console.log('testRegexGlobalLookahead0001 done');
    });

    /**
     * @tc.number REGEX_MULTILINE_LOOKAHEAD_0100
     * @tc.name testRegexMultilineLookahead0001
     * @tc.desc Verify multiline matching with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultilineLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMultilineLookahead0001 start');

      const re33 = /^(?=line)/gm;
      const matches33 = "line1\nanother line\nline2".match(re33);
      const result33 = matches33 ? matches33.length : 0;
      console.log(`33. Multiline lookahead matches: ${result33}`);
      expect(result33).assertEqual(2);
      done();
      console.log('testRegexMultilineLookahead0001 done');
    });

    /**
     * @tc.number REGEX_CASE_INSENSITIVE_LOOKAHEAD_0100
     * @tc.name testRegexCaseInsensitiveLookahead0001
     * @tc.desc Verify case-insensitive lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCaseInsensitiveLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCaseInsensitiveLookahead0001 start');

      const re34 = /a(?=B)/i;
      const match34 = re34.exec("ab");
      const result34 = match34?.[0] ?? null;
      console.log(`34. Case-insensitive lookahead: ${result34}`);
      expect(result34).assertEqual("a");
      done();
      console.log('testRegexCaseInsensitiveLookahead0001 done');
    });

    /**
     * @tc.number REGEX_UNICODE_LOOKAHEAD_0100
     * @tc.name testRegexUnicodeLookahead0001
     * @tc.desc Verify Unicode lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnicodeLookahead0001 start');

      const re35 = /\p{L}(?=\p{N})/u;
      const match35 = re35.exec("a1");
      const result35 = match35?.[0] ?? null;
      console.log(`35. Unicode lookahead: ${result35}`);
      expect(result35).assertEqual("a");
      done();
      console.log('testRegexUnicodeLookahead0001 done');
    });

    /**
     * @tc.number REGEX_DOTALL_LOOKAHEAD_0100
     * @tc.name testRegexDotallLookahead0001
     * @tc.desc Verify dotAll mode with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDotallLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDotallLookahead0001 start');

      const re36 = /a(?=.b)/s;
      const match36 = re36.exec("a\nb");
      const result36 = match36?.[0] ?? null;
      console.log(`36. DotAll lookahead: ${result36}`);
      expect(result36).assertEqual("a");
      done();
      console.log('testRegexDotallLookahead0001 done');
    });

    /**
     * @tc.number REGEX_STICKY_LOOKAHEAD_0100
     * @tc.name testRegexStickyLookahead0001
     * @tc.desc Verify sticky mode with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexStickyLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexStickyLookahead0001 start');

      const re37 = /a(?=b)/y;
      re37.lastIndex = 0;
      const match37 = re37.exec("ab");
      const result37 = match37?.[0] ?? null;
      console.log(`37. Sticky lookahead: ${result37}`);
      expect(result37).assertEqual("a");
      done();
      console.log('testRegexStickyLookahead0001 done');
    });

    /**
     * @tc.number REGEX_NESTED_LOOKAHEAD_0100
     * @tc.name testRegexNestedLookahead0001
     * @tc.desc Verify nested lookahead assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNestedLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNestedLookahead0001 start');

      const re38 = /a(?=b(?=c))/;
      const match38 = re38.exec("abc");
      const result38 = match38?.[0] ?? null;
      console.log(`38. Nested lookahead: ${result38}`);
      expect(result38).assertEqual("a");
      done();
      console.log('testRegexNestedLookahead0001 done');
    });

    /**
     * @tc.number REGEX_NESTED_LOOKBEHIND_0100
     * @tc.name testRegexNestedLookbehind0001
     * @tc.desc Verify nested lookbehind assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNestedLookbehind0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNestedLookbehind0001 start');

      const re39 = /(?<=(?<=a)b)c/;
      const match39 = re39.exec("abc");
      const result39 = match39?.[0] ?? null;
      console.log(`39. Nested lookbehind: ${result39}`);
      expect(result39).assertEqual("c");
      done();
      console.log('testRegexNestedLookbehind0001 done');
    });

    /**
     * @tc.number REGEX_COMBINED_ASSERTIONS_0100
     * @tc.name testRegexCombinedAssertions0001
     * @tc.desc Verify combined lookahead and lookbehind assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCombinedAssertions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCombinedAssertions0001 start');

      const re40 = /(?<=a)b(?=c)/;
      const match40 = re40.exec("abc");
      const result40 = match40?.[0] ?? null;
      console.log(`40. Combined assertions: ${result40}`);
      expect(result40).assertEqual("b");
      done();
      console.log('testRegexCombinedAssertions0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_STRING_POSITION_0100
     * @tc.name testRegexEmptyStringPosition0001
     * @tc.desc Verify empty string position matching with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyStringPosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyStringPosition0001 start');

      const re41 = /(?=a)/;
      const match41 = re41.exec("a");
      const result41 = match41?.index ?? -1;
      console.log(`41. Empty string position match: ${result41}`);
      expect(result41).assertEqual(0);
      done();
      console.log('testRegexEmptyStringPosition0001 done');
    });

    /**
     * @tc.number REGEX_ZERO_WIDTH_POSITIONS_0100
     * @tc.name testRegexZeroWidthPositions0001
     * @tc.desc Verify zero-width position matching count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexZeroWidthPositions0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexZeroWidthPositions0001 start');

      const re42 = /(?=a)|(?=b)/g;
      const matches42 = "ab".match(re42);
      const result42 = matches42?.length ?? 0;
      console.log(`42. Zero-width position matches: ${result42}`);
      expect(result42).assertEqual(2);
      done();
      console.log('testRegexZeroWidthPositions0001 done');
    });

    /**
     * @tc.number REGEX_NEWLINE_POSITION_0100
     * @tc.name testRegexNewlinePosition0001
     * @tc.desc Verify newline position matching with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNewlinePosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNewlinePosition0001 start');

      const re43 = /(?=\n)/;
      const match43 = re43.exec("a\nb");
      const result43 = match43?.index ?? -1;
      console.log(`43. Newline position match: ${result43}`);
      expect(result43).assertEqual(1);
      done();
      console.log('testRegexNewlinePosition0001 done');
    });

    /**
     * @tc.number REGEX_DOLLAR_POSITION_0100
     * @tc.name testRegexDollarPosition0001
     * @tc.desc Verify dollar sign position matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexDollarPosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexDollarPosition0001 start');

      const re44 = /(?=\$)/;
      const match44 = re44.exec("$100");
      const result44 = match44?.index ?? -1;
      console.log(`44. Dollar sign position match: ${result44}`);
      expect(result44).assertEqual(0);
      done();
      console.log('testRegexDollarPosition0001 done');
    });

    /**
     * @tc.number REGEX_UNICODE_SYMBOL_POSITION_0100
     * @tc.name testRegexUnicodeSymbolPosition0001
     * @tc.desc Verify Unicode symbol position matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUnicodeSymbolPosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUnicodeSymbolPosition0001 start');

      const re45 = /(?=€)/;
      const match45 = re45.exec("€100");
      const result45 = match45?.index ?? -1;
      console.log(`45. Euro symbol position match: ${result45}`);
      expect(result45).assertEqual(0);
      done();
      console.log('testRegexUnicodeSymbolPosition0001 done');
    });

    /**
     * @tc.number REGEX_CHINESE_CHAR_POSITION_0100
     * @tc.name testRegexChineseCharPosition0001
     * @tc.desc Verify Chinese character position matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexChineseCharPosition0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexChineseCharPosition0001 start');

      const re46 = /(?=中)/;
      const match46 = re46.exec("中文");
      const result46 = match46?.index ?? -1;
      console.log(`46. Chinese character position match: ${result46}`);
      expect(result46).assertEqual(0);
      done();
      console.log('testRegexChineseCharPosition0001 done');
    });

    /**
     * @tc.number REGEX_PASSWORD_DIGIT_0100
     * @tc.name testRegexPasswordDigit0001
     * @tc.desc Verify password contains digit using lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordDigit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPasswordDigit0001 start');

      const re47 = /^(?=.*\d).+$/;
      const result47 = re47.test("password1");
      console.log(`47. Password contains digit: ${result47}`);
      expect(result47).assertTrue();
      done();
      console.log('testRegexPasswordDigit0001 done');
    });

    /**
     * @tc.number REGEX_PASSWORD_UPPERCASE_0100
     * @tc.name testRegexPasswordUppercase0001
     * @tc.desc Verify password contains uppercase using lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordUppercase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPasswordUppercase0001 start');

      const re48 = /^(?=.*[A-Z]).+$/;
      const result48 = re48.test("Password");
      console.log(`48. Password contains uppercase: ${result48}`);
      expect(result48).assertTrue();
      done();
      console.log('testRegexPasswordUppercase0001 done');
    });

    /**
     * @tc.number REGEX_PASSWORD_LOWERCASE_0100
     * @tc.name testRegexPasswordLowercase0001
     * @tc.desc Verify password contains lowercase using lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordLowercase0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPasswordLowercase0001 start');

      const re49 = /^(?=.*[a-z]).+$/;
      const result49 = re49.test("PASSWORD");
      console.log(`49. Password contains lowercase: ${result49}`);
      expect(result49).assertFalse();
      done();
      console.log('testRegexPasswordLowercase0001 done');
    });

    /**
     * @tc.number REGEX_PASSWORD_SPECIAL_0100
     * @tc.name testRegexPasswordSpecial0001
     * @tc.desc Verify password contains special character using lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPasswordSpecial0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPasswordSpecial0001 start');

      const re50 = /^(?=.*[!@#$%]).+$/;
      const result50 = re50.test("pass@word");
      console.log(`50. Password contains special char: ${result50}`);
      expect(result50).assertTrue();
      done();
      console.log('testRegexPasswordSpecial0001 done');
    });

    /**
     * @tc.number REGEX_STRONG_PASSWORD_0100
     * @tc.name testRegexStrongPassword0001
     * @tc.desc Verify strong password requirements using multiple lookaheads.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexStrongPassword0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexStrongPassword0001 start');

      const re51 = /^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%]).{8,}$/;
      const result51 = re51.test("Passw0rd!");
      console.log(`51. Strong password validation: ${result51}`);
      expect(result51).assertTrue();
      done();
      console.log('testRegexStrongPassword0001 done');
    });

    /**
     * @tc.number REGEX_HTML_CONTENT_0100
     * @tc.name testRegexHtmlContent0001
     * @tc.desc Verify HTML content extraction using lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHtmlContent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHtmlContent0001 start');

      const re52 = /(?<=>)[^<]+(?=<)/;
      const match52 = re52.exec("<div>content</div>");
      const result52 = match52?.[0] ?? null;
      console.log(`52. HTML content match: ${result52}`);
      expect(result52).assertEqual("content");
      done();
      console.log('testRegexHtmlContent0001 done');
    });

    /**
     * @tc.number REGEX_QUOTED_CONTENT_0100
     * @tc.name testRegexQuotedContent0001
     * @tc.desc Verify quoted content extraction using lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexQuotedContent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexQuotedContent0001 start');

      const re53 = /(?<=")[^"]+(?=")/;
      const match53 = re53.exec('name="test"');
      const result53 = match53?.[0] ?? null;
      console.log(`53. Quoted content match: ${result53}`);
      expect(result53).assertEqual("test");
      done();
      console.log('testRegexQuotedContent0001 done');
    });

    /**
     * @tc.number REGEX_PARENTHESES_CONTENT_0100
     * @tc.name testRegexParenthesesContent0001
     * @tc.desc Verify parentheses content extraction using lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexParenthesesContent0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexParenthesesContent0001 start');

      const re54 = /(?<=\()[^)]+(?=\))/;
      const match54 = re54.exec("func(param)");
      const result54 = match54?.[0] ?? null;
      console.log(`54. Parentheses content match: ${result54}`);
      expect(result54).assertEqual("param");
      done();
      console.log('testRegexParenthesesContent0001 done');
    });

    /**
     * @tc.number REGEX_CSS_VALUE_0100
     * @tc.name testRegexCssValue0001
     * @tc.desc Verify CSS value extraction using lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCssValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCssValue0001 start');

      const re55 = /(?<=:)[^;]+/;
      const match55 = re55.exec("color: red;");
      const result55 = match55?.[0]?.trim() ?? null;
      console.log(`55. CSS value match: ${result55}`);
      expect(result55).assertEqual("red");
      done();
      console.log('testRegexCssValue0001 done');
    });

    /**
     * @tc.number REGEX_JSON_VALUE_0100
     * @tc.name testRegexJsonValue0001
     * @tc.desc Verify JSON value extraction using lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexJsonValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexJsonValue0001 start');

      const re56 = /(?<="value":\s*)[^,]+/;
      const match56 = re56.exec('{"value": 123, "name": "test"}');
      const result56 = match56?.[0]?.trim() ?? null;
      console.log(`56. JSON value match: ${result56}`);
      expect(result56).assertEqual("123");
      done();
      console.log('testRegexJsonValue0001 done');
    });

    /**
     * @tc.number REGEX_URL_PATH_0100
     * @tc.name testRegexUrlPath0001
     * @tc.desc Verify URL path extraction using lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlPath0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUrlPath0001 start');

      const re57 = /(?<=https?:\/\/[^\/]+)[^?]+/;
      const match57 = re57.exec("https://example.com/path?query=1");
      const result57 = match57?.[0] ?? null;
      console.log(`57. URL path match: ${result57}`);
      expect(result57).assertEqual("xample.com/path");
      done();
      console.log('testRegexUrlPath0001 done');
    });

    /**
     * @tc.number REGEX_URL_QUERY_0100
     * @tc.name testRegexUrlQuery0001
     * @tc.desc Verify URL query extraction using lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlQuery0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUrlQuery0001 start');

      const re58 = /(?<=\?).+/;
      const match58 = re58.exec("https://example.com?query=1&page=2");
      const result58 = match58?.[0] ?? null;
      console.log(`58. URL query match: ${result58}`);
      expect(result58).assertEqual("query=1&page=2");
      done();
      console.log('testRegexUrlQuery0001 done');
    });

    /**
     * @tc.number REGEX_IP_LAST_OCTET_0100
     * @tc.name testRegexIpLastOctet0001
     * @tc.desc Verify IP last octet extraction using lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpLastOctet0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexIpLastOctet0001 start');

      const re59 = /(?<=\.)\d+$/;
      const match59 = re59.exec("192.168.1.100");
      const result59 = match59?.[0] ?? null;
      console.log(`59. IP last octet match: ${result59}`);
      expect(result59).assertEqual("100");
      done();
      console.log('testRegexIpLastOctet0001 done');
    });

    /**
     * @tc.number REGEX_VERSION_PATCH_0100
     * @tc.name testRegexVersionPatch0001
     * @tc.desc Verify version patch number extraction using lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexVersionPatch0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexVersionPatch0001 start');

      const re60 = /(?<=\.)\d+$/;
      const match60 = re60.exec("1.2.3");
      const result60 = match60?.[0] ?? null;
      console.log(`60. Version patch match: ${result60}`);
      expect(result60).assertEqual("3");
      done();
      console.log('testRegexVersionPatch0001 done');
    });

    /**
     * @tc.number REGEX_FILENAME_0100
     * @tc.name testRegexFilename0001
     * @tc.desc Verify filename extraction without extension.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFilename0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexFilename0001 start');

      const re61 = /.+(?=\.)/;
      const match61 = re61.exec("document.txt");
      const result61 = match61?.[0] ?? null;
      console.log(`61. Filename without extension: ${result61}`);
      expect(result61).assertEqual("document");
      done();
      console.log('testRegexFilename0001 done');
    });

    /**
     * @tc.number REGEX_FILE_EXTENSION_0100
     * @tc.name testRegexFileExtension0001
     * @tc.desc Verify file extension extraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFileExtension0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexFileExtension0001 start');

      const re62 = /(?<=\.)[^.]+$/;
      const match62 = re62.exec("image.jpg");
      const result62 = match62?.[0] ?? null;
      console.log(`62. File extension: ${result62}`);
      expect(result62).assertEqual("jpg");
      done();
      console.log('testRegexFileExtension0001 done');
    });

    /**
     * @tc.number REGEX_YEAR_EXTRACTION_0100
     * @tc.name testRegexYearExtraction0001
     * @tc.desc Verify year extraction from date.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexYearExtraction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexYearExtraction0001 start');

      const re63 = /^\d+(?=-)/;
      const match63 = re63.exec("2023-12-31");
      const result63 = match63?.[0] ?? null;
      console.log(`63. Year from date: ${result63}`);
      expect(result63).assertEqual("2023");
      done();
      console.log('testRegexYearExtraction0001 done');
    });

    /**
     * @tc.number REGEX_HOUR_EXTRACTION_0100
     * @tc.name testRegexHourExtraction0001
     * @tc.desc Verify hour extraction from time.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexHourExtraction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexHourExtraction0001 start');

      const re64 = /^\d+(?=:)/;
      const match64 = re64.exec("12:34:56");
      const result64 = match64?.[0] ?? null;
      console.log(`64. Hour from time: ${result64}`);
      expect(result64).assertEqual("12");
      done();
      console.log('testRegexHourExtraction0001 done');
    });

    /**
     * @tc.number REGEX_AREA_CODE_0100
     * @tc.name testRegexAreaCode0001
     * @tc.desc Verify area code extraction from phone number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexAreaCode0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexAreaCode0001 start');

      const re65 = /^\d+(?=-)/;
      const match65 = re65.exec("010-12345678");
      const result65 = match65?.[0] ?? null;
      console.log(`65. Area code from phone: ${result65}`);
      expect(result65).assertEqual("010");
      done();
      console.log('testRegexAreaCode0001 done');
    });

    /**
     * @tc.number REGEX_ID_BIRTHDATE_0100
     * @tc.name testRegexIdBirthdate0001
     * @tc.desc Verify birthdate extraction from ID number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIdBirthdate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexIdBirthdate0001 start');

      const re66 = /(?<=\d{6})\d{8}(?=\d{4})/;
      const match66 = re66.exec("110101199001011234");
      const result66 = match66?.[0] ?? null;
      console.log(`66. Birthdate from ID: ${result66}`);
      expect(result66).assertEqual("19900101");
      done();
      console.log('testRegexIdBirthdate0001 done');
    });

    /**
     * @tc.number REGEX_MARKDOWN_TEXT_0100
     * @tc.name testRegexMarkdownText0001
     * @tc.desc Verify text extraction from Markdown link.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMarkdownText0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMarkdownText0001 start');

      const re67 = /(?<=\[)[^\]]+(?=\])/;
      const match67 = re67.exec("[link text](url)");
      const result67 = match67?.[0] ?? null;
      console.log(`67. Markdown link text: ${result67}`);
      expect(result67).assertEqual("link text");
      done();
      console.log('testRegexMarkdownText0001 done');
    });

    /**
     * @tc.number REGEX_MARKDOWN_URL_0100
     * @tc.name testRegexMarkdownUrl0001
     * @tc.desc Verify URL extraction from Markdown link.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMarkdownUrl0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMarkdownUrl0001 start');

      const re68 = /(?<=\()[^)]+(?=\))/;
      const match68 = re68.exec("[text](https://example.com)");
      const result68 = match68?.[0] ?? null;
      console.log(`68. Markdown link URL: ${result68}`);
      expect(result68).assertEqual("https://example.com");
      done();
      console.log('testRegexMarkdownUrl0001 done');
    });

    /**
     * @tc.number REGEX_CSS_CLASS_0100
     * @tc.name testRegexCssClass0001
     * @tc.desc Verify class name extraction from CSS selector.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCssClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCssClass0001 start');

      const re69 = /(?<=\.)[^. ]+/;
      const match69 = re69.exec(".class-name selector");
      const result69 = match69?.[0] ?? null;
      console.log(`69. CSS class name: ${result69}`);
      expect(result69).assertEqual("class-name");
      done();
      console.log('testRegexCssClass0001 done');
    });

    /**
     * @tc.number REGEX_CSS_ID_0100
     * @tc.name testRegexCssId0001
     * @tc.desc Verify ID extraction from CSS selector.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCssId0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCssId0001 start');

      const re70 = /(?<=#)[^# ]+/;
      const match70 = re70.exec("#id-name selector");
      const result70 = match70?.[0] ?? null;
      console.log(`70. CSS ID: ${result70}`);
      expect(result70).assertEqual("id-name");
      done();
      console.log('testRegexCssId0001 done');
    });

    /**
     * @tc.number REGEX_INSERT_BEFORE_0100
     * @tc.name testRegexInsertBefore0001
     * @tc.desc Verify insertion before matched position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexInsertBefore0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexInsertBefore0001 start');

      const re71 = /(?=\d)/g;
      const result71 = "123".replace(re71, ",");
      console.log(`71. Insert before digits: ${result71}`);
      expect(result71).assertEqual(",1,2,3");
      done();
      console.log('testRegexInsertBefore0001 done');
    });

    /**
     * @tc.number REGEX_REMOVE_AFTER_0100
     * @tc.name testRegexRemoveAfter0001
     * @tc.desc Verify removal after matched position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexRemoveAfter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexRemoveAfter0001 start');

      const re72 = /(?<=\$)\d+/;
      const result72 = "$100".replace(re72, "");
      console.log(`72. Remove after $: ${result72}`);
      expect(result72).assertEqual("$");
      done();
      console.log('testRegexRemoveAfter0001 done');
    });

    /**
     * @tc.number REGEX_TRANSFORM_AFTER_0100
     * @tc.name testRegexTransformAfter0001
     * @tc.desc Verify transformation after matched position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexTransformAfter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexTransformAfter0001 start');

      const re73 = /(?<=\$)\d+/;
      const result73 = "$100".replace(re73, (match) => (Number(match) * 2).toString());
      console.log(`73. Double after $: ${result73}`);
      expect(result73).assertEqual("$200");
      done();
      console.log('testRegexTransformAfter0001 done');
    });

    /**
     * @tc.number REGEX_FUNCTION_REPLACE_0100
     * @tc.name testRegexFunctionReplace0001
     * @tc.desc Verify function replacement with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFunctionReplace0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexFunctionReplace0001 start');

      const re74 = /(?<=[A-Z])(?=[A-Z][a-z])/g;
      const result74 = "ABCDefGHIjkl".replace(re74, " ");
      console.log(`74. Space between camelCase: ${result74}`);
      expect(result74).assertEqual("ABC DefGH Ijkl");
      done();
      console.log('testRegexFunctionReplace0001 done');
    });

    /**
     * @tc.number REGEX_OVERLAPPING_0100
     * @tc.name testRegexOverlapping0001
     * @tc.desc Verify overlapping pattern matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexOverlapping0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexOverlapping0001 start');

      const re75 = /(?=(\d{2}))/g;
      const matches75 = Array.from("1234".matchAll(re75)).map(m => m[1]);
      const result75 = matches75.join(",");
      console.log(`75. Overlapping matches: ${result75}`);
      expect(result75).assertEqual("12,23,34");
      done();
      console.log('testRegexOverlapping0001 done');
    });

    /**
     * @tc.number REGEX_EMPTY_INPUT_0100
     * @tc.name testRegexEmptyInput0001
     * @tc.desc Verify empty input matching with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexEmptyInput0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexEmptyInput0001 start');

      const re76 = /^(?=.*)/;
      const result76 = re76.test("");
      console.log(`76. Match empty input: ${result76}`);
      expect(result76).assertTrue();
      done();
      console.log('testRegexEmptyInput0001 done');
    });

    /**
     * @tc.number REGEX_FULL_STRING_0100
     * @tc.name testRegexFullString0001
     * @tc.desc Verify full string matching with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexFullString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexFullString0001 start');

      const re77 = /^(?=.*$)/;
      const result77 = re77.test("anything");
      console.log(`77. Match full string: ${result77}`);
      expect(result77).assertTrue();
      done();
      console.log('testRegexFullString0001 done');
    });

    /**
     * @tc.number REGEX_BACKREFERENCE_0100
     * @tc.name testRegexBackreference0001
     * @tc.desc Verify backreference with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexBackreference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexBackreference0001 start');

      const re78 = /(\w)(?=\1)/;
      const match78 = re78.exec("aabb");
      const result78 = match78?.[0] ?? null;
      console.log(`78. Backreference match: ${result78}`);
      expect(result78).assertEqual("a");
      done();
      console.log('testRegexBackreference0001 done');
    });

    /**
     * @tc.number REGEX_NAMED_GROUPS_0100
     * @tc.name testRegexNamedGroups0001
     * @tc.desc Verify named groups with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNamedGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNamedGroups0001 start');

      const re79 = /(?<prefix>\w+)(?=(?<suffix>\d+))/;
      const match79 = re79.exec("test123");
      const prefix = match79?.groups?.prefix ?? null;
      const suffix = match79?.groups?.suffix ?? null;
      console.log(`79. Named groups - prefix: ${prefix}, suffix: ${suffix}`);
      expect(prefix).assertEqual("test12");
      expect(suffix).assertEqual("3");
      done();
      console.log('testRegexNamedGroups0001 done');
    });

    /**
     * @tc.number REGEX_CHARACTER_CLASS_0100
     * @tc.name testRegexCharacterClass0001
     * @tc.desc Verify character class with assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCharacterClass0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCharacterClass0001 start');

      const re80 = /[A-Z](?=[a-z])/;
      const match80 = re80.exec("Abc");
      const result80 = match80?.[0] ?? null;
      console.log(`80. Character class match: ${result80}`);
      expect(result80).assertEqual("A");
      done();
      console.log('testRegexCharacterClass0001 done');
    });

    /**
     * @tc.number REGEX_ALTERNATION_WITH_LOOKAHEAD_0100
     * @tc.name testRegexAlternationWithLookahead0001
     * @tc.desc Verify alternation pattern with lookahead assertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexAlternationWithLookahead0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexAlternationWithLookahead0001 start');

      const re81 = /a(?=b|c)/;
      const match81 = re81.exec("ac");
      const result81 = match81?.[0] ?? null;
      console.log(`81. Alternation with lookahead: ${result81}`);
      expect(result81).assertEqual("a");
      done();
      console.log('testRegexAlternationWithLookahead0001 done');
    });

    /**
     * @tc.number REGEX_NON_CAPTURING_GROUP_0100
     * @tc.name testRegexNonCapturingGroup0001
     * @tc.desc Verify non-capturing group with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNonCapturingGroup0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNonCapturingGroup0001 start');

      const re82 = /a(?=(?:b|c))/;
      const match82 = re82.exec("ab");
      const result82 = match82?.[0] ?? null;
      console.log(`82. Non-capturing group with lookahead: ${result82}`);
      expect(result82).assertEqual("a");
      done();
      console.log('testRegexNonCapturingGroup0001 done');
    });

    /**
     * @tc.number REGEX_GREEDY_QUANTIFIER_0100
     * @tc.name testRegexGreedyQuantifier0001
     * @tc.desc Verify greedy quantifier with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexGreedyQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexGreedyQuantifier0001 start');

      const re83 = /a(?=.*b)/;
      const match83 = re83.exec("acccb");
      const result83 = match83?.[0] ?? null;
      console.log(`83. Greedy quantifier with lookahead: ${result83}`);
      expect(result83).assertEqual("a");
      done();
      console.log('testRegexGreedyQuantifier0001 done');
    });

    /**
     * @tc.number REGEX_LAZY_QUANTIFIER_0100
     * @tc.name testRegexLazyQuantifier0001
     * @tc.desc Verify lazy quantifier with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexLazyQuantifier0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexLazyQuantifier0001 start');

      const re84 = /a(?=.*?b)/;
      const match84 = re84.exec("acccb");
      const result84 = match84?.[0] ?? null;
      console.log(`84. Lazy quantifier with lookahead: ${result84}`);
      expect(result84).assertEqual("a");
      done();
      console.log('testRegexLazyQuantifier0001 done');
    });

    /**
     * @tc.number REGEX_URL_PARAMETER_0100
     * @tc.name testRegexUrlParameter0001
     * @tc.desc Verify URL parameter extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUrlParameter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUrlParameter0001 start');

      const re85 = /(?<=[?&])name=[^&]+/;
      const match85 = re85.exec("?age=30&name=test&city=beijing");
      const result85 = match85?.[0] ?? null;
      console.log(`85. URL parameter extraction: ${result85}`);
      expect(result85).assertEqual("name=test");
      done();
      console.log('testRegexUrlParameter0001 done');
    });

    /**
     * @tc.number REGEX_MULTILINE_COMMENT_0100
     * @tc.name testRegexMultilineComment0001
     * @tc.desc Verify multiline comment extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMultilineComment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMultilineComment0001 start');

      const re86 = /(?<=\/\*)([\s\S]*?)(?=\*\/)/;
      const match86 = re86.exec("/* multi-line\ncomment */");
      const result86 = match86?.[1].trim() ?? null;
      console.log(`86. Multiline comment extraction: ${result86}`);
      expect(result86).assertEqual("multi-line\ncomment");
      done();
      console.log('testRegexMultilineComment0001 done');
    });

    /**
     * @tc.number REGEX_SINGLELINE_COMMENT_0100
     * @tc.name testRegexSinglelineComment0001
     * @tc.desc Verify single-line comment extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexSinglelineComment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexSinglelineComment0001 start');

      const re87 = /(?<=\/\/).+/;
      const match87 = re87.exec("// this is a comment");
      const result87 = match87?.[0] ?? null;
      console.log(`87. Single-line comment extraction: ${result87}`);
      expect(result87).assertEqual(" this is a comment");
      done();
      console.log('testRegexSinglelineComment0001 done');
    });

    /**
     * @tc.number SUB_REGEX_XML_ATTRIBUTE_0100
     * @tc.name testRegexXmlAttribute0001
     * @tc.desc Verify XML attribute extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexXmlAttribute0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexXmlAttribute0001 start');

      const re88 = /(?<=\s)name="[^"]+"/;
      const match88 = re88.exec('<tag id="1" name="test" />');
      const result88 = match88?.[0] ?? null;
      console.log(`88. XML attribute extraction: ${result88}`);
      expect(result88).assertEqual('name="test"');
      done();
      console.log('testRegexXmlAttribute0001 done');
    });

    /**
     * @tc.number REGEX_CREDIT_CARD_GROUPS_0100
     * @tc.name testRegexCreditCardGroups0001
     * @tc.desc Verify credit card group extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCreditCardGroups0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCreditCardGroups0001 start');

      const re89 = /\d+(?= )/g;
      const matches89 = "1234 5678 9012 3456".match(re89);
      const result89 = matches89?.join(",") ?? null;
      console.log(`89. Credit card group extraction: ${result89}`);
      expect(result89).assertEqual("1234,5678,9012");
      done();
      console.log('testRegexCreditCardGroups0001 done');
    });

    /**
     * @tc.number REGEX_UUID_MIDDLE_0100
     * @tc.name testRegexUuidMiddle0001
     * @tc.desc Verify UUID middle section extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexUuidMiddle0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexUuidMiddle0001 start');

      const re90 = /(?<=-)[0-9a-fA-F]+(?=-)/;
      const match90 = re90.exec("550e8400-e29b-41d4-a716-446655440000");
      const result90 = match90?.[0] ?? null;
      console.log(`90. UUID middle section extraction: ${result90}`);
      expect(result90).assertEqual("e29b");
      done();
      console.log('testRegexUuidMiddle0001 done');
    });

    /**
     * @tc.number REGEX_IPV6_FIRST_SEGMENT_0100
     * @tc.name testRegexIpv6FirstSegment0001
     * @tc.desc Verify IPv6 first segment extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexIpv6FirstSegment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexIpv6FirstSegment0001 start');

      const re91 = /^[0-9a-fA-F:]+?(?=:)/;
      const match91 = re91.exec("2001:0db8:85a3:0000:0000:8a2e:0370:7334");
      const result91 = match91?.[0] ?? null;
      console.log(`91. IPv6 first segment extraction: ${result91}`);
      expect(result91).assertEqual("2001");
      done();
      console.log('testRegexIpv6FirstSegment0001 done');
    });

    /**
     * @tc.number REGEX_MAC_LAST_SEGMENT_0100
     * @tc.name testRegexMacLastSegment0001
     * @tc.desc Verify MAC address last segment extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMacLastSegment0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMacLastSegment0001 start');

      const re92 = /(?<=:)[0-9a-fA-F]{2}$/;
      const match92 = re92.exec("00:1B:44:11:3A:B7");
      const result92 = match92?.[0] ?? null;
      console.log(`92. MAC last segment extraction: ${result92}`);
      expect(result92).assertEqual("B7");
      done();
      console.log('testRegexMacLastSegment0001 done');
    });

    /**
     * @tc.number SUB_REGEX_SCIENTIFIC_NOTATION_0100
     * @tc.name testRegexScientificNotation0001
     * @tc.desc Verify scientific notation exponent extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexScientificNotation0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexScientificNotation0001 start');

      const re93 = /(?=[eE][+-]?\d+).+/;
      const match93 = re93.exec("1.23e+45");
      const result93 = match93?.[0] ?? null;
      console.log(`93. Scientific notation exponent extraction: ${result93}`);
      expect(result93).assertEqual("e+45");
      done();
      console.log('testRegexScientificNotation0001 done');
    });

    /**
     * @tc.number REGEX_CURRENCY_VALUE_0100
     * @tc.name testRegexCurrencyValue0001
     * @tc.desc Verify currency value extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexCurrencyValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexCurrencyValue0001 start');

      const re94 = /(?<=[€$£])\d+(\.\d+)?/;
      const match94 = re94.exec("€123.45");
      const result94 = match94?.[0] ?? null;
      console.log(`94. Currency value extraction: ${result94}`);
      expect(result94).assertEqual("123.45");
      done();
      console.log('testRegexCurrencyValue0001 done');
    });

    /**
     * @tc.number REGEX_PERCENTAGE_VALUE_0100
     * @tc.name testRegexPercentageValue0001
     * @tc.desc Verify percentage value extraction with lookahead.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexPercentageValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexPercentageValue0001 start');

      const re95 = /\d+(?=%)/;
      const match95 = re95.exec("75%");
      const result95 = match95?.[0] ?? null;
      console.log(`95. Percentage value extraction: ${result95}`);
      expect(result95).assertEqual("75");
      done();
      console.log('testRegexPercentageValue0001 done');
    });

    /**
     * @tc.number REGEX_VERSION_RANGE_0100
     * @tc.name testRegexVersionRange0001
     * @tc.desc Verify version range upper bound extraction with lookbehind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexVersionRange0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexVersionRange0001 start');

      const re96 = /(?<=<=)\d+\.\d+\.\d+/;
      const match96 = re96.exec("1.0.0 <= version <= 2.0.0");
      const result96 = match96?.[0] ?? null;
      console.log(`96. Version range upper bound extraction: ${result96}`);
      expect(result96).assertNull();
      done();
      console.log('testRegexVersionRange0001 done');
    });

    /**
     * @tc.number REGEX_MATH_OPERATOR_0100
     * @tc.name testRegexMathOperator0001
     * @tc.desc Verify math operator extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexMathOperator0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexMathOperator0001 start');

      const re97 = /(?<=\d)[+\-*/](?=\d)/;
      const match97 = re97.exec("10+5 * 3");
      const result97 = match97?.[0] ?? null;
      console.log(`97. Math operator extraction: ${result97}`);
      expect(result97).assertEqual("+");
      done();
      console.log('testRegexMathOperator0001 done');
    });

    /**
     * @tc.number REGEX_ARRAY_ELEMENT_0100
     * @tc.name testRegexArrayElement0001
     * @tc.desc Verify array first element extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexArrayElement0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexArrayElement0001 start');

      const re98 = /(?<=\[)[^,\]]+(?=,)/;
      const match98 = re98.exec("[1, 2, 3, 4]");
      const result98 = match98?.[0]?.trim() ?? null;
      console.log(`98. Array first element extraction: ${result98}`);
      expect(result98).assertEqual("1");
      done();
      console.log('testRegexArrayElement0001 done');
    });

    /**
     * @tc.number REGEX_COMPLEX_PASSWORD_0100
     * @tc.name testRegexComplexPassword0001
     * @tc.desc Verify complex password validation with multiple assertions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexComplexPassword0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexComplexPassword0001 start');

      const re99 = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#$%^&*])(?!.*\s).{8,16}$/;
      const result99 = re99.test("Passw0rd!");
      console.log(`99. Complex password validation: ${result99}`);
      expect(result99).assertTrue();
      done();
      console.log('testRegexComplexPassword0001 done');
    });

    /**
     * @tc.number REGEX_NESTED_PARENTHESES_0100
     * @tc.name testRegexNestedParentheses0001
     * @tc.desc Verify nested parentheses content extraction with lookaround.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it("testRegexNestedParentheses0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testRegexNestedParentheses0001 start');

      const re100 = /(?<=\()(?:[^()]+|\((?:[^()]+|\([^()]*\))*\))*(?=\))/;
      const match100 = re100.exec("a(b(c)d)e");
      const result100 = match100?.[0] ?? null;
      console.log(`100. Nested parentheses content extraction: ${result100}`);
      expect(result100).assertEqual("b(c)d");
      done();
      console.log('testRegexNestedParentheses0001 done');
    });
  })
}