/*
* Copyright (C) 2024 HiHope Open Source Organization.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { Empty } from '../../testability/pages/DataFlg';
import { sleep } from '../../testability/pages/Utils';

export default function builtinsArrayToLocaleStringTest() {
  describe('BuiltinsArrayToLocaleStringTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.name   builtinsArrayToLocaleStringTest1001
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_0100
     * @tc.desc   Test number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayToLocaleStringTest1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect([1, 2, 3].toLocaleString()).assertEqual("1,2,3");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1002
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_0200
     * @tc.desc   Test string array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(['apple', 'banana', 'cherry'].toLocaleString()).assertEqual("apple,banana,cherry");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1003
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_0300
     * @tc.desc   Test empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([].toLocaleString()).assertEqual("");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1004
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_0400
     * @tc.desc   Test null/undefined elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, null, undefined, 3].toLocaleString()).assertEqual("1,,,3");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1005
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_0500
     * @tc.desc   Test sparse array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([1, , 3].toLocaleString()).assertEqual("1,,3");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1006
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_0600
     * @tc.desc   Test object elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const obj: Empty = {};
      const arr = []
      const actual = [obj, arr, () => {
      }].toLocaleString();
      expect(actual).assertEqual("[object Object],,Cannot get source code of funtion");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1007
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_0700
     * @tc.desc   Test nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect([[1, 2], [3, 4]].toLocaleString()).assertEqual("1,2,3,4");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1008
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_0800
     * @tc.desc   Test NaN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(NaN.toLocaleString()).assertEqual("NaN");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1009
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_0900
     * @tc.desc   Test NaN equal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(NaN.toLocaleString('en')).assertEqual("NaN");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1010
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_1000
     * @tc.desc   Test number cases
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Math.floor(1.5).toLocaleString()).assertEqual("1");
      expect((0).toLocaleString()).assertEqual("0");
      expect((-0).toLocaleString()).assertEqual("-0");
      expect(Number.EPSILON.toLocaleString()).assertEqual("0")
      expect(Number.MIN_VALUE.toLocaleString()).assertEqual("0")
      const maxValStr = Number.MAX_VALUE.toLocaleString();
      expect(maxValStr).assertEqual('179,769,313,486,231,570,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000')
      expect(Infinity.toLocaleString()).assertEqual("∞");
      expect((-Infinity).toLocaleString()).assertEqual("-∞");
      expect(123.456.toLocaleString('en-US')).assertEqual("123.456");
      expect(123.456.toLocaleString('de-DE')).assertEqual("123,456");
      expect(0xcafebabe.toLocaleString()).assertEqual("3,405,691,582");
      expect(0x0102.toLocaleString()).assertEqual("258");
      expect(0x01020304.toLocaleString()).assertEqual("16,909,060");
      expect(0x3.toLocaleString()).assertEqual("3");
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1011
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_1100
     * @tc.desc   Test special characters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~".toLocaleString())
        .assertEqual("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect([undefined].toLocaleString()).assertEqual("");
      expect([null].toLocaleString()).assertEqual("");
      expect([""].toLocaleString()).assertEqual("");
      expect("中文\u6211\u0041".toLocaleString()).assertEqual("中文我A");
      expect("caf\u00E9".toLocaleString()).assertEqual("café");
      expect("\u{1F600}".toLocaleString()).assertEqual("😀");
      expect(["😊", "🚀", "❤️"].toLocaleString()).assertEqual("😊,🚀,❤️");
      expect("👋🏻".toLocaleString()).assertEqual("👋🏻");
      expect("👨👩👧👦".toLocaleString()).assertEqual("👨👩👧👦");
      const brokenSequence = 'a\uD800b\uDC00c';
      let actual2 = brokenSequence.toLocaleString();
      expect(actual2.length).assertEqual(5);
      expect(actual2[0]).assertEqual('a');
      expect(actual2[2]).assertEqual('b');
      expect(actual2[4]).assertEqual('c');
      const arr = ['\uDFFF', '\uD800X'];
      let actual3 = arr.toLocaleString();
      const parts = actual3.split(',');
      expect(parts[1].endsWith('X')).assertTrue();
      const REPLACEMENT_CHAR = '\uFFFD'; // �
      const highSurrogate = '\uD800';
      let actual = highSurrogate.toLocaleString();
      expect(actual.length).assertEqual(1);
      const charCode = actual.charCodeAt(0);
      if (charCode === 0xD800) {
        console.log('无Unicode替换字符逻辑');
        expect(actual).assertEqual(highSurrogate);
        expect(actual2[1].charCodeAt(0)).assertEqual(55296);
        expect(actual2[3].charCodeAt(0)).assertEqual(56320);
        expect(parts[0].charCodeAt(0)).assertEqual(57343);
        expect(parts[1].charCodeAt(0)).assertEqual(55296);
      } else {
        expect(actual).assertEqual(REPLACEMENT_CHAR);
        expect(actual2[1]).assertEqual(REPLACEMENT_CHAR);
        expect(actual2[3]).assertEqual(REPLACEMENT_CHAR);
        expect(parts[0]).assertEqual(REPLACEMENT_CHAR);
        expect(parts[1].startsWith(REPLACEMENT_CHAR)).assertTrue();
      }
    });

    /**
     * @tc.name   BuiltinsArrayToLocaleStringTest1012
     * @tc.number SUB_BUILTINS_ARRAY_TOLOCALESTRING_TEST_1200
     * @tc.desc   Test boolean conversion
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsArrayToLocaleStringTest1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(true.toLocaleString()).assertEqual("true");
      expect(false.toLocaleString()).assertEqual("false");
      expect([, !0].toLocaleString()).assertEqual(",true");
      expect([!'s'].toLocaleString()).assertEqual("false");
    });
  });
}