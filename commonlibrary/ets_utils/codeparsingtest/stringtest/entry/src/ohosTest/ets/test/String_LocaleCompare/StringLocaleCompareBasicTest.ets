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
import { testInvalidOptions, testThisNull, testThisUndefined, testThisNumber, testThisObject, testThisBoolean } from './localeCompare_helper';
import { testOmitParameter, testUndefinedParameter, testNullParameter, testNumberParameter, testObjectParameter } from './localeCompare_helper';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringLocaleCompareBasicTest() {
  describe('StringLocaleCompareBasicTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringLocaleCompare_SameString_001
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BASIC_0100
     * @tc.desc   Test localeCompare with same strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_SameString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "hello".localeCompare("hello");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_DifferentString_002
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BASIC_0200
     * @tc.desc   Test localeCompare with different strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_DifferentString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "a".localeCompare("b");
      expect(result1 < 0).assertTrue();
      let result2: number = "b".localeCompare("a");
      expect(result2 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_CaseSensitive_003
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BASIC_0300
     * @tc.desc   Test localeCompare with different case
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_CaseSensitive_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "a".localeCompare("A");
      expect(typeof result1).assertEqual("number");
      let result2: number = "Z".localeCompare("z");
      expect(typeof result2).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_MixedCase_004
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BASIC_0400
     * @tc.desc   Test localeCompare with mixed case strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_MixedCase_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "Hello".localeCompare("hello");
      expect(typeof result1).assertEqual("number");
      let result2: number = "JavaScript".localeCompare("javascript");
      expect(typeof result2).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_ArraySort_001
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_APP_0100
     * @tc.desc   Test localeCompare for array sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ArraySort_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let items: string[] = ["réservé", "Premier", "Cliché", "communiqué", "café", "Adieu"];
      items.sort((a: string, b: string) => a.localeCompare(b, "fr", { ignorePunctuation: false }));
      expect(items.length).assertEqual(6);
      expect(items[0]).assertEqual("Adieu");
    });

    /**
     * @tc.name   StringLocaleCompare_CaseInsensitiveSort_002
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_APP_0200
     * @tc.desc   Test localeCompare for case insensitive sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_CaseInsensitiveSort_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let words: string[] = ["apple", "Banana", "cherry", "Date"];
      words.sort((a: string, b: string) => a.localeCompare(b, "en", { sensitivity: "base" }));
      expect(words.length).assertEqual(4);
      expect(words[0]).assertEqual("apple");
    });

    /**
     * @tc.name   StringLocaleCompare_NumericSort_003
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_APP_0300
     * @tc.desc   Test localeCompare for numeric sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NumericSort_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let numbers: string[] = ["10", "2", "1", "20", "3"];
      numbers.sort((a: string, b: string) => a.localeCompare(b, undefined, { numeric: true }));
      expect(numbers.length).assertEqual(5);
      expect(numbers[0]).assertEqual("1");
      expect(numbers[1]).assertEqual("2");
      expect(numbers[2]).assertEqual("3");
    });

    /**
     * @tc.name   StringLocaleCompare_ObjectSort_004
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_APP_0400
     * @tc.desc   Test localeCompare for object array sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ObjectSort_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      interface User {
        name: string;
      }
      let users: User[] = [{ name: "Zoé" }, { name: "Åsa" }, { name: "John" }];
      users.sort((a: User, b: User) => a.name.localeCompare(b.name, "sv"));
      expect(users.length).assertEqual(3);
      expect(users[0].name).assertEqual("John");
    });

    /**
     * @tc.name   StringLocaleCompare_SpaceHandling_005
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_APP_0500
     * @tc.desc   Test localeCompare with space handling
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_SpaceHandling_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "hello world".localeCompare("hello\u00A0world");
      expect(result1 !== 0).assertTrue();
      let result2: number = "hello world".localeCompare("hello\tworld");
      expect(result2 !== 0).assertTrue();
      let result3: number = "hello".localeCompare(" hello");
      expect(result3 !== 0).assertTrue();
      let result4: number = "hello".localeCompare("hello ");
      expect(result4 !== 0).assertTrue();
      let result5: number = " hello ".localeCompare(" hello ");
      expect(result5).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_FileNameSort_006
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_APP_0600
     * @tc.desc   Test localeCompare for file name sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_FileNameSort_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let files: string[] = ["file10.txt", "file2.txt", "file1.txt"];
      files.sort((a: string, b: string) => a.localeCompare(b, undefined, { numeric: true }));
      expect(files.length).assertEqual(3);
      expect(files[0]).assertEqual("file1.txt");
      expect(files[1]).assertEqual("file2.txt");
      expect(files[2]).assertEqual("file10.txt");
    });

    /**
     * @tc.name   StringLocaleCompare_VersionSort_007
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_APP_0700
     * @tc.desc   Test localeCompare for version sorting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_VersionSort_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let versions: string[] = ["1.10.0", "1.2.0", "1.1.0", "2.0.0"];
      versions.sort((a: string, b: string) => a.localeCompare(b, undefined, { numeric: true }));
      expect(versions.length).assertEqual(4);
      expect(versions[0]).assertEqual("1.1.0");
      expect(versions[1]).assertEqual("1.2.0");
      expect(versions[2]).assertEqual("1.10.0");
      expect(versions[3]).assertEqual("2.0.0");
    });

    /**
     * @tc.name   StringLocaleCompare_EmojiSort_008
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_APP_0800
     * @tc.desc   Test localeCompare with emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_EmojiSort_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "😀".localeCompare("😃");
      expect(result1 < 0).assertTrue();
      let result2: number = "👨".localeCompare("👩");
      expect(result2 < 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_Performance_009
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_APP_0900
     * @tc.desc   Test localeCompare performance with large array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Performance_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let arr: string[] = Array(100).fill(0).map((value: number, index: number) => `file${index}.txt`);
      arr.sort((a: string, b: string) => a.localeCompare(b, undefined, { numeric: true }));
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual("file0.txt");
      expect(arr[99]).assertEqual("file99.txt");
    });

    /**
     * @tc.name   StringLocaleCompare_InvalidOptions_001
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0100
     * @tc.desc   Test localeCompare with invalid options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_InvalidOptions_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testInvalidOptions();
      expect(typeof result.result1).assertEqual("number");
      expect(typeof result.result3).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_ThisNull_002
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0200
     * @tc.desc   Test localeCompare with this as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisNull_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testThisNull();
      expect(result.hasError).assertTrue();
      expect(result.type).assertEqual("TypeError");
    });

    /**
     * @tc.name   StringLocaleCompare_ThisUndefined_003
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0300
     * @tc.desc   Test localeCompare with this as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisUndefined_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testThisUndefined();
      expect(result.hasError).assertTrue();
      expect(result.type).assertEqual("TypeError");
    });

    /**
     * @tc.name   StringLocaleCompare_ThisNumber_004
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0400
     * @tc.desc   Test localeCompare with this as number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisNumber_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testThisNumber();
      expect(result.result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_ThisObject_005
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0500
     * @tc.desc   Test localeCompare with this as object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisObject_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testThisObject();
      expect(result.result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_ThisBoolean_006
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0600
     * @tc.desc   Test localeCompare with this as boolean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisBoolean_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testThisBoolean();
      expect(result.result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_English_001
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_LANG_0100
     * @tc.desc   Test localeCompare with English
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_English_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "apple".localeCompare("banana", "en");
      expect(result1 < 0).assertTrue();
      let result2: number = "cat".localeCompare("apple", "en");
      expect(result2 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_German_002
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_LANG_0200
     * @tc.desc   Test localeCompare with German
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_German_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "ä".localeCompare("z", "de");
      expect(result1 < 0).assertTrue();
      let result2: number = "ä".localeCompare("a", "de", { sensitivity: "base" });
      expect(result2).assertEqual(0);
      let result3: number = "straße".localeCompare("strasse", "de", { sensitivity: "base" });
      expect(result3).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_Swedish_003
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_LANG_0300
     * @tc.desc   Test localeCompare with Swedish
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Swedish_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "ä".localeCompare("z", "sv");
      expect(result1 > 0).assertTrue();
      let result2: number = "ä".localeCompare("z", "de");
      expect(result2 < 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_Chinese_004
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_LANG_0400
     * @tc.desc   Test localeCompare with Chinese
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Chinese_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "北京".localeCompare("上海", "zh-CN");
      expect(typeof result1).assertEqual("number");
      let result2: number = "中国".localeCompare("美国", "zh-CN");
      expect(typeof result2).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_Japanese_005
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_LANG_0500
     * @tc.desc   Test localeCompare with Japanese
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Japanese_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "あ".localeCompare("い", "ja");
      expect(result1 < 0).assertTrue();
      let result2: number = "さ".localeCompare("か", "ja");
      expect(result2 > 0).assertTrue();
      let result3: number = "ア".localeCompare("イ", "ja");
      expect(result3 < 0).assertTrue();
      let result4: number = "カ".localeCompare("サ", "ja");
      expect(result4 < 0).assertTrue();
      let result5: number = "日本語".localeCompare("英語", "ja");
      expect(typeof result5).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_Korean_006
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_LANG_0600
     * @tc.desc   Test localeCompare with Korean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Korean_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "가".localeCompare("나", "ko");
      expect(result1 < 0).assertTrue();
      let result2: number = "한국어".localeCompare("영어", "ko");
      expect(result2 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_Arabic_007
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_LANG_0700
     * @tc.desc   Test localeCompare with Arabic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Arabic_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "مرحبا".localeCompare("عالم", "ar");
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_Russian_008
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_LANG_0800
     * @tc.desc   Test localeCompare with Russian
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Russian_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "привет".localeCompare("мир", "ru");
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_Thai_009
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_LANG_0900
     * @tc.desc   Test localeCompare with Thai
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Thai_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "สวัสดี".localeCompare("โลก", "th");
      expect(typeof result).assertEqual("number");
    });


    /**
     * @tc.name   StringLocaleCompare_OmitParameter_001
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0100
     * @tc.desc   Test localeCompare with omitted parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_OmitParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testOmitParameter();
      expect(typeof result.result1).assertEqual("number");
      expect(result.result2).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_UndefinedParameter_002
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0200
     * @tc.desc   Test localeCompare with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_UndefinedParameter_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testUndefinedParameter();
      expect(typeof result.result).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_NullParameter_003
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0300
     * @tc.desc   Test localeCompare with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NullParameter_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNullParameter();
      expect(typeof result.result1).assertEqual("number");
      expect(result.result2).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_NumberParameter_004
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0400
     * @tc.desc   Test localeCompare with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NumberParameter_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testNumberParameter();
      expect(result.result1).assertEqual(0);
      expect(result.result2 < 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_ObjectParameter_005
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0500
     * @tc.desc   Test localeCompare with object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ObjectParameter_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testObjectParameter();
      expect(result.result1).assertEqual(0);
      expect(result.result2).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_Locales_006
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0600
     * @tc.desc   Test localeCompare with single locale
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Locales_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "ä".localeCompare("z", "de");
      expect(result1 < 0).assertTrue();
      let result2: number = "ä".localeCompare("z", "sv");
      expect(result2 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_LocaleArray_007
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0700
     * @tc.desc   Test localeCompare with locale array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_LocaleArray_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "ä".localeCompare("z", ["de", "en"]);
      expect(result1 < 0).assertTrue();
      let result2: number = "ä".localeCompare("z", ["sv", "en"]);
      expect(result2 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_UnicodeExtension_008
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0800
     * @tc.desc   Test localeCompare with Unicode extension
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_UnicodeExtension_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "2".localeCompare("10", "en-u-kn-true");
      expect(result1 < 0).assertTrue();
      let result2: number = "2".localeCompare("10", "en");
      expect(result2 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_SensitivityBase_009
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0900
     * @tc.desc   Test localeCompare with sensitivity: base
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_SensitivityBase_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "ä".localeCompare("a", "de", { sensitivity: "base" });
      expect(result1).assertEqual(0);
      let result2: number = "A".localeCompare("a", "en", { sensitivity: "base" });
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_SensitivityAccent_010
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_1000
     * @tc.desc   Test localeCompare with sensitivity: accent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_SensitivityAccent_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "ä".localeCompare("a", "de", { sensitivity: "accent" });
      expect(result1 !== 0).assertTrue();
      let result2: number = "A".localeCompare("a", "en", { sensitivity: "accent" });
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_SensitivityCase_011
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_1100
     * @tc.desc   Test localeCompare with sensitivity: case
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_SensitivityCase_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "ä".localeCompare("a", "de", { sensitivity: "case" });
      expect(result1).assertEqual(0);
      let result2: number = "A".localeCompare("a", "en", { sensitivity: "case" });
      expect(result2 !== 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_SensitivityVariant_012
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_1200
     * @tc.desc   Test localeCompare with sensitivity: variant
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_SensitivityVariant_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "ä".localeCompare("a", "de", { sensitivity: "variant" });
      expect(result1 !== 0).assertTrue();
      let result2: number = "A".localeCompare("a", "en", { sensitivity: "variant" });
      expect(result2 !== 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_NumericTrue_013
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_1300
     * @tc.desc   Test localeCompare with numeric: true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NumericTrue_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "2".localeCompare("10", undefined, { numeric: true });
      expect(result1 < 0).assertTrue();
      let result2: number = "10".localeCompare("2", undefined, { numeric: true });
      expect(result2 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_NumericFalse_014
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_1400
     * @tc.desc   Test localeCompare with numeric: false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NumericFalse_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "2".localeCompare("10", undefined, { numeric: false });
      expect(result1 > 0).assertTrue();
      let result2: number = "2".localeCompare("10");
      expect(result2 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_IgnorePunctuationTrue_015
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_1500
     * @tc.desc   Test localeCompare with ignorePunctuation: true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_IgnorePunctuationTrue_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "hello-world".localeCompare("helloworld", "en", { ignorePunctuation: true });
      expect(result1).assertEqual(0);
      let result2: number = "test!.txt".localeCompare("test.txt", "en", { ignorePunctuation: true });
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_IgnorePunctuationFalse_016
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_1600
     * @tc.desc   Test localeCompare with ignorePunctuation: false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_IgnorePunctuationFalse_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "hello-world".localeCompare("helloworld", "en", { ignorePunctuation: false });
      expect(result !== 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_CaseFirstUpper_017
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_1700
     * @tc.desc   Test localeCompare with caseFirst: upper
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_CaseFirstUpper_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "a".localeCompare("A", "en", { caseFirst: "upper" });
      expect(result > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_CaseFirstLower_018
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_1800
     * @tc.desc   Test localeCompare with caseFirst: lower
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_CaseFirstLower_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "a".localeCompare("A", "en", { caseFirst: "lower" });
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_UsageSort_020
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_2000
     * @tc.desc   Test localeCompare with usage: sort
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_UsageSort_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "a".localeCompare("b", "en", { usage: "sort" });
      expect(result < 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_UsageSearch_021
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_2100
     * @tc.desc   Test localeCompare with usage: search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_UsageSearch_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "a".localeCompare("b", "en", { usage: "search" });
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_LocaleMatcherLookup_022
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_2200
     * @tc.desc   Test localeCompare with localeMatcher: lookup
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_LocaleMatcherLookup_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".localeCompare("test", "de-DE", { localeMatcher: "lookup" });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_LocaleMatcherBestFit_023
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_2300
     * @tc.desc   Test localeCompare with localeMatcher: best fit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_LocaleMatcherBestFit_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".localeCompare("test", "de-DE", { localeMatcher: "best fit" });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_CombinedOptions_024
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_2400
     * @tc.desc   Test localeCompare with combined options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_CombinedOptions_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "file2.txt".localeCompare("FILE10.TXT", "en", {
        sensitivity: "base",
        numeric: true,
        ignorePunctuation: true
      });
      expect(result < 0).assertTrue();
    });


    /**
     * @tc.name   StringLocaleCompare_NegativeValue_001
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_RETURN_0100
     * @tc.desc   Test localeCompare returns negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NegativeValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "a".localeCompare("b");
      expect(result < 0).assertTrue();
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_ZeroValue_002
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_RETURN_0200
     * @tc.desc   Test localeCompare returns zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ZeroValue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "test".localeCompare("test");
      expect(result1).assertEqual(0);
      let result2: number = "".localeCompare("");
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_PositiveValue_003
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_RETURN_0300
     * @tc.desc   Test localeCompare returns positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_PositiveValue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "b".localeCompare("a");
      expect(result > 0).assertTrue();
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_ReturnType_004
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_RETURN_0400
     * @tc.desc   Test localeCompare return type is number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ReturnType_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "a".localeCompare("b");
      expect(typeof result).assertEqual("number");
      expect(Number.isFinite(result)).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_EmptyString_005
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BOUNDARY_0100
     * @tc.desc   Test localeCompare with empty strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_EmptyString_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "".localeCompare("");
      expect(result1).assertEqual(0);
      let result2: number = "".localeCompare("a");
      expect(result2 < 0).assertTrue();
      let result3: number = "a".localeCompare("");
      expect(result3 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_SingleCharacter_006
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BOUNDARY_0200
     * @tc.desc   Test localeCompare with single characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_SingleCharacter_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "a".localeCompare("b");
      expect(result1 < 0).assertTrue();
      let result2: number = "z".localeCompare("a");
      expect(result2 > 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_LongString_007
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BOUNDARY_0300
     * @tc.desc   Test localeCompare with long strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_LongString_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let longStr1: string = "a".repeat(10000);
      let longStr2: string = "b".repeat(10000);
      let result1: number = longStr1.localeCompare(longStr2);
      expect(result1 < 0).assertTrue();

      let prefix: string = "test".repeat(1000);
      let str1: string = prefix + "a";
      let str2: string = prefix + "b";
      let result2: number = str1.localeCompare(str2);
      expect(result2 < 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_Unicode_008
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BOUNDARY_0400
     * @tc.desc   Test localeCompare with Unicode characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_Unicode_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "😀".localeCompare("😃");
      expect(result1 < 0).assertTrue();
      let result2: number = "你好".localeCompare("世界");
      expect(typeof result2).assertEqual("number");
      let result3: number = "日本語".localeCompare("한국어");
      expect(typeof result3).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_AccentedCharacters_009
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BOUNDARY_0500
     * @tc.desc   Test localeCompare with accented characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_AccentedCharacters_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "café".localeCompare("cafe");
      expect(typeof result1).assertEqual("number");
      let result2: number = "naïve".localeCompare("naive");
      expect(typeof result2).assertEqual("number");
    });

    /**
     * @tc.name   StringLocaleCompare_ControlCharacters_010
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BOUNDARY_0600
     * @tc.desc   Test localeCompare with control characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ControlCharacters_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "hello\tworld".localeCompare("hello world");
      expect(result1 !== 0).assertTrue();
      let result2: number = "test\n".localeCompare("test");
      expect(result2 !== 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_NumericString_011
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BOUNDARY_0700
     * @tc.desc   Test localeCompare with numeric strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NumericString_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "123".localeCompare("456");
      expect(result1 < 0).assertTrue();
      let result2: number = "2".localeCompare("10");
      expect(result2 > 0).assertTrue();
      let result3: number = "2".localeCompare("10", undefined, { numeric: true });
      expect(result3 < 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_DecimalString_012
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BOUNDARY_0800
     * @tc.desc   Test localeCompare with decimal strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_DecimalString_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "1.5".localeCompare("1.10");
      expect(result1 > 0).assertTrue();
      let result2: number = "1.5".localeCompare("1.10", undefined, { numeric: true });
      expect(result2 < 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_NegativeString_013
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_BOUNDARY_0900
     * @tc.desc   Test localeCompare with negative strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NegativeString_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: number = "-5".localeCompare("-10");
      expect(result1 > 0).assertTrue();
      let result2: number = "-5".localeCompare("-10", undefined, { numeric: true });
      expect(result2 < 0).assertTrue();
    });
  });
}
