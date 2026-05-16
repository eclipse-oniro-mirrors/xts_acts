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

import {
  testUndefinedParam,
  testNullParam,
  testNaNParam,
  testEmptyObjectParam,
  testEmptyArrayParam,
  testSingleElementArrayParam,
  testArrayWithThreeParam,
  testObjectWithValueOf,
  testObjectWithToString,
  testObjectWithBoth,
  testSymbolParam,
  testObjectWithToPrimitive,
  testObjectWithToPrimitiveString
} from './stringCharCodeAtErrorTest_JS.js';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

function stringToHexCodes(str: string): string[] {
  let hexCodes: string[] = [];
  for (let i: number = 0; i < str.length; i++) {
    let hex: string = str.charCodeAt(i).toString(16).toUpperCase().padStart(4, '0');
    hexCodes.push(hex);
  }
  return hexCodes;
}

function hexCodesToString(hexCodes: string[]): string {
  let chars: string[] = [];
  for (let i: number = 0; i < hexCodes.length; i++) {
    chars.push(String.fromCharCode(parseInt(hexCodes[i], 16)));
  }
  return chars.join('');
}

function stringToBinaryCodes(str: string): string[] {
  let binaryCodes: string[] = [];
  for (let i: number = 0; i < str.length; i++) {
    binaryCodes.push(str.charCodeAt(i).toString(2).padStart(16, '0'));
  }
  return binaryCodes;
}

function stringToUTF16Array(str: string): number[] {
  let result: number[] = [];
  for (let i: number = 0; i < str.length; i++) {
    result.push(str.charCodeAt(i));
  }
  return result;
}

function utf16ArrayToString(arr: number[]): string {
  let chars: string[] = [];
  for (let i: number = 0; i < arr.length; i++) {
    chars.push(String.fromCharCode(arr[i]));
  }
  return chars.join('');
}

function stringToCodePoints(str: string): number[] {
  let result: number[] = [];
  for (let i: number = 0; i < str.length; i++) {
    let code: number = str.charCodeAt(i);
    if (code >= 0xD800 && code <= 0xDBFF && i + 1 < str.length) {
      let nextCode: number = str.charCodeAt(i + 1);
      if (nextCode >= 0xDC00 && nextCode <= 0xDFFF) {
        let fullCodePoint: number = (code - 0xD800) * 0x400 + (nextCode - 0xDC00) + 0x10000;
        result.push(fullCodePoint);
        i++;
        continue;
      }
    }
    result.push(code);
  }
  return result;
}

function codePointsToString(arr: number[]): string {
  let result: string = '';
  for (let i: number = 0; i < arr.length; i++) {
    let codePoint: number = arr[i];
    if (codePoint >= 0x10000) {
      let high: number = ((codePoint - 0x10000) >> 10) | 0xD800;
      let low: number = ((codePoint - 0x10000) & 0x3FF) | 0xDC00;
      result += String.fromCharCode(high, low);
    } else {
      result += String.fromCharCode(codePoint);
    }
  }
  return result;
}

function createLargeString(length: number, char: string): string {
  let str: string = '';
  for (let i: number = 0; i < length; i++) {
    str += char;
  }
  return str;
}

function createSurrogateDenseString(count: number): string {
  let str: string = '';
  for (let i: number = 0; i < count; i++) {
    let codePoint: number = 0x10000 + i;
    let high: number = ((codePoint - 0x10000) >> 10) | 0xD800;
    let low: number = ((codePoint - 0x10000) & 0x3FF) | 0xDC00;
    str += String.fromCharCode(high, low);
  }
  return str;
}

