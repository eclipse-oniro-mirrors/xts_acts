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

export default function StringFromCodePointTest():void {
  describe('StringFromCodePointTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
    })
    beforeEach(async () => {
      await Utils.msSleep(20)
      // Presets an action, which is performed before each unit test case starts.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
    })

    /**
     * @tc.name   StringFromCodePoint_SingleCodePoint_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_0100
     * @tc.desc   Test fromCodePoint with single code point 42
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_SingleCodePoint_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(42);
      expect(result).assertEqual('*');
    });

    /**
     * @tc.name   StringFromCodePoint_SingleCodePoint_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_0200
     * @tc.desc   Test fromCodePoint with single code point 65
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_SingleCodePoint_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(65);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCodePoint_SingleCodePoint_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_0300
     * @tc.desc   Test fromCodePoint with single code point 0x404
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_SingleCodePoint_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x404);
      expect(result).assertEqual('Є');
    });

    /**
     * @tc.name   StringFromCodePoint_MultipleCodePoints_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_0400
     * @tc.desc   Test fromCodePoint with multiple code points (65, 90)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_MultipleCodePoints_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(65, 90);
      expect(result).assertEqual('AZ');
    });

    /**
     * @tc.name   StringFromCodePoint_MultipleCodePoints_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_0500
     * @tc.desc   Test fromCodePoint with multiple code points (9731, 9733, 9842)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_MultipleCodePoints_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(9731, 9733, 9842);
      expect(result).assertEqual('☃★♲');
    });

    /**
     * @tc.name   StringFromCodePoint_MultipleCodePoints_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_0600
     * @tc.desc   Test fromCodePoint with multiple code points (0x1d306, 0x61, 0x1d307)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_MultipleCodePoints_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x1d306, 0x61, 0x1d307);
      expect(result).assertEqual('𝌆a𝌇');
    });

    /**
     * @tc.name   StringFromCodePoint_ASCII_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_0700
     * @tc.desc   Test fromCodePoint with ASCII code point 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_ASCII_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0);
      expect(result).assertEqual('\u0000');
    });

    /**
     * @tc.name   StringFromCodePoint_ASCII_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_0800
     * @tc.desc   Test fromCodePoint with ASCII code point 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_ASCII_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(127);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_Latin1Supplement_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_0900
     * @tc.desc   Test fromCodePoint with Latin-1 supplement 0x00A9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Latin1Supplement_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x00A9);
      expect(result).assertEqual('©');
    });

    /**
     * @tc.name   StringFromCodePoint_Latin1Supplement_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1000
     * @tc.desc   Test fromCodePoint with Latin-1 supplement 0x00AE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Latin1Supplement_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x00AE);
      expect(result).assertEqual('®');
    });

    /**
     * @tc.name   StringFromCodePoint_Latin1Supplement_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1100
     * @tc.desc   Test fromCodePoint with Latin-1 supplement 0x20AC
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Latin1Supplement_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x20AC);
      expect(result).assertEqual('€');
    });

    /**
     * @tc.name   StringFromCodePoint_BMP_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1200
     * @tc.desc   Test fromCodePoint with BMP character 0x0404
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_BMP_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x0404);
      expect(result).assertEqual('Є');
    });

    /**
     * @tc.name   StringFromCodePoint_BMP_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1300
     * @tc.desc   Test fromCodePoint with BMP character 0x4E2D (Chinese character)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_BMP_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x4E2D);
      expect(result).assertEqual('中');
    });

    /**
     * @tc.name   StringFromCodePoint_BMP_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1400
     * @tc.desc   Test fromCodePoint with BMP character 0x3042 (Hiragana)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_BMP_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x3042);
      expect(result).assertEqual('あ');
    });

    /**
     * @tc.name   StringFromCodePoint_BMP_004
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1500
     * @tc.desc   Test fromCodePoint with BMP character 0xFFFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_BMP_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xFFFF);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_NoParameters_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1600
     * @tc.desc   Test fromCodePoint with no parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_NoParameters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint();
      expect(result).assertEqual('');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringFromCodePoint_ZeroValue_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1700
     * @tc.desc   Test fromCodePoint with zero value (NULL character)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_ZeroValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0);
      expect(result).assertEqual('\u0000');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_Decimal_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1800
     * @tc.desc   Test fromCodePoint with decimal number 65
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Decimal_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(65);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCodePoint_Decimal_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_1900
     * @tc.desc   Test fromCodePoint with decimal number 194564
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Decimal_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(194564);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_Hex_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_2000
     * @tc.desc   Test fromCodePoint with hexadecimal number 0x41
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Hex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x41);
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCodePoint_Hex_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_2100
     * @tc.desc   Test fromCodePoint with hexadecimal number 0x2F804
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Hex_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x2F804);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_Scientific_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_2200
     * @tc.desc   Test fromCodePoint with scientific notation 6.5e1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Scientific_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint((6.5e1).toInt());
      expect(result).assertEqual('A');
    });

    /**
     * @tc.name   StringFromCodePoint_Scientific_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_2300
     * @tc.desc   Test fromCodePoint with scientific notation 1.94564e5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Scientific_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint((1.94564e5).toInt());
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_MixedCharacters_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BASIC_2400
     * @tc.desc   Test fromCodePoint with mixed BMP and supplementary characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_MixedCharacters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x41, 0x1F600, 0x4E2D, 0x1F601);
      expect(result.length).assertEqual(6);
    });


    /**
     * @tc.name   StringFromCodePoint_MinBoundary_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_0100
     * @tc.desc   Test fromCodePoint with minimum code point 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_MinBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0);
      expect(result).assertEqual('\u0000');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_MinBoundary_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_0200
     * @tc.desc   Test fromCodePoint with code point 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_MinBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(1);
      expect(result).assertEqual('\u0001');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_SurrogateBoundary_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_0300
     * @tc.desc   Test fromCodePoint with BMP boundary 0xD7FF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_SurrogateBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xD7FF);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_SurrogateBoundary_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_0400
     * @tc.desc   Test fromCodePoint with high surrogate start 0xD800
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_SurrogateBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xD800);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_SurrogateBoundary_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_0500
     * @tc.desc   Test fromCodePoint with low surrogate end 0xDFFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_SurrogateBoundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xDFFF);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_SurrogateBoundary_004
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_0600
     * @tc.desc   Test fromCodePoint with private use area start 0xE000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_SurrogateBoundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xE000);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_PrivateUseArea_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_0700
     * @tc.desc   Test fromCodePoint with BMP PUA start 0xE000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_PrivateUseArea_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xE000);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_PrivateUseArea_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_0800
     * @tc.desc   Test fromCodePoint with BMP PUA end 0xF8FF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_PrivateUseArea_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xF8FF);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_PrivateUseArea_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_0900
     * @tc.desc   Test fromCodePoint with supplementary PUA 0xF0000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_PrivateUseArea_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xF0000);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_PrivateUseArea_004
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1000
     * @tc.desc   Test fromCodePoint with supplementary PUA 0xFFFFD
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_PrivateUseArea_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xFFFFD);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_NonCharacter_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1100
     * @tc.desc   Test fromCodePoint with non-character 0xFFFE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_NonCharacter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xFFFE);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_NonCharacter_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1200
     * @tc.desc   Test fromCodePoint with non-character 0xFFFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_NonCharacter_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0xFFFF);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_NonCharacter_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1300
     * @tc.desc   Test fromCodePoint with non-character 0x10FFFE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_NonCharacter_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x10FFFE);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_NonCharacter_004
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1400
     * @tc.desc   Test fromCodePoint with non-character 0x10FFFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_NonCharacter_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x10FFFF);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_ControlCharacters_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1500
     * @tc.desc   Test fromCodePoint with NULL character 0x0000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_ControlCharacters_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x0000);
      expect(result).assertEqual('\u0000');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_ControlCharacters_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1600
     * @tc.desc   Test fromCodePoint with Tab character 0x0009
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_ControlCharacters_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x0009);
      expect(result).assertEqual('\t');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_ControlCharacters_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1700
     * @tc.desc   Test fromCodePoint with newline character 0x000A
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_ControlCharacters_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x000A);
      expect(result).assertEqual('\n');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_ControlCharacters_004
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1800
     * @tc.desc   Test fromCodePoint with carriage return 0x000D
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_ControlCharacters_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x000D);
      expect(result).assertEqual('\r');
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringFromCodePoint_ControlCharacters_005
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_BOUNDARY_1900
     * @tc.desc   Test fromCodePoint with ESC character 0x001B
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_ControlCharacters_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x001B);
      expect(result).assertEqual('\u001b');
      expect(result.length).assertEqual(1);
    });


    /**
     * @tc.name   StringFromCodePoint_CompareFromCharCode_BMP_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_COMPARE_0100
     * @tc.desc   Compare fromCodePoint with fromCharCode for BMP character 0x404
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCodePoint_CompareFromCharCode_BMP_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let fromCharCodeResult: string = String.fromCharCode(0x404);
      let fromCodePointResult: string = String.fromCodePoint(0x404);
      expect(fromCharCodeResult).assertEqual(fromCodePointResult);
      expect(fromCodePointResult).assertEqual('Є');
    });

    /**
     * @tc.name   StringFromCodePoint_CompareFromCharCode_BMP_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_COMPARE_0200
     * @tc.desc   Compare fromCodePoint with fromCharCode for BMP character 0x4E2D
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCodePoint_CompareFromCharCode_BMP_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let fromCharCodeResult: string = String.fromCharCode(0x4E2D);
      let fromCodePointResult: string = String.fromCodePoint(0x4E2D);
      expect(fromCharCodeResult).assertEqual(fromCodePointResult);
      expect(fromCodePointResult).assertEqual('中');
    });

    /**
     * @tc.name   StringFromCodePoint_CompareFromCharCode_Supplementary_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_COMPARE_0300
     * @tc.desc   Compare fromCodePoint with fromCharCode for supplementary character 0x1F303
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCodePoint_CompareFromCharCode_Supplementary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let fromCharCodeResult: string = String.fromCharCode(0xD83C, 0xDF03);
      let fromCodePointResult: string = String.fromCodePoint(0x1F303);
      expect(fromCharCodeResult).assertEqual(fromCodePointResult);
      expect(fromCodePointResult.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_CompareFromCharCode_Supplementary_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_COMPARE_0400
     * @tc.desc   Compare fromCodePoint with fromCharCode for supplementary character 0x1F600
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCodePoint_CompareFromCharCode_Supplementary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let fromCharCodeResult: string = String.fromCharCode(0xD83D, 0xDE00);
      let fromCodePointResult: string = String.fromCodePoint(0x1F600);
      expect(fromCharCodeResult).assertEqual(fromCodePointResult);
      expect(fromCodePointResult.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_CompareLength_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_COMPARE_0500
     * @tc.desc   Compare length of fromCharCode and fromCodePoint for supplementary character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCodePoint_CompareLength_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let fromCharCodeLength: number = String.fromCharCode(0xD83C, 0xDF03).length;
      let fromCodePointLength: number = String.fromCodePoint(0x1F303).length;
      expect(fromCharCodeLength).assertEqual(fromCodePointLength);
      expect(fromCodePointLength).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_Error_TooLarge_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_ERROR_0100
     * @tc.desc   Test fromCodePoint with code point 0x110000 (too large)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCodePoint_Error_TooLarge_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let hasError: boolean = false;
      try {
        String.fromCodePoint(0x110000);
      } catch (e) {
        hasError = true;
        expect(e instanceof RangeError).assertEqual(true);
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   StringFromCodePoint_Error_TooLarge_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_ERROR_0200
     * @tc.desc   Test fromCodePoint with code point 1114112 (0x10FFFF + 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCodePoint_Error_TooLarge_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let hasError: boolean = false;
      try {
        String.fromCodePoint(1114112);
      } catch (e) {
        hasError = true;
        expect(e instanceof RangeError).assertEqual(true);
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   StringFromCodePoint_Error_Infinity_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_ERROR_0300
     * @tc.desc   Test fromCodePoint with Infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCodePoint_Error_Infinity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let hasError: boolean = false;
      try {
        String.fromCodePoint(Double.MAX_VALUE.toInt());
      } catch (e) {
        hasError = true;
        expect(e instanceof RangeError).assertEqual(true);
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   StringFromCodePoint_Error_Negative_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_ERROR_0400
     * @tc.desc   Test fromCodePoint with negative value -1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringFromCodePoint_Error_Negative_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let hasError: boolean = false;
      try {
        String.fromCodePoint(-1);
      } catch (e) {
        hasError = true;
        expect(e instanceof RangeError).assertEqual(true);
      }
      expect(hasError).assertEqual(true);
    });

    /**
     * @tc.name   StringFromCodePoint_Supplementary_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_0100
     * @tc.desc   Test fromCodePoint with supplementary character 0x10000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Supplementary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x10000);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_Supplementary_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_0200
     * @tc.desc   Test fromCodePoint with supplementary character 0x1F600 (emoji)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Supplementary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x1F600);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_Supplementary_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_0300
     * @tc.desc   Test fromCodePoint with supplementary character 0x2F804
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Supplementary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x2F804);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_Emoji_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_0400
     * @tc.desc   Test fromCodePoint with emoji 0x1F303
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Emoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x1F303);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_Emoji_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_0500
     * @tc.desc   Test fromCodePoint with multiple emoji (0x1F600, 0x1F601, 0x1F602)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_Emoji_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x1F600, 0x1F601, 0x1F602);
      expect(result.length).assertEqual(6);
    });

    /**
     * @tc.name   StringFromCodePoint_CJKExtension_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_0600
     * @tc.desc   Test fromCodePoint with CJK extension A character 0x20000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_CJKExtension_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x20000);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_CJKExtension_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_0700
     * @tc.desc   Test fromCodePoint with CJK extension character 0x2F804
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_CJKExtension_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x2F804);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_CJKExtension_003
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_0800
     * @tc.desc   Test fromCodePoint with CJK extension F character 0x30000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_CJKExtension_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x30000);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_MaxBoundary_001
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_0900
     * @tc.desc   Test fromCodePoint with maximum code point 0x10FFFF
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_MaxBoundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x10FFFF);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringFromCodePoint_MaxBoundary_002
     * @tc.number SUB_BUILTINS_STRING_FROMCODEPOINT_SUPPLEMENTARY_1000
     * @tc.desc   Test fromCodePoint with second last code point 0x10FFFE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringFromCodePoint_MaxBoundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: string = String.fromCodePoint(0x10FFFE);
      expect(result.length).assertEqual(2);
    });
  });
}
