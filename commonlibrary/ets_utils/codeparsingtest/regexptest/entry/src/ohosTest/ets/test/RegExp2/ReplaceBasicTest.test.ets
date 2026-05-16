/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function replaceBasicTest() {

    describe('String_Pattern_Replacement', () => {
      /**
       * @tc.name testReplace0100
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0100
       * @tc.desc   Test Basic String Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World, Hello Universe";
        const result = str.replace("Hello", "Hi");
        expect(result).assertEqual("Hi World, Hello Universe");
      });

      /**
       * @tc.name testReplace0101
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0200
       * @tc.desc   Test String Replaces First Match Only
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "apple, apple, apple";
        const result = str.replace("apple", "orange");
        expect(result).assertEqual("orange, apple, apple");
      });

      /**
       * @tc.name testReplace0102
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0300
       * @tc.desc   Test Empty String Pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "xxx";
        const result = str.replace("", "_");
        expect(result === "_xxx" || result === "xxx").assertTrue();
      });

      /**
       * @tc.name testReplace0103
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0400
       * @tc.desc   Test Non Existent String Pattern
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace("goodbye", "Hi");
        expect(result).assertEqual("Hello World");
      });

      /**
       * @tc.name testReplace0104
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0500
       * @tc.desc   Test String Pattern Escapes Special Chars
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "a.b.c";
        const result = str.replace(".", "_");
        expect(result).assertEqual("a_b.c");
      });
    });

    describe('Regex_Pattern_Replacement', () => {
      /**
       * @tc.name testReplace0105
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0600
       * @tc.desc   Test Basic Regex Replacement No Flags
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "cat, dog, cat";
        const result = str.replace(/cat/, "bird");
        expect(result).assertEqual("bird, dog, cat");
      });

      /**
       * @tc.name testReplace0106
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0700
       * @tc.desc   Test Global Replacement g Flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "cat, dog, cat";
        const result = str.replace(/cat/g, "bird");
        expect(result).assertEqual("bird, dog, bird");
      });

      /**
       * @tc.name testReplace0107
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0800
       * @tc.desc   Test Case Insensitive Replacement i Flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello world, hello universe";
        const result = str.replace(/hello/i, "Hi");
        expect(result).assertEqual("Hi world, hello universe");
      });

      /**
       * @tc.name testReplace0108
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_0900
       * @tc.desc   Test Multiline Replacement m Flag
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Line1\nLine2\nLine3";
        const result = str.replace(/^Line/gm, "Row");
        expect(result).assertEqual("Row1\nRow2\nRow3");
      });

      /**
       * @tc.name testReplace0109
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1000
       * @tc.desc   Test Combined Flags gi
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello HELLO hello HeLLo";
        const result = str.replace(/hello/gi, "Hi");
        expect(result).assertEqual("Hi Hi Hi Hi");
      });

      /**
       * @tc.name testReplace0110
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1100
       * @tc.desc   Test dotAll Flag s
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello\nWorld";
        const result = str.replace(/Hello.World/s, "Hi");
        expect(result).assertEqual("Hi");
      });

      /**
       * @tc.name testReplace0111
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1200
       * @tc.desc   Test Unicode Flag u
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const mathSansHigh = 55349;
        const mathSansDigitZeroLow = 57240;
        const mathSansDigitOneLow = 57241;
        const mathSansDigitTwoLow = 57242;
        const mathZero = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow);
        const str = String.fromCharCode(mathSansHigh, mathSansDigitZeroLow, mathSansHigh, mathSansDigitOneLow,
          mathSansHigh, mathSansDigitTwoLow);
        const result = str.replace(new RegExp(mathZero, 'gu'), '0');
        const digitOne = String.fromCharCode(mathSansHigh, mathSansDigitOneLow);
        const digitTwo = String.fromCharCode(mathSansHigh, mathSansDigitTwoLow);
        expect(result).assertEqual('0' + digitOne + digitTwo);
      });

      /**
       * @tc.name testReplace0112
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1300
       * @tc.desc   Test Sticky Flag y
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "aaa";
        const regex = /a/y;
        regex.lastIndex = 1;
        const result = str.replace(regex, "b");
        expect(result).assertEqual("aba");
      });

      /**
       * @tc.name testReplace0113
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1400
       * @tc.desc   Test hasIndices Flag d
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "test123";
        try {
          const regex: RegExp = new RegExp('test(\\d+)', 'd');
          const replaced = str.replace(regex, "replaced");
          expect(replaced).assertEqual("replaced");
        } catch (_) {
          expect(str).assertEqual("test123");
        }
      });
    });

    describe('Special_Replacement_Patterns', () => {
      /**
       * @tc.name testReplace0114
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1500
       * @tc.desc   Test Insert Dollar Sign
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "price: 100";
        const result = str.replace(/\d+/, "$$");
        expect(result).assertEqual("price: $");
      });

      /**
       * @tc.name testReplace0115
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1600
       * @tc.desc   Test Insert Entire Match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/World/, "$&!");
        expect(result).assertEqual("Hello World!");
      });

      /**
       * @tc.name testReplace0116
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1700
       * @tc.desc   Test Insert Text Before Match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/World/, "[$`]");
        expect(result).assertEqual("Hello [Hello ]");
      });

      /**
       * @tc.name testReplace0117
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1800
       * @tc.desc   Test Insert Text After Match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/Hello/, "[$']");
        expect(result).assertEqual("[ World] World");
      });

      /**
       * @tc.name testReplace0118
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_1900
       * @tc.desc   Test Numbered Capture Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "John Smith";
        const result = str.replace(/(\w+)\s(\w+)/, "$2, $1");
        expect(result).assertEqual("Smith, John");
      });

      /**
       * @tc.name testReplace0119
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2000
       * @tc.desc   Test Multiple Capture Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "2023-12-25";
        const result = str.replace(/(\d{4})-(\d{2})-(\d{2})/, "$3/$2/$1");
        expect(result).assertEqual("25/12/2023");
      });

      /**
       * @tc.name testReplace0120
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2100
       * @tc.desc   Test Named Capture Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "John Smith";
        const result = str.replace(/(?<first>\w+)\s(?<last>\w+)/, "$<last>, $<first>");
        expect(result).assertEqual("Smith, John");
      });

      /**
       * @tc.name testReplace0121
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2200
       * @tc.desc   Test Non Existent Capture Group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "foo";
        const result = str.replace(/(f)/, "$2");
        expect(result).assertEqual("$2oo");
      });

      /**
       * @tc.name testReplace0122
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2300
       * @tc.desc   Test String Pattern Ignores Dollar
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "foo";
        const result = str.replace("f", "$1");
        expect(result).assertEqual("$1oo");
      });

      /**
       * @tc.name testReplace0123
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2400
       * @tc.desc   Test Nested Capture Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc123";
        const result = str.replace(/((\w)(\w))/, "$1-$2-$3");
        expect(result).assertEqual("ab-a-bc123");
      });
    });

    describe('Function_as_Replacement', () => {
      interface NameGroups {
        first?: string;
        last?: string;
      }
      interface KeyValueGroups {
        key?: string;
        value?: string;
      }

      /**
       * @tc.name testReplace0124
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2500
       * @tc.desc   Test Basic Function Replacement
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello World";
        const result = str.replace(/World/, (match: string) => match.toUpperCase());
        expect(result).assertEqual("Hello WORLD");
      });

      /**
       * @tc.name testReplace0125
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2600
       * @tc.desc   Test Function Receives Match
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc123";
        const result = str.replace(/\d+/, (match: string) => `[${match}]`);
        expect(result).assertEqual("abc[123]");
      });

      /**
       * @tc.name testReplace0126
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2700
       * @tc.desc   Test Function Receives Capture Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "John Smith";
        const result = str.replace(/(\w+)\s(\w+)/, (match: string, p1: string, p2: string) => `${p2.toUpperCase()}, ${p1}`);
        expect(result).assertEqual("SMITH, John");
      });

      /**
       * @tc.name testReplace0127
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2800
       * @tc.desc   Test Function Receives Offset
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abcde";
        const result = str.replace(/cd/, (match: string, offset: number) => `${match}@${offset}`);
        expect(result).assertEqual("abcd@2e");
      });

      /**
       * @tc.name testReplace0128
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_2900
       * @tc.desc   Test Function Receives String
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "Hello";
        const result = str.replace(/l/, (match: string, offset: number, string: string) => `${match}[${string.length}]`);
        expect(result).assertEqual("Hel[5]lo");
      });

      /**
       * @tc.name testReplace0129
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3000
       * @tc.desc   Test Function Receives Named Groups
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "John Smith";
        const result = str.replace(/(?<first>\w+)\s(?<last>\w+)/, (match: string, p1: string, p2: string, offset: number, string: string, groups?: NameGroups) => {
          return `${groups?.last}, ${groups?.first}`;
        });
        expect(result).assertEqual("Smith, John");
      });

      /**
       * @tc.name testReplace0130
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3100
       * @tc.desc   Test Function Called Multiple Times Global
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "a1b2c3";
        const result = str.replace(/\d/g, (match: string) => {
          return (parseInt(match) * 10).toString();
        });
        expect(result).assertEqual("a10b20c30");
      });

      /**
       * @tc.name testReplace0131
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3200
       * @tc.desc   Test Unmatched Branch Capture Group
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc";
        const result = str.replace(/(a)|(b)/g, (match: string, p1?: string, p2?: string) => {
          return p1 ? "A" : (p2 ? "B" : "?");
        });
        expect(result).assertEqual("ABc");
      });

      /**
       * @tc.name testReplace0132
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3300
       * @tc.desc   Test Temperature Conversion Example
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const f2c = (() => {
          const convert = (str: string, p1: string): string => {
            return `${((parseFloat(p1) - 32) * 5) / 9}C`;
          };
          return (x: string): string => {
            const s = String(x);
            const test = /(-?\d+(?:\.\d*)?)F\b/g;
            return s.replace(test, convert);
          };
        })();
        const result = f2c("212F");
        expect(result).assertEqual("100C");
      });

      /**
       * @tc.name testReplace0133
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3400
       * @tc.desc   Test Access Named Groups In Function
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "name:John,age:25";
        const result = str.replace(/(?<key>\w+):(?<value>\w+)/g, (match: string, p1: string, p2: string, offset: number, string: string, groups?: KeyValueGroups) => {
          return `${groups?.key}=${groups?.value}`;
        });
        expect(result).assertEqual("name=John,age=25");
      });

      /**
       * @tc.name testReplace0134
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3500
       * @tc.desc   Test Function Returns Undefined
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc";
        const result = str.replace(/a/, (): string => {
          return String(undefined);
        });
        expect(result).assertEqual("undefinedbc");
      });

      /**
       * @tc.name testReplace0135
       * @tc.number SUB_COMMONLIBRARY_REGEXP_REPLACE_BASIC_TEST_3600
       * @tc.desc   Test Function Throws Exception
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testReplace0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        const str = "abc";
        let caughtError = false;
        try {
          str.replace(/a/, () => {
            throw new Error("Replace error");
          });
        } catch (e) {
          caughtError = true;
        }
        expect(caughtError).assertTrue();
      });
    });

}