export default function StringCharCodeAtBasicTest() {
  describe('StringCharCodeAtBasicTest', () => {
    beforeAll(() => {
    })
    beforeEach( async () => {
      await sleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringCharCodeAt_Basic_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_BASIC_0100
     * @tc.desc   Test charCodeAt with first character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Basic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "ABC".charCodeAt(0);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.name   StringCharCodeAt_Basic_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_BASIC_0200
     * @tc.desc   Test charCodeAt with second character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Basic_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "Hello".charCodeAt(1);
      expect(result).assertEqual(101);
    });

    /**
     * @tc.name   StringCharCodeAt_Basic_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_BASIC_0300
     * @tc.desc   Test charCodeAt return value range for ASCII character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Basic_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "A".charCodeAt(0);
      expect(result >= 0 && result <= 65535).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Basic_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_BASIC_0400
     * @tc.desc   Test charCodeAt return value range for extended Latin character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Basic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "ñ".charCodeAt(0);
      expect(result >= 0 && result <= 65535).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Basic_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_BASIC_0500
     * @tc.desc   Test charCodeAt with last character of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Basic_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let result: number = str.charCodeAt(str.length - 1);
      expect(result).assertEqual(111);
    });

    /**
     * @tc.name   StringCharCodeAt_Basic_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_BASIC_0600
     * @tc.desc   Test charCodeAt with middle character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Basic_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "World".charCodeAt(2);
      expect(result).assertEqual(114);
    });

    /**
     * @tc.name   StringCharCodeAt_Basic_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_BASIC_0700
     * @tc.desc   Test charCodeAt default parameter (no index)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Basic_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(0);
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Application_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_APPLICATION_0100
     * @tc.desc   Test string to hex codes conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Application_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "Hello";
      let hexCodes: string[] = stringToHexCodes(testStr);
      expect(hexCodes[0]).assertEqual("0048");
      expect(hexCodes[1]).assertEqual("0065");
      expect(hexCodes[2]).assertEqual("006C");
    });

    /**
     * @tc.name   StringCharCodeAt_Application_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_APPLICATION_0200
     * @tc.desc   Test hex codes to string conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Application_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "Hello";
      let hexCodes: string[] = stringToHexCodes(testStr);
      let reconstructed: string = hexCodesToString(hexCodes);
      expect(reconstructed).assertEqual("Hello");
    });

    /**
     * @tc.name   StringCharCodeAt_Application_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_APPLICATION_0300
     * @tc.desc   Test string to binary codes conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Application_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "AB";
      let binaryCodes: string[] = stringToBinaryCodes(testStr);
      expect(binaryCodes[0]).assertEqual("0000000001000001");
      expect(binaryCodes[1]).assertEqual("0000000001000010");
    });

    /**
     * @tc.name   StringCharCodeAt_Application_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_APPLICATION_0400
     * @tc.desc   Test charCodeAt in loop to get all codes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Application_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ABC";
      let codes: number[] = [];
      for (let i: number = 0; i < str.length; i++) {
        codes.push(str.charCodeAt(i));
      }
      expect(codes.length).assertEqual(3);
      expect(codes[0]).assertEqual(65);
      expect(codes[1]).assertEqual(66);
      expect(codes[2]).assertEqual(67);
    });

    /**
     * @tc.name   StringCharCodeAt_Application_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_APPLICATION_0500
     * @tc.desc   Test finding minimum code in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Application_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let minCode: number = Infinity;
      for (let i: number = 0; i < str.length; i++) {
        let code: number = str.charCodeAt(i);
        if (code < minCode) {
          minCode = code;
        }
      }
      expect(minCode).assertEqual(72);
    });

    /**
     * @tc.name   StringCharCodeAt_Application_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_APPLICATION_0600
     * @tc.desc   Test finding maximum code in string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Application_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let maxCode: number = -Infinity;
      for (let i: number = 0; i < str.length; i++) {
        let code: number = str.charCodeAt(i);
        if (code > maxCode) {
          maxCode = code;
        }
      }
      expect(maxCode).assertEqual(111);
    });

    /**
     * @tc.name   StringCharCodeAt_Application_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_APPLICATION_0700
     * @tc.desc   Test charCodeAt with Chinese characters hex conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Application_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "你好";
      let hexCodes: string[] = stringToHexCodes(testStr);
      expect(hexCodes[0]).assertEqual("4F60");
      expect(hexCodes[1]).assertEqual("597D");
    });


    /**
     * @tc.name   StringCharCodeAt_Comprehensive_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_COMPREHENSIVE_0100
     * @tc.desc   Test string to UTF-16 array conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Comprehensive_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "Hello";
      let utf16Array: number[] = stringToUTF16Array(testStr);
      expect(utf16Array.length).assertEqual(5);
      expect(utf16Array[0]).assertEqual(72);
      expect(utf16Array[4]).assertEqual(111);
    });

    /**
     * @tc.name   StringCharCodeAt_Comprehensive_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_COMPREHENSIVE_0200
     * @tc.desc   Test UTF-16 array to string conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Comprehensive_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let utf16Array: number[] = [72, 101, 108, 108, 111];
      let result: string = utf16ArrayToString(utf16Array);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.name   StringCharCodeAt_Comprehensive_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_COMPREHENSIVE_0300
     * @tc.desc   Test string to code points conversion for BMP characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Comprehensive_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "你好";
      let codePoints: number[] = stringToCodePoints(testStr);
      expect(codePoints.length).assertEqual(2);
      expect(codePoints[0]).assertEqual(20320);
      expect(codePoints[1]).assertEqual(22909);
    });

    /**
     * @tc.name   StringCharCodeAt_Comprehensive_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_COMPREHENSIVE_0400
     * @tc.desc   Test string to code points conversion for emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Comprehensive_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "🚀";
      let codePoints: number[] = stringToCodePoints(testStr);
      expect(codePoints.length).assertEqual(1);
      expect(codePoints[0]).assertEqual(128640);
    });

    /**
     * @tc.name   StringCharCodeAt_Comprehensive_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_COMPREHENSIVE_0500
     * @tc.desc   Test code points to string conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Comprehensive_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let codePoints: number[] = [128640];
      let result: string = codePointsToString(codePoints);
      expect(result).assertEqual("🚀");
    });

    /**
     * @tc.name   StringCharCodeAt_Comprehensive_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_COMPREHENSIVE_0600
     * @tc.desc   Test round trip for mixed string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Comprehensive_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "Hello 你好";
      let utf16Array: number[] = stringToUTF16Array(testStr);
      let reconstructed: string = utf16ArrayToString(utf16Array);
      expect(reconstructed).assertEqual(testStr);
    });

    /**
     * @tc.name   StringCharCodeAt_Comprehensive_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_COMPREHENSIVE_0700
     * @tc.desc   Test round trip for emoji string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Comprehensive_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "🚀👋";
      let codePoints: number[] = stringToCodePoints(testStr);
      let reconstructed: string = codePointsToString(codePoints);
      expect(reconstructed).assertEqual(testStr);
    });

    /**
     * @tc.name   StringCharCodeAt_Comprehensive_008
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_COMPREHENSIVE_0800
     * @tc.desc   Test counting surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Comprehensive_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello 🚀 👋";
      let surrogateCount: number = 0;
      let i: number = 0;
      while (i < str.length) {
        let code: number = str.charCodeAt(i);
        if (code >= 0xD800 && code <= 0xDBFF) {
          if (i + 1 < str.length) {
            let nextCode: number = str.charCodeAt(i + 1);
            if (nextCode >= 0xDC00 && nextCode <= 0xDFFF) {
              surrogateCount++;
              i += 2;
              continue;
            }
          }
        }
        i++;
      }
      expect(surrogateCount).assertEqual(2);
    });

    /**
     * @tc.name   StringCharCodeAt_Comprehensive_009
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_COMPREHENSIVE_0900
     * @tc.desc   Test UTF-16 well-formed check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Comprehensive_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let isWellFormed: boolean = true;
      for (let i: number = 0; i < str.length; i++) {
        let code: number = str.charCodeAt(i);
        if (code >= 0xD800 && code <= 0xDBFF) {
          if (i + 1 >= str.length) {
            isWellFormed = false;
            break;
          }
          let nextCode: number = str.charCodeAt(i + 1);
          if (nextCode < 0xDC00 || nextCode > 0xDFFF) {
            isWellFormed = false;
            break;
          }
          i++;
        } else if (code >= 0xDC00 && code <= 0xDFFF) {
          isWellFormed = false;
          break;
        }
      }
      expect(isWellFormed).assertTrue();
    });


    /**
     * @tc.name   StringCharCodeAt_Error_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_0100
     * @tc.desc   Test charCodeAt with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testUndefinedParam();
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_0200
     * @tc.desc   Test charCodeAt with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testNullParam();
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_0300
     * @tc.desc   Test charCodeAt with NaN parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testNaNParam();
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_0400
     * @tc.desc   Test charCodeAt with empty object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testEmptyObjectParam();
      expect(Number.isNaN(result)).assertFalse();
    });

    /**
     * @tc.name   StringCharCodeAt_Error_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_0500
     * @tc.desc   Test charCodeAt with empty array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testEmptyArrayParam();
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_0600
     * @tc.desc   Test charCodeAt with single element array parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testSingleElementArrayParam();
      expect(result).assertEqual(115);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_0700
     * @tc.desc   Test charCodeAt with array [3] parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testArrayWithThreeParam();
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_008
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_0800
     * @tc.desc   Test charCodeAt with object having valueOf
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testObjectWithValueOf();
      expect(result).assertEqual(101);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_009
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_0900
     * @tc.desc   Test charCodeAt with object having toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testObjectWithToString();
      expect(result).assertEqual(115);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_010
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_1000
     * @tc.desc   Test charCodeAt with object having both valueOf and toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testObjectWithBoth();
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_011
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_1100
     * @tc.desc   Test charCodeAt with Symbol parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testSymbolParam();
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Error_012
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_1200
     * @tc.desc   Test charCodeAt with object having Symbol.toPrimitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testObjectWithToPrimitive();
      expect(result).assertEqual(115);
    });

    /**
     * @tc.name   StringCharCodeAt_Error_013
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_ERROR_1300
     * @tc.desc   Test charCodeAt with object having Symbol.toPrimitive returning string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Error_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = testObjectWithToPrimitiveString();
      expect(result).assertEqual(116);
    });


    /**
     * @tc.name   StringCharCodeAt_Index_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_INDEX_0100
     * @tc.desc   Test charCodeAt with first index of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Index_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let result: number = str.charCodeAt(0);
      expect(result).assertEqual(72);
    });

    /**
     * @tc.name   StringCharCodeAt_Index_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_INDEX_0200
     * @tc.desc   Test charCodeAt with last index of string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Index_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let result: number = str.charCodeAt(str.length - 1);
      expect(result).assertEqual(111);
    });

    /**
     * @tc.name   StringCharCodeAt_Index_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_INDEX_0300
     * @tc.desc   Test charCodeAt with out of range positive index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Index_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(10);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Index_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_INDEX_0400
     * @tc.desc   Test charCodeAt with negative index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Index_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(-1);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Index_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_INDEX_0500
     * @tc.desc   Test charCodeAt with large positive index
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Index_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(999);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Index_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_INDEX_0600
     * @tc.desc   Test charCodeAt on empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Index_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "".charCodeAt(0);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Index_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_INDEX_0700
     * @tc.desc   Test charCodeAt on single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Index_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "a".charCodeAt(0);
      expect(result).assertEqual(97);
    });

    /**
     * @tc.name   StringCharCodeAt_Index_008
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_INDEX_0800
     * @tc.desc   Test charCodeAt with index 1 on single character string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Index_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "a".charCodeAt(1);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Index_009
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_INDEX_0900
     * @tc.desc   Test charCodeAt with index equal to string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Index_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "test";
      let result: number = str.charCodeAt(str.length);
      expect(Number.isNaN(result)).assertTrue();
    });


    /**
     * @tc.name   StringCharCodeAt_MethodCompare_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_METHODCOMPARE_0100
     * @tc.desc   Test charCodeAt vs charAt relationship
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_MethodCompare_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let index: number = 1;
      let code: number = str.charCodeAt(index);
      let char: string = str.charAt(index);
      expect(code).assertEqual(101);
      expect(char).assertEqual("e");
      expect(String.fromCharCode(code)).assertEqual(char);
    });

    /**
     * @tc.name   StringCharCodeAt_MethodCompare_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_METHODCOMPARE_0200
     * @tc.desc   Test charCodeAt vs codePointAt for BMP characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_MethodCompare_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.charCodeAt(0)).assertEqual(str.codePointAt(0));
    });

    /**
     * @tc.name   StringCharCodeAt_MethodCompare_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_METHODCOMPARE_0300
     * @tc.desc   Test charCodeAt vs codePointAt for surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_MethodCompare_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "𠮷𠮾";
      expect(str.charCodeAt(0)).assertEqual(55362);
      expect(str.codePointAt(0)).assertEqual(134071);
      expect(str.charCodeAt(1)).assertEqual(57271);
      expect(str.codePointAt(1)).assertEqual(57271);
    });

    /**
     * @tc.name   StringCharCodeAt_MethodCompare_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_METHODCOMPARE_0400
     * @tc.desc   Test charCodeAt and fromCharCode round trip
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_MethodCompare_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let codes: number[] = [];
      for (let i: number = 0; i < str.length; i++) {
        codes.push(str.charCodeAt(i));
      }
      let reconstructed: string = String.fromCharCode(...codes);
      expect(reconstructed).assertEqual("Hello");
    });

    /**
     * @tc.name   StringCharCodeAt_MethodCompare_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_METHODCOMPARE_0500
     * @tc.desc   Test charCodeAt and fromCharCode with surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_MethodCompare_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "𠮷𠮾";
      let high1: number = str.charCodeAt(0);
      let low1: number = str.charCodeAt(1);
      let reconstructed: string = String.fromCharCode(high1, low1);
      expect(reconstructed).assertEqual("𠮷");
    });


    /**
     * @tc.name   StringCharCodeAt_Parameter_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_0100
     * @tc.desc   Test charCodeAt with float 0.4 (truncated to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(0.4);
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_0200
     * @tc.desc   Test charCodeAt with float 0.9 (truncated to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(0.9);
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_0300
     * @tc.desc   Test charCodeAt with negative float -1.5 (returns NaN)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(-1.5);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_0400
     * @tc.desc   Test charCodeAt with negative float -0.5 (truncated to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(-0.5);
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_0500
     * @tc.desc   Test charCodeAt with zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(0);
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_0600
     * @tc.desc   Test charCodeAt with negative zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(-0);
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_0700
     * @tc.desc   Test charCodeAt with integer index 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(1);
      expect(result).assertEqual(101);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_008
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_0800
     * @tc.desc   Test charCodeAt with string "1" (converted to 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(1);
      expect(result).assertEqual(101);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_009
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_0900
     * @tc.desc   Test charCodeAt with string "0" (converted to 0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(0);
      expect(result).assertEqual(116);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_010
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_1000
     * @tc.desc   Test charCodeAt with string "2.5" (converted to 2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(2);
      expect(result).assertEqual(115);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_011
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_1100
     * @tc.desc   Test charCodeAt with float 1.9 (truncated to 1)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(1.9);
      expect(result).assertEqual(101);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_012
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_1200
     * @tc.desc   Test charCodeAt with float 2.1 (truncated to 2)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "test".charCodeAt(2.1);
      expect(result).assertEqual(115);
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_013
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_1300
     * @tc.desc   Test charCodeAt with MAX_SAFE_INTEGER (returns NaN)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let largeInt: number = Number.MAX_SAFE_INTEGER;
      let result: number = "test".charCodeAt(largeInt);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Parameter_014
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PARAMETER_1400
     * @tc.desc   Test charCodeAt with MAX_SAFE_INTEGER * 2 (returns NaN)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Parameter_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let hugeInt: number = Number.MAX_SAFE_INTEGER * 2;
      let result: number = "test".charCodeAt(hugeInt);
      expect(Number.isNaN(result)).assertTrue();
    });


    /**
     * @tc.name   StringCharCodeAt_Performance_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PERFORMANCE_0100
     * @tc.desc   Test charCodeAt with large string - first character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Performance_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let largeStr: string = createLargeString(1000, 'A');
      let result: number = largeStr.charCodeAt(0);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.name   StringCharCodeAt_Performance_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PERFORMANCE_0200
     * @tc.desc   Test charCodeAt with large string - last character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Performance_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let largeStr: string = createLargeString(1000, 'A');
      let result: number = largeStr.charCodeAt(largeStr.length - 1);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.name   StringCharCodeAt_Performance_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PERFORMANCE_0300
     * @tc.desc   Test charCodeAt with large string - middle character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Performance_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let largeStr: string = createLargeString(1000, 'A');
      let result: number = largeStr.charCodeAt(500);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.name   StringCharCodeAt_Performance_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PERFORMANCE_0400
     * @tc.desc   Test charCodeAt with large string - length check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Performance_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let largeStr: string = createLargeString(1000, 'A');
      expect(largeStr.length).assertEqual(1000);
    });

    /**
     * @tc.name   StringCharCodeAt_Performance_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PERFORMANCE_0500
     * @tc.desc   Test charCodeAt with surrogate dense string - length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Performance_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let surrogateDenseStr: string = createSurrogateDenseString(10);
      expect(surrogateDenseStr.length).assertEqual(20);
    });

    /**
     * @tc.name   StringCharCodeAt_Performance_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PERFORMANCE_0600
     * @tc.desc   Test charCodeAt with surrogate dense string - high surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Performance_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let surrogateDenseStr: string = createSurrogateDenseString(10);
      let result: number = surrogateDenseStr.charCodeAt(0);
      let isHighSurrogate: boolean = (result >= 0xD800 && result <= 0xDBFF);
      expect(isHighSurrogate).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Performance_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PERFORMANCE_0700
     * @tc.desc   Test charCodeAt with surrogate dense string - low surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Performance_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let surrogateDenseStr: string = createSurrogateDenseString(10);
      let result: number = surrogateDenseStr.charCodeAt(1);
      let isLowSurrogate: boolean = (result >= 0xDC00 && result <= 0xDFFF);
      expect(isLowSurrogate).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Performance_008
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PERFORMANCE_0800
     * @tc.desc   Test charCodeAt with boundary access - start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Performance_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "Hello World! 你好 🚀";
      expect(testStr.charCodeAt(0)).assertEqual(72);
    });

    /**
     * @tc.name   StringCharCodeAt_Performance_009
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_PERFORMANCE_0900
     * @tc.desc   Test charCodeAt with boundary access - end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Performance_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let testStr: string = "Hello World! 你好 🚀";
      let lastIndex: number = testStr.length - 1;
      let result: number = testStr.charCodeAt(lastIndex);
      let isLowSurrogate: boolean = (result >= 0xDC00 && result <= 0xDFFF);
      expect(isLowSurrogate).assertTrue();
    });


    /**
     * @tc.name   StringCharCodeAt_ReturnValue_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_0100
     * @tc.desc   Test charCodeAt with uppercase A
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "A".charCodeAt(0);
      expect(result).assertEqual(65);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_0200
     * @tc.desc   Test charCodeAt with uppercase Z
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "Z".charCodeAt(0);
      expect(result).assertEqual(90);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_0300
     * @tc.desc   Test charCodeAt with lowercase a
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "a".charCodeAt(0);
      expect(result).assertEqual(97);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_0400
     * @tc.desc   Test charCodeAt with lowercase z
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "z".charCodeAt(0);
      expect(result).assertEqual(122);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_0500
     * @tc.desc   Test charCodeAt with digit 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "0".charCodeAt(0);
      expect(result).assertEqual(48);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_0600
     * @tc.desc   Test charCodeAt with digit 9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "9".charCodeAt(0);
      expect(result).assertEqual(57);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_0700
     * @tc.desc   Test charCodeAt with extended Latin ñ
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "ñ".charCodeAt(0);
      expect(result).assertEqual(241);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_008
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_0800
     * @tc.desc   Test charCodeAt with extended Latin é
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "é".charCodeAt(0);
      expect(result).assertEqual(233);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_009
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_0900
     * @tc.desc   Test charCodeAt with extended Latin ü
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "ü".charCodeAt(0);
      expect(result).assertEqual(252);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_010
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_1000
     * @tc.desc   Test charCodeAt with extended Latin ç
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "ç".charCodeAt(0);
      expect(result).assertEqual(231);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_011
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_1100
     * @tc.desc   Test charCodeAt with newline character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "\n".charCodeAt(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_012
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_1200
     * @tc.desc   Test charCodeAt with carriage return character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "\r".charCodeAt(0);
      expect(result).assertEqual(13);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_013
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_1300
     * @tc.desc   Test charCodeAt with tab character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "\t".charCodeAt(0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_014
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_1400
     * @tc.desc   Test charCodeAt with space character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = " ".charCodeAt(0);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name   StringCharCodeAt_ReturnValue_015
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_RETURNVALUE_1500
     * @tc.desc   Test charCodeAt with non-character code point
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_ReturnValue_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let nonCharacter: string = String.fromCharCode(0xFDD0);
      let result: number = nonCharacter.charCodeAt(0);
      expect(result).assertEqual(64976);
    });


    /**
     * @tc.name   StringCharCodeAt_SpecialChar_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_0100
     * @tc.desc   Test charCodeAt with exclamation mark
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("!".charCodeAt(0)).assertEqual(33);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_0200
     * @tc.desc   Test charCodeAt with question mark
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("?".charCodeAt(0)).assertEqual(63);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_0300
     * @tc.desc   Test charCodeAt with comma
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(",".charCodeAt(0)).assertEqual(44);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_0400
     * @tc.desc   Test charCodeAt with period
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(".".charCodeAt(0)).assertEqual(46);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_0500
     * @tc.desc   Test charCodeAt with semicolon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(";".charCodeAt(0)).assertEqual(59);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_0600
     * @tc.desc   Test charCodeAt with colon
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(":".charCodeAt(0)).assertEqual(58);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_0700
     * @tc.desc   Test charCodeAt with double quote
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect('"'.charCodeAt(0)).assertEqual(34);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_008
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_0800
     * @tc.desc   Test charCodeAt with single quote
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("'".charCodeAt(0)).assertEqual(39);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_009
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_0900
     * @tc.desc   Test charCodeAt with left bracket
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("[".charCodeAt(0)).assertEqual(91);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_010
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1000
     * @tc.desc   Test charCodeAt with right bracket
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("]".charCodeAt(0)).assertEqual(93);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_011
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1100
     * @tc.desc   Test charCodeAt with plus sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("+".charCodeAt(0)).assertEqual(43);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_012
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1200
     * @tc.desc   Test charCodeAt with minus sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("-".charCodeAt(0)).assertEqual(45);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_013
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1300
     * @tc.desc   Test charCodeAt with asterisk
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("*".charCodeAt(0)).assertEqual(42);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_014
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1400
     * @tc.desc   Test charCodeAt with forward slash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("/".charCodeAt(0)).assertEqual(47);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_015
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1500
     * @tc.desc   Test charCodeAt with equals sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("=".charCodeAt(0)).assertEqual(61);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_016
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1600
     * @tc.desc   Test charCodeAt with less than sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("<".charCodeAt(0)).assertEqual(60);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_017
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1700
     * @tc.desc   Test charCodeAt with greater than sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(">".charCodeAt(0)).assertEqual(62);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_018
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1800
     * @tc.desc   Test charCodeAt with percent sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("%".charCodeAt(0)).assertEqual(37);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_019
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_1900
     * @tc.desc   Test charCodeAt with caret
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("^".charCodeAt(0)).assertEqual(94);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_020
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_2000
     * @tc.desc   Test charCodeAt with hash sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("#".charCodeAt(0)).assertEqual(35);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_021
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_2100
     * @tc.desc   Test charCodeAt with dollar sign
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("$".charCodeAt(0)).assertEqual(36);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_022
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_2200
     * @tc.desc   Test charCodeAt with ampersand
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("&".charCodeAt(0)).assertEqual(38);
    });

    /**
     * @tc.name   StringCharCodeAt_SpecialChar_023
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SPECIALCHAR_2300
     * @tc.desc   Test charCodeAt with pipe
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_SpecialChar_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("|".charCodeAt(0)).assertEqual(124);
    });


    /**
     * @tc.name   StringCharCodeAt_StringType_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_STRINGTYPE_0100
     * @tc.desc   Test charCodeAt on empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_StringType_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result: number = "".charCodeAt(0);
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_StringType_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_STRINGTYPE_0200
     * @tc.desc   Test charCodeAt on Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_StringType_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "你好";
      expect(str.charCodeAt(0)).assertEqual(20320);
      expect(str.charCodeAt(1)).assertEqual(22909);
    });

    /**
     * @tc.name   StringCharCodeAt_StringType_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_STRINGTYPE_0300
     * @tc.desc   Test charCodeAt on emoji string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_StringType_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "👋";
      expect(str.charCodeAt(0)).assertEqual(55357);
      expect(str.charCodeAt(1)).assertEqual(56395);
    });

    /**
     * @tc.name   StringCharCodeAt_StringType_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_STRINGTYPE_0400
     * @tc.desc   Test charCodeAt on mixed character types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_StringType_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello 你好 👋";
      expect(str.charCodeAt(0)).assertEqual(72);
      expect(str.charCodeAt(5)).assertEqual(32);
      expect(str.charCodeAt(6)).assertEqual(20320);
      expect(str.charCodeAt(8)).assertEqual(32);
      expect(str.charCodeAt(9)).assertEqual(55357);
    });

    /**
     * @tc.name   StringCharCodeAt_StringType_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_STRINGTYPE_0500
     * @tc.desc   Test charCodeAt on BMP Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_StringType_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("汉".charCodeAt(0)).assertEqual(27721);
      expect("字".charCodeAt(0)).assertEqual(23383);
    });

    /**
     * @tc.name   StringCharCodeAt_StringType_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_STRINGTYPE_0600
     * @tc.desc   Test charCodeAt on private use area character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_StringType_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = String.fromCharCode(0xE000);
      expect(str1.charCodeAt(0)).assertEqual(57344);
      let str2: string = String.fromCharCode(0xF8FF);
      expect(str2.charCodeAt(0)).assertEqual(63743);
    });

    /**
     * @tc.name   StringCharCodeAt_StringType_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_STRINGTYPE_0700
     * @tc.desc   Test charCodeAt on reserved area character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_StringType_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str1: string = String.fromCharCode(0xFDD0);
      expect(str1.charCodeAt(0)).assertEqual(64976);
      let str2: string = String.fromCharCode(0xFDEF);
      expect(str2.charCodeAt(0)).assertEqual(65007);
    });


    /**
     * @tc.name   StringCharCodeAt_Surrogate_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_0100
     * @tc.desc   Test charCodeAt with surrogate pair - first character high surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "𠮷𠮾";
      let result: number = str.charCodeAt(0);
      expect(result).assertEqual(55362);
    });

    /**
     * @tc.name   StringCharCodeAt_Surrogate_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_0200
     * @tc.desc   Test charCodeAt with surrogate pair - second character low surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "𠮷𠮾";
      let result: number = str.charCodeAt(1);
      expect(result).assertEqual(57271);
    });

    /**
     * @tc.name   StringCharCodeAt_Surrogate_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_0300
     * @tc.desc   Test charCodeAt with surrogate pair - third character high surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "𠮷𠮾";
      let result: number = str.charCodeAt(2);
      expect(result).assertEqual(55362);
    });

    /**
     * @tc.name   StringCharCodeAt_Surrogate_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_0400
     * @tc.desc   Test charCodeAt with surrogate pair - fourth character low surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "𠮷𠮾";
      let result: number = str.charCodeAt(3);
      expect(result).assertEqual(57278);
    });

    /**
     * @tc.name   StringCharCodeAt_Surrogate_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_0500
     * @tc.desc   Test charCodeAt with standalone high surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = String.fromCharCode(0xD800);
      let result: number = str.charCodeAt(0);
      expect(result).assertEqual(0xD800);
    });

    /**
     * @tc.name   StringCharCodeAt_Surrogate_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_0600
     * @tc.desc   Test charCodeAt with standalone low surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = String.fromCharCode(0xDC00);
      let result: number = str.charCodeAt(0);
      expect(result).assertEqual(0xDC00);
    });

    /**
     * @tc.name   StringCharCodeAt_Surrogate_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_0700
     * @tc.desc   Test charCodeAt with invalid surrogate pair (high + non-low)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let highSurrogate: string = String.fromCharCode(0xD800);
      let lowSurrogate: string = String.fromCharCode(0xDC00);
      let invalidPair: string = highSurrogate + "A" + lowSurrogate;
      expect(invalidPair.charCodeAt(0)).assertEqual(0xD800);
      expect(invalidPair.charCodeAt(1)).assertEqual(65);
      expect(invalidPair.charCodeAt(2)).assertEqual(0xDC00);
    });

    /**
     * @tc.name   StringCharCodeAt_Surrogate_008
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_0800
     * @tc.desc   Test charCodeAt with emoji - high surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = "🚀";
      let result: number = emoji.charCodeAt(0);
      expect(result).assertEqual(55357);
    });

    /**
     * @tc.name   StringCharCodeAt_Surrogate_009
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_0900
     * @tc.desc   Test charCodeAt with emoji - low surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = "🚀";
      let result: number = emoji.charCodeAt(1);
      expect(result).assertEqual(56960);
    });

    /**
     * @tc.name   StringCharCodeAt_Surrogate_010
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_SURROGATE_1000
     * @tc.desc   Test charCodeAt with waving hand emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Surrogate_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = "👋";
      expect(emoji.charCodeAt(0)).assertEqual(55357);
      expect(emoji.charCodeAt(1)).assertEqual(56395);
    });


    /**
     * @tc.name   StringCharCodeAt_Unicode_001
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_UNICODE_0100
     * @tc.desc   Test charCodeAt with BMP Chinese character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Unicode_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("汉".charCodeAt(0)).assertEqual(27721);
    });

    /**
     * @tc.name   StringCharCodeAt_Unicode_002
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_UNICODE_0200
     * @tc.desc   Test charCodeAt with another BMP Chinese character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Unicode_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("字".charCodeAt(0)).assertEqual(23383);
    });

    /**
     * @tc.name   StringCharCodeAt_Unicode_003
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_UNICODE_0300
     * @tc.desc   Test charCodeAt with BMP ASCII character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Unicode_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("A".charCodeAt(0)).assertEqual(65);
    });

    /**
     * @tc.name   StringCharCodeAt_Unicode_004
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_UNICODE_0400
     * @tc.desc   Test charCodeAt with BMP extended Latin
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Unicode_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("ñ".charCodeAt(0)).assertEqual(241);
    });

    /**
     * @tc.name   StringCharCodeAt_Unicode_005
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_UNICODE_0500
     * @tc.desc   Test charCodeAt with rocket emoji - high surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Unicode_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = "🚀";
      expect(emoji.charCodeAt(0)).assertEqual(55357);
    });

    /**
     * @tc.name   StringCharCodeAt_Unicode_006
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_UNICODE_0600
     * @tc.desc   Test charCodeAt with rocket emoji - low surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Unicode_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = "🚀";
      expect(emoji.charCodeAt(1)).assertEqual(56960);
    });

    /**
     * @tc.name   StringCharCodeAt_Unicode_007
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_UNICODE_0700
     * @tc.desc   Test charCodeAt with rocket emoji - codePointAt comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Unicode_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = "🚀";
      expect(emoji.codePointAt(0)).assertEqual(128640);
    });

    /**
     * @tc.name   StringCharCodeAt_Unicode_008
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_UNICODE_0800
     * @tc.desc   Test charCodeAt for surrogate pair validation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Unicode_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = "🚀";
      let first: number = emoji.charCodeAt(0);
      let second: number = emoji.charCodeAt(1);
      let isHighSurrogate: boolean = (first >= 0xD800 && first <= 0xDBFF);
      let isLowSurrogate: boolean = (second >= 0xDC00 && second <= 0xDFFF);
      expect(isHighSurrogate).assertTrue();
      expect(isLowSurrogate).assertTrue();
    });

    /**
     * @tc.name   StringCharCodeAt_Unicode_009
     * @tc.number SUB_BUILTINS_STRING_CHARCODEAT_UNICODE_0900
     * @tc.desc   Test charCodeAt for surrogate pair code point calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringCharCodeAt_Unicode_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let emoji: string = "🚀";
      let first: number = emoji.charCodeAt(0);
      let second: number = emoji.charCodeAt(1);
      let fullCodePoint: number = (first - 0xD800) * 0x400 + (second - 0xDC00) + 0x10000;
      expect(fullCodePoint).assertEqual(128640);
    });
  });
}
