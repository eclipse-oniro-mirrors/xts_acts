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

export default function StringCodePointATest():void {
  describe('StringCodePointAtTest', () => {
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
     * @tc.name   StringCodePointAt_BasicChar_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BASIC_0100
     * @tc.desc   Test codePointAt with basic ASCII character at index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_BasicChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = 'ABC'.codePointAt(0);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.name   StringCodePointAt_BasicChar_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BASIC_0200
     * @tc.desc   Test codePointAt with basic ASCII character at index 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_BasicChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = 'ABC'.codePointAt(1);
      expect(result).assertEqual(66);
    });

    /**
     * @tc.name   StringCodePointAt_BasicChar_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BASIC_0300
     * @tc.desc   Test codePointAt with basic ASCII character at index 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_BasicChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = 'ABC'.codePointAt(2);
      expect(result).assertEqual(67);
    });

    /**
     * @tc.name   StringCodePointAt_HexConversion_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BASIC_0400
     * @tc.desc   Test codePointAt result converted to hexadecimal string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_HexConversion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let codePoint: Int | undefined = 'ABC'.codePointAt(0);
      let result: string = codePoint !== undefined ? codePoint.toString(16) : '';
      expect(result).assertEqual('41');
    });

    /**
     * @tc.name   StringCodePointAt_HexConversion_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BASIC_0500
     * @tc.desc   Test codePointAt result converted to hexadecimal string for different index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_HexConversion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let codePoint: Int | undefined = 'ABC'.codePointAt(1);
      let result: string = codePoint !== undefined ? codePoint.toString(16) : '';
      expect(result).assertEqual('42');
    });

    /**
     * @tc.name   StringCodePointAt_SymbolChar_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BASIC_0600
     * @tc.desc   Test codePointAt with snowman symbol character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_SymbolChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let icons: string = '☃★♲';
      let result: Int | undefined = icons.codePointAt(0);
      expect(result).assertEqual(9731);
    });

    /**
     * @tc.name   StringCodePointAt_SymbolChar_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BASIC_0700
     * @tc.desc   Test codePointAt with star symbol character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_SymbolChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let icons: string = '☃★♲';
      let result: Int | undefined = icons.codePointAt(1);
      expect(result).assertEqual(9733);
    });

    /**
     * @tc.name   StringCodePointAt_SymbolChar_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BASIC_0800
     * @tc.desc   Test codePointAt with recycling symbol character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_SymbolChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let icons: string = '☃★♲';
      let result: Int | undefined = icons.codePointAt(2);
      expect(result).assertEqual(9842);
    });


    /**
     * @tc.name   StringCodePointAt_OutOfRange_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BOUNDARY_0100
     * @tc.desc   Test codePointAt with index beyond string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_OutOfRange_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = 'ABC'.codePointAt(42);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringCodePointAt_OutOfRange_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BOUNDARY_0200
     * @tc.desc   Test codePointAt with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_OutOfRange_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = ''.codePointAt(0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringCodePointAt_OutOfRange_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BOUNDARY_0300
     * @tc.desc   Test codePointAt with index at string length boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_OutOfRange_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = 'test'.codePointAt(4);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringCodePointAt_NegativeIndex_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BOUNDARY_0400
     * @tc.desc   Test codePointAt with negative index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_NegativeIndex_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = 'ABC'.codePointAt(-1);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringCodePointAt_NegativeIndex_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BOUNDARY_0500
     * @tc.desc   Test codePointAt with large negative index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_NegativeIndex_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = 'ABC'.codePointAt(-100);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringCodePointAt_BoundaryValue_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BOUNDARY_0600
     * @tc.desc   Test codePointAt at first character index (0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_BoundaryValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ABC';
      let result: Int | undefined = str.codePointAt(0);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.name   StringCodePointAt_BoundaryValue_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BOUNDARY_0700
     * @tc.desc   Test codePointAt at last character index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_BoundaryValue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'ABC';
      let result: Int | undefined = str.codePointAt(str.length - 1);
      expect(result).assertEqual(67);
    });

    /**
     * @tc.name   StringCodePointAt_BoundaryValue_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_BOUNDARY_0800
     * @tc.desc   Test codePointAt at index equal to string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_BoundaryValue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = 'ABC';
      let result: Int | undefined = str.codePointAt(str.length);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringCodePointAt_VsCharCodeAt_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_INTERACTION_0100
     * @tc.desc   Compare codePointAt and charCodeAt with emoji at index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_VsCharCodeAt_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = '😍';
      let codePointResult: Int | undefined = emoji.codePointAt(0);
      let charCodeResult: number = emoji.charCodeAt(0);
      if (codePointResult !== undefined) {
        expect(codePointResult).assertLarger(charCodeResult);
        expect(codePointResult).assertEqual(128525);
      }
      expect(charCodeResult).assertEqual(55357);
    });

    /**
     * @tc.name   StringCodePointAt_VsCharCodeAt_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_INTERACTION_0200
     * @tc.desc   Compare codePointAt and charCodeAt with emoji at index 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_VsCharCodeAt_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let emoji: string = '😍';
      let codePointResult: int | undefined = emoji.codePointAt(1);
      let charCodeResult: number = emoji.charCodeAt(1);
      if (codePointResult !== undefined) {
        expect(codePointResult).assertEqual(charCodeResult);
        expect(codePointResult).assertEqual(56845);
      }
    });

    /**
     * @tc.name   StringCodePointAt_VsCharCodeAt_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_INTERACTION_0300
     * @tc.desc   Compare codePointAt and charCodeAt with ASCII character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_VsCharCodeAt_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let ascii: string = 'A';
      let codePointResult: int | undefined = ascii.codePointAt(0);
      let charCodeResult: number = ascii.charCodeAt(0);
      if (codePointResult !== undefined) {
        expect(codePointResult).assertEqual(charCodeResult);
        expect(codePointResult).assertEqual(65);
      }
    });

    /**
     * @tc.name   StringCodePointAt_FromCodePoint_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_INTERACTION_0500
     * @tc.desc   Test reverse operation with fromCodePoint
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_FromCodePoint_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let original: string = '😍';
      let codePoint: Int | undefined = original.codePointAt(0);
      if (codePoint !== undefined) {
        let restored: string = String.fromCodePoint(codePoint);
        expect(original === restored).assertTrue();
      }
    });

    /**
     * @tc.name   StringCodePointAt_LengthProperty_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_INTERACTION_0600
     * @tc.desc   Test codePointAt with emoji length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_LengthProperty_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = '😀';
      let length: number = emoji.length;
      let codePoint: Int | undefined = emoji.codePointAt(0);
      expect(length).assertEqual(2);
      expect(codePoint).assertEqual(128512);
    });

    /**
     * @tc.name   StringCodePointAt_LengthProperty_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_INTERACTION_0700
     * @tc.desc   Test codePointAt with ASCII character length property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_LengthProperty_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let ascii: string = 'A';
      let length: number = ascii.length;
      let codePoint: Int | undefined = ascii.codePointAt(0);
      expect(length).assertEqual(1);
      expect(codePoint).assertEqual(65);
    });


    /**
     * @tc.name   StringCodePointAt_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SPECIAL_0100
     * @tc.desc   Test codePointAt with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let empty: string = '';
      let result: Int | undefined = empty.codePointAt(0);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   StringCodePointAt_ControlChar_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SPECIAL_0200
     * @tc.desc   Test codePointAt with newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_ControlChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\n'.codePointAt(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   StringCodePointAt_ControlChar_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SPECIAL_0300
     * @tc.desc   Test codePointAt with tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_ControlChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\t'.codePointAt(0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   StringCodePointAt_ControlChar_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SPECIAL_0400
     * @tc.desc   Test codePointAt with carriage return character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_ControlChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\r'.codePointAt(0);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.name   StringCodePointAt_ZeroWidthChar_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SPECIAL_0500
     * @tc.desc   Test codePointAt with zero-width space character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_ZeroWidthChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = '\u200B'.codePointAt(0);
      expect(result).assertEqual(8203);
    });

    /**
     * @tc.name   StringCodePointAt_ZeroWidthChar_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SPECIAL_0600
     * @tc.desc   Test codePointAt with zero-width no-break space character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_ZeroWidthChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = '\uFEFF'.codePointAt(0);
      expect(result).assertEqual(65279);
    });

    /**
     * @tc.name   StringCodePointAt_CombiningChar_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SPECIAL_0700
     * @tc.desc   Test codePointAt with combined e acute character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_CombiningChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = 'é'.codePointAt(0);
      expect(result).assertEqual(233);
    });

    /**
     * @tc.name   StringCodePointAt_CombiningChar_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SPECIAL_0800
     * @tc.desc   Test codePointAt with e + combining acute accent at index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_CombiningChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = 'e\u0301'.codePointAt(0);
      expect(result).assertEqual(101);
    });

    /**
     * @tc.name   StringCodePointAt_CombiningChar_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SPECIAL_0900
     * @tc.desc   Test codePointAt with e + combining acute accent at index 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_CombiningChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = 'e\u0301'.codePointAt(1);
      expect(result).assertEqual(769);
    });


    /**
     * @tc.name   StringCodePointAt_Emoji_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_0100
     * @tc.desc   Test codePointAt with emoji character (heart eyes)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_Emoji_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '😍'.codePointAt(0);
      expect(result).assertEqual(128525);
    });

    /**
     * @tc.name   StringCodePointAt_Emoji_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_0200
     * @tc.desc   Test codePointAt with emoji using escape sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_Emoji_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\ud83d\ude0d'.codePointAt(0);
      expect(result).assertEqual(128525);
    });

    /**
     * @tc.name   StringCodePointAt_Emoji_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_0300
     * @tc.desc   Test codePointAt emoji converted to hexadecimal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_Emoji_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let codePoint: Int | undefined = '😍'.codePointAt(0);
      let result: string = codePoint !== undefined ? codePoint.toString(16) : '';
      expect(result).assertEqual('1f60d');
    });

    /**
     * @tc.name   StringCodePointAt_TrailingSurrogate_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_0400
     * @tc.desc   Test codePointAt accessing trailing surrogate of emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_TrailingSurrogate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = '😍'.codePointAt(1);
      expect(result).assertEqual(56845);
    });

    /**
     * @tc.name   StringCodePointAt_TrailingSurrogate_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_0500
     * @tc.desc   Test codePointAt accessing trailing surrogate using escape sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_TrailingSurrogate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = '\ud83d\ude0d'.codePointAt(1);
      expect(result).assertEqual(56845);
    });

    /**
     * @tc.name   StringCodePointAt_TrailingSurrogate_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_0600
     * @tc.desc   Test codePointAt trailing surrogate converted to hexadecimal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_TrailingSurrogate_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let codePoint: Int | undefined = '\ud83d\ude0d'.codePointAt(1);
      let result: string = codePoint !== undefined ? codePoint.toString(16) : '';
      expect(result).assertEqual('de0d');
    });

    /**
     * @tc.name   StringCodePointAt_MixedSurrogate_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_0700
     * @tc.desc   Test codePointAt with mixed surrogate pairs and regular characters at index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_MixedSurrogate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\ud83d\udc0e\ud83d\udc71\u2764';
      let result: Int | undefined = str.codePointAt(0);
      expect(result).assertEqual(128014);
    });

    /**
     * @tc.name   StringCodePointAt_MixedSurrogate_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_0800
     * @tc.desc   Test codePointAt with mixed surrogate pairs at index 1 (trailing surrogate)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_MixedSurrogate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\ud83d\udc0e\ud83d\udc71\u2764';
      let result: Int | undefined = str.codePointAt(1);
      expect(result).assertEqual(56334);
    });

    /**
     * @tc.name   StringCodePointAt_MixedSurrogate_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_0900
     * @tc.desc   Test codePointAt with mixed surrogate pairs at index 2 (next surrogate pair start)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_MixedSurrogate_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\ud83d\udc0e\ud83d\udc71\u2764';
      let result: Int | undefined = str.codePointAt(2);
      expect(result).assertEqual(128113);
    });

    /**
     * @tc.name   StringCodePointAt_MixedSurrogate_004
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_1000
     * @tc.desc   Test codePointAt with mixed surrogate pairs at index 3 (trailing surrogate)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_MixedSurrogate_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let str: string = '\ud83d\udc0e\ud83d\udc71\u2764';
      let result: Int | undefined = str.codePointAt(3);
      expect(result).assertEqual(56433);
    });

    /**
     * @tc.name   StringCodePointAt_MixedSurrogate_005
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_1100
     * @tc.desc   Test codePointAt with mixed surrogate pairs at index 4 (BMP character)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_MixedSurrogate_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = '\ud83d\udc0e\ud83d\udc71\u2764';
      let result: Int | undefined = str.codePointAt(4);
      expect(result).assertEqual(10084);
    });

    /**
     * @tc.name   StringCodePointAt_ConsecutiveSurrogates_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_1200
     * @tc.desc   Test codePointAt with consecutive surrogate pairs at index 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_ConsecutiveSurrogates_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emojis: string = '😀😁😂';
      let result: Int | undefined = emojis.codePointAt(0);
      expect(result).assertEqual(128512);
    });

    /**
     * @tc.name   StringCodePointAt_ConsecutiveSurrogates_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_1300
     * @tc.desc   Test codePointAt with consecutive surrogate pairs at index 1 (trailing surrogate)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_ConsecutiveSurrogates_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let emojis: string = '😀😁😂';
      let result: Int | undefined = emojis.codePointAt(1);
      expect(result).assertEqual(56832);
    });

    /**
     * @tc.name   StringCodePointAt_ConsecutiveSurrogates_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_1400
     * @tc.desc   Test codePointAt with consecutive surrogate pairs at index 2 (next emoji)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_ConsecutiveSurrogates_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emojis: string = '😀😁😂';
      let result: Int | undefined = emojis.codePointAt(2);
      expect(result).assertEqual(128513);
    });

    /**
     * @tc.name   StringCodePointAt_ConsecutiveSurrogates_004
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_1500
     * @tc.desc   Test codePointAt with consecutive surrogate pairs at index 3 (trailing surrogate)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_ConsecutiveSurrogates_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let emojis: string = '😀😁😂';
      let result: Int | undefined = emojis.codePointAt(3);
      expect(result).assertEqual(56833);
    });

    /**
     * @tc.name   StringCodePointAt_IsolatedSurrogate_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_1600
     * @tc.desc   Test codePointAt with isolated leading surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_IsolatedSurrogate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = '\uD83D'.codePointAt(0);
      expect(result).assertEqual(55357);
    });

    /**
     * @tc.name   StringCodePointAt_IsolatedSurrogate_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_SURROGATE_1700
     * @tc.desc   Test codePointAt with isolated trailing surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('StringCodePointAt_IsolatedSurrogate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let result: Int | undefined = '\uDC0D'.codePointAt(0);
      expect(result).assertEqual(56333);
    });


    /**
     * @tc.name   StringCodePointAt_BMPChar_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_0100
     * @tc.desc   Test codePointAt with null character (U+0000)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_BMPChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\u0000'.codePointAt(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name   StringCodePointAt_BMPChar_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_0200
     * @tc.desc   Test codePointAt with DEL character (U+007F)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_BMPChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\u007F'.codePointAt(0);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.name   StringCodePointAt_BMPChar_003
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_0300
     * @tc.desc   Test codePointAt with Latin small letter y with diaeresis (U+00FF)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_BMPChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\u00FF'.codePointAt(0);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.name   StringCodePointAt_BMPChar_004
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_0400
     * @tc.desc   Test codePointAt with maximum BMP character (U+FFFF)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_BMPChar_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\uFFFF'.codePointAt(0);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.name   StringCodePointAt_SupplementaryPlane_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_0500
     * @tc.desc   Test codePointAt with first supplementary plane character (U+10000)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_SupplementaryPlane_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\uD800\uDC00'.codePointAt(0);
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.name   StringCodePointAt_SupplementaryPlane_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_0600
     * @tc.desc   Test codePointAt with last valid Unicode character (U+10FFFF)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_SupplementaryPlane_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '\uDBFF\uDFFF'.codePointAt(0);
      expect(result).assertEqual(1114111);
    });

    /**
     * @tc.name   StringCodePointAt_CJKChar_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_0700
     * @tc.desc   Test codePointAt with CJK unified ideograph
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_CJKChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '中'.codePointAt(0);
      expect(result).assertEqual(20013);
    });

    /**
     * @tc.name   StringCodePointAt_CJKChar_002
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_0800
     * @tc.desc   Test codePointAt with another CJK unified ideograph
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_CJKChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = '文'.codePointAt(0);
      expect(result).assertEqual(25991);
    });

    /**
     * @tc.name   StringCodePointAt_ArabicChar_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_0900
     * @tc.desc   Test codePointAt with Arabic letter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_ArabicChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = 'أ'.codePointAt(0);
      expect(result).assertEqual(1571);
    });

    /**
     * @tc.name   StringCodePointAt_DevanagariChar_001
     * @tc.number SUB_BUILTINS_STRING_CODEPOINTAT_UNICODE_1000
     * @tc.desc   Test codePointAt with Devanagari letter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCodePointAt_DevanagariChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: Int | undefined = 'अ'.codePointAt(0);
      expect(result).assertEqual(2309);
    });

  });
}
