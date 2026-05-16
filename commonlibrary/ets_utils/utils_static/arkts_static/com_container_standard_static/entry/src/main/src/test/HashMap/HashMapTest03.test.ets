/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index'
import { HashMap } from '@kit.ArkTS';
function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function HashMapTest03Test(): void {
  describe('hashMapTest03Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_0100
     * @tc.name      testHashMap0195
     * @tc.desc      String type data is passed into  '\\\\' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0195';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\\\\');
      expect(hashMap.get("key")).assertEqual('\\\\');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_0200
     * @tc.name      testHashMap0196
     * @tc.desc      String type data is passed into  ']]' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0196';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', ']]');
      expect(hashMap.get("key")).assertEqual(']]');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_0300
     * @tc.name      testHashMap0197
     * @tc.desc      String type data is passed into  '^^' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0197';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '^^');
      expect(hashMap.get("key")).assertEqual('^^');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_0400
     * @tc.name      testHashMap0198
     * @tc.desc      String type data is passed into  '__' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0198';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '__');
      expect(hashMap.get("key")).assertEqual('__');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_0500
     * @tc.name      testHashMap0199
     * @tc.desc      String type data is passed into  '``' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0199';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '``');
      expect(hashMap.get("key")).assertEqual('``');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_0600
     * @tc.name      testHashMap0200
     * @tc.desc      String type data is passed into  '{{' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0200';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '{{');
      expect(hashMap.get("key")).assertEqual('{{');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_0700
     * @tc.name      testHashMap0201
     * @tc.desc      String type data is passed into  '||' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0201';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '||');
      expect(hashMap.get("key")).assertEqual('||');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_0800
     * @tc.name      testHashMap0202
     * @tc.desc      String type data is passed into  '}}' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0202';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '}}');
      expect(hashMap.get("key")).assertEqual('}}');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_0900
     * @tc.name      testHashMap0203
     * @tc.desc      String type data is passed into  '~~' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0203';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '~~');
      expect(hashMap.get("key")).assertEqual('~~');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1000
     * @tc.name      testHashMap0204
     * @tc.desc      String type data is passed into  tab check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0204';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      let str='';
      let i: int=0;
      while(i<2){
        str+='  ';
        i++;
      }
      hashMap.set('key', str);
      expect(hashMap.get("key")).assertEqual('    ');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1100
     * @tc.name      testHashMap0205
     * @tc.desc      The special escape character \a is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0205';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\a');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(97);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1200
     * @tc.name      testHashMap0206
     * @tc.desc      The special escape character \b is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0206';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\b');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(8);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1300
     * @tc.name      testHashMap0207
     * @tc.desc      The special escape character \f is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0207';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\f');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(12);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1400
     * @tc.name      testHashMap0208
     * @tc.desc      The special escape character \n is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0208';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\n');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(10);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1500
     * @tc.name      testHashMap0209
     * @tc.desc      The special escape character \r is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0209';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\r');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(13);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1600
     * @tc.name      testHashMap0210
     * @tc.desc      The special escape character \t is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0210';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\t');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(9);
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1700
     * @tc.name      testHashMap0211
     * @tc.desc      The special escape character \v is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0211';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\v');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(11);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1800
     * @tc.name      testHashMap0212
     * @tc.desc      The special escape character \\ is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0212';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\\');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(92);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_1900
     * @tc.name      testHashMap0213
     * @tc.desc      The special escape character \' is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0213';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\'');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(39);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2000
     * @tc.name      testHashMap0214
     * @tc.desc      The special escape character \" is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0214';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\"');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(34);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2100
     * @tc.name      testHashMap0215
     * @tc.desc      The special escape character \? is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0215';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\?');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(63);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2200
     * @tc.name      testHashMap0216
     * @tc.desc      The special escape character \0 is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0216';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\0');
      expect(hashMap.get("key")!.charCodeAt(0)).assertEqual(0);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2300
     * @tc.name      testHashMap0217
     * @tc.desc      The special escape character \ddd   is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0217';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\d100');
      expect(hashMap.get('key')!.charCodeAt(0)).assertEqual(100);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2400
     * @tc.name      testHashMap0218
     * @tc.desc      The special escape character \xhh   is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0218';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\x10');
      expect(hashMap.get('key')!.charCodeAt(0)).assertEqual(16);
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2500
     * @tc.name      testHashMap0219
     * @tc.desc      Emoticon 👆 is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0219';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '👆';
      const unicodeEscapeChar = '\ud83d\udc46';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2600
     * @tc.name      testHashMap0220
     * @tc.desc      Emoticon 👿 is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0220';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '👿';
      const unicodeEscapeChar = '\ud83d\udc7f';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2700
     * @tc.name      testHashMap0221
     * @tc.desc      Emoticon 👀 is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0221';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '👀';
      const unicodeEscapeChar = '\ud83d\udc40';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2800
     * @tc.name      testHashMap0222
     * @tc.desc      Emoticon 💯 is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0222';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '💯';
      const unicodeEscapeChar = '\ud83d\udcaf';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_2900
     * @tc.name      testHashMap0223
     * @tc.desc      Emoticon 🎅 is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0223';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '🎅';
      const unicodeEscapeChar = '\ud83c\udf85';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3000
     * @tc.name      testHashMap0224
     * @tc.desc      Emoticon 😼 is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0224';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '😼';
      const unicodeEscapeChar = '\ud83d\ude3c';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3100
     * @tc.name      testHashMap0225
     * @tc.desc      Emoticon 🔧 is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0225';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '🔧';
      const unicodeEscapeChar = '\ud83d\udd27';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3200
     * @tc.name      testHashMap0226
     * @tc.desc      Emoticon 💇 is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0226';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '💇';
      const unicodeEscapeChar = '\ud83d\udc87';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3300
     * @tc.name      testHashMap0227
     * @tc.desc      Emoticon 🤼‍♂�?is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0227';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '🤼‍♂�?';
      const unicodeEscapeChar = '\ud83e\udd3c\u200d\u2642\ufe0f';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3400
     * @tc.name      testHashMap0228
     * @tc.desc      Emoticon 🛢�?is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0228';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '🛢';
      const unicodeEscapeChar = '\ud83d\udee2';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3500
     * @tc.name      testHashMap0229
     * @tc.desc      Emoticon  🀄️ is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0229';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '�?';
      const unicodeEscapeChar = '\ud83c\udc04';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3600
     * @tc.name      testHashMap0230
     * @tc.desc      Emoticon 🏴 is passed in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0230';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      const emojiChar = '🏴';
      const unicodeEscapeChar = '\ud83c\udff4';
      hashMap.set('key', emojiChar);
      expect(hashMap.get('key')).assertEqual(emojiChar);
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3700
     * @tc.name      testHashMap0231
     * @tc.desc      Illegal unicode encoding \udc04 in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0231", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0231';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\udc04');
      expect(hashMap.get('key')).assertEqual('\udc04');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3800
     * @tc.name      testHashMap0232
     * @tc.desc      Illegal unicode encoding \ud83d in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0232", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0232';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\ud83d');
      expect(hashMap.get('key')).assertEqual('\ud83d');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_3900
     * @tc.name      testHashMap0233
     * @tc.desc       Illegal unicode encoding \udff4 in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0233", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0233';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\udff4');
      expect(hashMap.get('key')).assertEqual('\udff4');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4000
     * @tc.name      testHashMap0234
     * @tc.desc      Input keyword NaN in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0234", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0234';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'NaN');
      expect(hashMap.get("key")).assertEqual('NaN');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4100
     * @tc.name      testHashMap0235
     * @tc.desc      Pass in the type of treeString in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0235';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();

      let ans = '[';
      let i: int=0
      while (i < 9) {
        ans += '{"a":1},';
        i++;
      }
      ans += '{"a":1}]';

      hashMap.set('key', ans);
      expect(hashMap.get("key")!.substring(1,ans.length-1).length).assertEqual('{"a":1}'.length*10+','.length*9);
      expect(hashMap.get("key")!.substring(1,ans.length-1).split(',')[0]).assertEqual('{"a":1}')
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4200
     * @tc.name      testHashMap0236
     * @tc.desc      Passing in the sliceString type for multiple recursive calls in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0236", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0236';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      let str = "{k1:value1,k2:value2}";
      hashMap.set('key', str);

      let i: int=0
      while(i<5)
      {
        expect(hashMap.get("key")!.substring(0,str.length-2)).assertEqual('{k1:value1,k2:value');
        i++;
      }
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4300
     * @tc.name      testHashMap0237
     * @tc.desc      A very large string is passed in the string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0237", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0237';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      let str = "a".repeat(100);
      hashMap.set('key', str);
      expect(hashMap.get("key")).assertEqual(str);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4400
     * @tc.name      testHashMap0238
     * @tc.desc      Release references after storing extremely large strings in string data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0238", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0238';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();

      let largeStr = "a".repeat(1000);
      hashMap.set('largeKey', largeStr);
      expect(hashMap.get("largeKey")).assertEqual(largeStr);

      largeStr = "";
      hashMap.remove('largeKey');
      hashMap.clear();
      expect(hashMap.get("largeKey")).assertEqual(undefined);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4500
     * @tc.name      testHashMap0239
     * @tc.desc      Number type data is passed in with a check item of 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0239", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0239';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', 0);
      expect(hashMap.get("key")).assertEqual(0);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4600
     * @tc.name      testHashMap0240
     * @tc.desc      Number type data is passed in with a check item of undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0240';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number | undefined>();
      hashMap.set('key', undefined);
      expect(hashMap.get("key")).assertEqual(undefined);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4700
     * @tc.name      testHashMap0241
     * @tc.desc      Number type data is passed in with a check item of NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0241", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0241';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', NaN);
      expect(Number.isNaN(hashMap.get("key")!)).assertTrue();
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4800
     * @tc.name      testHashMap0242
     * @tc.desc      Number type data is passed in with a check item of -0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0242", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0242';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', -0);
      expect(hashMap.get("key")).assertEqual(-0);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_4900
     * @tc.name      testHashMap0243
     * @tc.desc      Number type data is passed in with a check item of Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0243", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0243';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', Infinity);
      expect(hashMap.get("key")).assertEqual(Infinity);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5000
     * @tc.name      testHashMap0244
     * @tc.desc      Number type data is passed in with a check item of -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0244", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0244';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', -Infinity);
      expect(hashMap.get("key")).assertEqual(-Infinity);
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5100
     * @tc.name      testHashMap0245
     * @tc.desc      Number type data is passed in with a check item of double type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0245", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0245';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', Math.floor(1.5));
      expect(hashMap.get("key")).assertEqual(Math.floor(1.5));
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5200
     * @tc.name      testHashMap0246
     * @tc.desc      Number type data is passed in with Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0246", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0246';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', Number.MAX_VALUE);
      expect(hashMap.get("key")).assertEqual(1.7976931348623157e+308);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5300
     * @tc.name      testHashMap0247
     * @tc.desc      Number type data is passed in with Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0247", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0247';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', Number.MIN_VALUE);
      expect(hashMap.get("key")).assertEqual(5e-324);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5400
     * @tc.name      testHashMap0248
     * @tc.desc      The difference between the input number type data and the smallest floating-point
                     number greater than 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0248", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0248';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', Number.EPSILON);
      expect(hashMap.get("key")).assertEqual(2.220446049250313e-16);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5500
     * @tc.name      testHashMap0249
     * @tc.desc      Data of type number is passed into The difference between the input number type data
     *               and the smallest floating-point number greater than 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0249", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0249';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', Number.EPSILON);
      expect(hashMap.get("key")).assertEqual(2.220446049250313e-16);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5600
     * @tc.name      testHashMap0250
     * @tc.desc      Data of type number is passed into Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0250';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      hashMap.set('key', Number.MAX_SAFE_INTEGER);
      expect(hashMap.get("key")).assertEqual(2**53-1);
      console.log(TAG + ' end');
    });



    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5700
     * @tc.name      testHashMap0251
     * @tc.desc      Data of type number is passed into -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0251", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0251';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=-128
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5800
     * @tc.name      testHashMap0252
     * @tc.desc      Data of type number is passed into 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0252", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0252';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=127
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_5900
     * @tc.name      testHashMap0253
     * @tc.desc      Data of type number is passed into -32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0253", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0253';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=-32768
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6000
     * @tc.name      testHashMap0254
     * @tc.desc      Data of type number is passed into 32767
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0254", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0254';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=32767
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6100
     * @tc.name      testHashMap0255
     * @tc.desc      Data of type number is passed into -2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0255", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0255';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=-2147483648
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6200
     * @tc.name      testHashMap0256
     * @tc.desc      Data of type number is passed into 2147483647
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0256", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0256';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=2147483647
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6300
     * @tc.name      testHashMap0257
     * @tc.desc      Data of type number is passed into -9223372036854775808
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0257", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0257';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=-9223372036854775808
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6400
     * @tc.name      testHashMap0258
     * @tc.desc      Data of type number is passed into 9223372036854775807
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0258", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0258';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=9223372036854775807
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6500
     * @tc.name      testHashMap0259
     * @tc.desc      Data of type number is passed into 1.40129846432481707e-45
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0259", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0259';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=1.40129846432481707e-45
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6600
     * @tc.name      testHashMap0260
     * @tc.desc      Data of type number is passed into -1.40129846432481707e-45
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0260';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=-1.40129846432481707e-45
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6700
     * @tc.name      testHashMap0261
     * @tc.desc      Data of type number is passed into 3.40282346638528860e+38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0261", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0261';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=3.40282346638528860e+38
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6800
     * @tc.name      testHashMap0262
     * @tc.desc      Data of type number is passed into -3.40282346638528860e+38
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0262", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0262';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=-3.40282346638528860e+38
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_6900
     * @tc.name      testHashMap0263
     * @tc.desc      Data of type number is passed into 4.94065645841246544e-324
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0263", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0263';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=4.94065645841246544e-324
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7000
     * @tc.name      testHashMap0264
     * @tc.desc      Data of type number is passed into -4.94065645841246544e-324
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0264", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0264';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=-4.94065645841246544e-324
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7100
     * @tc.name      testHashMap0265
     * @tc.desc      Data of type number is passed into 1.79769313486231570e+308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0265", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0265';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=1.79769313486231570e+308
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7200
     * @tc.name      testHashMap0266
     * @tc.desc      Data of type number is passed into -1.79769313486231570e+308
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0266", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0266';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=-1.79769313486231570e+308
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7300
     * @tc.name      testHashMap0267
     * @tc.desc      Data of type number is passed into 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0267", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0267';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=0
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7400
     * @tc.name      testHashMap0268
     * @tc.desc      Data of type number is passed into 65535
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0268", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0268';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=65535
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7500
     * @tc.name      testHashMap0269
     * @tc.desc      Data of type number is passed into BigInt(0xdecafafecacefade)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0269", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0269';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, BigInt>();
      let num: BigInt = BigInt("16045170604489821470")
      hashMap.set('key', num);
      expect(hashMap.get("key")!.toString()).assertEqual(num.toString());
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7600
     * @tc.name      testHashMap0270
     * @tc.desc      Data of type number is passed into 123.456
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0270';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=123.456
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7700
     * @tc.name      testHashMap0271
     * @tc.desc      Data of type number is passed into float(0xcafebabe)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0271", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0271';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=0xcafebabe
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7800
     * @tc.name      testHashMap0272
     * @tc.desc      Data of type number is passed into hexadecimal (0x0102)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0272", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0272';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=0x0102
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_7900
     * @tc.name      testHashMap0273
     * @tc.desc      Data of type number is passed into base 32 (0x01020304)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0273", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0273';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=0x01020304
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8000
     * @tc.name      testHashMap0274
     * @tc.desc      Data of type number is passed into  octal(0x3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0274", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0274';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: int=0x3
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8100
     * @tc.name      testHashMap0275
     * @tc.desc      Inputting number type data for exponential operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0275", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0275';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num: number = 2**3
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(8);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8200
     * @tc.name      testHashMap0276
     * @tc.desc      The input parameter for number type data is in Scientific notation(1e3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0276", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0276';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=1e3
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8300
     * @tc.name      testHashMap0277
     * @tc.desc      The input parameter for number type data is in Scientific notation(2.5e-2)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0277", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0277';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=2.5e-2
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertEqual(num);
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8400
     * @tc.name      testHashMap0278
     * @tc.desc      Data of type number is passed into  BigInt(9007199254740991n)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0278", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0278';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, number>();
      let num=9007199254740991;
      hashMap.set('key', num);
      expect(hashMap.get("key")!.toString()).assertEqual(BigInt(9007199254740991).toString());
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8500
     * @tc.name      testHashMap0279
     * @tc.desc      The boolean type data passed in as a parameter is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0279", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0279';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, boolean>();
      let num=true;
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertTrue()
      console.log(TAG + ' end');
    });


    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8600
     * @tc.name      testHashMap0280
     * @tc.desc      The boolean type data passed in as a parameter is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0280';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, boolean>();
      let num=false;
      hashMap.set('key', num);
      expect(hashMap.get("key")).assertFalse()
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8700
     * @tc.name      testHashMap0281
     * @tc.desc      0 can be used as a substitute for false in boolean type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0281", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0281';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, boolean>();
      let num: int=0;
      if(num){
        hashMap.set("key",true);
        expect(hashMap.get("key")).assertEqual(true)
      }
      else {
        hashMap.set("key",false);
        expect(hashMap.get("key")).assertEqual(false)
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8800
     * @tc.name      testHashMap0282
     * @tc.desc      NaN can be used as a substitute for false in boolean type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0282", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0282';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, boolean>();
      let num=NaN;
      if(num){
        hashMap.set("key",true);
        expect(hashMap.get("key")).assertEqual(true)
      }
      else {
        hashMap.set("key",false);
        expect(hashMap.get("key")).assertEqual(false)
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_8900
     * @tc.name      testHashMap0283
     * @tc.desc      "" can be used as a substitute for false in boolean type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0283", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0283';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, boolean>();
      let num="";
      if(num){
        hashMap.set("key",true);
        expect(hashMap.get("key")).assertEqual(true)
      }
      else {
        hashMap.set("key",false);
        expect(hashMap.get("key")).assertEqual(false)
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_9000
     * @tc.name      testHashMap0284
     * @tc.desc      null can be used as a substitute for false in boolean type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0284", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0284';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, boolean>();
      let num=null;
      if(num){
        hashMap.set("key",true);
        expect(hashMap.get("key")).assertEqual(true)
      }
      else {
        hashMap.set("key",false);
        expect(hashMap.get("key")).assertEqual(false)
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_9100
     * @tc.name      testHashMap0285
     * @tc.desc      undefined can be used as a substitute for false in boolean type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0285", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0285';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, boolean>();
      let num=undefined;
      if(num){
        hashMap.set("key",true);
        expect(hashMap.get("key")).assertEqual(true)
      }
      else {
        hashMap.set("key",false);
        expect(hashMap.get("key")).assertEqual(false)
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_9200
     * @tc.name      testHashMap0286
     * @tc.desc      !+ Other data types can be used as substitutes for boolean data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0286", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0286';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, boolean>();
      let num=!'s';
      if(num){
        hashMap.set("key",true);
        expect(hashMap.get("key")).assertEqual(true)
      }
      else {
        hashMap.set("key",false);
        expect(hashMap.get("key")).assertEqual(false)
      }
      console.log(TAG + ' end');
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHMAP_TESTTHREE_9300
     * @tc.name      testHashMap0287
     * @tc.desc      !+ Other data types can be used as substitutes for boolean data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0287", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0287';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, boolean>();
      let num=!0;
      if(num){
        hashMap.set("key",true);
        console.log("num:true")
        expect(hashMap.get("key")).assertEqual(true)
      }
      else {
        hashMap.set("key",false);
        expect(hashMap.get("key")).assertEqual(false)
      }
      console.log(TAG + ' end');
    });


  })
}
