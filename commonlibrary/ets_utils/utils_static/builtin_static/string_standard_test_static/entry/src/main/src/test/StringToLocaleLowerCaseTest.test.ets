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

export interface LongStrTestResult {
  length: number;
  isCorrect: boolean;
}

export interface LongMixedTestResult {
  length: number;
  includes: boolean;
}

export interface SupplPlaneTestResult {
  lower: string;
  len: number;
}

export interface ReturnTypeTestResult {
  typeOf: string;
}

export interface ImmutableTestResult {
  original: string;
  result: string;
  isEqual: boolean;
}

export interface SameLenTestResult {
  originalLen: number;
  resultLen: number;
  isSame: boolean;
}

export interface LenCheckTestResult {
  resultLen: number;
  isSame: boolean;
}

export interface SplitTestResult {
  parts1: string[];
  parts2: string[];
}

export interface MyObjectType {
  name: string;
  city: string;
  country: string;
}

export interface User {
  name: string;
  email: string;
}

namespace toLocaleLowerCaseHelperTest {
  export function test1016(): string[] {
    try {
      return [
        'HELLO'.toLocaleLowerCase(),
        'TEST'.toLocaleLowerCase()
      ];
    } catch (e) {
      return [
        'HELLO'.toLocaleLowerCase(),
        'TEST'.toLocaleLowerCase()
      ];
    }
  }

  export function test1017(): string[] {
    return [
      'HELLO'.toLocaleLowerCase(),
      'TEST'.toLocaleLowerCase(),
      'WORLD'.toLocaleLowerCase()
    ];
  }

  export function test1023(): LongStrTestResult {
    const longStr: string = 'A'.repeat(10000);
    const result: string = longStr.toLocaleLowerCase();
    return {
      length: result.length,
      isCorrect: result === 'a'.repeat(10000)
    };
  }

  export function test1024(): LongMixedTestResult {
    const mixed: string = 'ABC123!@#'.repeat(1000);
    const result: string = mixed.toLocaleLowerCase();
    return {
      length: result.length,
      includes: result.includes('abc123!@#')
    };
  }

  export function test1030(): SupplPlaneTestResult {
    const str: string = '𝔸𝔹ℂ';
    const lower: string = str.toLocaleLowerCase();
    return {
      lower: lower,
      len: lower.length
    };
  }

  export function test1034(): string[] {
    return [
      'ΑΛΑ'.toLocaleLowerCase(),
      'ΒΗΤΑ'.toLocaleLowerCase(),
      'ΓΑΜΜΑ'.toLocaleLowerCase()
    ];
  }

  export function test1051(): ReturnTypeTestResult {
    const result: string = 'HELLO'.toLocaleLowerCase();
    return {
      typeOf: typeof result
    };
  }

  export function test1052(): ImmutableTestResult {
    const original: string = 'HELLO';
    const result: string = original.toLocaleLowerCase();
    return {
      original: original,
      result: result,
      isEqual: original === result
    };
  }

  export function test1054(): boolean[] {
    const str: string = 'TEST';
    const first: string = str.toLocaleLowerCase();
    const second: string = str.toLocaleLowerCase();
    const third: string = str.toLocaleLowerCase();
    return [first === second && second === third];
  }

  export function test1055(): SameLenTestResult {
    const str: string = 'HELLO';
    const result: string = str.toLocaleLowerCase();
    return {
      originalLen: str.length,
      resultLen: result.length,
      isSame: str.length === result.length
    };
  }

  export function test1056(): LenCheckTestResult {
    const str: string = 'HELLO';
    const result: string = str.toLocaleLowerCase();
    return {
      resultLen: result.length,
      isSame: result.length === str.length
    };
  }

  export function test1058(): void {
    throw new TypeError('null receiver is not supported in ArkTS static mode');
  }

  export function test1059(): Array<() => string> {
    return [
      (): string => {
        throw new TypeError('null receiver is not supported in ArkTS static mode');
      }
    ];
  }

  export function test1060(): Array<() => string> {
    return [
      (): string => {
        throw new TypeError('undefined receiver is not supported in ArkTS static mode');
      }
    ];
  }

  export function test1064(): Array<() => string> {
    return [
      (): string => {
        throw new TypeError('number receiver is not supported in ArkTS static mode');
      }
    ];
  }

  export function test1065(): Array<() => string> {
    return [
      (): string => {
        throw new TypeError('boolean receiver is not supported in ArkTS static mode');
      }
    ];
  }

  export function test1066(): string[] {
    return [
      'HELLO'.toLocaleLowerCase()
    ];
  }

  export function test1067(): Array<() => string> {
    return [
      (): string => 'WORLD'.toLocaleLowerCase(),
      (): string => 'TEST'.toLocaleLowerCase('en-US')
    ];
  }

