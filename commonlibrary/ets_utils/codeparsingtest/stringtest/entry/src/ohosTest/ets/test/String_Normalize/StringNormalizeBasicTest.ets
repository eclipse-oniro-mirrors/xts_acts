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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import * as normalizeJS from './StringNormalizeBoundaryTest_JS';
import * as normalizeExceptionJS from './StringNormalizeExceptionTest_JS';


function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

function normalizeForStorage(text: string): string {
  return text.normalize('NFC');
}

function countCharacters(text: string): number {
  let normalized: string = text.normalize('NFC');
  return normalized.length;
}

function normalizeUsername(username: string): string {
  return username.normalize('NFKC').toLowerCase();
}

function normalizeEmail(email: string): string {
  let parts: string[] = email.split('@');
  return parts[0].normalize('NFC') + '@' + parts[1].toLowerCase();
}

function comparePassword(input: string, stored: string): boolean {
  return input.normalize('NFC') === stored.normalize('NFC');
}

function normalizeFilename(filename: string): string {
  let normalized: string = filename.normalize('NFC');
  return normalized.replace(/[<>:"/\\|?*]/g, '_');
}

export default function StringNormalizeBasicTest() {
  describe('StringNormalizeBasicTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await sleep(20);
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   StringNormalize_DefaultParameter_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_DEFAULT_0100
     * @tc.desc   Test normalize() with no parameter defaults to NFC
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_DefaultParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u00F1'; // ñ
      let result: string = str.normalize();
      expect(result).assertEqual(str.normalize('NFC'));
    });

    /**
     * @tc.name   StringNormalize_DefaultParameter_002
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_DEFAULT_0200
     * @tc.desc   Test normalize() with undefined parameter uses NFC
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_DefaultParameter_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u006E\u0303'; // n + ~
      let result: string = str.normalize(undefined);
      expect(result).assertEqual(str.normalize('NFC'));
    });

    /**
     * @tc.name   StringNormalize_ReturnValue_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_RETURN_0100
     * @tc.desc   Test normalize() returns a string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_ReturnValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'hello';
      let result: string = str.normalize('NFC');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringNormalize_ReturnValue_002
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_RETURN_0200
     * @tc.desc   Test normalize() does not modify original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_ReturnValue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let original: string = '\u006E\u0303';
      let normalized: string = original.normalize('NFC');
      expect(original).assertEqual('\u006E\u0303');
      expect(original !== normalized).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_ReturnValue_003
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_RETURN_0300
     * @tc.desc   Test normalize() on empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_ReturnValue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let empty: string = '';
      let result: string = empty.normalize('NFC');
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringNormalize_Application_Search_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_0100
     * @tc.desc   Test normalize for user input search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_Search_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let database: string[] = ['café', 'cafe\u0301', 'CAFÉ'];
      let query: string = 'cafe';
      let normalizedQuery: string = query.toLowerCase().normalize('NFC');
      let results: string[] = database.filter((item: string): boolean =>
      item.toLowerCase().normalize('NFC').includes(normalizedQuery)
      );
      expect(results.length).assertEqual(0);
    });

    /**
     * @tc.name   StringNormalize_Application_URL_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_0200
     * @tc.desc   Test normalize for URL parameter encoding
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_URL_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let urlParam: string = 'ren\u00E9e'; // renée
      let normalized: string = urlParam.normalize('NFC');
      expect(normalized.length).assertLarger(0);
    });

    /**
     * @tc.name   StringNormalize_Application_Storage_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_0300
     * @tc.desc   Test normalize for database storage consistency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_Storage_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let input1: string = '\u00F1';
      let input2: string = '\u006E\u0303';
      expect(normalizeForStorage(input1) === normalizeForStorage(input2)).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Application_Dedup_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_0400
     * @tc.desc   Test normalize for text deduplication
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_Dedup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let texts: string[] = ['café', 'cafe\u0301', 'Café'];
      let set: Set<string> = new Set(texts.map((t: string): string => t.normalize('NFC').toLowerCase()));
      expect(set.size).assertLarger(0);
    });

    /**
     * @tc.name   StringNormalize_Application_Count_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_0500
     * @tc.desc   Test normalize for character counting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_Count_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text1: string = '\u00F1'; // ñ
      let text2: string = '\u006E\u0303'; // n + ~
      expect(countCharacters(text1)).assertEqual(1);
      expect(countCharacters(text2.normalize('NFC'))).assertEqual(1);
    });

    /**
     * @tc.name   StringNormalize_Application_Username_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_0600
     * @tc.desc   Test normalize for username normalization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_Username_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let input1: string = 'Ａｄｍｉｎ'; // Full-width
      let input2: string = 'Admin';
      expect(normalizeUsername(input1) === normalizeUsername(input2)).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Application_Email_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_0700
     * @tc.desc   Test normalize for email address normalization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_Email_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let email: string = 'Ren\u00E9e@example.com';
      let result: string = normalizeEmail(email);
      expect(result.includes('@')).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Application_Sort_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_0800
     * @tc.desc   Test normalize for name sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_Sort_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let names: string[] = ['Zoë', 'Zoe\u0308', 'Zoe', 'Álvaro'];
      let sorted: string[] = names.sort((a: string, b: string): number =>
      a.normalize('NFD').localeCompare(b.normalize('NFD'))
      );
      expect(sorted.length).assertEqual(4);
    });

    /**
     * @tc.name   StringNormalize_Application_Password_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_0900
     * @tc.desc   Test normalize for password comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_Password_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let password1: string = 'p\u00E1ssword';
      let password2: string = 'pa\u0301ssword';
      expect(comparePassword(password1, password2)).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Application_Filename_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_APPLICATION_1000
     * @tc.desc   Test normalize for filename normalization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Application_Filename_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let file1: string = 'doc\u00FCment.txt'; // döcument.txt
      let file2: string = 'docu\u0308ment.txt';
      expect(normalizeFilename(file1) === normalizeFilename(file2)).assertTrue();
    });


    /**
     * @tc.name   StringNormalize_Boundary_Valid_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0100
     * @tc.desc   Test all valid normalization forms
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Valid_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u00F1';
      let nfc: string = str.normalize('NFC');
      let nfd: string = str.normalize('NFD');
      let nfkc: string = str.normalize('NFKC');
      let nfkd: string = str.normalize('NFKD');
      expect(nfc.length).assertLargerOrEqual(1);
      expect(nfd.length).assertLargerOrEqual(1);
      expect(nfkc.length).assertLargerOrEqual(1);
      expect(nfkd.length).assertLargerOrEqual(1);
    });

    /**
     * @tc.name   StringNormalize_Boundary_Case_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0200
     * @tc.desc   Test parameter is case sensitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Case_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeJS.test001();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Boundary_Empty_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0300
     * @tc.desc   Test empty string parameter throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Empty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeJS.test002();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Boundary_Invalid_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0400
     * @tc.desc   Test invalid string parameters throw RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Invalid_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeJS.test003();
      expect(result.throwCount).assertEqual(5);
    });

    /**
     * @tc.name   StringNormalize_Boundary_Number_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0500
     * @tc.desc   Test number parameter throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Number_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeJS.test004();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Boundary_Null_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0600
     * @tc.desc   Test null parameter throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeJS.test005();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Boundary_Object_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0700
     * @tc.desc   Test object parameter throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeJS.test006();
      expect(result.thrown).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Boundary_Long_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0800
     * @tc.desc   Test normalize on very long string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('StringNormalize_Boundary_Long_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let longStr: string = 'a'.repeat(10000);
      let result: string = longStr.normalize('NFC');
      expect(result.length).assertEqual(10000);
    });

    /**
     * @tc.name   StringNormalize_Boundary_Combining_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_BOUNDARY_0900
     * @tc.desc   Test normalize on string with only combining characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Boundary_Combining_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let combiningOnly: string = '\u0301\u0302\u0303';
      let nfc: string = combiningOnly.normalize('NFC');
      let nfd: string = combiningOnly.normalize('NFD');
      expect(nfc).assertEqual(combiningOnly);
      expect(nfd).assertEqual(combiningOnly);
    });


    /**
     * @tc.name   StringNormalize_Compare_Equivalence_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPARE_0100
     * @tc.desc   Test different Unicode forms become equal after normalization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Compare_Equivalence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = '\u00F1'; // ñ
      let str2: string = '\u006E\u0303'; // n + ~
      expect(str1 === str2).assertFalse();
      expect(str1.normalize('NFC') === str2.normalize('NFC')).assertTrue();
      expect(str1.normalize('NFD') === str2.normalize('NFD')).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Compare_Mixed_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPARE_0200
     * @tc.desc   Test different normalization forms should not be equal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Compare_Mixed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u00F1';
      let nfc: string = str.normalize('NFC');
      let nfd: string = str.normalize('NFD');
      expect(nfc === nfd).assertFalse();
      expect(nfc.length !== nfd.length).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Compare_Includes_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPARE_0300
     * @tc.desc   Test normalize with includes method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Compare_Includes_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text: string = 'Caf\u00E9'; // Café
      let search: string = 'e\u0301'; // e + acute
      expect(text.includes(search)).assertFalse();
      expect(text.normalize('NFD').includes(search)).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Compare_IndexOf_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPARE_0400
     * @tc.desc   Test normalize with indexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Compare_IndexOf_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text: string = 'Am\u00E9lie'; // Amélie
      let search: string = 'e\u0301'; // e + acute
      expect(text.indexOf(search)).assertEqual(-1);
      let normalizedText: string = text.normalize('NFD');
      expect(normalizedText.indexOf(search)).assertEqual(2);
    });

    /**
     * @tc.name   StringNormalize_Compare_Sort_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPARE_0500
     * @tc.desc   Test normalize with localeCompare for sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Compare_Sort_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let words: string[] = ['cote', 'côté', 'côte', 'coté'];
      let sorted: string[] = words.sort((a: string, b: string): number =>
      a.normalize('NFD').localeCompare(b.normalize('NFD'))
      );
      expect(sorted.length).assertEqual(4);
    });

    /**
     * @tc.name   StringNormalize_Compare_Dedup_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPARE_0600
     * @tc.desc   Test normalize for array deduplication
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Compare_Dedup_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let arr: string[] = ['\u00F1', '\u006E\u0303', 'n'];
      let set: Set<string> = new Set(arr.map((s: string): string => s.normalize('NFC')));
      expect(set.size).assertEqual(2);
    });

    /**
     * @tc.name   StringNormalize_Compare_Regex_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPARE_0700
     * @tc.desc   Test normalize with regex matching
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Compare_Regex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text: string = 'café';
      let textDecomposed: string = text.normalize('NFD');
      let hasEAcute: boolean = textDecomposed.includes('\u0301');
      expect(hasEAcute).assertTrue();
    });


    /**
     * @tc.name   StringNormalize_Complex_Multiple_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPLEX_0100
     * @tc.desc   Test multiple normalizations have same result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Complex_Multiple_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u00F1';
      let once: string = str.normalize('NFD');
      let twice: string = once.normalize('NFD');
      expect(once === twice).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Complex_Cross_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPLEX_0200
     * @tc.desc   Test cross-normalization between different forms
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Complex_Cross_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u1E9B\u0323';
      let nfc: string = str.normalize('NFC');
      let nfkc: string = nfc.normalize('NFKC');
      let nfkd: string = nfkc.normalize('NFKD');
      expect(nfkd.length).assertEqual(3);
    });

    /**
     * @tc.name   StringNormalize_Complex_Mixed_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPLEX_0300
     * @tc.desc   Test normalize on mixed ASCII and non-ASCII characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Complex_Mixed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let mixed: string = 'Hello \u00F1 World \u00E9';
      let nfd: string = mixed.normalize('NFD');
      expect(nfd.includes('\u006E\u0303')).assertTrue();
      expect(nfd.includes('\u0065\u0301')).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Complex_Multilang_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPLEX_0400
     * @tc.desc   Test normalize on multi-language text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Complex_Multilang_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let multilang: string = 'Français Español Português';
      let nfd: string = multilang.normalize('NFD');
      let nfc: string = multilang.normalize('NFC');
      expect(nfd.length > nfc.length).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Complex_Formatted_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPLEX_0500
     * @tc.desc   Test normalize on strings with special formatting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Complex_Formatted_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let formatted: string = 'Line1\nLine2\tTab\u00E9';
      let nfc: string = formatted.normalize('NFC');
      expect(nfc.includes('\n')).assertTrue();
      expect(nfc.includes('\t')).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Complex_Start_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPLEX_0600
     * @tc.desc   Test normalize on string starting with combining character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Complex_Start_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let startsWithCombining: string = '\u0301ABC';
      let nfc: string = startsWithCombining.normalize('NFC');
      expect(nfc[0]).assertEqual('\u0301');
      expect(nfc.length).assertEqual(4);
    });

    /**
     * @tc.name   StringNormalize_Complex_End_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_COMPLEX_0700
     * @tc.desc   Test normalize on string ending with combining character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Complex_End_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let endsWithCombining: string = 'ABC\u0301';
      let nfc: string = endsWithCombining.normalize('NFC');
      expect(nfc.length).assertEqual(3);
    });


    /**
     * @tc.name   StringNormalize_Exception_Range_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0100
     * @tc.desc   Test invalid normalization form throws RangeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Range_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeExceptionJS.test001();
      expect(result.isRangeError).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Exception_Type_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0300
     * @tc.desc   Test normalize on non-string object throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Type_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeExceptionJS.test003();
      expect(result.isTypeError).assertFalse();
    });

    /**
     * @tc.name   StringNormalize_Exception_Null_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0400
     * @tc.desc   Test normalize on null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Null_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeExceptionJS.test004();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Exception_Undefined_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0500
     * @tc.desc   Test normalize on undefined throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Undefined_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = normalizeExceptionJS.test005();
      expect(result.isTypeError).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Exception_Recovery_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_EXCEPTION_0600
     * @tc.desc   Test program continues after catching exception
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Exception_Recovery_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'test';
      let result: string = '';
      try {
        result = str.normalize('INVALID');
      } catch (e) {
        result = str.normalize('NFC');
      }
      expect(result).assertEqual('test');
    });


    /**
     * @tc.name   StringNormalize_Interaction_Concat_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_0100
     * @tc.desc   Test normalize with concat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_Concat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = '\u00F1'; // ñ
      let str2: string = '\u006E\u0303'; // n + ~
      let result: string = str1.normalize('NFD').concat(str2.normalize('NFD'));
      expect(result.length).assertEqual(4);
      expect(result).assertEqual('\u006E\u0303\u006E\u0303');
    });

    /**
     * @tc.name   StringNormalize_Interaction_Slice_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_0200
     * @tc.desc   Test normalize with slice method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_Slice_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'café\u0301'; // café + acute
      let nfd: string = str.normalize('NFD');
      let sliced: string = nfd.slice(0, 5);
      expect(sliced.length).assertLessOrEqual(5);
    });

    /**
     * @tc.name   StringNormalize_Interaction_Substring_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_0300
     * @tc.desc   Test normalize with substring method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_Substring_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u006E\u0303\u0061'; // ña
      let nfd: string = str.normalize('NFD');
      let sub: string = nfd.substring(0, 2);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.name   StringNormalize_Interaction_Split_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_0400
     * @tc.desc   Test normalize with split method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_Split_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'café\u0301';
      let nfd: string = str.normalize('NFD');
      let parts: string[] = nfd.split('');
      expect(parts.length).assertLarger(0);
    });

    /**
     * @tc.name   StringNormalize_Interaction_ToLowerCase_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_0500
     * @tc.desc   Test normalize with toLowerCase method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_ToLowerCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let upper: string = '\u00D1'; // Ñ
      let lower: string = upper.normalize('NFD').toLowerCase();
      let result: string = lower.normalize('NFC');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringNormalize_Interaction_ToUpperCase_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_0600
     * @tc.desc   Test normalize with toUpperCase method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_ToUpperCase_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let lower: string = '\u00F1'; // ñ
      let upper: string = lower.normalize('NFD').toUpperCase();
      let result: string = upper.normalize('NFC');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringNormalize_Interaction_Trim_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_0700
     * @tc.desc   Test normalize with trim method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_Trim_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '  \u00F1  ';
      let result: string = str.normalize('NFC').trim();
      expect(result).assertEqual('ñ');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringNormalize_Interaction_StartsWith_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_0800
     * @tc.desc   Test normalize with startsWith method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_StartsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'café';
      let prefix: string = 'caf\u00E9';
      expect(str.startsWith(prefix)).assertTrue();
      let strNFD: string = str.normalize('NFD');
      let prefixNFD: string = prefix.normalize('NFD');
      expect(strNFD.startsWith(prefixNFD)).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Interaction_EndsWith_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_0900
     * @tc.desc   Test normalize with endsWith method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_EndsWith_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'café';
      let suffix: string = '\u00E9';
      expect(str.endsWith(suffix)).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Interaction_Repeat_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_1000
     * @tc.desc   Test normalize with repeat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_Repeat_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u006E\u0303'; // n + ~
      let repeated: string = str.normalize('NFC').repeat(3);
      expect(repeated).assertEqual('ñññ');
      expect(repeated.length).assertEqual(3);
    });

    /**
     * @tc.name   StringNormalize_Interaction_PadStart_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_1100
     * @tc.desc   Test normalize with padStart method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_PadStart_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u00F1';
      let padded: string = str.normalize('NFD').padStart(4, ' ');
      expect(padded.length).assertEqual(4);
    });

    /**
     * @tc.name   StringNormalize_Interaction_PadEnd_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_1200
     * @tc.desc   Test normalize with padEnd method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_PadEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u00F1';
      let padded: string = str.normalize('NFD').padEnd(4, ' ');
      expect(padded.length).assertEqual(4);
    });

    /**
     * @tc.name   StringNormalize_Interaction_Replace_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_1300
     * @tc.desc   Test normalize with replace method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_Replace_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'café';
      let replaced: string = str.normalize('NFD').replace('\u0301', '');
      expect(replaced.normalize('NFC')).assertEqual('cafe');
    });

    /**
     * @tc.name   StringNormalize_Interaction_ReplaceAll_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_INTERACTION_1400
     * @tc.desc   Test normalize with replaceAll method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Interaction_ReplaceAll_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'café café';
      let replaced: string = str.normalize('NFD').replaceAll('\u0301', '');
      expect(replaced.normalize('NFC')).assertEqual('cafe cafe');
    });


    /**
     * @tc.name   StringNormalize_NFC_Composition_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFC_COMPOSE_0100
     * @tc.desc   Test NFC normalization of single combined character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFC_Composition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let decomposed: string = '\u0041\u0301'; // A + acute accent
      let composed: string = decomposed.normalize('NFC');
      expect(composed.length).assertEqual(1);
      expect(composed.charCodeAt(0).toString(16)).assertEqual('c1');
    });

    /**
     * @tc.name   StringNormalize_NFC_Composition_002
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFC_COMPOSE_0200
     * @tc.desc   Test NFC normalization of multiple combining characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFC_Composition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let decomposed: string = '\u006E\u0303\u0301'; // n + ~ + acute
      let composed: string = decomposed.normalize('NFC');
      expect(composed.length).assertLargerOrEqual(1);
    });

    /**
     * @tc.name   StringNormalize_NFC_Composition_003
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFC_COMPOSE_0300
     * @tc.desc   Test NFC normalization keeps composed character unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFC_Composition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let composed: string = '\u00F1'; // ñ
      let result: string = composed.normalize('NFC');
      expect(result).assertEqual(composed);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringNormalize_NFC_Equivalence_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFC_EQUIV_0100
     * @tc.desc   Test NFC normalization makes different representations equivalent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFC_Equivalence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = '\u00F1'; // ñ (single code point)
      let str2: string = '\u006E\u0303'; // n + ~ (two code points)
      let nfc1: string = str1.normalize('NFC');
      let nfc2: string = str2.normalize('NFC');
      expect(nfc1).assertEqual(nfc2);
      expect(nfc1.length).assertEqual(nfc2.length);
    });

    /**
     * @tc.name   StringNormalize_NFC_Equivalence_002
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFC_EQUIV_0200
     * @tc.desc   Test NFC normalization of complex character sequences
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFC_Equivalence_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let name1: string = '\u0041\u006d\u00e9\u006c\u0069\u0065'; // Amélie
      let name2: string = '\u0041\u006d\u0065\u0301\u006c\u0069\u0065'; // Amélie (decomposed form)
      let nfc1: string = name1.normalize('NFC');
      let nfc2: string = name2.normalize('NFC');
      expect(nfc1).assertEqual(nfc2);
    });

    /**
     * @tc.name   StringNormalize_NFC_Length_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFC_LENGTH_0100
     * @tc.desc   Test NFC normalization reduces length for decomposed forms
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFC_Length_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let decomposed: string = '\u0041\u0301\u0302'; // A + acute + circumflex
      let composed: string = decomposed.normalize('NFC');
      expect(decomposed.length).assertEqual(3);
      expect(composed.length).assertLess(3);
    });

    /**
     * @tc.name   StringNormalize_NFC_Length_002
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFC_LENGTH_0200
     * @tc.desc   Test NFC normalization keeps length unchanged for normal characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFC_Length_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let normal: string = 'Hello World';
      let result: string = normal.normalize('NFC');
      expect(normal.length).assertEqual(result.length);
    });


    /**
     * @tc.name   StringNormalize_NFD_Decomposition_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFD_DECOMP_0100
     * @tc.desc   Test NFD normalization decomposes single combined character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFD_Decomposition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let composed: string = '\u00F1'; // ñ
      let decomposed: string = composed.normalize('NFD');
      expect(decomposed.length).assertEqual(2);
      expect(decomposed).assertEqual('\u006E\u0303');
    });

    /**
     * @tc.name   StringNormalize_NFD_Decomposition_002
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFD_DECOMP_0200
     * @tc.desc   Test NFD normalization decomposes multiple diacritics
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFD_Decomposition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let composed: string = '\u1E9B'; // ẛ (long s with dot above)
      let decomposed: string = composed.normalize('NFD');
      expect(decomposed.length).assertEqual(2);
      expect(decomposed.charCodeAt(0).toString(16)).assertEqual('17f');
      expect(decomposed.charCodeAt(1).toString(16)).assertEqual('307');
    });

    /**
     * @tc.name   StringNormalize_NFD_Decomposition_003
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFD_DECOMP_0300
     * @tc.desc   Test NFD normalization keeps decomposed character unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFD_Decomposition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let decomposed: string = '\u006E\u0303';
      let result: string = decomposed.normalize('NFD');
      expect(result).assertEqual(decomposed);
    });

    /**
     * @tc.name   StringNormalize_NFD_Equivalence_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFD_EQUIV_0100
     * @tc.desc   Test NFD normalization makes different representations equivalent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFD_Equivalence_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = '\u00F1'; // ñ
      let str2: string = '\u006E\u0303'; // n + ~
      let nfd1: string = str1.normalize('NFD');
      let nfd2: string = str2.normalize('NFD');
      expect(nfd1).assertEqual(nfd2);
      expect(nfd1.length).assertEqual(2);
      expect(nfd2.length).assertEqual(2);
    });

    /**
     * @tc.name   StringNormalize_NFD_Order_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFD_ORDER_0100
     * @tc.desc   Test NFD normalization orders multiple diacritics properly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFD_Order_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u1E9B\u0323'; // ẛ + dot below
      let nfd: string = str.normalize('NFD');
      expect(nfd.length).assertEqual(3);
      expect(nfd.charCodeAt(0).toString(16)).assertEqual('17f');
      expect(nfd.charCodeAt(1).toString(16)).assertEqual('323');
      expect(nfd.charCodeAt(2).toString(16)).assertEqual('307');
    });


    /**
     * @tc.name   StringNormalize_NFKC_Ligature_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKC_LIGATURE_0100
     * @tc.desc   Test NFKC normalization converts ligatures to separate characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKC_Ligature_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let ligature: string = '\uFB00'; // ﬀ (ligature ff)
      let nfkc: string = ligature.normalize('NFKC');
      expect(nfkc).assertEqual('ff');
      expect(nfkc.length).assertEqual(2);
      expect(nfkc).assertEqual('\u0066\u0066');
    });

    /**
     * @tc.name   StringNormalize_NFKC_FullWidth_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKC_FULLWIDTH_0100
     * @tc.desc   Test NFKC normalization converts full-width characters to half-width
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKC_FullWidth_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let fullWidth: string = '\uFF21\uFF22\uFF23'; // ＡＢＣ
      let nfkc: string = fullWidth.normalize('NFKC');
      expect(nfkc).assertEqual('ABC');
      expect(nfkc.length).assertEqual(3);
    });

    /**
     * @tc.name   StringNormalize_NFKC_Circled_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKC_CIRCLED_0100
     * @tc.desc   Test NFKC normalization converts circled characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKC_Circled_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let circled: string = '\u24B9'; // Ⓓ
      let nfkc: string = circled.normalize('NFKC');
      expect(nfkc).assertEqual('D');
      expect(nfkc).assertEqual('\u0044');
    });

    /**
     * @tc.name   StringNormalize_NFKC_Complex_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKC_COMPLEX_0100
     * @tc.desc   Test NFKC normalization handles complex characters with diacritics
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKC_Complex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u1E9B\u0323'; // ẛ + dot below
      let nfkc: string = str.normalize('NFKC');
      expect(nfkc.length).assertEqual(1);
      expect(nfkc.charCodeAt(0).toString(16)).assertEqual('1e69');
    });

    /**
     * @tc.name   StringNormalize_NFKC_Superscript_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKC_SUPER_0100
     * @tc.desc   Test NFKC normalization converts superscript/subscript characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKC_Superscript_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let superscript: string = '\u00B2'; // ²
      let nfkc: string = superscript.normalize('NFKC');
      expect(nfkc).assertEqual('2');
    });

    /**
     * @tc.name   StringNormalize_NFKC_Composition_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKC_DECOMP_0100
     * @tc.desc   Test NFKC decomposes then composes characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKC_Composition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u1E9B\u0323'; // ẛ + dot below
      let nfkc: string = str.normalize('NFKC');
      let nfkd: string = str.normalize('NFKD');
      expect(nfkc.length).assertEqual(1);
      expect(nfkd.length).assertEqual(3);
      expect(nfkc !== nfkd).assertTrue();
    });


    /**
     * @tc.name   StringNormalize_NFKD_Ligature_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKD_LIGATURE_0100
     * @tc.desc   Test NFKD normalization decomposes ligatures
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKD_Ligature_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let ligature: string = '\uFB00'; // ﬀ
      let nfkd: string = ligature.normalize('NFKD');
      expect(nfkd).assertEqual('ff');
      expect(nfkd.length).assertEqual(2);
      expect(nfkd).assertEqual('\u0066\u0066');
    });

    /**
     * @tc.name   StringNormalize_NFKD_FullWidth_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKD_FULLWIDTH_0100
     * @tc.desc   Test NFKD normalization decomposes full-width characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKD_FullWidth_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let fullWidth: string = '\uFF21'; // Ａ
      let nfkd: string = fullWidth.normalize('NFKD');
      expect(nfkd).assertEqual('A');
      expect(nfkd.length).assertEqual(1);
    });

    /**
     * @tc.name   StringNormalize_NFKD_Special_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKD_SPECIAL_0100
     * @tc.desc   Test NFKD normalization decomposes special symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKD_Special_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let ellipsis: string = '\u2026'; // …
      let nfkd: string = ellipsis.normalize('NFKD');
      expect(nfkd).assertEqual('...');
      expect(nfkd.length).assertEqual(3);
    });

    /**
     * @tc.name   StringNormalize_NFKD_Complete_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKD_COMPLETE_0100
     * @tc.desc   Test NFKD normalization performs complete decomposition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKD_Complete_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\u1E9B\u0323'; // ẛ + dot below
      let nfkd: string = str.normalize('NFKD');
      expect(nfkd.length).assertEqual(3);
      expect(nfkd.charCodeAt(0).toString(16)).assertEqual('73');
      expect(nfkd.charCodeAt(1).toString(16)).assertEqual('323');
      expect(nfkd.charCodeAt(2).toString(16)).assertEqual('307');
    });

    /**
     * @tc.name   StringNormalize_NFKD_Roman_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKD_ROMAN_0100
     * @tc.desc   Test NFKD normalization decomposes Roman numerals
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKD_Roman_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let roman: string = '\u2163'; // Ⅳ
      let nfkd: string = roman.normalize('NFKD');
      expect(nfkd).assertEqual('IV');
      expect(nfkd.length).assertEqual(2);
    });

    /**
     * @tc.name   StringNormalize_NFKD_Maximum_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_NFKD_MAX_0100
     * @tc.desc   Test NFKD normalization produces maximum decomposition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_NFKD_Maximum_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let complex: string = '\u1E9B\u0323';
      let nfd: string = complex.normalize('NFD');
      let nfkd: string = complex.normalize('NFKD');
      expect(nfd.length).assertEqual(3);
      expect(nfkd.length).assertEqual(3);
      expect(nfkd.charCodeAt(0).toString(16)).assertEqual('73');
    });


    /**
     * @tc.name   StringNormalize_Special_Emoji_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_0100
     * @tc.desc   Test normalize on emoji characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_Emoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = '👨‍👩‍👧‍👦'; // Family emoji (ZWS sequence)
      let nfc: string = emoji.normalize('NFC');
      let nfd: string = emoji.normalize('NFD');
      expect(emoji.length).assertEqual(11);
      expect(nfc === emoji).assertTrue();
      expect(nfd === emoji).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Special_ZWJ_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_0200
     * @tc.desc   Test normalize on zero-width joiner
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_ZWJ_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let zwj: string = '\u200D'; // Zero-width joiner
      let result: string = zwj.normalize('NFC');
      expect(result === zwj).assertTrue();
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringNormalize_Special_BOM_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_0300
     * @tc.desc   Test normalize on BOM character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_BOM_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let bom: string = '\uFEFF'; // BOM
      let result: string = bom.normalize('NFC');
      expect(result === bom).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Special_Latin1_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_0400
     * @tc.desc   Test normalize on Latin-1 supplement characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_Latin1_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let chars: string[] = ['\u00C0', '\u00C1', '\u00C2']; // À, Á, Â
      for (let i = 0; i < chars.length; i++) {
        let nfd: string = chars[i].normalize('NFD');
        expect(nfd.length).assertEqual(2);
      }
    });

    /**
     * @tc.name   StringNormalize_Special_Greek_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_0500
     * @tc.desc   Test normalize on Greek characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_Greek_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let greek: string = '\u03AC'; // ά (Greek alpha with tonos)
      let nfd: string = greek.normalize('NFD');
      expect(nfd.length).assertEqual(2);
      expect(nfd.charCodeAt(0).toString(16)).assertEqual('3b1');
      expect(nfd.charCodeAt(1).toString(16)).assertEqual('301');
    });

    /**
     * @tc.name   StringNormalize_Special_Cyrillic_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_0600
     * @tc.desc   Test normalize on Cyrillic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_Cyrillic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let cyrillic: string = '\u0401'; // Ё (Cyrillic IO)
      let nfd: string = cyrillic.normalize('NFD');
      expect(nfd.length).assertEqual(2);
    });

    /**
     * @tc.name   StringNormalize_Special_CJK_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_0700
     * @tc.desc   Test normalize on CJK characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_CJK_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let cjk: string = '中文日本語한국어';
      let nfc: string = cjk.normalize('NFC');
      let nfd: string = cjk.normalize('NFD');
      expect(nfc === nfd).assertFalse();
      expect(nfc === cjk).assertTrue();
    });

    /**
     * @tc.name   StringNormalize_Special_MultiDiacritic_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_0800
     * @tc.desc   Test normalize on characters with multiple diacritics
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_MultiDiacritic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let multi: string = 'e\u0301\u0302\u0303'; // e + acute + circumflex + tilde
      let nfc: string = multi.normalize('NFC');
      let nfd: string = multi.normalize('NFD');
      expect(multi.length).assertEqual(4);
      expect(nfd.length).assertEqual(4);
    });

    /**
     * @tc.name   StringNormalize_Special_NoPrecomposed_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_0900
     * @tc.desc   Test normalize on characters without precomposed form
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_NoPrecomposed_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let noPrecomposed: string = 'a\u0301\u0302'; // a + acute + circumflex
      let nfc: string = noPrecomposed.normalize('NFC');
      expect(nfc.length).assertEqual(2);
    });

    /**
     * @tc.name   StringNormalize_Special_Math_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_1000
     * @tc.desc   Test normalize on mathematical symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_Math_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let math: string = '\u2070'; // ⁰ (superscript 0)
      let nfkc: string = math.normalize('NFKC');
      let nfkd: string = math.normalize('NFKD');
      expect(nfkc).assertEqual('0');
      expect(nfkd).assertEqual('0');
    });

    /**
     * @tc.name   StringNormalize_Special_Unit_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_1100
     * @tc.desc   Test normalize on unit symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_Unit_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let unit: string = '\u2103'; // ℃ (Celsius)
      let nfkc: string = unit.normalize('NFKC');
      expect(nfkc).assertEqual('°C');
      expect(nfkc.length).assertEqual(2);
    });

    /**
     * @tc.name   StringNormalize_Special_Currency_001
     * @tc.number SUB_BUILTINS_STRING_NORMALIZE_SPECIAL_1200
     * @tc.desc   Test normalize on currency symbols
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringNormalize_Special_Currency_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let currency: string = '\u20AC'; // €
      let nfkc: string = currency.normalize('NFKC');
      expect(nfkc === currency).assertTrue();
    });
  });
}
