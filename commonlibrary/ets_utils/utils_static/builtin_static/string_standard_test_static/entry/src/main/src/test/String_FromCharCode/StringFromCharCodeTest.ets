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

interface PunctuationResult {
  result: string;
  length: number;
  charCode: number;
}

function testPunctuation002(): PunctuationResult {
  const result: string = String.fromCharCode(0x201C);
  let ret: PunctuationResult = {
    result: result,
    length: result.length,
    charCode: result.charCodeAt(0)
  };
  return ret;
}

function testPunctuation003(): PunctuationResult {
  const result: string = String.fromCharCode(0x201D);
  let ret: PunctuationResult = {
    result: result,
    length: result.length,
    charCode: result.charCodeAt(0),
  };
  return ret;
}

export default function StringFromCharCodeTest():void {
  describe('StringFromCharCodeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach( async () => {
      await Utils.msSleep(20)
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
     * @tc.name   StringFromCharCode_StaticMethod_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_STATIC_0100
     * @tc.desc   Test fromCharCode with single code unit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_StaticMethod_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(65);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCharCode_StaticMethod_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_STATIC_0200
     * @tc.desc   Test fromCharCode with multiple code units
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_StaticMethod_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(65, 66, 67);
      expect(result).assertEqual('ABC');
    });

    /**
     * @tc.name   StringFromCharCode_BasicStringCreation_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_BASIC_0100
     * @tc.desc   Test basic string creation from code units
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_BasicStringCreation_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(189, 43, 190, 61);
      expect(result).assertEqual('½+¾=');
    });

    /**
     * @tc.name   StringFromCharCode_BasicStringCreation_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_BASIC_0200
     * @tc.desc   Test creating "Hello" string from code units
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_BasicStringCreation_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(72, 101, 108, 108, 111);
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringFromCharCode_SingleParam_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SINGLE_0100
     * @tc.desc   Test fromCharCode with single parameter decimal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_SingleParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(65);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCharCode_SingleParam_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SINGLE_0200
     * @tc.desc   Test fromCharCode with single parameter hexadecimal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_SingleParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0x41);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCharCode_SingleParam_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SINGLE_0300
     * @tc.desc   Test fromCharCode with lowercase letter code
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_SingleParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(97);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringFromCharCode_MultipleParam_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_MULTIPLE_0100
     * @tc.desc   Test fromCharCode with multiple parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_MultipleParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(65, 66, 67);
      expect(result).assertEqual('ABC');
    });

    /**
     * @tc.name   StringFromCharCode_MultipleParam_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_MULTIPLE_0200
     * @tc.desc   Test fromCharCode with hexadecimal parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_MultipleParam_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0x48, 0x65, 0x6C, 0x6C, 0x6F);
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringFromCharCode_MultipleParam_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_MULTIPLE_0300
     * @tc.desc   Test fromCharCode with 100 parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_MultipleParam_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = "";
      for (let i = 0; i < 100; i++) {
        result += String.fromCharCode(65);
      }
      expect(result.length).assertEqual(100);
      expect(result.substring(0, 10)).assertEqual('AAAAAAAAAA');
    });

    /**
     * @tc.name   StringFromCharCode_NoParam_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_NOPARAM_0100
     * @tc.desc   Test fromCharCode with no parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_NoParam_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode();
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });


    /**
     * @tc.name   StringFromCharCode_ASCII_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_ASCII_0100
     * @tc.desc   Test ASCII uppercase letter A
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_ASCII_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(65);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCharCode_ASCII_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_ASCII_0200
     * @tc.desc   Test ASCII uppercase letter Z
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_ASCII_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(90);
      expect(result).assertEqual('Z');
    });

    /**
     * @tc.name   StringFromCharCode_ASCII_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_ASCII_0300
     * @tc.desc   Test ASCII lowercase letter a
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_ASCII_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(97);
      expect(result).assertEqual('a');
    });

    /**
     * @tc.name   StringFromCharCode_ASCII_004
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_ASCII_0400
     * @tc.desc   Test ASCII lowercase letter z
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_ASCII_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(122);
      expect(result).assertEqual('z');
    });

    /**
     * @tc.name   StringFromCharCode_ASCII_005
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_ASCII_0500
     * @tc.desc   Test ASCII digit 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_ASCII_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(48);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.name   StringFromCharCode_ASCII_006
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_ASCII_0600
     * @tc.desc   Test ASCII digit 9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_ASCII_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(57);
      expect(result).assertEqual('9');
    });

    /**
     * @tc.name   StringFromCharCode_Latin1Supplement_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_LATIN1_0100
     * @tc.desc   Test Latin-1 supplement character e with acute
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Latin1Supplement_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0xE9);
      expect(result).assertEqual('é');
    });

    /**
     * @tc.name   StringFromCharCode_Latin1Supplement_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_LATIN1_0200
     * @tc.desc   Test Latin-1 supplement character n with tilde
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Latin1Supplement_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0xF1);
      expect(result).assertEqual('ñ');
    });

    /**
     * @tc.name   StringFromCharCode_Latin1Supplement_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_LATIN1_0300
     * @tc.desc   Test Latin-1 supplement character u with diaeresis
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Latin1Supplement_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0xFC);
      expect(result).assertEqual('ü');
    });

    /**
     * @tc.name   StringFromCharCode_Latin1Supplement_004
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_LATIN1_0400
     * @tc.desc   Test copyright symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Latin1Supplement_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0xA9);
      expect(result).assertEqual('©');
    });

    /**
     * @tc.name   StringFromCharCode_Latin1Supplement_005
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_LATIN1_0500
     * @tc.desc   Test registered trademark symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Latin1Supplement_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0xAE);
      expect(result).assertEqual('®');
    });

    /**
     * @tc.name   StringFromCharCode_Punctuation_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_PUNCTUATION_0100
     * @tc.desc   Test em dash character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Punctuation_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0x2014);
      expect(result).assertEqual('—');
    });

    /**
     * @tc.name   StringFromCharCode_Punctuation_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_PUNCTUATION_0200
     * @tc.desc   Test left double quotation mark
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Punctuation_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let data = testPunctuation002();
      expect(data.length).assertEqual(1);
      expect(data.charCode).assertEqual(0x201C);
    });

    /**
     * @tc.name   StringFromCharCode_Punctuation_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_PUNCTUATION_0300
     * @tc.desc   Test right double quotation mark
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Punctuation_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let data = testPunctuation003();
      expect(data.length).assertEqual(1);
      expect(data.charCode).assertEqual(0x201D);
    });

    /**
     * @tc.name   StringFromCharCode_Punctuation_004
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_PUNCTUATION_0400
     * @tc.desc   Test horizontal ellipsis
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Punctuation_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0x2026);
      expect(result).assertEqual('…');
    });

    /**
     * @tc.name   StringFromCharCode_Punctuation_005
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_PUNCTUATION_0500
     * @tc.desc   Test em dash with decimal notation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Punctuation_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(8212);
      expect(result).assertEqual('—');
    });


    /**
     * @tc.name   StringFromCharCode_Truncation_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_TRUNCATION_0100
     * @tc.desc   Test value truncation when exceeding 0xFFFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Truncation_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result1: string = String.fromCharCode(0x12014);
      let result2: string = String.fromCharCode(0x2014);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('—');
    });

    /**
     * @tc.name   StringFromCharCode_Truncation_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_TRUNCATION_0200
     * @tc.desc   Test truncation of 0x10041 to 0x0041
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Truncation_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0x10041);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCharCode_Negative_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_NEGATIVE_0100
     * @tc.desc   Test negative number conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Negative_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(-1);
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.name   StringFromCharCode_Zero_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_ZERO_0100
     * @tc.desc   Test zero value (null character)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Zero_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCharCode_Zero_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_ZERO_0200
     * @tc.desc   Test null character with other characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Zero_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0, 65, 0);
      expect(result.length).assertEqual(3);
      expect(result.charCodeAt(0)).assertEqual(0);
      expect(result.charCodeAt(1)).assertEqual(65);
      expect(result.charCodeAt(2)).assertEqual(0);
    });

    /**
     * @tc.name   StringFromCharCode_Boundary_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_BOUNDARY_0100
     * @tc.desc   Test minimum value 0x0000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Boundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0x0000);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCharCode_Boundary_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_BOUNDARY_0200
     * @tc.desc   Test maximum BMP value 0xFFFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Boundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCharCode(0xFFFF);
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(65535);
    });

    /**
     * @tc.name   StringFromCharCode_Boundary_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_BOUNDARY_0300
     * @tc.desc   Test value 0x10000 gets truncated to 0x0000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Boundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0x10000);
      expect(result.charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.name   StringFromCharCode_SpecialValues_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SPECIAL_0100
     * @tc.desc   Test NaN parameter converts to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_SpecialValues_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(65, NaN.toInt(), 66);
      expect(result.length).assertEqual(3);
      expect(result.charCodeAt(1)).assertEqual(0);
    });

    /**
     * @tc.name   StringFromCharCode_SpecialValues_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SPECIAL_0300
     * @tc.desc   Test decimal number gets truncated
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_SpecialValues_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(65, 3.5.toInt(), 66);
      expect(result.length).assertEqual(3);
      expect(result.charCodeAt(1)).assertEqual(3);
    });


    /**
     * @tc.name   StringFromCharCode_Compare_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_COMPARE_0100
     * @tc.desc   Compare fromCharCode and fromCodePoint for BMP character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Compare_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1: string = String.fromCharCode(65);
      let result2: string = String.fromCodePoint(65);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCharCode_Compare_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_COMPARE_0200
     * @tc.desc   Compare fromCharCode with surrogate pair vs fromCodePoint
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Compare_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result1: string = String.fromCharCode(0xD83C, 0xDF03);
      let result2: string = String.fromCodePoint(0x1F303);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('🌃');
    });

    /**
     * @tc.name   StringFromCharCode_Compare_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_COMPARE_0300
     * @tc.desc   Test fromCharCode truncation vs fromCodePoint for supplementary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('StringFromCharCode_Compare_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let result1: string = String.fromCharCode(0x1F303);
      let result2: string = String.fromCodePoint(0x1F303);
      // Verify that fromCharCode truncates the value and produces different result
      expect(result1 !== result2).assertTrue();
    });

    /**
     * @tc.name   StringFromCharCode_Compare_004
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_COMPARE_0400
     * @tc.desc   Test fromCodePoint with maximum valid code point
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Compare_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCodePoint(0x10FFFF);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCharCode_Application_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_APP_0100
     * @tc.desc   Test converting hex code array to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Application_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let hexCodes: int[] = [0x48, 0x65, 0x6C, 0x6C, 0x6F];
      let result: string = "";
      for (let i = 0; i < hexCodes.length; i++) {
        result += String.fromCharCode(hexCodes[i]);
      }
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringFromCharCode_Application_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_APP_0200
     * @tc.desc   Test converting byte array to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Application_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let bytes: int[] = [72, 101, 108, 108, 111];
      let result: string = "";
      for (let i = 0; i < bytes.length; i++) {
        result += String.fromCharCode(bytes[i]);
      }
      expect(result).assertEqual('Hello');
    });

    /**
     * @tc.name   StringFromCharCode_Application_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_APP_0300
     * @tc.desc   Test exploring CJK unified ideographs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Application_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let results: string[] = [];
      for (let i = 0x4E00; i <= 0x4E05; i++) {
        results.push(String.fromCharCode(i));
      }
      let combined: string = results.join('');
      expect(combined.length).assertEqual(6);
    });

    /**
     * @tc.name   StringFromCharCode_Application_004
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_APP_0400
     * @tc.desc   Test building string from code pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCharCode_Application_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let pattern: int[] = [65, 66, 67, 44, 32, 68, 69, 70];
      let result: string = "";
      for (let i = 0; i < pattern.length; i++) {
        result += String.fromCharCode(pattern[i]);
      }
      expect(result).assertEqual('ABC, DEF');
    });

    /**
     * @tc.name   StringFromCharCode_Application_005
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_APP_0500
     * @tc.desc   Test generating consecutive character sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_Application_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = "";
      for (let i = 0; i < 5; i++) {
        result += String.fromCharCode(65 + i);
      }
      expect(result).assertEqual('ABCDE');
    });


    /**
     * @tc.name   StringFromCharCode_SurrogatePair_001
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SURROGATE_0100
     * @tc.desc   Test surrogate pair for night sky stars emoji (U+1F303)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_SurrogatePair_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0xD83C, 0xDF03);
      expect(result).assertEqual('🌃');
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCharCode_SurrogatePair_002
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SURROGATE_0200
     * @tc.desc   Test surrogate pair with decimal notation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_SurrogatePair_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(55356, 57091);
      expect(result).assertEqual('🌃');
    });

    /**
     * @tc.name   StringFromCharCode_SurrogatePair_003
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SURROGATE_0300
     * @tc.desc   Test surrogate pair for grinning face emoji (U+1F600)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_SurrogatePair_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0xD83D, 0xDE00);
      expect(result).assertEqual('😀');
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCharCode_SurrogatePair_004
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SURROGATE_0400
     * @tc.desc   Test multiple surrogate pairs combined with BMP characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_SurrogatePair_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0xD834, 0xDF06, 0x61, 0xD834, 0xDF07);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringFromCharCode_SurrogatePair_005
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SURROGATE_0500
     * @tc.desc   Test high surrogate range start (0xD800) with low surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_SurrogatePair_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0xD800, 0xDC00);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCharCode_SurrogatePair_006
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SURROGATE_0600
     * @tc.desc   Test high surrogate range end (0xDBFF) with low surrogate range end (0xDFFF)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCharCode_SurrogatePair_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: string = String.fromCharCode(0xDBFF, 0xDFFF);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCharCode_SurrogatePair_007
     * @tc.number SUB_BUILTINS_STRING_FROMCHARCODE_SURROGATE_0700
     * @tc.desc   Test invalid surrogate pair order (low before high)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('StringFromCharCode_SurrogatePair_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let result: string = String.fromCharCode(0xDC00, 0xD800);
      expect(result.length).assertEqual(2);
    });

  });
}
