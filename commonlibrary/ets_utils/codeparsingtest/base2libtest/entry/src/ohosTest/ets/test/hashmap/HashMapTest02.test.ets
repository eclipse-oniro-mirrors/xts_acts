/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium'
import { HashMap } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function HashMapTest02Test() {
  describe('hashMapTest02Test', () => {
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
     * @tc.number    SUB_HASHMAP_TEST_0189
     * @tc.name      testHashMap0090
     * @tc.desc      String type data is passed into  '-' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0090';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '-');
      expect(hashMap.get("key")).assertEqual('-');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0190
     * @tc.name      testHashMap0091
     * @tc.desc      String type data is passed into  '.' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0091';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '.');
      expect(hashMap.get("key")).assertEqual('.');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0191
     * @tc.name      testHashMap0092
     * @tc.desc      String type data is passed into  '/' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0092';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '/');
      expect(hashMap.get("key")).assertEqual('/');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0192
     * @tc.name      testHashMap0093
     * @tc.desc      String type data is passed into  ':' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0093';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', ':');
      expect(hashMap.get("key")).assertEqual(':');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0193
     * @tc.name      testHashMap0094
     * @tc.desc      String type data is passed into  ';' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0094';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', ';');
      expect(hashMap.get("key")).assertEqual(';');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0194
     * @tc.name      testHashMap0095
     * @tc.desc      String type data is passed into  '<' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0095';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '<');
      expect(hashMap.get("key")).assertEqual('<');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0195
     * @tc.name      testHashMap0096
     * @tc.desc      String type data is passed into  '=' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0096';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '=');
      expect(hashMap.get("key")).assertEqual('=');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0196
     * @tc.name      testHashMap0097
     * @tc.desc      String type data is passed into  '>' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0097';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '>');
      expect(hashMap.get("key")).assertEqual('>');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0197
     * @tc.name      testHashMap0098
     * @tc.desc      String type data is passed into  '?' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0098';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '?');
      expect(hashMap.get("key")).assertEqual('?');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0198
     * @tc.name      testHashMap0099
     * @tc.desc      String type data is passed into  '@' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0099';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '@');
      expect(hashMap.get("key")).assertEqual('@');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0199
     * @tc.name      testHashMap0100
     * @tc.desc      String type data is passed into  '[' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0100';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '[');
      expect(hashMap.get("key")).assertEqual('[');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0200
     * @tc.name      testHashMap0101
     * @tc.desc      String type data is passed into  '\\' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0101';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '\\');
      expect(hashMap.get("key")).assertEqual('\\');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0201
     * @tc.name      testHashMap0102
     * @tc.desc      String type data is passed into  ']' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0102';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', ']');
      expect(hashMap.get("key")).assertEqual(']');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0202
     * @tc.name      testHashMap0103
     * @tc.desc      String type data is passed into  '^' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0103';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '^');
      expect(hashMap.get("key")).assertEqual('^');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0203
     * @tc.name      testHashMap0104
     * @tc.desc      String type data is passed into  '_' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0104';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '_');
      expect(hashMap.get("key")).assertEqual('_');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0204
     * @tc.name      testHashMap0105
     * @tc.desc      String type data is passed into  '`' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0105';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '`');
      expect(hashMap.get("key")).assertEqual('`');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0205
     * @tc.name      testHashMap0106
     * @tc.desc      String type data is passed into  '{' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0106';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '{');
      expect(hashMap.get("key")).assertEqual('{');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0206
     * @tc.name      testHashMap0107
     * @tc.desc      String type data is passed into  '|' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0107';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '|');
      expect(hashMap.get("key")).assertEqual('|');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0207
     * @tc.name      testHashMap0108
     * @tc.desc      String type data is passed into  '}' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0108';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '}');
      expect(hashMap.get("key")).assertEqual('}');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0208
     * @tc.name      testHashMap0109
     * @tc.desc      String type data is passed into  '~' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0109';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '~');
      expect(hashMap.get("key")).assertEqual('~');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0209
     * @tc.name      testHashMap0110
     * @tc.desc      String type data is passed into  '0' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0110';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '0');
      expect(hashMap.get("key")).assertEqual('0');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0210
     * @tc.name      testHashMap0111
     * @tc.desc      String type data is passed into  '1' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0111';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '1');
      expect(hashMap.get("key")).assertEqual('1');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0211
     * @tc.name      testHashMap0112
     * @tc.desc      String type data is passed into  '2' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0112';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '2');
      expect(hashMap.get("key")).assertEqual('2');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0212
     * @tc.name      testHashMap0113
     * @tc.desc      String type data is passed into  '3' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0113';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '3');
      expect(hashMap.get("key")).assertEqual('3');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0213
     * @tc.name      testHashMap0114
     * @tc.desc      String type data is passed into  '4' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0114';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '4');
      expect(hashMap.get("key")).assertEqual('4');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0214
     * @tc.name      testHashMap0115
     * @tc.desc      String type data is passed into  '5' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0115';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '5');
      expect(hashMap.get("key")).assertEqual('5');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0215
     * @tc.name      testHashMap0116
     * @tc.desc      String type data is passed into  '6' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0116';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '6');
      expect(hashMap.get("key")).assertEqual('6');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0216
     * @tc.name      testHashMap0117
     * @tc.desc      String type data is passed into  '7' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0117';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '7');
      expect(hashMap.get("key")).assertEqual('7');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0217
     * @tc.name      testHashMap0118
     * @tc.desc      String type data is passed into  '8' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0118';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '8');
      expect(hashMap.get("key")).assertEqual('8');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0218
     * @tc.name      testHashMap0119
     * @tc.desc      String type data is passed into  '9' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0119';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '9');
      expect(hashMap.get("key")).assertEqual('9');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0219
     * @tc.name      testHashMap0120
     * @tc.desc      String type data is passed into  'A' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0120';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'A');
      expect(hashMap.get('key')).assertEqual('A');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0220
     * @tc.name      testHashMap0121
     * @tc.desc      String type data is passed into  'B' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0121';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'B');
      expect(hashMap.get("key")).assertEqual('B');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0221
     * @tc.name      testHashMap0122
     * @tc.desc      String type data is passed into  'C' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0122';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'C');
      expect(hashMap.get("key")).assertEqual('C');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0222
     * @tc.name      testHashMap0123
     * @tc.desc      String type data is passed into  'D' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0123';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'D');
      expect(hashMap.get("key")).assertEqual('D');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0223
     * @tc.name      testHashMap0124
     * @tc.desc      String type data is passed into  'E' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0124';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'E');
      expect(hashMap.get("key")).assertEqual('E');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0224
     * @tc.name      testHashMap0125
     * @tc.desc      String type data is passed into  'F' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0125';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'F');
      expect(hashMap.get("key")).assertEqual('F');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0225
     * @tc.name      testHashMap0126
     * @tc.desc      String type data is passed into  'G' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0126';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'G');
      expect(hashMap.get("key")).assertEqual('G');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0226
     * @tc.name      testHashMap0127
     * @tc.desc      String type data is passed into  'H' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0127';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'H');
      expect(hashMap.get("key")).assertEqual('H');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0227
     * @tc.name      testHashMap0128
     * @tc.desc      String type data is passed into  'I' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0128';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'I');
      expect(hashMap.get("key")).assertEqual('I');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0228
     * @tc.name      testHashMap0129
     * @tc.desc      String type data is passed into  'J' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0129';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'J');
      expect(hashMap.get("key")).assertEqual('J');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0229
     * @tc.name      testHashMap0130
     * @tc.desc      String type data is passed into  'K' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0130';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'K');
      expect(hashMap.get("key")).assertEqual('K');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0230
     * @tc.name      testHashMap0131
     * @tc.desc      String type data is passed into  'L' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0131';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'L');
      expect(hashMap.get("key")).assertEqual('L');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0231
     * @tc.name      testHashMap0132
     * @tc.desc      String type data is passed into  'M' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0132';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'M');
      expect(hashMap.get("key")).assertEqual('M');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0232
     * @tc.name      testHashMap0133
     * @tc.desc      String type data is passed into  'N' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0133';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'N');
      expect(hashMap.get("key")).assertEqual('N');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0233
     * @tc.name      testHashMap0134
     * @tc.desc      String type data is passed into  'O' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0134';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'O');
      expect(hashMap.get("key")).assertEqual('O');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0234
     * @tc.name      testHashMap0135
     * @tc.desc      String type data is passed into  'P' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0135';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'P');
      expect(hashMap.get("key")).assertEqual('P');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0235
     * @tc.name      testHashMap0136
     * @tc.desc      String type data is passed into  'Q' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0136';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'Q');
      expect(hashMap.get("key")).assertEqual('Q');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0236
     * @tc.name      testHashMap0137
     * @tc.desc      String type data is passed into  'R' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0137';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'R');
      expect(hashMap.get("key")).assertEqual('R');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0237
     * @tc.name      testHashMap0138
     * @tc.desc      String type data is passed into  'S' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0138';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'S');
      expect(hashMap.get("key")).assertEqual('S');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0238
     * @tc.name      testHashMap0139
     * @tc.desc      String type data is passed into  'T' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0139';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'T');
      expect(hashMap.get("key")).assertEqual('T');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0239
     * @tc.name      testHashMap0140
     * @tc.desc      String type data is passed into  'U' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0140';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'U');
      expect(hashMap.get("key")).assertEqual('U');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0240
     * @tc.name      testHashMap0141
     * @tc.desc      String type data is passed into  'V' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0141';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'V');
      expect(hashMap.get("key")).assertEqual('V');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0241
     * @tc.name      testHashMap0142
     * @tc.desc      String type data is passed into  'W' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0142';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'W');
      expect(hashMap.get("key")).assertEqual('W');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0242
     * @tc.name      testHashMap0143
     * @tc.desc      String type data is passed into  'X' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0143';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'X');
      expect(hashMap.get("key")).assertEqual('X');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0243
     * @tc.name      testHashMap0144
     * @tc.desc      String type data is passed into  'Y' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0144';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'Y');
      expect(hashMap.get("key")).assertEqual('Y');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0244
     * @tc.name      testHashMap0145
     * @tc.desc      String type data is passed into  'Z' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0145';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'Z');
      expect(hashMap.get("key")).assertEqual('Z');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0245
     * @tc.name      testHashMap0146
     * @tc.desc      String type data is passed into  'a' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0146';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'a');
      expect(hashMap.get("key")).assertEqual('a');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0246
     * @tc.name      testHashMap0147
     * @tc.desc      String type data is passed into  'b' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0147';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'b');
      expect(hashMap.get("key")).assertEqual('b');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0247
     * @tc.name      testHashMap0148
     * @tc.desc      String type data is passed into  'c' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0148';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'c');
      expect(hashMap.get("key")).assertEqual('c');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0248
     * @tc.name      testHashMap0149
     * @tc.desc      String type data is passed into  'd' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0149';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'd');
      expect(hashMap.get("key")).assertEqual('d');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0249
     * @tc.name      testHashMap0150
     * @tc.desc      String type data is passed into  'e' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0150';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'e');
      expect(hashMap.get("key")).assertEqual('e');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0250
     * @tc.name      testHashMap0151
     * @tc.desc      String type data is passed into  'f' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0151';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'f');
      expect(hashMap.get("key")).assertEqual('f');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0251
     * @tc.name      testHashMap0152
     * @tc.desc      String type data is passed into  'g' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0152';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'g');
      expect(hashMap.get("key")).assertEqual('g');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0252
     * @tc.name      testHashMap0153
     * @tc.desc      String type data is passed into  'h' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0153';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'h');
      expect(hashMap.get("key")).assertEqual('h');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0253
     * @tc.name      testHashMap0154
     * @tc.desc      String type data is passed into  'i' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0154';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'i');
      expect(hashMap.get("key")).assertEqual('i');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0254
     * @tc.name      testHashMap0155
     * @tc.desc      String type data is passed into  'j' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0155';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'j');
      expect(hashMap.get("key")).assertEqual('j');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0255
     * @tc.name      testHashMap0156
     * @tc.desc      String type data is passed into  'k' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0156';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'k');
      expect(hashMap.get("key")).assertEqual('k');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0256
     * @tc.name      testHashMap0157
     * @tc.desc      String type data is passed into  'l' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0157';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'l');
      expect(hashMap.get("key")).assertEqual('l');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0257
     * @tc.name      testHashMap0158
     * @tc.desc      String type data is passed into  'm' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0132';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'm');
      expect(hashMap.get("key")).assertEqual('m');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0258
     * @tc.name      testHashMap0159
     * @tc.desc      String type data is passed into  'n' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0159';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'n');
      expect(hashMap.get("key")).assertEqual('n');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0259
     * @tc.name      testHashMap0160
     * @tc.desc      String type data is passed into  'o' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0160';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'o');
      expect(hashMap.get("key")).assertEqual('o');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0260
     * @tc.name      testHashMap0161
     * @tc.desc      String type data is passed into  'p' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0161';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'p');
      expect(hashMap.get("key")).assertEqual('p');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0261
     * @tc.name      testHashMap0162
     * @tc.desc      String type data is passed into  'q' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0162';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'q');
      expect(hashMap.get("key")).assertEqual('q');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0262
     * @tc.name      testHashMap0163
     * @tc.desc      String type data is passed into  'r' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0163';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'r');
      expect(hashMap.get("key")).assertEqual('r');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0263
     * @tc.name      testHashMap0164
     * @tc.desc      String type data is passed into  's' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0164';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 's');
      expect(hashMap.get("key")).assertEqual('s');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0264
     * @tc.name      testHashMap0165
     * @tc.desc      String type data is passed into  't' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0165';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 't');
      expect(hashMap.get("key")).assertEqual('t');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0265
     * @tc.name      testHashMap0166
     * @tc.desc      String type data is passed into  'u' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0166';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'u');
      expect(hashMap.get("key")).assertEqual('u');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0266
     * @tc.name      testHashMap0167
     * @tc.desc      String type data is passed into  'v' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0167';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'v');
      expect(hashMap.get("key")).assertEqual('v');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0267
     * @tc.name      testHashMap0168
     * @tc.desc      String type data is passed into  'w' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0168';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'w');
      expect(hashMap.get("key")).assertEqual('w');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0268
     * @tc.name      testHashMap0169
     * @tc.desc      String type data is passed into  'x' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0169';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'x');
      expect(hashMap.get("key")).assertEqual('x');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0269
     * @tc.name      testHashMap0170
     * @tc.desc      String type data is passed into  'y' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0170';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'y');
      expect(hashMap.get("key")).assertEqual('y');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0270
     * @tc.name      testHashMap0171
     * @tc.desc      String type data is passed into  'z' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0171';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', 'z');
      expect(hashMap.get("key")).assertEqual('z');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0271
     * @tc.name      testHashMap0172
     * @tc.desc      String type data is passed into '!!' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0172';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '!!');
      expect(hashMap.get("key")).assertEqual('!!');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0272
     * @tc.name      testHashMap0173
     * @tc.desc      String type data is passed into '""' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0173';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '""');
      expect(hashMap.get("key")).assertEqual('""');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0273
     * @tc.name      testHashMap0174
     * @tc.desc      String type data is passed into '##' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0174';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '##');
      expect(hashMap.get("key")).assertEqual('##');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0274
     * @tc.name      testHashMap0175
     * @tc.desc      String type data is passed into '$$' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0175';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '$$');
      expect(hashMap.get("key")).assertEqual('$$');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0275
     * @tc.name      testHashMap0176
     * @tc.desc      String type data is passed into '%%' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0176';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '%%');
      expect(hashMap.get("key")).assertEqual('%%');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0276
     * @tc.name      testHashMap0177
     * @tc.desc      String type data is passed into '&&' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0177';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '&&');
      expect(hashMap.get("key")).assertEqual('&&');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0277
     * @tc.name      testHashMap0178
     * @tc.desc      String type data is passed into  "''" check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0178';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', "''");
      expect(hashMap.get("key")).assertEqual( "''");
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0278
     * @tc.name      testHashMap0179
     * @tc.desc      String type data is passed into  '((' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0179';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '((');
      expect(hashMap.get("key")).assertEqual( '((');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0279
     * @tc.name      testHashMap0180
     * @tc.desc      String type data is passed into  '))' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0180';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '))');
      expect(hashMap.get("key")).assertEqual('))');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0280
     * @tc.name      testHashMap0181
     * @tc.desc      String type data is passed into  '**' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0181';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '**');
      expect(hashMap.get("key")).assertEqual('**');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0281
     * @tc.name      testHashMap0182
     * @tc.desc      String type data is passed into  '++' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0182';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '++');
      expect(hashMap.get("key")).assertEqual('++');
      console.log(TAG + ' end');
    });
    /**
     * @tc.number    SUB_HASHMAP_TEST_0282
     * @tc.name      testHashMap0183
     * @tc.desc      String type data is passed into  ',,' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0183';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', ',,');
      expect(hashMap.get("key")).assertEqual(',,');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0283
     * @tc.name      testHashMap0184
     * @tc.desc      String type data is passed into  '--' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0184';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '--');
      expect(hashMap.get("key")).assertEqual('--');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0284
     * @tc.name      testHashMap0185
     * @tc.desc      String type data is passed into  '..' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0185';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '..');
      expect(hashMap.get("key")).assertEqual('..');
      console.log(TAG + ' end');
    });

    /**
     * @tc.number    SUB_HASHMAP_TEST_0285
     * @tc.name      testHashMap0186
     * @tc.desc      String type data is passed into  '//' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0186';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '//');
      expect(hashMap.get("key")).assertEqual('//');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0286
     * @tc.name      testHashMap0187
     * @tc.desc      String type data is passed into  '::' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0187';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '::');
      expect(hashMap.get("key")).assertEqual('::');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0287
     * @tc.name      testHashMap0188
     * @tc.desc      String type data is passed into  ';;' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0188';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', ';;');
      expect(hashMap.get("key")).assertEqual(';;');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0288
     * @tc.name      testHashMap0189
     * @tc.desc      String type data is passed into  '<<' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0189';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '<<');
      expect(hashMap.get("key")).assertEqual('<<');
      console.log(TAG + ' end');
    });



    /**
     * @tc.number    SUB_HASHMAP_TEST_0289
     * @tc.name      testHashMap0190
     * @tc.desc      String type data is passed into  '==' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0190';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '==');
      expect(hashMap.get("key")).assertEqual('==');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0290
     * @tc.name      testHashMap0191
     * @tc.desc      String type data is passed into  '>>' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0191';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '>>');
      expect(hashMap.get("key")).assertEqual('>>');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0291
     * @tc.name      testHashMap0192
     * @tc.desc      String type data is passed into  '??' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0192';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '??');
      expect(hashMap.get("key")).assertEqual('??');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0292
     * @tc.name      testHashMap0193
     * @tc.desc      String type data is passed into  '@@' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0193';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '@@');
      expect(hashMap.get("key")).assertEqual('@@');
      console.log(TAG + ' end');
    });


    /**
     * @tc.number    SUB_HASHMAP_TEST_0293
     * @tc.name      testHashMap0194
     * @tc.desc      String type data is passed into  '[[' check item
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashMap0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashMap0194';
      console.log(TAG + ' start');
      let hashMap = new HashMap<string, string>();
      hashMap.set('key', '[[');
      expect(hashMap.get("key")).assertEqual('[[');
      console.log(TAG + ' end');
    });


  })
}