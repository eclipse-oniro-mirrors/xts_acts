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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function StringToStringBasicTest():void {
  describe('StringToStringBasicTest', () => {
    beforeAll(() => {
    })
    beforeEach( async () => {
      await Utils.msSleep(20)
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringToString_Basic_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0100
     * @tc.desc   Test toString() with ordinary string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'hello world';
      const result: string = str.toString();
      expect(result).assertEqual('hello world');
    });

    /**
     * @tc.name   StringToString_Basic_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0200
     * @tc.desc   Test toString() with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '';
      const result: string = str.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringToString_Basic_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0300
     * @tc.desc   Test toString() with single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'a';
      const result: string = str.toString();
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringToString_Basic_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0400
     * @tc.desc   Test toString() with String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('foo');
      const result: string = strObj.toString();
      expect(result).assertEqual('foo');
    });

    /**
     * @tc.name   StringToString_Basic_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0500
     * @tc.desc   Test toString() with empty String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('');
      const result: string = strObj.toString();
      expect(result).assertEqual('');
    });

    /**
     * @tc.name   StringToString_Basic_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_BASIC_0600
     * @tc.desc   Test toString() with String object containing special characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_Basic_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('foo\nbar\tbaz');
      const result: string = strObj.toString();
      expect(result).assertEqual('foo\nbar\tbaz');
    });


    /**
     * @tc.name   StringToString_ReturnValue_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0200
     * @tc.desc   Test toString() returns value equal to String object's wrapped string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('test');
      const result: string = strObj.toString();
      expect(result === 'test').assertTrue();
    });

    /**
     * @tc.name   StringToString_ReturnValue_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0300
     * @tc.desc   Test toString() and valueOf() return same for primitive string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'test';
      const toStringResult: string = str.toString();
      const valueOfResult: string = str.valueOf();
      expect(toStringResult === valueOfResult).assertTrue();
    });

    /**
     * @tc.name   StringToString_ReturnValue_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0400
     * @tc.desc   Test toString() and valueOf() return same for String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('test');
      const toStringResult: string = strObj.toString();
      const valueOfResult: string = strObj.valueOf();
      expect(toStringResult === valueOfResult).assertTrue();
    });

    /**
     * @tc.name   StringToString_ReturnValue_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0500
     * @tc.desc   Test toString() returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'test';
      const result: string = str.toString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringToString_ReturnValue_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_RETURNVALUE_0600
     * @tc.desc   Test toString() does not return object type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_ReturnValue_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('test');
      const result: string = strObj.toString();
      expect(typeof result).assertEqual('string');
      expect(typeof result !== 'object').assertTrue();
    });


    /**
     * @tc.name   StringToString_SpecialString_001
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0100
     * @tc.desc   Test toString() with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '';
      const result: string = str.toString();
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringToString_SpecialString_002
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0200
     * @tc.desc   Test toString() with empty String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('');
      const result: string = strObj.toString();
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringToString_SpecialString_003
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0300
     * @tc.desc   Test toString() with BMP characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '中文';
      const result: string = str.toString();
      expect(result).assertEqual('中文');
    });

    /**
     * @tc.name   StringToString_SpecialString_004
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0400
     * @tc.desc   Test toString() with emoji (supplementary plane)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '😀🎉';
      const result: string = str.toString();
      expect(result).assertEqual('😀🎉');
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.name   StringToString_SpecialString_005
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0500
     * @tc.desc   Test toString() with mixed characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'Hello世界😀';
      const result: string = str.toString();
      expect(result).assertEqual('Hello世界😀');
    });

    /**
     * @tc.name   StringToString_SpecialString_006
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0600
     * @tc.desc   Test toString() with newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'line1\nline2';
      const result: string = str.toString();
      expect(result).assertEqual('line1\nline2');
    });

    /**
     * @tc.name   StringToString_SpecialString_007
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0700
     * @tc.desc   Test toString() with tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'col1\tcol2';
      const result: string = str.toString();
      expect(result).assertEqual('col1\tcol2');
    });

    /**
     * @tc.name   StringToString_SpecialString_008
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0800
     * @tc.desc   Test toString() with carriage return and newline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'line1\r\nline2';
      const result: string = str.toString();
      expect(result).assertEqual('line1\r\nline2');
    });

    /**
     * @tc.name   StringToString_SpecialString_009
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_0900
     * @tc.desc   Test toString() with backslash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'path\\to\\file';
      const result: string = str.toString();
      expect(result).assertEqual('path\\to\\file');
    });

    /**
     * @tc.name   StringToString_SpecialString_010
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1000
     * @tc.desc   Test toString() with quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str1: string = 'He said "hello"';
      const str2: string = "It's a test";
      expect(str1.toString()).assertEqual('He said "hello"');
      expect(str2.toString()).assertEqual("It's a test");
    });

    /**
     * @tc.name   StringToString_SpecialString_011
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1100
     * @tc.desc   Test toString() with zero-width characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'test\u200B\u200C\u200D';
      const result: string = str.toString();
      expect(result).assertEqual('test\u200B\u200C\u200D');
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.name   StringToString_SpecialString_012
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1200
     * @tc.desc   Test toString() with combining characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'e\u0301';
      const result: string = str.toString();
      expect(result).assertEqual('e\u0301');
    });

    /**
     * @tc.name   StringToString_SpecialString_013
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1300
     * @tc.desc   Test toString() with BOM character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '\uFEFFtest';
      const result: string = str.toString();
      expect(result).assertEqual('\uFEFFtest');
    });

    /**
     * @tc.name   StringToString_SpecialString_014
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1400
     * @tc.desc   Test toString() with very long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = 'a'.repeat(10000);
      const result: string = str.toString();
      expect(result.length).assertEqual(10000);
      expect(result === str).assertTrue();
    });

    /**
     * @tc.name   StringToString_SpecialString_015
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1500
     * @tc.desc   Test toString() with very long String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const strObj: String = new String('b'.repeat(50000));
      const result: string = strObj.toString();
      expect(result.length).assertEqual(50000);
    });

    /**
     * @tc.name   StringToString_SpecialString_016
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1600
     * @tc.desc   Test toString() with spaces only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '   ';
      const result: string = str.toString();
      expect(result).assertEqual('   ');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringToString_SpecialString_017
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1700
     * @tc.desc   Test toString() with numbers only
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '12345';
      const result: string = str.toString();
      expect(result).assertEqual('12345');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.name   StringToString_SpecialString_018
     * @tc.number SUB_BUILTINS_STRING_TOSTRING_SPECIALSTRING_1800
     * @tc.desc   Test toString() with HTML entities
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToString_SpecialString_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const str: string = '&lt;div&gt;';
      const result: string = str.toString();
      expect(result).assertEqual('&lt;div&gt;');
    });

  });
}
