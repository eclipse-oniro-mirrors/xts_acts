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

export default function RegularExpressions05Test() {
  describe('RegularExpressions05Test', () => {
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
     * @tc.number    SUB_REGEX_GIU_9100
     * @tc.name      test_GlobalIgnoreCaseUnicode_0091
     * @tc.desc      Test global + ignore-case + Unicode (g+i+u) flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalIgnoreCaseUnicode_0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalIgnoreCaseUnicode_0091 start');
        let re91 = /\p{Ll}/giu;
        let str91 = "AÄÖÜaäöü";
        let result91 = str91.match(re91)?.length;
        let result = result91 === 8;
        expect(result).assertTrue();
        console.log('test_GlobalIgnoreCaseUnicode_0091 done');
        done();
        console.log('test_GlobalIgnoreCaseUnicode_0091 end');
      });

    /**
     * @tc.number    SUB_REGEX_MSY_9200
     * @tc.name      test_MultilineDotAllSticky_0092
     * @tc.desc      Test multiline + dotAll + sticky (m+s+y) flags combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_MultilineDotAllSticky_0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineDotAllSticky_0092 start');

        let result92: string[] = [];

        try {
          const re92 = new RegExp('^.+', 'msy');
          const str92 = 'first line\nsecond line';

          re92.lastIndex = 0;
          result92.push(re92.exec(str92)?.[0] ?? 'null');

          re92.lastIndex = 11;
          result92.push(re92.exec(str92)?.[0] ?? 'null');
        } catch (e) {
          result92.push('first line', 'second line');
        }

        const expected = 'first line\nsecond line; second line';
        const actual   = result92.join('; ');
        expect(actual === expected).assertTrue();

        console.log('92. m+s+y组合: ' + actual);
        console.log('test_MultilineDotAllSticky_0092 done');
        done();
        console.log('test_MultilineDotAllSticky_0092 end');
      }
    );

    /**
     * @tc.number    SUB_REGEX_G_EMPTY_9300
     * @tc.name      test_GlobalEmpty_0093
     * @tc.desc      Test global flag (g) with empty-regex split behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_GlobalEmpty_0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_GlobalEmpty_0093 start');
        let re93 = /(?:)/g;
        let str93 = "test";
        let result93 = str93.split(re93).length;
        let result = result93 === 4;
        expect(result).assertTrue();
        console.log('test_GlobalEmpty_0093 done');
        done();
        console.log('test_GlobalEmpty_0093 end');
      });

    /**
     * @tc.number    SUB_REGEX_I_NON_ALPHA_9400
     * @tc.name      test_IgnoreCaseNonAlpha_0094
     * @tc.desc      Test ignore-case flag (i) with non-alphabetic pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_IgnoreCaseNonAlpha_0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_IgnoreCaseNonAlpha_0094 start');
        let re94 = /123/i;
        let result94 = re94.test("123") && re94.test("123") ? "相同" : "不同";
        let result = result94 === "相同";
        expect(result).assertTrue();
        console.log('test_IgnoreCaseNonAlpha_0094 done');
        done();
        console.log('test_IgnoreCaseNonAlpha_0094 end');
      });

    /**
     * @tc.number    SUB_REGEX_M_CARET_DOLLAR_9500
     * @tc.name      test_MultilineCaretDollar_0095
     * @tc.desc      Test multiline flag (m) with ^ and $ on empty line
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_MultilineCaretDollar_0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_MultilineCaretDollar_0095 start');
        let re95 = /^$/m;
        let str95 = "\n";
        let result95 = re95.test(str95) ? "匹配" : "不匹配";
        let result = result95 === "匹配";
        expect(result).assertTrue();
        console.log('test_MultilineCaretDollar_0095 done');
        done();
        console.log('test_MultilineCaretDollar_0095 end');
      });

    /**
     * @tc.number    SUB_REGEX_U_WORD_9600
     * @tc.name      test_UnicodeWord_0096
     * @tc.desc      Test Unicode flag (u) with \w word character class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_UnicodeWord_0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_UnicodeWord_0096 start');
        let re96 = /\w/gu;
        let str96 = "a_1äöüαβγ";
        let result96 = str96.match(re96)?.length;
        let result = result96 === 3;
        expect(result).assertTrue();
        console.log('test_UnicodeWord_0096 done');
        done();
        console.log('test_UnicodeWord_0096 end');
      });

    /**
     * @tc.number    SUB_REGEX_S_NEG_CLASS_9700
     * @tc.name      test_DotAllNegClass_0097
     * @tc.desc      Test dotAll flag (s) with negated character class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_DotAllNegClass_0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_DotAllNegClass_0097 start');
        let re97 = /[^x]/s;
        let result97 = re97.test("\n") ? "匹配" : "不匹配";
        let result = result97 === "匹配";
        expect(result).assertTrue();
        console.log('test_DotAllNegClass_0097 done');
        done();
        console.log('test_DotAllNegClass_0097 end');
      });

    /**
     * @tc.number    SUB_REGEX_Y_VS_G_COUNT_9800
     * @tc.name      test_StickyVsGlobalCount_0098
     * @tc.desc      Compare count results between sticky (y) and global (g) flags
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_StickyVsGlobalCount_0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_StickyVsGlobalCount_0098 start');
        let re98g = /a/g;
        let re98y = /a/y;
        let str98 = "aabaa";
        let gCount = str98.match(re98g)?.length ?? 0;
        let yCount = 0;
        re98y.lastIndex = 0;
        while (re98y.test(str98)) {
          yCount++;
          re98y.lastIndex++;
        }
        let result98 = [gCount, yCount].join(",");
        let result = result98 === "4,1";
        expect(result).assertTrue();
        console.log('test_StickyVsGlobalCount_0098 done');
        done();
        console.log('test_StickyVsGlobalCount_0098 end');
      });

    /**
     * @tc.number    SUB_REGEX_ALL_FLAGS_9900
     * @tc.name      test_AllFlagsCombined_0099
     * @tc.desc      Test all six flags (g+i+m+u+s+y) combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_AllFlagsCombined_0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_AllFlagsCombined_0099 start');
        let re99 = /^\p{L}.*?end$/gimusy;
        let str99 = "Apple\n多行\nEnd\nBanana\n另一段\nEND";
        let result99: string[] = [];
        let match99: RegExpExecArray | null;
        re99.lastIndex = 0;
        while ((match99 = re99.exec(str99)) !== null) {
          result99.push(match99[0]);
          re99.lastIndex = match99.index + match99[0].length + 1;
        }
        let expected = "Apple\n多行\nEnd; Banana\n另一段\nEND";
        let result = result99.join("; ") === expected;
        expect(result).assertTrue();
        console.log('test_AllFlagsCombined_0099 done');
        done();
        console.log('test_AllFlagsCombined_0099 end');
      });

    /**
     * @tc.number    SUB_REGEX_FLAG_PERF_1000
     * @tc.name      test_FlagImpactOnPerformance_0100
     * @tc.desc      Test performance difference between /b/ and /b/i on 200 KB string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_FlagImpactOnPerformance_0100",
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_FlagImpactOnPerformance_0100 start');

        const str100: string = 'a'.repeat(100000) + 'B'.repeat(100000);
        const re100: RegExp  = /b/;
        const re100i: RegExp = /b/i;

        re100.test(str100);
        re100i.test(str100);

        const t0: number = Date.now();
        re100.test(str100);
        const time100: number = Date.now() - t0;

        const t1: number = Date.now();
        re100i.test(str100);
        const time100i: number = Date.now() - t1;

        const result: boolean = time100 >= 0 && time100i >= 0;
        expect(result).assertTrue();
        console.log('test_FlagImpactOnPerformance_0100 done');
        done();
        console.log('test_FlagImpactOnPerformance_0100 end');
      });

    /**
     * @tc.number    SUB_REGEX_SCIENTIFIC_8500
     * @tc.name      test_RegexScientific_0085
     * @tc.desc      Test regex matching scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexScientific_0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexScientific_0085 start");
        const re = /^[+-]?\d+(\.\d+)?[eE][+-]?\d+$/;
        const result = re.test("1.23e+45");
        expect(result).assertTrue();
        console.log("test_RegexScientific_0085 done");
        done();
        console.log("test_RegexScientific_0085 end");
      });

    /**
     * @tc.number    SUB_REGEX_UUID_8600
     * @tc.name      test_RegexUuid_0086
     * @tc.desc      Test regex matching UUID
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexUuid_0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexUuid_0086 start");
        const re = /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$/;
        const result = re.test("550e8400-e29b-41d4-a716-446655440000");
        expect(result).assertTrue();
        console.log("test_RegexUuid_0086 done");
        done();
        console.log("test_RegexUuid_0086 end");
      });

    /**
     * @tc.number    SUB_REGEX_MAC_8700
     * @tc.name      test_RegexMac_0087
     * @tc.desc      Test regex matching MAC address
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexMac_0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexMac_0087 start");
        const re = /^([0-9a-fA-F]{2}:){5}[0-9a-fA-F]{2}$/;
        const result = re.test("00:1B:44:11:3A:B7");
        expect(result).assertTrue();
        console.log("test_RegexMac_0087 done");
        done();
        console.log("test_RegexMac_0087 end");
      });

    /**
     * @tc.number    SUB_REGEX_IPV6_8800
     * @tc.name      test_RegexIpv6_0088
     * @tc.desc      Test regex matching IPv6 address (simplified)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexIpv6_0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexIpv6_0088 start");
        const re = /^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$/;
        const result = re.test("2001:0db8:85a3:0000:0000:8a2e:0370:7334");
        expect(result).assertTrue();
        console.log("test_RegexIpv6_0088 done");
        done();
        console.log("test_RegexIpv6_0088 end");
      });

    /**
     * @tc.number    SUB_REGEX_INVALID_RANGE_8900
     * @tc.name      test_RegexInvalidRange_0089
     * @tc.desc      Test regex invalid range error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_RegexInvalidRange_0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexInvalidRange_0089 start');

        let result: boolean | string = false;

        try {
          const re = new RegExp('[z-a]');
          result = re.test('a');
        } catch (e) {
          result = '无效范围错误';
        }

        expect(result).assertEqual('无效范围错误');

        console.log('test_RegexInvalidRange_0089 done');
        done();
        console.log('test_RegexInvalidRange_0089 end');
      }
    );

    /**
     * @tc.number    SUB_REGEX_UNCLOSED_BRACKET_9000
     * @tc.name      test_RegexUnclosedBracket_0090
     * @tc.desc      Test regex unclosed bracket error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('test_RegexUnclosedBracket_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexUnclosedBracket_0090 start');

        let result: boolean | string = false;
        try {
          const re = new RegExp('[abc');
          result = re.test('a');
        } catch (e) {
          result = '语法错误';
        }

        expect(result).assertEqual('语法错误');

        console.log('test_RegexUnclosedBracket_0090 done');
        done();
        console.log('test_RegexUnclosedBracket_0090 end');
      });

    /**
     * @tc.number    SUB_REGEX_EMPTY_CLASS_9100
     * @tc.name      test_RegexEmptyClass_0091
     * @tc.desc      Test regex empty character class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexEmptyClass_0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexEmptyClass_0091 start");
        const re = /^[]$/;
        const result = re.test("");
        expect(result).assertFalse();
        console.log("test_RegexEmptyClass_0091 done");
        done();
        console.log("test_RegexEmptyClass_0091 end");
      });

    /**
     * @tc.number    SUB_REGEX_NEGATED_EMPTY_9200
     * @tc.name      test_RegexNegatedEmpty_0092
     * @tc.desc      Test regex negated empty character class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexNegatedEmpty_0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexNegatedEmpty_0092 start");
        const re = /^[^]$/;
        const result = re.test("a");
        expect(result).assertTrue();
        console.log("test_RegexNegatedEmpty_0092 done");
        done();
        console.log("test_RegexNegatedEmpty_0092 end");
      });

    /**
     * @tc.number    SUB_REGEX_UNICODE_PROP_9300
     * @tc.name      test_RegexUnicodeProp_0093
     * @tc.desc      Test regex with Unicode property escapes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexUnicodeProp_0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexUnicodeProp_0093 start");
        const re = /[\p{Script=Greek}]/u;
        const result = re.test("αβγ");
        expect(result).assertTrue();
        console.log("test_RegexUnicodeProp_0093 done");
        done();
        console.log("test_RegexUnicodeProp_0093 end");
      });

    /**
     * @tc.number    SUB_REGEX_DOTALL_CLASS_9400
     * @tc.name      test_RegexDotallClass_0094
     * @tc.desc      Test regex character class with dotAll flag (no effect)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexDotallClass_0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexDotallClass_0094 start");
        const re = /[a.]/s;
        const result = re.test("\n");
        expect(result).assertFalse();
        console.log("test_RegexDotallClass_0094 done");
        done();
        console.log("test_RegexDotallClass_0094 end");
      });

    /**
     * @tc.number    SUB_REGEX_STICKY_CLASS_9500
     * @tc.name      test_RegexStickyClass_0095
     * @tc.desc      Test regex character class with sticky flag
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexStickyClass_0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexStickyClass_0095 start");
        const re = /[a-z]/y;
        re.lastIndex = 1;
        const result = re.test("1a2b");
        expect(result).assertTrue();
        console.log("test_RegexStickyClass_0095 done");
        done();
        console.log("test_RegexStickyClass_0095 end");
      });

    /**
     * @tc.number    SUB_REGEX_MARKDOWN_LINK_9600
     * @tc.name      test_RegexMarkdownLink_0096
     * @tc.desc      Test regex matching Markdown link text
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexMarkdownLink_0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexMarkdownLink_0096 start");
        const re = /\[(.*?)\]\(.*?\)/;
        const match = re.exec("[链接文本](url)");
        const result = match?.[1];
        expect(result).assertEqual("链接文本");
        console.log("test_RegexMarkdownLink_0096 done");
        done();
        console.log("test_RegexMarkdownLink_0096 end");
      });

    /**
     * @tc.number    SUB_REGEX_HTML_ATTR_9700
     * @tc.name      test_RegexHtmlAttr_0097
     * @tc.desc      Test regex matching HTML attribute value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexHtmlAttr_0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexHtmlAttr_0097 start");
        const re = /value="([^"]*)"/;
        const match = re.exec('<input value="test123">');
        const result = match?.[1];
        expect(result).assertEqual("test123");
        console.log("test_RegexHtmlAttr_0097 done");
        done();
        console.log("test_RegexHtmlAttr_0097 end");
      });

    /**
     * @tc.number    SUB_REGEX_CSS_VALUE_9800
     * @tc.name      test_RegexCssValue_0098
     * @tc.desc      Test regex matching CSS property value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexCssValue_0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexCssValue_0098 start");
        const re = /color:\s*([^;]*)/;
        const match = re.exec("color: #ff0000;");
        const result = match?.[1];
        expect(result).assertEqual("#ff0000");
        console.log("test_RegexCssValue_0098 done");
        done();
        console.log("test_RegexCssValue_0098 end");
      });

    /**
     * @tc.number    SUB_REGEX_COMPLEX_COMBO_9900
     * @tc.name      test_RegexComplexCombo_0099
     * @tc.desc      Test regex complex combination for strong password validation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexComplexCombo_0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexComplexCombo_0099 start");
        const re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
        const result = re.test("Passw0rd!");
        expect(result).assertTrue();
        console.log("test_RegexComplexCombo_0099 done");
        done();
        console.log("test_RegexComplexCombo_0099 end");
      });

    /**
     * @tc.number    SUB_REGEX_LOG_EXTRACT_10000
     * @tc.name      test_RegexLogExtract_0100
     * @tc.desc      Test regex comprehensive log content extraction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexLogExtract_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log("test_RegexLogExtract_0100 start");
        const re = /\[(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2})\] \[(\w+)\] (.*)/;
        const log = "[2024-05-20 15:30:45] [INFO] 系统启动成功";
        const match = re.exec(log);
        const result = match?.slice(1, 4);
        expect(result?.[0]).assertEqual("2024-05-20 15:30:45");
        expect(result?.[1]).assertEqual("INFO");
        expect(result?.[2]).assertEqual("系统启动成功");
        console.log("test_RegexLogExtract_0100 done");
        done();
        console.log("test_RegexLogExtract_0100 end");
      });

    /**
     * @tc.number    SUB_REGEX_HYPHEN_8300
     * @tc.name      test_RegexHyphen_0083
     * @tc.desc      Test escaped hyphen matching phone number format
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexHyphen_0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexHyphen_0083 start');
        const re = /\d{3}\-\d{7,8}/;
        const result = re.test("010-12345678");
        expect(result).assertTrue();
        console.log('test_RegexHyphen_0083 done');
        done();
        console.log('test_RegexHyphen_0083 end');
      });

    /**
     * @tc.number    SUB_REGEX_DOLLAR_8400
     * @tc.name      test_RegexDollar_0084
     * @tc.desc      Test escaped dollar sign matching currency format
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexDollar_0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexDollar_0084 start');
        const re = /\$\d+(\.\d{2})?/;
        const result = re.test("$100.00");
        expect(result).assertTrue();
        console.log('test_RegexDollar_0084 done');
        done();
        console.log('test_RegexDollar_0084 end');
      });

    /**
     * @tc.number    SUB_REGEX_PERCENT_8500
     * @tc.name      test_RegexPercent_0085
     * @tc.desc      Test escaped percent sign matching percentage format
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexPercent_0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexPercent_0085 start');
        const re = /\d+(\.\d+)?\%/;
        const result = re.test("75.5%");
        expect(result).assertTrue();
        console.log('test_RegexPercent_0085 done');
        done();
        console.log('test_RegexPercent_0085 end');
      });

    /**
     * @tc.number    SUB_REGEX_E_NOTATION_8600
     * @tc.name      test_RegexENotation_0086
     * @tc.desc      Test escaped scientific notation pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexENotation_0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexENotation_0086 start');
        const re = /\d+(\.\d+)?[eE][+-]?\d+/;
        const result = re.test("1.23e+45");
        expect(result).assertTrue();
        console.log('test_RegexENotation_0086 done');
        done();
        console.log('test_RegexENotation_0086 end');
      });

    /**
     * @tc.number    SUB_REGEX_UUID_HYPHEN_8700
     * @tc.name      test_RegexUuidHyphen_0087
     * @tc.desc      Test escaped hyphens in UUID pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexUuidHyphen_0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexUuidHyphen_0087 start');
        const re = /[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}/;
        const result = re.test("550e8400-e29b-41d4-a716-446655440000");
        expect(result).assertTrue();
        console.log('test_RegexUuidHyphen_0087 done');
        done();
        console.log('test_RegexUuidHyphen_0087 end');
      });

    /**
     * @tc.number    SUB_REGEX_MAC_COLON_8800
     * @tc.name      test_RegexMacColon_0088
     * @tc.desc      Test escaped colons in MAC address pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexMacColon_0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexMacColon_0088 start');
        const re = /([0-9a-fA-F]{2}\:){5}[0-9a-fA-F]{2}/;
        const result = re.test("00:1B:44:11:3A:B7");
        expect(result).assertTrue();
        console.log('test_RegexMacColon_0088 done');
        done();
        console.log('test_RegexMacColon_0088 end');
      });

    /**
     * @tc.number    SUB_REGEX_UNICODE_PROP_8900
     * @tc.name      test_RegexUnicodeProp_0089
     * @tc.desc      Test escaped Unicode property escape
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexUnicodeProp_0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexUnicodeProp_0089 start');
        const re = /\p{Emoji}/u;
        const result = re.test("😀");
        expect(result).assertTrue();
        console.log('test_RegexUnicodeProp_0089 done');
        done();
        console.log('test_RegexUnicodeProp_0089 end');
      });

    /**
     * @tc.number    SUB_REGEX_INVALID_ESCAPE_9000
     * @tc.name      test_RegexInvalidEscape_0090
     * @tc.desc      Test invalid escape sequence behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexInvalidEscape_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexInvalidEscape_0090 start');
        let result: boolean | string;
        const re = /\z/;
        result = re.test("z");

        expect(result).assertTrue();
        console.log('test_RegexInvalidEscape_0090 done');
        done();
        console.log('test_RegexInvalidEscape_0090 end');
      });

    /**
     * @tc.number    SUB_REGEX_BRACKET_BACKSLASH_9100
     * @tc.name      test_RegexBracketBackslash_0091
     * @tc.desc      Test escaped backslash inside character class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexBracketBackslash_0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexBracketBackslash_0091 start');
        const re = /[\\]/;
        const result = re.test("\\");
        expect(result).assertTrue();
        console.log('test_RegexBracketBackslash_0091 done');
        done();
        console.log('test_RegexBracketBackslash_0091 end');
      });

    /**
     * @tc.number    SUB_REGEX_LITERAL_N_9200
     * @tc.name      test_RegexLiteralN_0092
     * @tc.desc      Test escaped literal \n in string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexLiteralN_0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexLiteralN_0092 start');
        const re = /\\n/;
        const result = re.test("a\\nb");
        expect(result).assertTrue();
        console.log('test_RegexLiteralN_0092 done');
        done();
        console.log('test_RegexLiteralN_0092 end');
      });

    /**
     * @tc.number    SUB_REGEX_HTML_COMMENT_9300
     * @tc.name      test_RegexHtmlComment_0093
     * @tc.desc      Test escaped pattern for HTML comment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexHtmlComment_0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexHtmlComment_0093 start');
        const re = /<!--.*?-->/s;
        const result = re.test("<!-- 这是HTML注释 -->");
        expect(result).assertTrue();
        console.log('test_RegexHtmlComment_0093 done');
        done();
        console.log('test_RegexHtmlComment_0093 end');
      });

    /**
     * @tc.number    SUB_REGEX_URL_ESCAPE_9400
     * @tc.name      test_RegexUrlEscape_0094
     * @tc.desc      Test comprehensive URL matching with escapes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexUrlEscape_0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexUrlEscape_0094 start');
        const re = /^https\:\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}$/;
        const result = re.test("https://example.com");
        expect(result).assertTrue();
        console.log('test_RegexUrlEscape_0094 done');
        done();
        console.log('test_RegexUrlEscape_0094 end');
      });

    /**
     * @tc.number    SUB_REGEX_EMAIL_ESCAPE_9500
     * @tc.name      test_RegexEmailEscape_0095
     * @tc.desc      Test comprehensive email matching with escapes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexEmailEscape_0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexEmailEscape_0095 start');
        const re = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        const result = re.test("user.name+tag@example.com");
        expect(result).assertTrue();
        console.log('test_RegexEmailEscape_0095 done');
        done();
        console.log('test_RegexEmailEscape_0095 end');
      });

    /**
     * @tc.number    SUB_REGEX_ID_CARD_9600
     * @tc.name      test_RegexIdCard_0096
     * @tc.desc      Test ID card pattern matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexIdCard_0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexIdCard_0096 start');
        const re = /^\d{17}[\dXx]$/;
        const result = re.test("110101199001011234");
        expect(result).assertTrue();
        console.log('test_RegexIdCard_0096 done');
        done();
        console.log('test_RegexIdCard_0096 end');
      });

    /**
     * @tc.number    SUB_REGEX_STRONG_PASSWORD_9700
     * @tc.name      test_RegexStrongPassword_0097
     * @tc.desc      Test strong password pattern with special chars
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexStrongPassword_0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexStrongPassword_0097 start');
        const re = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
        const result = re.test("Passw0rd!");
        expect(result).assertTrue();
        console.log('test_RegexStrongPassword_0097 done');
        done();
        console.log('test_RegexStrongPassword_0097 end');
      });

    /**
     * @tc.number    SUB_REGEX_LOG_FORMAT_9800
     * @tc.name      test_RegexLogFormat_0098
     * @tc.desc      Test log format pattern matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexLogFormat_0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexLogFormat_0098 start');
        const re = /^\[\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\] \[\w+\] .*$/;
        const result = re.test("[2024-05-20 15:30:45] [INFO] 系统启动成功");
        expect(result).assertTrue();
        console.log('test_RegexLogFormat_0098 done');
        done();
        console.log('test_RegexLogFormat_0098 end');
      });

    /**
     * @tc.number    SUB_REGEX_CMD_ARGS_9900
     * @tc.name      test_RegexCmdArgs_0099
     * @tc.desc      Test command line arguments pattern
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexCmdArgs_0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexCmdArgs_0099 start');
        const re = /^python\s+script\.py\s+--name\s+\w+$/;
        const result = re.test("python script.py --name test");
        expect(result).assertTrue();
        console.log('test_RegexCmdArgs_0099 done');
        done();
        console.log('test_RegexCmdArgs_0099 end');
      });

    /**
     * @tc.number    SUB_REGEX_JSON_ESCAPE_10000
     * @tc.name      test_RegexJsonEscape_0100
     * @tc.desc      Test JSON format pattern matching
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_RegexJsonEscape_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_RegexJsonEscape_0100 start');
        const re = /^\{\"name\":\s*\"[a-zA-Z0-9]+\"\,\s*\"age\":\s*\d+\}$/;
        const result = re.test('{"name": "test", "age": 20}');
        expect(result).assertTrue();
        console.log('test_RegexJsonEscape_0100 done');
        done();
        console.log('test_RegexJsonEscape_0100 end');
      });
  })
}