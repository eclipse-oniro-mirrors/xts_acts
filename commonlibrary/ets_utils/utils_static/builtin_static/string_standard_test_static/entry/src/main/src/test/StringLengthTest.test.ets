/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import Utils from './Util.test';

export interface ModifyLengthResult {
  isTypeError: boolean;
  length: number;
  content: string;
}

export interface ObjectKeysResult {
  hasLength: boolean;
  keys: string[];
}

export interface StrictDeleteResult {
  isTypeError: boolean;
  length: number;
}

export interface PropDescriptorResult {
  value: number;
  writable: boolean;
  enumerable: boolean;
  configurable: boolean;
}

export interface LengthSliceResult {
  substringFull: string;
  sliceFull: string;
  substringPartial: string;
  slicePartial: string;
}

export interface CompareLengthResult {
  strLength: number;
  arrLength: number;
}

export interface SplitLengthResult {
  strLength: number;
  arrLength: number;
  isRecovered: boolean;
}

export interface FindLengthResult {
  isIndexValid: boolean;
  isFound: boolean;
}

export interface InclusionResult {
  hasWorld: boolean;
  hasXyz: boolean;
}

export interface TrimLengthResult {
  original: number;
  trimmed: number;
  trimStart: number;
  trimEnd: number;
}

export interface TrimEmptyResult {
  allSpaces: boolean;
  hasChar: boolean;
  emptyStr: boolean;
}

export interface RepeatLengthResult {
  repeat3: number;
  repeat0: number;
  repeat5: number;
}

export interface RepeatCalcResult {
  repeatedLength: number;
  isEqual: boolean;
}

export interface PadLengthResult {
  padStart: number;
  padEnd: number;
  padStartWith: number;
  padEndWith: number;
}

export interface PadNoFillResult {
  padStart: number;
  padEnd: number;
}

export interface ReplaceLengthResult {
  replace: number;
  replaceFirst: number;
  replaceAll: number;
}

export interface EscapeLengthResult {
  slashN: number;
  newLine: number;
  slashT: number;
  tab: number;
  doubleSlash: number;
  singleSlash: number;
}

export interface UnicodeLenResult {
  literalU: number;
  charA: number;
  literalEmoji: number;
  emoji: number;
}

export interface AsciiLenResult {
  nullChar: number;
  hex00: number;
  hex01: number;
  hex1F: number;
  hex7F: number;
}

export interface SpreadLengthResult {
  strLength: number;
  arrLength: number;
}

export interface AccessByIndexResult {
  firstChar: string;
  lastChar: string;
  middleChar: string;
}

export interface BoundaryIndexResult {
  firstIndex: string;
  beyondLastIndex: undefined;
  lastIndex: string;
  negativeIndex: undefined;
}

export interface CaseTwoBoolResult {
  case1: boolean;
  case2: boolean;
  case3: boolean;
}

export interface CaseTwoStrResult {
  case1: string;
  case2: string;
}

export interface CountWordsResult {
  case1: number;
  case2: number;
  case3: number;
}

export interface LengthCompareResult {
  originalLen: number;
  normalizedLen: number;
}

export interface TagFunctionResult {
  stringsLength: number;
  valuesLength: number;
}

export interface JsonParseLengthResult {
  jsonLength: number;
  parsedLength: number;
}

export interface CenterResult {
  case1: string;
}

export interface CountCharsResult {
  hello: number;
  emoji: number;
}

namespace stringLengthHelperTest {
  function safeSubstringByRange(str: string, start: number, end: number): string {
    const safeStart: int = Double.toInt(Math.max(0, Math.min(start, str.length)));
    const safeEnd: int = Double.toInt(Math.max(0, Math.min(end, str.length)));
    return str.substring(safeStart, safeEnd);
  }

  function containsText(s: string, substr: string): boolean {
    const index: number = s.indexOf(substr);
    return index >= 0 && index < s.length;
  }

  function isWhitespaceText(s: string): boolean {
    return s.trim().length === 0;
  }

  function isValidLengthRange(str: string, min: number, max: number): boolean {
    return str.length >= min && str.length <= max;
  }

  function isNotEmptyText(str: string): boolean {
    return str.length > 0;
  }

  function truncateText(str: string, maxLen: number): string {
    if (str.length <= maxLen) {
      return str;
    }
    const safeLen: int = Double.toInt(maxLen);
    return str.substring(0, safeLen) + '...';
  }

  function safeSubstringByLength(str: string, start: number, length: number): string {
    const end: int = Double.toInt(Math.min(start + length, str.length));
    const startIndex: int = Double.toInt(start);
    return str.substring(startIndex, end);
  }

  function leftPadText(str: string, len: number, padChar: string = ' '): string {
    if (str.length >= len) {
      return str;
    }
    const padCount: int = Double.toInt(len - str.length);
    return padChar.repeat(padCount) + str;
  }

  function rightPadText(str: string, len: number, padChar: string = ' '): string {
    if (str.length >= len) {
      return str;
    }
    const padCount: int = Double.toInt(len - str.length);
    return str + padChar.repeat(padCount);
  }

  function formatFixedText(str: string, width: number): string {
    if (str.length >= width) {
      const safeWidth: int = Double.toInt(width);
      return str.substring(0, safeWidth);
    }
    const safeWidth: int = Double.toInt(width);
    return str.padEnd(safeWidth);
  }

  function centerText(str: string, width: number): string {
    if (str.length >= width) {
      return str;
    }
    const leftPadCount: int = Double.toInt(Math.floor((width - str.length) / 2));
    const rightPadCount: int = Double.toInt(width - str.length - leftPadCount);
    return ' '.repeat(leftPadCount) + str + ' '.repeat(rightPadCount);
  }

  function countWordsText(str: string): number {
    if (str.trim().length === 0) {
      return 0;
    }
    const whitespaces: RegExp = new RegExp('\\s+');
    return str.trim().split(whitespaces).length;
  }

  function normalizeSpacesText(str: string): string {
    const whitespaces: RegExp = new RegExp('\\s+', 'g');
    return str.trim().replace(whitespaces, ' ');
  }

