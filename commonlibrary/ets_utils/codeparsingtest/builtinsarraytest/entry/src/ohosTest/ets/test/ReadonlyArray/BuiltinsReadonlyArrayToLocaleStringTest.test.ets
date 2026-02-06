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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
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
import { Empty } from '../../testability/pages/DataFlg';
import { sleep } from '../../testability/pages/TsMethodTest';

export default function builtinsReadonlyArrayToLocaleStringTest() {
  describe('BuiltinsReadonlyArrayToLocaleStringTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(100);
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
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_0100
     * @tc.name builtinsReadonlyArrayToLocaleStringTest1001
     * @tc.desc Test number ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsReadonlyArrayToLocaleStringTest1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      let arr: readonly number[] = [1, 2, 3];
      expect(arr.toLocaleString()).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_0200
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1002
     * @tc.desc Test string ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly string[] = ['apple', 'banana', 'cherry'];
      expect(arr.toLocaleString()).assertEqual("apple,banana,cherry");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_0300
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1003
     * @tc.desc Test empty ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [];
      expect(arr.toLocaleString()).assertEqual("");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_0400
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1004
     * @tc.desc Test null/undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number | undefined | null)[] = [1, null, undefined, 3];
      expect(arr.toLocaleString()).assertEqual("1,,,3");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_0500
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1005
     * @tc.desc Test sparse ReadonlyArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number | undefined)[] = [1, , 3];
      expect(arr.toLocaleString()).assertEqual("1,,3");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_0600
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1006
     * @tc.desc Test object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const obj: Empty = {};
      const arr = []
      let all: readonly Object[] = [obj, arr, () => {
      }]
      const actual = all.toLocaleString();
      expect(actual).assertEqual("[object Object],,Cannot get source code of funtion");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_0700
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1007
     * @tc.desc Test nested ReadonlyArrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly (number[])[] = [[1, 2], [3, 4]];
      expect(arr.toLocaleString()).assertEqual("1,2,3,4");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_0800
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1008
     * @tc.desc Test NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(NaN.toLocaleString()).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_0900
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1009
     * @tc.desc Test NaN equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(NaN.toLocaleString('en')).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_1000
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1010
     * @tc.desc Test number cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly number[] = [Math.floor(1.5), 0, -0];
      expect(arr.toLocaleString()).assertEqual("1,0,-0");
      let arr2: readonly number[] = [Number.MIN_VALUE, Number.EPSILON];
      expect(arr2.toLocaleString()).assertEqual("0,0")
      let arr3: readonly number[] = [Number.MAX_VALUE];
      const maxValStr = arr3.toLocaleString();
      expect(maxValStr).assertEqual('179,769,313,486,231,570,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,' +
        '000,000,000,000,000,000,000')
      let arr4: readonly number[] = [Infinity, -Infinity];
      expect(arr4.toLocaleString()).assertEqual("∞,-∞");
      expect(123.456.toLocaleString('en-US')).assertEqual("123.456");
      expect(123.456.toLocaleString('de-DE')).assertEqual("123,456");
      let arr5: readonly number[] = [0xcafebabe, 0x0102, 0x01020304, 0x3];
      expect(arr5.toLocaleString()).assertEqual("3,405,691,582,258,16,909,060,3");
    });

    /**
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_1100
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1011
     * @tc.desc Test special characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr1: readonly (string | undefined | null)[]
        = ["!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~", undefined, null, ""];
      expect(arr1.toLocaleString())
        .assertEqual("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~,,,");
      let arr2: readonly string[] = ["中文\u6211\u0041", "caf\u00E9", "\u{1F600}"]
      expect(arr2.toLocaleString()).assertEqual("中文我A,café,😀");
      let arr3: readonly string[] = ["😊", "🚀", "❤️", "👋🏻", "👨👩👧👦"]
      expect(arr3.toLocaleString()).assertEqual("😊,🚀,❤️,👋🏻,👨👩👧👦");
      const brokenSequence: readonly string[] = ['a\uD800b\uDC00c'];
      let actual2 = brokenSequence.toLocaleString();
      expect(actual2.length).assertEqual(5);
      expect(actual2[0]).assertEqual('a');
      expect(actual2[2]).assertEqual('b');
      expect(actual2[4]).assertEqual('c');
      const arr: readonly string[] = ['\uDFFF', '\uD800X'];
      let actual3 = arr.toLocaleString();
      const parts = actual3.split(',');
      expect(parts[1].endsWith('X')).assertTrue();
      const REPLACEMENT_CHAR = '\uFFFD'; // �
      const highSurrogate: readonly string[] = ['\uD800'];
      let actual = highSurrogate.toLocaleString();
      expect(actual.length).assertEqual(1);
      const charCode = actual.charCodeAt(0);
      if (charCode === 0xD800) {
        console.log('无Unicode替换字符逻辑');
        expect(actual).assertEqual(highSurrogate[0]);
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
     * @tc.number SUB_BUILTINS_ReadonlyArray_TOLOCALESTRING_TEST_1200
     * @tc.name BuiltinsReadonlyArrayToLocaleStringTest1012
     * @tc.desc Test boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('BuiltinsReadonlyArrayToLocaleStringTest1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      let arr: readonly boolean[] = [true, false, !0, !'s'];
      expect(arr.toLocaleString()).assertEqual("true,false,true,false");
    });

  });
}