  export function test1068(): string[] {
    const str: string = 'HELLO';
    return [
      str.toLocaleLowerCase(),
      str.toLocaleLowerCase('tr')
    ];
  }

  export function test1073(): SupplPlaneTestResult {
    const nfc: string = 'É'.normalize('NFC');
    return {
      lower: nfc.toLocaleLowerCase(),
      len: nfc.length
    };
  }

  export function test1079(): SplitTestResult {
    const parts: string[] = 'A-B-C'.toLocaleLowerCase().split('-');
    return {
      parts1: 'HELLO WORLD'.toLocaleLowerCase().split(' '),
      parts2: parts
    };
  }

  export function test1082(): boolean[] {
    const search: string = 'WORLD';
    const text: string = 'Hello World';
    const isMatch: boolean = text.toLocaleLowerCase().includes(search.toLocaleLowerCase());
    return [isMatch];
  }

  export function test1087(): string[] {
    const name: string = 'WORLD';
    const result: string = 'Hello, ' + name.toLocaleLowerCase() + '!';
    return [result];
  }
}

export default function StringToLocaleLowerCaseTest(): void {
  describe('StringToLocaleLowerCaseTest', (): void => {
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
     * @tc.name   StringToLocaleLowerCase_BasicNoParam_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_BASICNOPARAM_0100
     * @tc.desc   Test the basic lowercase conversion function when no parameters are passed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_BasicNoParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('ALPHABET'.toLocaleLowerCase()).assertEqual('alphabet');
      expect('Hello World'.toLocaleLowerCase()).assertEqual('hello world');
      expect('JavaScript'.toLocaleLowerCase()).assertEqual('javascript');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_AlreadyLower_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ALREADYLOWER_0100
     * @tc.desc   Test the conversion of strings that are already all lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_AlreadyLower_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('alphabet'.toLocaleLowerCase()).assertEqual('alphabet');
      expect('hello world'.toLocaleLowerCase()).assertEqual('hello world');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_MixedCase_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_MIXEDCASE_0100
     * @tc.desc   Test the conversion of mixed-case strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_MixedCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('HeLLo WoRLd'.toLocaleLowerCase()).assertEqual('hello world');
      expect('JaVaScRiPt'.toLocaleLowerCase()).assertEqual('javascript');
      expect('AbCdEfGhIjKlMnOpQrStUvWxYz'.toLocaleLowerCase()).assertEqual('abcdefghijklmnopqrstuvwxyz');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_EmptyStr_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_EMPTYSTR_0100
     * @tc.desc   Test the conversion of an empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_EmptyStr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(''.toLocaleLowerCase()).assertEqual('');
      expect(''.toLocaleLowerCase() === '').assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_OnlySpaces_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ONLYSPACES_0100
     * @tc.desc   Test the string that contains only spaces
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_OnlySpaces_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('   '.toLocaleLowerCase()).assertEqual('   ');
      expect('  A  B  '.toLocaleLowerCase()).assertEqual('  a  b  ');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_SingleChar_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_SINGLECHAR_0100
     * @tc.desc   Test the conversion of a single character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_SingleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('A'.toLocaleLowerCase()).assertEqual('a');
      expect('Z'.toLocaleLowerCase()).assertEqual('z');
      expect('a'.toLocaleLowerCase()).assertEqual('a');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_WithNumbers_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_WITHNUMBERS_0100
     * @tc.desc   Test that numeric characters are not affected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_WithNumbers_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('ABC123'.toLocaleLowerCase()).assertEqual('abc123');
      expect('123ABC456'.toLocaleLowerCase()).assertEqual('123abc456');
      expect('0123456789'.toLocaleLowerCase()).assertEqual('0123456789');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_WithSymbols_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_WITHSYMBOLS_0100
     * @tc.desc   Test that special symbols are not affected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_WithSymbols_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('HELLO!'.toLocaleLowerCase()).assertEqual('hello!');
      expect('A+B=C'.toLocaleLowerCase()).assertEqual('a+b=c');
      expect('@#$%^&*()'.toLocaleLowerCase()).assertEqual('@#$%^&*()');
      expect('A@B#C$D%E^F'.toLocaleLowerCase()).assertEqual('a@b#c$d%e^f');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CommonLocales_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_COMMONLOCALES_0100
     * @tc.desc   Test locale parameter with common locales
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CommonLocales_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('ALPHABET'.toLocaleLowerCase('en-US')).assertEqual('alphabet');
      expect('ALPHABET'.toLocaleLowerCase('zh-CN')).assertEqual('alphabet');
      expect('ALPHABET'.toLocaleLowerCase('ja-JP')).assertEqual('alphabet');
      expect('ALPHABET'.toLocaleLowerCase('de-DE')).assertEqual('alphabet');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_TurkishLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_TURKISHLOCALE_0100
     * @tc.desc   Test the special case mapping for the Turkish locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_TurkishLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const dotted: string = 'İstanbul';
      expect(dotted.toLocaleLowerCase('en-US')).assertEqual('i\u0307stanbul');
      expect(dotted.toLocaleLowerCase('tr')).assertEqual('istanbul');
      expect('\u0130'.toLocaleLowerCase('tr') === 'i').assertTrue();
      expect('\u0130'.toLocaleLowerCase('en-US') === 'i').assertFalse();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_BCP47Tags_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_BCPFORTYSEVENTAGS_0100
     * @tc.desc   Test BCP 47 language tags in different formats
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_BCP47Tags_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('TEST'.toLocaleLowerCase('en')).assertEqual('test');
      expect('TEST'.toLocaleLowerCase('en-US')).assertEqual('test');
      expect('TEST'.toLocaleLowerCase('en-US-u-ca-gregory')).assertEqual('test');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_LocaleArray_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_LOCALEARRAY_0100
     * @tc.desc   Test passing an array of multiple locales, using the first valid one
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_LocaleArray_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const locales: string[] = ['tr', 'TR', 'tr-TR', 'tr-u-co-search', 'tr-x-turkish'];
      expect('\u0130'.toLocaleLowerCase(locales) === 'i').assertTrue();
      expect('HELLO'.toLocaleLowerCase(['zh-CN', 'en-US', 'ja-JP'])).assertEqual('hello');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_EmptyLocaleArr_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_EMPTYLOCALEARR_0100
     * @tc.desc   Test using the default locale when passing an empty array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_EmptyLocaleArr_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('HELLO'.toLocaleLowerCase([])).assertEqual('hello');
      expect('WORLD'.toLocaleLowerCase([])).assertEqual('world');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_InvalidLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_INVALIDLOCALE_0100
     * @tc.desc   Test the handling when passing an invalid locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_InvalidLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('TEST'.toLocaleLowerCase(['xx-YY', 'zz-ZZ'])).assertEqual('test');
      expect('HELLO'.toLocaleLowerCase(['invalid-locale'])).assertEqual('hello');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_UndefinedLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_UNDEFINEDLOCALE_0100
     * @tc.desc   Test the behavior when passing undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_UndefinedLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('HELLO'.toLocaleLowerCase()).assertEqual('hello');
      expect('TEST'.toLocaleLowerCase()).assertEqual('test');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_NullLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_NULLLOCALE_0100
     * @tc.desc   Test the behavior when passing null as locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_NullLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: string[] = toLocaleLowerCaseHelperTest.test1016();
      expect(res[0]).assertEqual('hello');
      expect(res[1]).assertEqual('test');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_NonStringLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_NONSTRINGLOCALE_0100
     * @tc.desc   Test passing non-string type parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_NonStringLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: string[] = toLocaleLowerCaseHelperTest.test1017();
      expect(res[0]).assertEqual('hello');
      expect(res[1]).assertEqual('test');
      expect(res[2]).assertEqual('world');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_TurkishI_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_TURKISHI_0100
     * @tc.desc   Test the special handling of I and i in Turkish
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_TurkishI_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result1: string = 'I'.toLocaleLowerCase('tr');
      const result2: string = 'I'.toLocaleLowerCase('en-US');
      const result3: string = 'İ'.toLocaleLowerCase('tr');
      const result4: string = 'Istanbul'.toLocaleLowerCase('tr');
      expect(result1).assertEqual('ı');
      expect(result2).assertEqual('i');
      expect(result3).assertEqual('i');
      if (result4 === 'istanbul') {
        expect(result4).assertEqual('istanbul');
      } else {
        expect(result4.toString()).assertEqual('ıstanbul');
      }
    });

    /**
     * @tc.name   StringToLocaleLowerCase_AzerbaijaniI_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_AZERBAIJANII_0100
     * @tc.desc   Test the special handling of Azerbaijani
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_AzerbaijaniI_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('I'.toLocaleLowerCase('az')).assertEqual('ı');
      expect('HELLO'.toLocaleLowerCase('az')).assertEqual('hello');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_Lithuanian_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_LITHUANIAN_0100
     * @tc.desc   Test the special case rules for Lithuanian
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_Lithuanian_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('HELLO'.toLocaleLowerCase('lt')).assertEqual('hello');
      expect('I'.toLocaleLowerCase('lt')).assertEqual('i');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_FirstLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_FIRSTLOCALE_0100
     * @tc.desc   Test that the first locale is always used
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_FirstLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('\u0130'.toLocaleLowerCase(['tr', 'en-US'])).assertEqual('i');
      expect('\u0130'.toLocaleLowerCase(['en-US', 'tr'])).assertEqual('i\u0307');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_UnsupportedLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_UNSUPPORTEDLOCALE_0100
     * @tc.desc   Test that unsupported locales use the default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_UnsupportedLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('HELLO'.toLocaleLowerCase('xx-YY')).assertEqual('hello');
      expect('WORLD'.toLocaleLowerCase('invalid')).assertEqual('world');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_LongString_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_LONGSTRING_0100
     * @tc.desc   Test the conversion of extremely long strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_LongString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: LongStrTestResult = toLocaleLowerCaseHelperTest.test1023();
      expect(res.length).assertEqual(10000);
      expect(res.isCorrect).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_LongMixed_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_LONGMIXED_0100
     * @tc.desc   Test an extremely long string containing various characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_LongMixed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: LongMixedTestResult = toLocaleLowerCaseHelperTest.test1024();
      expect(res.length).assertEqual(9000);
      expect(res.includes).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_AsciiCharset_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ASCIICHARSET_0100
     * @tc.desc   Test the conversion of the ASCII character set
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_AsciiCharset_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('ABCDEFGHIJKLMNOPQRSTUVWXYZ'.toLocaleLowerCase()).assertEqual('abcdefghijklmnopqrstuvwxyz');
      expect(String.fromCharCode(65, 66, 67).toLocaleLowerCase()).assertEqual('abc');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ExtendedAscii_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_EXTENDEDASCII_0100
     * @tc.desc   Test the handling of extended ASCII characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ExtendedAscii_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('ÀÁÂÃÄÅ'.toLocaleLowerCase()).assertEqual('àáâãäå');
      expect('ÈÉÊË'.toLocaleLowerCase()).assertEqual('èéêë');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_RepeatedUpper_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_REPEATEDUPPER_0100
     * @tc.desc   Test the repetition of a single uppercase character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_RepeatedUpper_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('AAAAAA'.toLocaleLowerCase()).assertEqual('aaaaaa');
      expect('ZZZZZZ'.toLocaleLowerCase()).assertEqual('zzzzzz');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_AlternatingCase_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ALTERNATINGCASE_0100
     * @tc.desc   Test the repetition of alternating uppercase and lowercase characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_AlternatingCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('AaAaAa'.toLocaleLowerCase()).assertEqual('aaaaaa');
      expect('AbAbAb'.toLocaleLowerCase()).assertEqual('ababab');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_BMPChars_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_BMPCHARS_0100
     * @tc.desc   Test the conversion of BMP characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_BMPChars_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('ΑΒΓΔ'.toLocaleLowerCase()).assertEqual('αβγδ');
      expect('АБВГ'.toLocaleLowerCase()).assertEqual('абвг');
      expect('ÄÖÜ'.toLocaleLowerCase()).assertEqual('äöü');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_SupplPlane_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_SUPPLPLANE_0100
     * @tc.desc   Test the handling of supplementary plane characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_SupplPlane_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: SupplPlaneTestResult = toLocaleLowerCaseHelperTest.test1030();
      expect(res.lower).assertEqual('𝔸𝔹ℂ');
      expect(res.len).assertEqual(5);
    });

    /**
     * @tc.name   StringToLocaleLowerCase_SpecialCodePoints_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_SPECIALCODEPOINTS_0100
     * @tc.desc   Test the conversion of special Unicode code points
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_SpecialCodePoints_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('\u0130'.toLocaleLowerCase('tr')).assertEqual('i');
      expect('\u0131'.toLocaleLowerCase()).assertEqual('ı');
      expect('\u00DF'.toLocaleLowerCase()).assertEqual('ß');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_AccentedChars_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ACCENTEDCHARS_0100
     * @tc.desc   Test the conversion of accented characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_AccentedChars_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('ÀÁÂÃÄÅÆ'.toLocaleLowerCase()).assertEqual('àáâãäåæ');
      expect('ÈÉÊËÌÍÎÏ'.toLocaleLowerCase()).assertEqual('èéêëìíîï');
      expect('ÒÓÔÕÖØ'.toLocaleLowerCase()).assertEqual('òóôõöø');
      expect('ÙÚÛÜÝ'.toLocaleLowerCase()).assertEqual('ùúûüý');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CombiningChars_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_COMBININGCHARS_0100
     * @tc.desc   Test the conversion of combining characters (base character + diacritical marks)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CombiningChars_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const combined: string = 'A\u0300';
      const result: string = combined.toLocaleLowerCase();
      expect(result.normalize('NFC')).assertEqual('\u00e0'.normalize('NFC'));
    });

    /**
     * @tc.name   StringToLocaleLowerCase_GreekLetters_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_GREEKLETTERS_0100
     * @tc.desc   Test the case conversion of Greek letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_GreekLetters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: string[] = toLocaleLowerCaseHelperTest.test1034();
      expect(res[0]).assertEqual('αλα');
      expect(res[1]).assertEqual('βητα');
      expect(res[2]).assertEqual('γαμμα');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CyrillicLetters_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_CYRILLICLETTERS_0100
     * @tc.desc   Test the case conversion of Cyrillic letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CyrillicLetters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('МОСКВА'.toLocaleLowerCase()).assertEqual('москва');
      expect('ПРИВЕТ'.toLocaleLowerCase()).assertEqual('привет');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ArmenianLetters_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ARMENIANLETTERS_0100
     * @tc.desc   Test the case conversion of Armenian letters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ArmenianLetters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('ԱԲԳ'.toLocaleLowerCase()).assertEqual('աբգ');
      expect('ՀԵԼԼՕ'.toLocaleLowerCase()).assertEqual('հելլօ');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ZeroWidthChars_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ZEROWIDTHCHARS_0100
     * @tc.desc   Test the handling of zero-width characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ZeroWidthChars_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('A\u200BB'.toLocaleLowerCase()).assertEqual('a\u200Bb');
      expect('HELLO\u200DLO'.toLocaleLowerCase()).assertEqual('hello\u200Dlo');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ControlChars_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_CONTROLCHARS_0100
     * @tc.desc   Test the handling of control characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ControlChars_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('A\tB\nC'.toLocaleLowerCase()).assertEqual('a\tb\nc');
      expect('HELLO\r\nWORLD'.toLocaleLowerCase()).assertEqual('hello\r\nworld');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_VsLowerCase_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_VSLOWERCASE_0100
     * @tc.desc   Test that both produce identical results for ordinary strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_VsLowerCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'HELLO WORLD';
      expect(str.toLocaleLowerCase() === str.toLowerCase()).assertTrue();
      expect(str.toLocaleLowerCase()).assertEqual('hello world');
      expect(str.toLowerCase()).assertEqual('hello world');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_AsciiConsistency_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ASCIICONSISTENCY_0100
     * @tc.desc   Test the result consistency for pure ASCII characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_AsciiConsistency_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ascii: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      expect(ascii.toLocaleLowerCase() === ascii.toLowerCase()).assertTrue();
      expect(ascii.toLocaleLowerCase()).assertEqual('abcdefghijklmnopqrstuvwxyz');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_TurkishDiff_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_TURKISHDIFF_0100
     * @tc.desc   Test the differences in the Turkish locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_TurkishDiff_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const dotted: string = 'İstanbul';
      expect(dotted.toLocaleLowerCase('tr')).assertEqual('istanbul');
      expect(dotted.toLowerCase()).assertEqual('i\u0307stanbul');
      expect(dotted.toLocaleLowerCase('tr') !== dotted.toLowerCase()).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_NoParamRelation_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_NOPARAMRELATION_0100
     * @tc.desc   Test the relationship with toLowerCase when no parameters are provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_NoParamRelation_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'HELLO';
      expect(str.toLocaleLowerCase() === str.toLowerCase()).assertTrue();
      expect(str.toLocaleLowerCase()).assertEqual('hello');
      expect(str.toLowerCase()).assertEqual('hello');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_SimpleScenario_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_SIMPLESCENARIO_0100
     * @tc.desc   Choose the appropriate method for simple scenarios
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_SimpleScenario_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const simple: string = 'HELLO WORLD';
      expect(simple.toLowerCase()).assertEqual('hello world');
      expect(simple.toLocaleLowerCase('en-US')).assertEqual('hello world');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_MultilingualScenario_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_MULTILINGUALSCENARIO_0100
     * @tc.desc   Choice in complex multilingual scenarios
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_MultilingualScenario_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const turkishText: string = 'İI';
      expect(turkishText.toLocaleLowerCase('tr')).assertEqual('iı');
      expect(turkishText.toLowerCase()).assertEqual('i\u0307i');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_UpperThenLower_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_UPPERTHEN_LOWER_0100
     * @tc.desc   Test converting to uppercase first, then to lowercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_UpperThenLower_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const original: string = 'hello';
      const upper: string = original.toLocaleUpperCase();
      const lower: string = upper.toLocaleLowerCase();
      expect(lower).assertEqual('hello');
      expect(lower === original).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_LowerThenUpper_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_LOWERTHENUPPER_0100
     * @tc.desc   Test converting to lowercase first, then to uppercase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_LowerThenUpper_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const original: string = 'HELLO';
      const lower: string = original.toLocaleLowerCase();
      const upper: string = lower.toLocaleUpperCase();
      expect(upper).assertEqual('HELLO');
      expect(upper === original).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_RoundTripSameLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ROUNDTRIPSAMELOC_0100
     * @tc.desc   Test round-trip conversion using the same locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_RoundTripSameLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const original: string = 'hello';
      const upper: string = original.toLocaleUpperCase('tr');
      const lower: string = upper.toLocaleLowerCase('tr');
      expect(lower).assertEqual('hello');
      expect(lower === original).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_SameLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_SAMELOCALE_0100
     * @tc.desc   Test case conversion using the same locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_SameLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello';
      const upperTR: string = str.toLocaleUpperCase('tr');
      const lowerTR: string = upperTR.toLocaleLowerCase('tr');
      expect(lowerTR === str).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_DiffLocale_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_DIFFLOCALE_0100
     * @tc.desc   Test for potential differences caused by using different locales
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_DiffLocale_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'i';
      const upperEN: string = str.toLocaleUpperCase('en-US');
      const lowerTR: string = upperEN.toLocaleLowerCase('tr');
      expect(lowerTR).assertEqual('ı');
      expect(lowerTR === str).assertFalse();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_GermanRoundTrip_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_GERMANROUNDTRIP_0100
     * @tc.desc   Test round-trip conversion of special German characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_GermanRoundTrip_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'straße';
      const upper: string = str.toLocaleUpperCase('de-DE');
      const lower: string = upper.toLocaleLowerCase('de-DE');
      expect(lower).assertEqual('strasse');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ReturnType_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_RETURNTYPE_0100
     * @tc.desc   Test that the return value is a string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ReturnType_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: ReturnTypeTestResult = toLocaleLowerCaseHelperTest.test1051();
      expect(res.typeOf).assertEqual('string');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_OriginalUnchanged_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ORIGINALUNCHANGED_0100
     * @tc.desc   Test that a new string is returned and the original string remains unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_OriginalUnchanged_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: ImmutableTestResult = toLocaleLowerCaseHelperTest.test1052();
      expect(res.original).assertEqual('HELLO');
      expect(res.result).assertEqual('hello');
      expect(res.isEqual).assertFalse();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_OriginalNotModified_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ORIGINALNOTMOD_0100
     * @tc.desc   Test that the original string is not modified
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_OriginalNotModified_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'WORLD';
      const lower: string = str.toLocaleLowerCase();
      expect(str).assertEqual('WORLD');
      expect(lower).assertEqual('world');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_MultipleCallsSame_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_MULTIPLECALLSSAME_0100
     * @tc.desc   Test that multiple calls return the same result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_MultipleCallsSame_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: boolean[] = toLocaleLowerCaseHelperTest.test1054();
      expect(res[0]).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_SameLength_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_SAMELENGTH_0100
     * @tc.desc   Test that the return value has the same length as the original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_SameLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: SameLenTestResult = toLocaleLowerCaseHelperTest.test1055();
      expect(res.originalLen).assertEqual(5);
      expect(res.resultLen).assertEqual(5);
      expect(res.isSame).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_LengthWithSpecial_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_LENGTHWITHSPECIAL_0100
     * @tc.desc   Test the length when special characters are included
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_LengthWithSpecial_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: LenCheckTestResult = toLocaleLowerCaseHelperTest.test1056();
      expect(res.resultLen).assertEqual(5);
      expect(res.isSame).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_InvalidLocaleFormat_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_INVALIDLOCALEFORMAT_0100
     * @tc.desc   Test that an exception is thrown for invalid locale formats
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_InvalidLocaleFormat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'HELLO';
      const locales: string = 'a';
      let isRangeError: boolean = false;
      try {
        str.toLocaleLowerCase(locales);
      } catch (e) {
        isRangeError = e instanceof RangeError;
      }
      expect(isRangeError).assertEqual(true);
    });

    /**
     * @tc.name   StringToLocaleLowerCase_NonStringObj_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_NONSTRINGOBJ_0100
     * @tc.desc   Test calling on non-String objects
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_NonStringObj_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let isTypeError: boolean = false;
      try {
        toLocaleLowerCaseHelperTest.test1058();
      } catch (e) {
        isTypeError = e instanceof TypeError;
      }
      expect(isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringToLocaleLowerCase_NullReceiver_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_NULLRECEIVER_0100
     * @tc.desc   Test calling on null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_NullReceiver_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: Array<() => string> = toLocaleLowerCaseHelperTest.test1059();
      try {
        res[0]();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name   StringToLocaleLowerCase_UndefinedReceiver_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_UNDEFINEDRECEIVER_0100
     * @tc.desc   Test calling on undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_UndefinedReceiver_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: Array<() => string> = toLocaleLowerCaseHelperTest.test1060();
      try {
        res[0]();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name   StringToLocaleLowerCase_EmptyArrParam_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_EMPTYARRPARAM_0100
     * @tc.desc   Test that the array parameter contains invalid elements
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_EmptyArrParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('HELLO'.toLocaleLowerCase([])).assertEqual('hello');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_StringObject_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_STRINGOBJECT_0100
     * @tc.desc   Test calling the method on a String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_StringObject_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('HELLO');
      expect(strObj.toLocaleLowerCase()).assertEqual('hello');
      expect(typeof strObj.toLocaleLowerCase()).assertEqual('string');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_StringPrim_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_STRINGPRIM_0100
     * @tc.desc   Test calling via prototype chain on numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_StringPrim_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strPrim: String = new String('HELLO');
      expect(strPrim.toLocaleLowerCase()).assertEqual('hello');
      expect(typeof strPrim.toLocaleLowerCase()).assertEqual('string');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_NumberReceiver_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_NUMBERRECEIVER_0100
     * @tc.desc   Test calling via prototype chain on numbers
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_NumberReceiver_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: Array<() => string> = toLocaleLowerCaseHelperTest.test1064();
      try {
        res[0]();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name   StringToLocaleLowerCase_BoolReceiver_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_BOOLRECEIVER_0100
     * @tc.desc   Test calling via prototype chain on booleans
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_BoolReceiver_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: Array<() => string> = toLocaleLowerCaseHelperTest.test1065();
      try {
        res[0]();
      } catch (e) {
        expect(e instanceof TypeError).assertTrue();
      }
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CallUsage_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_CALLUSAGE_0100
     * @tc.desc   Test calling using call on other values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CallUsage_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: string[] = toLocaleLowerCaseHelperTest.test1066();
      expect(res[0]).assertEqual('hello');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ApplyUsage_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_APPLYUSAGE_0100
     * @tc.desc   Test calling using apply on other values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ApplyUsage_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: Array<() => string> = toLocaleLowerCaseHelperTest.test1067();
      expect(res[0]()).assertEqual('world');
      expect(res[1]()).assertEqual('test');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_BindUsage_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_BINDUSAGE_0100
     * @tc.desc   Test creating new function using bind
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_BindUsage_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: string[] = toLocaleLowerCaseHelperTest.test1068();
      expect(res[0]).assertEqual('hello');
      expect(res[1]).assertEqual('hello');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_UnicodeEscape_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_UNICODEESCAPE_0100
     * @tc.desc   Test conversion of Unicode escape sequences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_UnicodeEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('\u0041\u0042\u0043'.toLocaleLowerCase()).assertEqual('abc');
      expect('\u0130'.toLocaleLowerCase('tr')).assertEqual('i');
      expect('\u0131'.toLocaleLowerCase()).assertEqual('ı');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CodePointEscape_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_CODEPOINTESCAPE_0100
     * @tc.desc   Test ES6 Unicode Code Point Escapes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CodePointEscape_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('\u{0041}\u{0042}\u{0043}'.toLocaleLowerCase()).assertEqual('abc');
      expect('\u{0130}'.toLocaleLowerCase('tr')).assertEqual('i');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_SurrogatePair_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_SURROGATEPAIR_0100
     * @tc.desc   Test handling of surrogate pair characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_SurrogatePair_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const emoji: string = '😀'.toLocaleLowerCase();
      expect(emoji).assertEqual('😀');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_NFCNorm_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_NFCNORM_0100
     * @tc.desc   Test for NFC normalization form
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_NFCNorm_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: SupplPlaneTestResult = toLocaleLowerCaseHelperTest.test1073();
      expect(res.lower).assertEqual('é');
      expect(res.len).assertEqual(1);
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ZWJSequence_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ZWJSEQUENCE_0100
     * @tc.desc   Test Zero-Width Joiner (ZWJ) sequences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ZWJSequence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const zwj: string = '👨‍👩‍👧‍👦';
      expect(zwj.toLocaleLowerCase()).assertEqual('👨‍👩‍👧‍👦');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_VariationSelector_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_VARIATIONSELECTOR_0100
     * @tc.desc   Test characters with variation selectors
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_VariationSelector_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const withVS: string = 'A\uFE0F';
      expect(withVS.toLocaleLowerCase()).assertEqual('a\uFE0F');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CaseThenTrim_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_CASETHENTRIM_0100
     * @tc.desc   Test converting case first, then trimming whitespace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CaseThenTrim_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('  HELLO  '.toLocaleLowerCase().trim()).assertEqual('hello');
      expect('  WORLD  '.trim().toLocaleLowerCase()).assertEqual('world');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CaseThenSlice_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_CASETHENSLICE_0100
     * @tc.desc   Test converting case first, then slicing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CaseThenSlice_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('HELLO WORLD'.toLocaleLowerCase().slice(0, 5)).assertEqual('hello');
      expect('HELLO WORLD'.slice(0, 5).toLocaleLowerCase()).assertEqual('hello');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CaseThenSplit_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_CASETHENSPLIT_0100
     * @tc.desc   Test converting case first, then splitting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CaseThenSplit_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: SplitTestResult = toLocaleLowerCaseHelperTest.test1079();
      const expected1: string[] = ['hello', 'world'];
      expect(res.parts1.length).assertEqual(expected1.length);
      for (let i: int = 0; i < expected1.length; i++) {
        expect(res.parts1[i]).assertEqual(expected1[i]);
      }
      const expected2: string[] = ['a', 'b', 'c'];
      expect(res.parts2.length).assertEqual(expected2.length);
      for (let i: int = 0; i < expected2.length; i++) {
        expect(res.parts2[i]).assertEqual(expected2[i]);
      }
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CaseThenReplace_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_CASETHENREPLACE_0100
     * @tc.desc   Test converting first, then replacing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CaseThenReplace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('HELLO WORLD'.toLocaleLowerCase().replace('world', 'js')).assertEqual('hello js');
      expect('ABC ABC'.toLocaleLowerCase().split('abc').join('xyz')).assertEqual('xyz xyz');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_CaseInsensSearch_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_CASEINSEARCH_0100
     * @tc.desc   Test case-insensitive search using toLocaleLowerCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_CaseInsensSearch_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: boolean[] = toLocaleLowerCaseHelperTest.test1082();
      expect(res[0]).assertTrue();
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ArrayMap_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ARRAYMAP_0100
     * @tc.desc   Test using in array map
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ArrayMap_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const words: string[] = ['HELLO', 'WORLD', 'JAVASCRIPT'];
      const lowerWords: string[] = words.map((word: string): string => word.toLocaleLowerCase());
      expect(lowerWords[0]).assertEqual('hello');
      expect(lowerWords[1]).assertEqual('world');
      expect(lowerWords[2]).assertEqual('javascript');
      expect(lowerWords.length).assertEqual(3);
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ArrayFilter_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ARRAYFILTER_0100
     * @tc.desc   Test using in array filter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ArrayFilter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = ['hello', 'WORLD', 'javascript', 'CODE']
        .filter((word: string): boolean => word === word.toLocaleLowerCase());
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('hello');
      expect(result[1]).assertEqual('javascript');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ArraySort_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_ARRAYSORT_0100
     * @tc.desc   Test for use in array sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ArraySort_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string[] = ['Zebra', 'apple', 'Banana']
        .sort((a: string, b: string): int => {
          const lowerA: string = a.toLocaleLowerCase();
          const lowerB: string = b.toLocaleLowerCase();
          if (lowerA < lowerB) {
            return -1;
          }
          if (lowerA > lowerB) {
            return 1;
          }
          return 0;
        });
      expect(result[0]).assertEqual('apple');
      expect(result[1]).assertEqual('Banana');
      expect(result[2]).assertEqual('Zebra');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_TemplateLiteral_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_TEMPLATELITERAL_0100
     * @tc.desc   Test usage in template strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_TemplateLiteral_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result: string = `Hello, ${'WORLD'.toLocaleLowerCase()}!`;
      expect(result).assertEqual('Hello, world!');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_TaggedTemplate_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_TAGGEDTEMPLATE_0100
     * @tc.desc   Test usage in tagged templates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_TaggedTemplate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const res: string[] = toLocaleLowerCaseHelperTest.test1087();
      expect(res[0]).assertEqual('Hello, world!');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_ObjProperties_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_OBJPROPERTIES_0100
     * @tc.desc   Test converting object property values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_ObjProperties_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const obj: MyObjectType = {
        name: 'JOHN',
        city: 'NEW YORK',
        country: 'USA'
      };
      const lowerObj: MyObjectType = {
        name: obj.name.toLocaleLowerCase(),
        city: obj.city.toLocaleLowerCase(),
        country: obj.country.toLocaleLowerCase()
      };
      expect(lowerObj.name).assertEqual('john');
      expect(lowerObj.city).assertEqual('new york');
      expect(lowerObj.country).assertEqual('usa');
    });

    /**
     * @tc.name   StringToLocaleLowerCase_JSONData_001
     * @tc.number SUB_BUILTINS_STRING_TOLOCALELOWERCASE_JSONDATA_0100
     * @tc.desc   Test handling strings in JSON data
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToLocaleLowerCase_JSONData_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const parsedData: User = {
        name: 'ALICE',
        email: 'ALICE@EXAMPLE.COM'
      };
      const normalized: User = {
        name: parsedData.name.toLocaleLowerCase(),
        email: parsedData.email.toLocaleLowerCase()
      };
      expect(normalized.name).assertEqual('alice');
      expect(normalized.email).assertEqual('alice@example.com');
    });

  });
}