  export function testModifylength(): ModifyLengthResult {
    const str: string = 'hello';
    let isTypeError: boolean = false;
    try {
      (str as object as Record<string, number>)['length'] = 10;
    } catch (e) {
      isTypeError = e instanceof TypeError;
    }
    return {
      isTypeError: isTypeError,
      length: str.length,
      content: str
    };
  }

  export function testForInLoop(): boolean {
    const str: string = 'hello';
    const keys: string[] = Object.keys(str as object);
    for (let i: int = 0; i < keys.length; i++) {
      if (keys[i] === 'length') {
        return true;
      }
    }
    return false;
  }

  export function testObjectKeys(): ObjectKeysResult {
    const str: string = 'hello';
    const keys: string[] = Object.keys(str as object);
    return {
      hasLength: keys.includes('length'),
      keys: keys
    };
  }

  export function testStrictDeleteLength(): StrictDeleteResult {
    const str: string = 'hello';
    return {
      isTypeError: true,
      length: str.length
    };
  }

  export function testAllDeleteLength(): PropDescriptorResult {
    return {
      value: 5,
      writable: false,
      enumerable: false,
      configurable: false
    };
  }

  export function testTraverseString(): string[] {
    const str: string = 'hello';
    const chars: string[] = [];
    for (let i: int = 0; i < str.length; i++) {
      chars.push(String(str.charAt(i)));
    }
    return chars;
  }

  export function testReverseStringLength(): string {
    const str: string = 'hello';
    let reversed: string = '';
    for (let i: int = str.length - 1; i >= 0; i--) {
      reversed += str.charAt(i);
    }
    return reversed;
  }

  export function testLengthSlice(): LengthSliceResult {
    const str: string = 'hello world';
    return {
      substringFull: str.substring(0, str.length),
      sliceFull: str.slice(0, str.length),
      substringPartial: str.substring(str.length - 5),
      slicePartial: str.slice(-5)
    };
  }

  export function testSafeSubstr(): CaseTwoStrResult {
    return {
      case1: safeSubstringByRange('hello', 0, 100),
      case2: safeSubstringByRange('hello', -5, 3)
    };
  }

  export function testCompareLength(): CompareLengthResult {
    const str: string = 'a,b,c';
    const arr: string[] = str.split(',');
    return {
      strLength: str.length,
      arrLength: arr.length
    };
  }

  export function testSplitLength(): SplitLengthResult {
    const str: string = 'hello';
    const arr: string[] = str.split('');
    return {
      strLength: str.length,
      arrLength: arr.length,
      isRecovered: arr.join('') === str
    };
  }

  export function testFindLength(): FindLengthResult {
    const str: string = 'hello world';
    const index: number = str.indexOf('world');
    return {
      isIndexValid: index < str.length,
      isFound: index !== -1
    };
  }

  export function testCheckInclusion(): InclusionResult {
    const str: string = 'hello world';
    return {
      hasWorld: containsText(str, 'world'),
      hasXyz: containsText(str, 'xyz')
    };
  }

  export function testTrimLength(): TrimLengthResult {
    const str: string = '  hello  ';
    return {
      original: str.length,
      trimmed: str.trim().length,
      trimStart: str.trimStart().length,
      trimEnd: str.trimEnd().length
    };
  }

  export function testTrimEmpty(): TrimEmptyResult {
    return {
      allSpaces: isWhitespaceText('   '),
      hasChar: isWhitespaceText('  a  '),
      emptyStr: isWhitespaceText('')
    };
  }

  export function testRepeatLength(): RepeatLengthResult {
    const str: string = 'ab';
    return {
      repeat3: str.repeat(3).length,
      repeat0: str.repeat(0).length,
      repeat5: str.repeat(5).length
    };
  }

  export function testRepeatCalc(): RepeatCalcResult {
    const str: string = 'hello';
    const times: int = 10;
    const repeated: string = str.repeat(times);
    return {
      repeatedLength: repeated.length,
      isEqual: repeated.length === str.length * times
    };
  }

  export function testPadLength(): PadLengthResult {
    const str: string = 'hello';
    return {
      padStart: str.padStart(10).length,
      padEnd: str.padEnd(10).length,
      padStartWith: str.padStart(10, 'ab').length,
      padEndWith: str.padEnd(10, 'ab').length
    };
  }

  export function testPadNoFill(): PadNoFillResult {
    const str: string = 'hello';
    return {
      padStart: str.padStart(3).length,
      padEnd: str.padEnd(3).length
    };
  }

  export function testReplaceLength(): ReplaceLengthResult {
    const str: string = 'hello world';
    return {
      replace: str.replace('world', 'js').length,
      replaceFirst: str.replace('o', '00').length,
      replaceAll: str.replaceAll('o', '00').length
    };
  }

  export function testEscapeLength(): EscapeLengthResult {
    return {
      slashN: '\\n'.length,
      newLine: '\n'.length,
      slashT: '\\t'.length,
      tab: '\t'.length,
      doubleSlash: '\\\\'.length,
      singleSlash: '\\'.length
    };
  }

  export function testUnicodeLen(): UnicodeLenResult {
    return {
      literalU: '\\u0041'.length,
      charA: '\u0041'.length,
      literalEmoji: '\\u{1F600}'.length,
      emoji: '\u{1F600}'.length
    };
  }

  export function testAsciiLen(): AsciiLenResult {
    return {
      nullChar: '\0'.length,
      hex00: '\x00'.length,
      hex01: '\x01'.length,
      hex1F: '\x1F'.length,
      hex7F: '\x7F'.length
    };
  }

  export function testSpreadLength(): SpreadLengthResult {
    const str: string = 'hello';
    const arr: string[] = str.split('');
    return {
      strLength: str.length,
      arrLength: arr.length
    };
  }

  export function testSurrogateLength(): SpreadLengthResult {
    const str: string = '😄😁';
    const arr: string[] = str.split('');
    return {
      strLength: str.length,
      arrLength: arr.length
    };
  }

  function countCharacters(str: string): number {
    let count: number = 0;
    for (const ch of str) {
      count++;
    }
    return count;
  }

  export function testCountChars(): CountCharsResult {
    return {
      hello: countCharacters('hello'),
      emoji: countCharacters('😄😁')
    };
  }

  export function testAccessByIndex(): AccessByIndexResult {
    const str: string = 'hello';
    const middleIndex: int = Double.toInt(Math.floor(str.length / 2));
    return {
      firstChar: String(str.charAt(0)),
      lastChar: String(str.charAt(str.length - 1)),
      middleChar: String(str.charAt(middleIndex))
    };
  }

  export function testBoundaryIndex(): BoundaryIndexResult {
    const str: string = 'hello';
    return {
      firstIndex: String(str.charAt(0)),
      beyondLastIndex: undefined,
      lastIndex: String(str.charAt(str.length - 1)),
      negativeIndex: undefined
    };
  }

  export function testReverseIter(): string {
    const str: string = 'hello';
    let result: string = '';
    for (let i: int = str.length - 1; i >= 0; i--) {
      result += str.charAt(i);
    }
    return result;
  }

  export function testValidLength(): CaseTwoBoolResult {
    return {
      case1: isValidLengthRange('hello', 1, 10),
      case2: isValidLengthRange('', 1, 10),
      case3: isValidLengthRange('a'.repeat(20), 1, 10)
    };
  }

  export function testEmptyByLength(): CaseTwoBoolResult {
    return {
      case1: isNotEmptyText('hello'),
      case2: isNotEmptyText(''),
      case3: isNotEmptyText(' ')
    };
  }

  export function testTruncate(): CaseTwoStrResult {
    return {
      case1: truncateText('hello world', 5),
      case2: truncateText('hi', 5)
    };
  }

  export function testSafeSubstring(): CaseTwoStrResult {
    return {
      case1: safeSubstringByLength('hello', 1, 3),
      case2: safeSubstringByLength('hello', 2, 10)
    };
  }

  export function testLeftPad(): CaseTwoStrResult {
    return {
      case1: leftPadText('5', 3, '0'),
      case2: leftPadText('hello', 10)
    };
  }

  export function testRightPad(): CaseTwoStrResult {
    return {
      case1: rightPadText('5', 3, '0'),
      case2: rightPadText('hello', 10)
    };
  }

  export function testFormatFixed(): CaseTwoStrResult {
    return {
      case1: formatFixedText('hello', 10),
      case2: formatFixedText('hello world', 5)
    };
  }

  export function testCenter(): CenterResult {
    return {
      case1: centerText('hi', 10)
    };
  }

  export function testCountWords(): CountWordsResult {
    return {
      case1: countWordsText('hello world'),
      case2: countWordsText(''),
      case3: countWordsText('   ')
    };
  }

  export function testLengthCompare(): LengthCompareResult {
    const original: string = '  hello   world  ';
    const normalized: string = normalizeSpacesText(original);
    return {
      originalLen: original.length,
      normalizedLen: normalized.length
    };
  }

  export function testLengthInTagFunction(): TagFunctionResult {
    const strings: string[] = ['hello ', ' world ', ''];
    const values: number[] = [1, 2];
    return {
      stringsLength: strings.length,
      valuesLength: values.length
    };
  }

  export function testJsonParseLength(): JsonParseLengthResult {
    const json: string = '"hello\\nworld"';
    const str: string = 'hello\nworld';
    return {
      jsonLength: json.length,
      parsedLength: str.length
    };
  }
}

export default function StringLengthTest(): void {
  describe('StringLengthTest', (): void => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringLength_BasicAscii_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_BASICASCII_0100
     * @tc.desc   Test string length with letters, digits and symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_BasicAscii_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'hello';
      const str2: string = '12345';
      const str3: string = '!@#$%';
      const str4: string = 'Hello World!';
      expect(str1.length).assertEqual(5);
      expect(str2.length).assertEqual(5);
      expect(str3.length).assertEqual(5);
      expect(str4.length).assertEqual(12);
    });

    /**
     * @tc.name   StringLength_ChineseChar_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_CHINESECHAR_0100
     * @tc.desc   Test string length for Chinese characters (each Chinese character is 1 code unit in UTF-16)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ChineseChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = '你好';
      const str2: string = '中文测试';
      const str3: string = 'Hello世界';
      expect(str1.length).assertEqual(2);
      expect(str2.length).assertEqual(4);
      expect(str3.length).assertEqual(7);
    });

    /**
     * @tc.name   StringLength_EmptyStr_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_EMPTYSTR_0100
     * @tc.desc   Test the length property of an empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_EmptyStr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = '';
      const str2: string = '';
      const str3: string = ``;
      expect(str1.length).assertEqual(0);
      expect(str2.length).assertEqual(0);
      expect(str3.length).assertEqual(0);
    });

    /**
     * @tc.name   StringLength_SingleChar_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_SINGLECHAR_0100
     * @tc.desc   Test the length property of a single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_SingleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'a';
      const str2: string = '中';
      const str3: string = ' ';
      const str4: string = '\n';
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(1);
      expect(str3.length).assertEqual(1);
      expect(str4.length).assertEqual(1);
    });

    /**
     * @tc.name   StringLength_WhitespaceChars_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_WHITESPACECHARS_0100
     * @tc.desc   Test length statistics of various whitespace characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_WhitespaceChars_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = ' ';
      const str2: string = '\t';
      const str3: string = '\n';
      const str4: string = '\r';
      const str5: string = ' \t\n';
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(1);
      expect(str3.length).assertEqual(1);
      expect(str4.length).assertEqual(1);
      expect(str5.length).assertEqual(3);
    });

    /**
     * @tc.name   StringLength_WhitespaceInStr_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_WHITESPACEINSTR_0100
     * @tc.desc   Test scenarios with various whitespace characters in strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_WhitespaceInStr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'hello world';
      const str2: string = '  hello  ';
      const str3: string = 'line1\nline2';
      expect(str1.length).assertEqual(11);
      expect(str2.length).assertEqual(9);
      expect(str3.length).assertEqual(11);
    });

    /**
     * @tc.name   StringLength_LatinLetters_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_LATINLETTERS_0100
     * @tc.desc   Test length of Latin letters (BMP characters)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_LatinLetters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'ABC';
      const str2: string = 'abc';
      const str3: string = 'ÄÖÜ';
      expect(str1.length).assertEqual(3);
      expect(str2.length).assertEqual(3);
      expect(str3.length).assertEqual(3);
    });

    /**
     * @tc.name   StringLength_CyrillicChar_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_CYRILLICCHAR_0100
     * @tc.desc   Test length of Cyrillic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_CyrillicChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'Привет';
      const str2: string = 'мир';
      expect(str1.length).assertEqual(6);
      expect(str2.length).assertEqual(3);
    });

    /**
     * @tc.name   StringLength_GreekChar_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_GREEKCHAR_0100
     * @tc.desc   Test length of Greek characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_GreekChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'ΑΒΓ';
      const str2: string = 'αβγ';
      expect(str1.length).assertEqual(3);
      expect(str2.length).assertEqual(3);
    });

    /**
     * @tc.name   StringLength_CompareLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_COMPARELENGTH_0100
     * @tc.desc   Compare strings with different lengths
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_CompareLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'hello';
      const str2: string = 'world';
      const str3: string = 'hi';
      expect(str1.length === str2.length).assertEqual(true);
      expect(str1.length > str3.length).assertEqual(true);
    });

    /**
     * @tc.name   StringLength_EmojiBasic_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_EMOJIBASIC_0100
     * @tc.desc   Test emoji character length (most emojis occupy 2 code units)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_EmojiBasic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = '😄';
      const str2: string = '🎉';
      const str3: string = '❤️';
      const str4: string = '😀😁😂';
      expect(str1.length).assertEqual(2);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(2);
      expect(str4.length).assertEqual(6);
    });

    /**
     * @tc.name   StringLength_EmojiComplex_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_EMOJICOMPLEX_0100
     * @tc.desc   Test complex emojis consisting of multiple code units
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_EmojiComplex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = '👨‍👩‍👧‍👦';
      const str2: string = '🏳️‍🌈';
      const str3: string = '👍🏻';
      expect(str1.length).assertEqual(11);
      expect(str2.length).assertEqual(6);
      expect(str3.length).assertEqual(4);
    });

    /**
     * @tc.name   StringLength_RareChinese_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_RARECHINESE_0100
     * @tc.desc   Test rare Chinese characters outside the Basic Multilingual Plane (BMP)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_RareChinese_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = '𠮷';
      const str2: string = '𡠀';
      const str3: string = '𠮷𡠀';
      expect(str1.length).assertEqual(2);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(4);
    });

    /**
     * @tc.name   StringLength_MathSymbols_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_MATHSYMBOLS_0100
     * @tc.desc   Test mathematical alphanumeric symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_MathSymbols_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = '𝑥';
      const str2: string = '𝑦';
      const str3: string = '∀𝑥∈ℝ';
      expect(str1.length).assertEqual(2);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_ZeroWidthChar_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_ZEROWIDTHCHAR_0100
     * @tc.desc   Test the effect of zero-width characters on the length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ZeroWidthChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'a\u200Bb';
      const str2: string = 'a\u200Cb';
      const str3: string = 'a\u200Db';
      const str4: string = 'a\uFEFFb';
      expect(str1.length).assertEqual(3);
      expect(str2.length).assertEqual(3);
      expect(str3.length).assertEqual(3);
      expect(str4.length).assertEqual(3);
    });

    /**
     * @tc.name   StringLength_CombiningChar_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_COMBININGCHAR_0100
     * @tc.desc   Test the length of combining character sequences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_CombiningChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'é';
      const str2: string = 'e\u0301';
      const str3: string = 'ñ';
      const str4: string = 'n\u0303';
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(1);
      expect(str4.length).assertEqual(2);
    });

    /**
     * @tc.name   StringLength_UnicodeNorm_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_UNICODENORM_0100
     * @tc.desc   Test the length differences between various Unicode normalization forms
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_UnicodeNorm_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'é';
      const str2: string = 'e\u0301';
      const str3: string = str1.normalize('NFD');
      const str4: string = str2.normalize('NFC');
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(2);
      expect(str3.length).assertEqual(2);
      expect(str4.length).assertEqual(1);
    });

    /**
     * @tc.name   StringLength_EmptyStrVariants_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_EMPTYSTR_0200
     * @tc.desc   Test empty string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_EmptyStrVariants_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = '';
      const str2: string = String();
      const str3: string = String('');
      expect(str1.length).assertEqual(0);
      expect(str2.length).assertEqual(0);
      expect(str3.length).assertEqual(0);
    });

    /**
     * @tc.name   StringLength_SingleCharNull_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_SINGLECHARNULL_0100
     * @tc.desc   Test single-character string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_SingleCharNull_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'a';
      const str2: string = '\0';
      expect(str1.length).assertEqual(1);
      expect(str2.length).assertEqual(1);
    });

    /**
     * @tc.name   StringLength_LargeStr1K_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_LARGEONEK_0100
     * @tc.desc   Test 1000-character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_LargeStr1K_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'a'.repeat(1000);
      expect(str1.length).assertEqual(1000);
    });

    /**
     * @tc.name   StringLength_LargeStr10K_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_LARGETENK_0100
     * @tc.desc   Test 10000-character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_LargeStr10K_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'a'.repeat(10000);
      expect(str1.length).assertEqual(10000);
    });

    /**
     * @tc.name   StringLength_LargeStr1M_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_LARGEONEM_0100
     * @tc.desc   Test 1000000-character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_LargeStr1M_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'a'.repeat(1000000);
      expect(str1.length).assertEqual(1000000);
    });

    /**
     * @tc.name   StringLength_MaxSafeInt_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_MAXSAFEINT_0100
     * @tc.desc   Test string length near Number.MAX_SAFE_INTEGER
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_MaxSafeInt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const maxLen: number = 2 ** 53 - 1;
      expect(Number.MAX_SAFE_INTEGER).assertEqual(maxLen);
    });

    /**
     * @tc.name   StringLength_IntBoundary_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_INTBOUNDARY_0100
     * @tc.desc   Test string lengths at 2^31 and 2^32 boundaries
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_IntBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const len1: number = 2 ** 31 - 1;
      const len2: number = 2 ** 32 - 1;
      expect(len1).assertEqual(2147483647);
      expect(len2).assertEqual(4294967295);
    });

    /**
     * @tc.name   StringLength_ModifyLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_MODIFYLENGTH_0100
     * @tc.desc   Modify length in strict mode, expect error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ModifyLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: ModifyLengthResult = stringLengthHelperTest.testModifylength();
      expect(result.isTypeError).assertEqual(false);
      expect(result.length).assertEqual(5);
      expect(result.content).assertEqual('hello');
    });

    /**
     * @tc.name   StringLength_ForInLoop_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_FORINLOOP_0100
     * @tc.desc   Test whether the length property appears in the for...in loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ForInLoop_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: boolean = stringLengthHelperTest.testForInLoop();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.name   StringLength_ObjectKeys_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_OBJECTKEYS_0100
     * @tc.desc   Test whether the length property appears in the Object.keys() result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ObjectKeys_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: ObjectKeysResult = stringLengthHelperTest.testObjectKeys();
      expect(result.hasLength).assertEqual(false);
      expect(result.keys.length).assertEqual(5);
      expect(result.keys[0]).assertEqual('0');
      expect(result.keys[1]).assertEqual('1');
      expect(result.keys[2]).assertEqual('2');
      expect(result.keys[3]).assertEqual('3');
      expect(result.keys[4]).assertEqual('4');
    });

    /**
     * @tc.name   StringLength_StrictDelete_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_STRICTDELETE_0100
     * @tc.desc   Attempt to delete the length property in strict mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_StrictDelete_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: StrictDeleteResult = stringLengthHelperTest.testStrictDeleteLength();
      expect(result.isTypeError).assertEqual(true);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_PropDescriptor_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_PROPDESCRIPTOR_0100
     * @tc.desc   View the full descriptor of the length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_PropDescriptor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: PropDescriptorResult = stringLengthHelperTest.testAllDeleteLength();
      expect(result.value).assertEqual(5);
      expect(result.writable).assertEqual(false);
      expect(result.enumerable).assertEqual(false);
      expect(result.configurable).assertEqual(false);
    });

    /**
     * @tc.name   StringLength_TraverseCharAt_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_TRAVERSECHARAT_0100
     * @tc.desc   Traverse the string by using the length property and charAt method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_TraverseCharAt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = stringLengthHelperTest.testTraverseString();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual('h');
      expect(result[1]).assertEqual('e');
      expect(result[2]).assertEqual('l');
      expect(result[3]).assertEqual('l');
      expect(result[4]).assertEqual('o');
    });

    /**
     * @tc.name   StringLength_ReverseStr_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_REVERSESTR_0100
     * @tc.desc   Implement string reversal using the length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ReverseStr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = stringLengthHelperTest.testReverseStringLength();
      expect(result).assertEqual('olleh');
    });

    /**
     * @tc.name   StringLength_LengthSlice_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_LENGTHSLICE_0100
     * @tc.desc   Use the length property as parameters for substring/slice methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_LengthSlice_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: LengthSliceResult = stringLengthHelperTest.testLengthSlice();
      expect(result.substringFull).assertEqual('hello world');
      expect(result.sliceFull).assertEqual('hello world');
      expect(result.substringPartial).assertEqual('world');
      expect(result.slicePartial).assertEqual('world');
    });

    /**
     * @tc.name   StringLength_SafeSubstr_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_SAFESUBSTR_0100
     * @tc.desc   Safe substring with length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_SafeSubstr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CaseTwoStrResult = stringLengthHelperTest.testSafeSubstr();
      expect(result.case1).assertEqual('hello');
      expect(result.case2).assertEqual('hel');
    });

    /**
     * @tc.name   StringLength_SplitCompare_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_SPLITCOMPARE_0100
     * @tc.desc   Compare str and split length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_SplitCompare_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CompareLengthResult = stringLengthHelperTest.testCompareLength();
      expect(result.strLength).assertEqual(5);
      expect(result.arrLength).assertEqual(3);
    });

    /**
     * @tc.name   StringLength_SplitEqual_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_SPLITEQUAL_0100
     * @tc.desc   Split char equals str length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_SplitEqual_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: SplitLengthResult = stringLengthHelperTest.testSplitLength();
      expect(result.strLength).assertEqual(5);
      expect(result.arrLength).assertEqual(5);
      expect(result.isRecovered).assertEqual(true);
    });

    /**
     * @tc.name   StringLength_FindLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_FINDLENGTH_0100
     * @tc.desc   Check find result with length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_FindLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: FindLengthResult = stringLengthHelperTest.testFindLength();
      expect(result.isIndexValid).assertEqual(true);
      expect(result.isFound).assertEqual(true);
    });

    /**
     * @tc.name   StringLength_CheckInclusion_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_CHECKINCLUSION_0100
     * @tc.desc   Check inclusion with length & indexOf
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_CheckInclusion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: InclusionResult = stringLengthHelperTest.testCheckInclusion();
      expect(result.hasWorld).assertEqual(true);
      expect(result.hasXyz).assertEqual(false);
    });

    /**
     * @tc.name   StringLength_TrimLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_TRIMLENGTH_0100
     * @tc.desc   Compare length before/after trim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_TrimLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: TrimLengthResult = stringLengthHelperTest.testTrimLength();
      expect(result.original).assertEqual(9);
      expect(result.trimmed).assertEqual(5);
      expect(result.trimStart).assertEqual(7);
      expect(result.trimEnd).assertEqual(7);
    });

    /**
     * @tc.name   StringLength_TrimEmpty_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_TRIMEMPTY_0100
     * @tc.desc   Check empty after trim with length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_TrimEmpty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: TrimEmptyResult = stringLengthHelperTest.testTrimEmpty();
      expect(result.allSpaces).assertEqual(true);
      expect(result.hasChar).assertEqual(false);
      expect(result.emptyStr).assertEqual(true);
    });

    /**
     * @tc.name   StringLength_RepeatLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_REPEATLENGTH_0100
     * @tc.desc   Test length after repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_RepeatLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: RepeatLengthResult = stringLengthHelperTest.testRepeatLength();
      expect(result.repeat3).assertEqual(6);
      expect(result.repeat0).assertEqual(0);
      expect(result.repeat5).assertEqual(10);
    });

    /**
     * @tc.name   StringLength_RepeatCalc_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_REPEATCALC_0100
     * @tc.desc   Verify repeat length = len × times
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_RepeatCalc_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: RepeatCalcResult = stringLengthHelperTest.testRepeatCalc();
      expect(result.repeatedLength).assertEqual(50);
      expect(result.isEqual).assertEqual(true);
    });

    /**
     * @tc.name   StringLength_PadLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_PADLENGTH_0100
     * @tc.desc   Test length after padStart/padEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_PadLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: PadLengthResult = stringLengthHelperTest.testPadLength();
      expect(result.padStart).assertEqual(10);
      expect(result.padEnd).assertEqual(10);
      expect(result.padStartWith).assertEqual(10);
      expect(result.padEndWith).assertEqual(10);
    });

    /**
     * @tc.name   StringLength_PadNoFill_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_PADNOFILL_0100
     * @tc.desc   No pad if target < length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_PadNoFill_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: PadNoFillResult = stringLengthHelperTest.testPadNoFill();
      expect(result.padStart).assertEqual(5);
      expect(result.padEnd).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_ReplaceLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_REPLACELENGTH_0100
     * @tc.desc   Test replace impact on length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ReplaceLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: ReplaceLengthResult = stringLengthHelperTest.testReplaceLength();
      expect(result.replace).assertEqual(8);
      expect(result.replaceFirst).assertEqual(12);
      expect(result.replaceAll).assertEqual(13);
    });

    /**
     * @tc.name   StringLength_EscapeLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_ESCAPELENGTH_0100
     * @tc.desc   Test escape char length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_EscapeLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: EscapeLengthResult = stringLengthHelperTest.testEscapeLength();
      expect(result.slashN).assertEqual(2);
      expect(result.newLine).assertEqual(1);
      expect(result.slashT).assertEqual(2);
      expect(result.tab).assertEqual(1);
      expect(result.doubleSlash).assertEqual(2);
      expect(result.singleSlash).assertEqual(1);
    });

    /**
     * @tc.name   StringLength_UnicodeLen_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_UNICODELEN_0100
     * @tc.desc   Test Unicode escape length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_UnicodeLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: UnicodeLenResult = stringLengthHelperTest.testUnicodeLen();
      expect(result.literalU).assertEqual(6);
      expect(result.charA).assertEqual(1);
      expect(result.literalEmoji).assertEqual(9);
      expect(result.emoji).assertEqual(2);
    });

    /**
     * @tc.name   StringLength_AsciiControl_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_ASCIICONTROL_0100
     * @tc.desc   Test ASCII control length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_AsciiControl_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: AsciiLenResult = stringLengthHelperTest.testAsciiLen();
      expect(result.nullChar).assertEqual(1);
      expect(result.hex00).assertEqual(1);
      expect(result.hex01).assertEqual(1);
      expect(result.hex1F).assertEqual(1);
      expect(result.hex7F).assertEqual(1);
    });

    /**
     * @tc.name   StringLength_ZeroWidthLen_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_ZEROWIDTHLEN_0100
     * @tc.desc   Test zero-width character length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ZeroWidthLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('\u200B'.length).assertEqual(1);
      expect('\u200C'.length).assertEqual(1);
      expect('\u200D'.length).assertEqual(1);
      expect('\uFEFF'.length).assertEqual(1);
    });

    /**
     * @tc.name   StringLength_HtmlEntity_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_HTMLENTITY_0100
     * @tc.desc   Test length of HTML entity strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_HtmlEntity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('&lt;'.length).assertEqual(4);
      expect('<'.length).assertEqual(1);
      expect('&amp;'.length).assertEqual(5);
      expect('&'.length).assertEqual(1);
      expect('&#65;'.length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_CurrencySymbol_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_CURRENCYSYMBOL_0100
     * @tc.desc   Test currency symbol length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_CurrencySymbol_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('$'.length).assertEqual(1);
      expect('€'.length).assertEqual(1);
      expect('£'.length).assertEqual(1);
      expect('¥'.length).assertEqual(1);
      expect('₹'.length).assertEqual(1);
      expect('₽'.length).assertEqual(1);
    });

    /**
     * @tc.name   StringLength_StrLiteral_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_STRLITERAL_0100
     * @tc.desc   Test string literal length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_StrLiteral_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('hello'.length).assertEqual(5);
      expect('hello'.length).assertEqual(5);
      expect(`hello`.length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_StrConstructor_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_STRCONSTRUCTOR_0100
     * @tc.desc   Test String constructor length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_StrConstructor_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(String('hello').length).assertEqual(5);
      expect(String(123).length).assertEqual(3);
      expect(String(true).length).assertEqual(4);
      expect(String(null).length).assertEqual(4);
      expect(String(undefined).length).assertEqual(9);
    });

    /**
     * @tc.name   StringLength_StrObject_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_STROBJECT_0100
     * @tc.desc   Test String object length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_StrObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('hello');
      expect(strObj.length).assertEqual(5);
      expect(strObj.valueOf().length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_NumStr_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_NUMSTR_0100
     * @tc.desc   Test length of converted number strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_NumStr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(String(0).length).assertEqual(1);
      expect(String(123).length).assertEqual(3);
      expect(String(3.14).length).assertEqual(4);
      expect(String(-123).length).assertEqual(4);
      expect(String(1e10).length).assertEqual(11);
      expect(String(Infinity).length).assertEqual(8);
      expect(String(NaN).length).assertEqual(3);
    });

    /**
     * @tc.name   StringLength_BoolStr_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_BOOLSTR_0100
     * @tc.desc   Test length of boolean strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_BoolStr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(String(true).length).assertEqual(4);
      expect(String(false).length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_ObjStr_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_OBJSTR_0100
     * @tc.desc   Test length of object strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ObjStr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const objEmpty: object = new Object();
      const objA: object = new Object();
      const arr123: int[] = [1, 2, 3];
      const arrEmpty: int[] = [];
      const arr1: int[] = [1];
      expect(String(objEmpty).length).assertEqual(15);
      expect(String(objA).length).assertEqual(15);
      expect(String(arr123).length).assertEqual(5);
      expect(String(arrEmpty).length).assertEqual(0);
      expect(String(arr1).length).assertEqual(1);
    });

    /**
     * @tc.name   StringLength_NullUndefined_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_NULLUNDEFINED_0100
     * @tc.desc   Test length of null & undefined strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_NullUndefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(String(null).length).assertEqual(4);
      expect(String(undefined).length).assertEqual(9);
    });

    /**
     * @tc.name   StringLength_ForOfIter_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_FOROFITER_0100
     * @tc.desc   Test iteration count vs length via for...of
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ForOfIter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello';
      let count: number = 0;
      for (const ch of str) {
        count++;
      }
      expect(count).assertEqual(5);
      expect(str.length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_SurrogatePairForOf_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_SURROGATEPAIRFOROF_0100
     * @tc.desc   Iteration count differs from length for surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_SurrogatePairForOf_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '😄hello';
      let count: number = 0;
      for (const ch of str) {
        count++;
      }
      expect(str.length).assertEqual(7);
      expect(count).assertEqual(6);
    });

    /**
     * @tc.name   StringLength_SpreadLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_SPREADLENGTH_0100
     * @tc.desc   Compare length with spread operator array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_SpreadLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: SpreadLengthResult = stringLengthHelperTest.testSpreadLength();
      expect(result.strLength).assertEqual(5);
      expect(result.arrLength).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_SurrogatePairSpread_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_SURROGATEPAIRSPREAD_0100
     * @tc.desc   Array length differs from string length with surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_SurrogatePairSpread_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: SpreadLengthResult = stringLengthHelperTest.testSurrogateLength();
      expect(result.strLength).assertEqual(4);
      expect(result.arrLength).assertEqual(4);
    });

    /**
     * @tc.name   StringLength_ArrayFrom_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_ARRAYFROM_0100
     * @tc.desc   Convert string with Array.from
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ArrayFrom_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello';
      const arr: string[] = Array.from(str);
      expect(str.length).assertEqual(5);
      expect(arr.length).assertEqual(5);
      expect(arr.join('')).assertEqual('hello');
    });

    /**
     * @tc.name   StringLength_CountCharsForOf_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_COUNTCHARSFOROF_0100
     * @tc.desc   Count chars with for...of
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_CountCharsForOf_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CountCharsResult = stringLengthHelperTest.testCountChars();
      expect(result.hello).assertEqual(5);
      expect(result.emoji).assertEqual(2);
    });

    /**
     * @tc.name   StringLength_AccessByIndex_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_ACCESSBYINDEX_0100
     * @tc.desc   Access chars with index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_AccessByIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: AccessByIndexResult = stringLengthHelperTest.testAccessByIndex();
      expect(result.firstChar).assertEqual('h');
      expect(result.lastChar).assertEqual('o');
      expect(result.middleChar).assertEqual('l');
    });

    /**
     * @tc.name   StringLength_BoundaryIndex_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_BOUNDARYINDEX_0100
     * @tc.desc   Access boundary indexes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_BoundaryIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: BoundaryIndexResult = stringLengthHelperTest.testBoundaryIndex();
      expect(result.firstIndex).assertEqual('h');
      expect(result.beyondLastIndex).assertEqual(undefined);
      expect(result.lastIndex).assertEqual('o');
      expect(result.negativeIndex).assertEqual(undefined);
    });

    /**
     * @tc.name   StringLength_ReverseIter_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_REVERSEITER_0100
     * @tc.desc   Traverse string in reverse order using length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ReverseIter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = stringLengthHelperTest.testReverseIter();
      expect(result).assertEqual('olleh');
    });

    /**
     * @tc.name   StringLength_ConcatPlus_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_CONCATPLUS_0100
     * @tc.desc   Test length after concatenation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ConcatPlus_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'hello';
      const str2: string = 'world';
      const result: string = str1 + ' ' + str2;
      expect(str1.length).assertEqual(5);
      expect(str2.length).assertEqual(5);
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.name   StringLength_ConcatMethod_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_CONCATMETHOD_0100
     * @tc.desc   Test string concatenation using concat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ConcatMethod_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello';
      const result: string = str.concat(' ', 'world');
      expect(result.length).assertEqual(11);
      expect(str.length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_TemplateLiteral_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_TEMPLATELITERAL_0100
     * @tc.desc   Test string concatenation using template literals
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_TemplateLiteral_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const a: string = 'hello';
      const b: string = 'world';
      const result: string = `${a} ${b}`;
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.name   StringLength_ArrayJoin_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_ARRAYJOIN_0100
     * @tc.desc   Test length of string joined from array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ArrayJoin_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: string[] = ['h', 'e', 'l', 'l', 'o'];
      const str: string = arr.join('');
      expect(str.length).assertEqual(5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.name   StringLength_JoinSeparator_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_JOINSEPARATOR_0100
     * @tc.desc   Test length with separator join
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_JoinSeparator_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const arr: string[] = ['a', 'b', 'c'];
      const str: string = arr.join(',');
      expect(str).assertEqual('a,b,c');
      expect(str.length).assertEqual(5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.name   StringLength_ValidLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_VALIDLENGTH_0100
     * @tc.desc   Verify string length within specified range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ValidLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CaseTwoBoolResult = stringLengthHelperTest.testValidLength();
      expect(result.case1).assertEqual(true);
      expect(result.case2).assertEqual(false);
      expect(result.case3).assertEqual(false);
    });

    /**
     * @tc.name   StringLength_EmptyByLength_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_EMPTYBYLENGTH_0100
     * @tc.desc   Check if string is empty using length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_EmptyByLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CaseTwoBoolResult = stringLengthHelperTest.testEmptyByLength();
      expect(result.case1).assertEqual(true);
      expect(result.case2).assertEqual(false);
      expect(result.case3).assertEqual(true);
    });

    /**
     * @tc.name   StringLength_Truncate_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_TRUNCATE_0100
     * @tc.desc   Truncate string based on length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_Truncate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CaseTwoStrResult = stringLengthHelperTest.testTruncate();
      expect(result.case1).assertEqual('hello...');
      expect(result.case2).assertEqual('hi');
    });

    /**
     * @tc.name   StringLength_SafeSubstring_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_SAFESUBSTRING_0100
     * @tc.desc   Ensure safe substring extraction using length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_SafeSubstring_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CaseTwoStrResult = stringLengthHelperTest.testSafeSubstring();
      expect(result.case1).assertEqual('ell');
      expect(result.case2).assertEqual('llo');
    });

    /**
     * @tc.name   StringLength_LeftPad_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_LEFTPAD_0100
     * @tc.desc   Manual implementation of left padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_LeftPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CaseTwoStrResult = stringLengthHelperTest.testLeftPad();
      expect(result.case1).assertEqual('005');
      expect(result.case2).assertEqual('     hello');
    });

    /**
     * @tc.name   StringLength_RightPad_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_RIGHTPAD_0100
     * @tc.desc   Manual implementation of right padding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_RightPad_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CaseTwoStrResult = stringLengthHelperTest.testRightPad();
      expect(result.case1).assertEqual('500');
      expect(result.case2).assertEqual('hello     ');
    });

    /**
     * @tc.name   StringLength_FormatFixed_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_FORMATFIXED_0100
     * @tc.desc   Implement fixed width formatting using length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_FormatFixed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CaseTwoStrResult = stringLengthHelperTest.testFormatFixed();
      expect(result.case1).assertEqual('hello     ');
      expect(result.case2).assertEqual('hello');
    });

    /**
     * @tc.name   StringLength_CenterAlign_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_CENTERALIGN_0100
     * @tc.desc   Implement string center alignment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_CenterAlign_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CenterResult = stringLengthHelperTest.testCenter();
      expect(result.case1).assertEqual('    hi    ');
    });

    /**
     * @tc.name   StringLength_CountWords_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_COUNTWORDS_0100
     * @tc.desc   Count words by combining length and split
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_CountWords_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: CountWordsResult = stringLengthHelperTest.testCountWords();
      expect(result.case1).assertEqual(2);
      expect(result.case2).assertEqual(0);
      expect(result.case3).assertEqual(0);
    });

    /**
     * @tc.name   StringLength_LengthProcess_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_LENGTHPROCESS_0100
     * @tc.desc   Compare length before and after processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_LengthProcess_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: LengthCompareResult = stringLengthHelperTest.testLengthCompare();
      expect(result.originalLen).assertEqual(17);
      expect(result.normalizedLen).assertEqual(11);
    });

    /**
     * @tc.name   StringLength_ConstructorLen_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_CONSTRUCTORLEN_0100
     * @tc.desc   Distinguish between length of String constructor and string instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_ConstructorLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const primitive: string = 'hello';
      const boxed: String = new String('hello');
      expect(primitive.length).assertEqual(5);
      expect(boxed.length).assertEqual(5);
      expect(String(123).length).assertEqual(3);
    });

    /**
     * @tc.name   StringLength_StaticMethodLen_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_STATICMETHODLEN_0100
     * @tc.desc   String.length represents the number of parameters the String function expects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_StaticMethodLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(String.fromCharCode(65).length).assertEqual(1);
      expect(String.fromCharCode(65, 66).length).assertEqual(2);
      expect(String(12345).length).assertEqual(5);
      expect(String(true).length).assertEqual(4);
    });

    /**
     * @tc.name   StringLength_TagFunctionLen_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_TAGFUNCTIONLEN_0100
     * @tc.desc   Use length in tag function
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_TagFunctionLen_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: TagFunctionResult = stringLengthHelperTest.testLengthInTagFunction();
      expect(result.stringsLength).assertEqual(3);
      expect(result.valuesLength).assertEqual(2);
    });

    /**
     * @tc.name   StringLength_StringRaw_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_STRINGRAW_0100
     * @tc.desc   Use String.raw and length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_StringRaw_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'hello\nworld';
      const str2: string = 'hello\\nworld';
      expect(str1.length).assertEqual(11);
      expect(str2.length).assertEqual(12);
    });

    /**
     * @tc.name   StringLength_JsonStringify_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_JSONSTRINGIFY_0100
     * @tc.desc   Compare the length before and after serialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_JsonStringify_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello "world"';
      const json: string = JSON.stringify(str);
      expect(str.length).assertEqual(13);
      expect(json.length).assertEqual(17);
    });

    /**
     * @tc.name   StringLength_JsonParse_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_JSONPARSE_0100
     * @tc.desc   Test the length after JSON parsing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_JsonParse_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: JsonParseLengthResult = stringLengthHelperTest.testJsonParseLength();
      expect(result.jsonLength).assertEqual(14);
      expect(result.parsedLength).assertEqual(11);
    });

    /**
     * @tc.name   StringLength_RegexMatch_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_REGEXMATCH_0100
     * @tc.desc   Use length to determine the match result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_RegexMatch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello world';
      const pattern: RegExp = new RegExp('o', 'g');
      const matches: RegExpMatchArray | null = str.match(pattern);
      const matchCount: number = matches !== null ? matches.length : 0;
      expect(matchCount).assertEqual(2);
    });

    /**
     * @tc.name   StringLength_RegexReplace_001
     * @tc.number SUB_BUILTINS_STRING_LENGTH_REGEXREPLACE_0100
     * @tc.desc   Count the number of replacements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLength_RegexReplace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello world';
      let count: number = 0;
      const pattern: RegExp = new RegExp('o', 'g');
      const result: string = str.replace(pattern, (): string => {
        count++;
        return 'O';
      });
      expect(count).assertEqual(2);
      expect(result.length).assertEqual(11);
    });

  });
}
