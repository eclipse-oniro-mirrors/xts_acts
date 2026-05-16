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

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringEndsWithBasicTest() {
  describe('StringEndsWithBasicTest', () => {
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
     * @tc.name   StringEndsWith_Basic_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_0100
     * @tc.desc   Test endsWith with exact match at the end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("World")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Basic_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_0200
     * @tc.desc   Test endsWith with partial match at the end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("rld")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Basic_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_0300
     * @tc.desc   Test endsWith with partial string not at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("Wor")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Basic_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_0400
     * @tc.desc   Test endsWith with string at the beginning
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("Hello")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Basic_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_0500
     * @tc.desc   Test endsWith with completely different string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("xyz")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Basic_006
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_0600
     * @tc.desc   Test endsWith with single character match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("o")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Basic_007
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_0700
     * @tc.desc   Test endsWith with single character not match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("a")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Basic_008
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_0800
     * @tc.desc   Test endsWith with number type searchString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Value: 123";
      expect(str.endsWith("123")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Basic_009
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_0900
     * @tc.desc   Test endsWith with boolean type searchString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Result: true";
      expect(str.endsWith("true")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Basic_010
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_1000
     * @tc.desc   Test endsWith with null type searchString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "This is null";
      expect(str.endsWith("null")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Basic_011
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_1100
     * @tc.desc   Test endsWith with undefined type searchString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Variable is undefined";
      expect(str.endsWith("undefined")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Basic_012
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_1200
     * @tc.desc   Test endsWith with object type searchString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Object: [object Object]";
      expect(str.endsWith("[object Object]")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Basic_013
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_1300
     * @tc.desc   Test endsWith with array type searchString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "1,2,3";
      expect(str.endsWith("2,3")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Basic_014
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BASIC_1400
     * @tc.desc   Test endsWith with full array match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Basic_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "1,2,3";
      expect(str.endsWith("1,2,3")).assertTrue();
    });


    /**
     * @tc.name   StringEndsWith_Application_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_0100
     * @tc.desc   Test endsWith for file extension check - pdf
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let filename: string = "document.pdf";
      expect(filename.endsWith(".pdf")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Application_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_0200
     * @tc.desc   Test endsWith for file extension check - txt not match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let filename: string = "document.pdf";
      expect(filename.endsWith(".txt")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Application_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_0300
     * @tc.desc   Test endsWith for domain suffix check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let domain: string = "example.com.cn";
      expect(domain.endsWith(".com.cn")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Application_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_0400
     * @tc.desc   Test endsWith for domain suffix check - .cn
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let domain: string = "example.com.cn";
      expect(domain.endsWith(".cn")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Application_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_0500
     * @tc.desc   Test endsWith for URL path ending check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let path: string = "/api/users/";
      expect(path.endsWith("/")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Application_006
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_0600
     * @tc.desc   Test endsWith for sentence punctuation check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let sentence: string = "Is this a question?";
      expect(sentence.endsWith("?")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Application_007
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_0700
     * @tc.desc   Test endsWith for newline check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let text: string = "Line 1\nLine 2\n";
      expect(text.endsWith("\n")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Application_008
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_0800
     * @tc.desc   Test endsWith for trailing space check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let input: string = "user input ";
      expect(input.endsWith(" ")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Application_009
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_0900
     * @tc.desc   Test endsWith for trimmed trailing space check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let input: string = "user input ";
      expect(input.trim().endsWith(" ")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Application_010
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_1000
     * @tc.desc   Test endsWith with template string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let name: string = "World";
      let greeting: string = `Hello ${name}`;
      expect(greeting.endsWith("World")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Application_011
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_APPLICATION_1100
     * @tc.desc   Test endsWith with multiline string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Application_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let multiline: string = `Line 1
Line 2
Line 3`;
      expect(multiline.endsWith("Line 3")).assertTrue();
    });


    /**
     * @tc.name   StringEndsWith_Boundary_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_0100
     * @tc.desc   Test endsWith with single character match itself
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      expect(str.endsWith("a")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_0200
     * @tc.desc   Test endsWith with single character match empty
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      expect(str.endsWith("")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_0300
     * @tc.desc   Test endsWith with very long string ending match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "x".repeat(100000) + "END";
      expect(str.endsWith("END")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_0400
     * @tc.desc   Test endsWith with endPosition 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("H", 1)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_0500
     * @tc.desc   Test endsWith with empty string and endPosition 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", 1)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_006
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_0600
     * @tc.desc   Test endsWith with MAX_SAFE_INTEGER endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", Number.MAX_SAFE_INTEGER)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_007
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_0700
     * @tc.desc   Test endsWith with MIN_SAFE_INTEGER endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", Number.MIN_SAFE_INTEGER)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_008
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_0800
     * @tc.desc   Test endsWith with empty string and MIN_SAFE_INTEGER endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", Number.MIN_SAFE_INTEGER)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_009
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_0900
     * @tc.desc   Test endsWith with single character search match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("o")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_010
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1000
     * @tc.desc   Test endsWith with single character search not match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("H")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_011
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1100
     * @tc.desc   Test endsWith with search string one char longer than original
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello!")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_012
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1200
     * @tc.desc   Test endsWith multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("World")).assertTrue();
      expect(str.endsWith("World")).assertTrue();
      expect(str.endsWith("ld")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_013
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1300
     * @tc.desc   Test endsWith with -0 endPosition and empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", -0)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_014
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1400
     * @tc.desc   Test endsWith with -0 endPosition and non-empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("H", -0)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_015
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1500
     * @tc.desc   Test endsWith with +0 endPosition and empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", +0)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_016
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1600
     * @tc.desc   Test endsWith with +0 endPosition and non-empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("H", +0)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_017
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1700
     * @tc.desc   Test endsWith with scientific notation endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hel", 3e0)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_018
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1800
     * @tc.desc   Test endsWith with large scientific notation endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", 1e10)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_019
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_1900
     * @tc.desc   Test endsWith with hexadecimal endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hel", 0x3)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_020
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_2000
     * @tc.desc   Test endsWith with no arguments
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("undefined")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_021
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_2100
     * @tc.desc   Test endsWith with string literal
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect("Hello".endsWith("lo")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Boundary_022
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_BOUNDARY_2200
     * @tc.desc   Test endsWith with String object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Boundary_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: String = new String("Hello");
      expect(str.endsWith("lo")).assertTrue();
    });


    /**
     * @tc.name   StringEndsWith_CaseSensitivity_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_CASE_0100
     * @tc.desc   Test endsWith with lowercase match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_CaseSensitivity_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "hello world";
      expect(str.endsWith("world")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_CaseSensitivity_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_CASE_0200
     * @tc.desc   Test endsWith with uppercase match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_CaseSensitivity_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "HELLO WORLD";
      expect(str.endsWith("WORLD")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_CaseSensitivity_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_CASE_0300
     * @tc.desc   Test endsWith with different case - lowercase search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_CaseSensitivity_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("world")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_CaseSensitivity_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_CASE_0400
     * @tc.desc   Test endsWith with different case - uppercase search
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_CaseSensitivity_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("WORLD")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_CaseSensitivity_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_CASE_0500
     * @tc.desc   Test endsWith with exact case match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_CaseSensitivity_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("World")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_CaseSensitivity_006
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_CASE_0600
     * @tc.desc   Test endsWith with different first letter case
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_CaseSensitivity_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("hello")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_CaseSensitivity_007
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_CASE_0700
     * @tc.desc   Test endsWith with exact match for full string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_CaseSensitivity_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello")).assertTrue();
    });


    /**
     * @tc.name   StringEndsWith_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EMPTYSTRING_0100
     * @tc.desc   Test empty string ends with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      expect(str.endsWith("")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EmptyString_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EMPTYSTRING_0200
     * @tc.desc   Test empty string ends with non-empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EmptyString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "";
      expect(str.endsWith("a")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_EmptyString_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EMPTYSTRING_0300
     * @tc.desc   Test non-empty string ends with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EmptyString_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EmptyString_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EMPTYSTRING_0400
     * @tc.desc   Test empty string with endPosition parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EmptyString_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", 3)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EmptyString_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EMPTYSTRING_0500
     * @tc.desc   Test empty string with endPosition 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EmptyString_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", 0)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EmptyString_006
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EMPTYSTRING_0600
     * @tc.desc   Test empty string with negative endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EmptyString_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", -1)).assertTrue();
    });


    /**
     * @tc.name   StringEndsWith_EndPosition_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_0100
     * @tc.desc   Test endsWith with endPosition matching prefix
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("Hello", 5)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_0200
     * @tc.desc   Test endsWith with endPosition not matching different string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("World", 5)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_0300
     * @tc.desc   Test endsWith with string number endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("Hello", 5)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_0400
     * @tc.desc   Test endsWith with negative endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", -1)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_0500
     * @tc.desc   Test endsWith with empty string and negative endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", -1)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_006
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_0600
     * @tc.desc   Test endsWith with float endPosition (truncated)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hel", 3.9)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_007
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_0700
     * @tc.desc   Test endsWith with float endPosition not matching longer string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hell", 3.9)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_008
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_0800
     * @tc.desc   Test endsWith with endPosition exceeding string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", 100)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_009
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_0900
     * @tc.desc   Test endsWith with NaN endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", NaN)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_010
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1000
     * @tc.desc   Test endsWith with empty string and NaN endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", NaN)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_011
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1100
     * @tc.desc   Test endsWith with Infinity endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", Infinity)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_012
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1200
     * @tc.desc   Test endsWith with null endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", 0)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_013
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1300
     * @tc.desc   Test endsWith with empty string and null endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", 0)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_014
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1400
     * @tc.desc   Test endsWith with undefined endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_015
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1500
     * @tc.desc   Test endsWith with endPosition at string middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("ello", 5)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_016
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1600
     * @tc.desc   Test endsWith with partial match at middle position
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.endsWith("Hell", 5)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_017
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1700
     * @tc.desc   Test endsWith with endPosition equal to string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", 5)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_018
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1800
     * @tc.desc   Test endsWith with partial match at string length
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("lo", 5)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_019
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_1900
     * @tc.desc   Test endsWith with search string longer than endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", 3)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_020
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_2000
     * @tc.desc   Test endsWith with search string equal to endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hel", 3)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_021
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_2100
     * @tc.desc   Test endsWith with incrementing endPosition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("H", 1)).assertTrue();
      expect(str.endsWith("He", 2)).assertTrue();
      expect(str.endsWith("Hel", 3)).assertTrue();
      expect(str.endsWith("Hell", 4)).assertTrue();
      expect(str.endsWith("Hello", 5)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_022
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_2200
     * @tc.desc   Test endsWith with endPosition 0 and empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("", 0)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_023
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_2300
     * @tc.desc   Test endsWith with endPosition 0 and non-empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("H", 0)).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_EndPosition_024
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_ENDPOSITION_2400
     * @tc.desc   Test endsWith with endPosition 0 and full string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_EndPosition_024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello", 0)).assertFalse();
    });


    /**
     * @tc.name   StringEndsWith_Exception_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EXCEPTION_0100
     * @tc.desc   Test endsWith call with string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Exception_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("lo")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Exception_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EXCEPTION_0200
     * @tc.desc   Test endsWith with different search strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Exception_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("lo")).assertTrue();
      expect(str.endsWith("el")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Exception_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EXCEPTION_0300
     * @tc.desc   Test endsWith on number converted to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Exception_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let numStr: string = String(12345);
      expect(numStr.endsWith("45")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Exception_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EXCEPTION_0400
     * @tc.desc   Test endsWith on boolean converted to string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Exception_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let boolStr: string = String(true);
      expect(boolStr.endsWith("ue")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Exception_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_EXCEPTION_0500
     * @tc.desc   Test endsWith with object toString
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Exception_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      class TestObj {}
      let obj: TestObj = new TestObj();
      let objStr: string = String(obj);
      expect(objStr.endsWith("Object]")).assertTrue();
    });


    /**
     * @tc.name   StringEndsWith_Length_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_0100
     * @tc.desc   Test endsWith with long string ending match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a".repeat(10000) + "END";
      expect(str.endsWith("END")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Length_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_0200
     * @tc.desc   Test endsWith with long search string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a".repeat(10000);
      expect(str.endsWith("a".repeat(1000))).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Length_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_0300
     * @tc.desc   Test endsWith with single character string match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      expect(str.endsWith("a")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Length_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_0400
     * @tc.desc   Test endsWith with single character string empty match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      expect(str.endsWith("")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Length_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_0500
     * @tc.desc   Test endsWith with single character string no match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "a";
      expect(str.endsWith("b")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Length_006
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_0600
     * @tc.desc   Test endsWith with two character string match last char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ab";
      expect(str.endsWith("b")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Length_007
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_0700
     * @tc.desc   Test endsWith with two character string match full
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ab";
      expect(str.endsWith("ab")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Length_008
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_0800
     * @tc.desc   Test endsWith with two character string no match first char
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ab";
      expect(str.endsWith("a")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Length_009
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_0900
     * @tc.desc   Test endsWith with search string longer than original
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hi";
      expect(str.endsWith("Hello")).assertFalse();
    });

    /**
     * @tc.name   StringEndsWith_Length_010
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_1000
     * @tc.desc   Test endsWith with equal length strings match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("Hello")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_Length_011
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_LENGTH_1100
     * @tc.desc   Test endsWith with equal length strings no match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_Length_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.endsWith("World")).assertFalse();
    });


    /**
     * @tc.name   StringEndsWith_MethodInteraction_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_0100
     * @tc.desc   Test endsWith with startsWith for full check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.startsWith("Hello") && str.endsWith("World")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_0200
     * @tc.desc   Test endsWith with startsWith for complete match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      expect(str.startsWith("Hello") && str.endsWith("Hello")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_0300
     * @tc.desc   Test endsWith with includes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      expect(str.includes("World") && str.endsWith("World")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_0400
     * @tc.desc   Test endsWith after slice
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let sliced: string = str.slice(0, 5);
      expect(sliced.endsWith("Hello")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_0500
     * @tc.desc   Test endsWith with slice for suffix comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let suffix: string = str.slice(-5);
      expect(str.endsWith(suffix)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_006
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_0600
     * @tc.desc   Test endsWith with indexOf verification
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let search: string = "World";
      let expectedPos: number = str.length - search.length;
      expect(str.endsWith(search) === (str.indexOf(search) === expectedPos)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_007
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_0700
     * @tc.desc   Test endsWith with lastIndexOf verification
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World World";
      let search: string = "World";
      let ends: boolean = str.endsWith(search);
      let lastPos: number = str.lastIndexOf(search);
      expect(ends === (lastPos === str.length - search.length)).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_008
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_0800
     * @tc.desc   Test endsWith with toLowerCase for case insensitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let search: string = "WORLD";
      expect(str.toLowerCase().endsWith(search.toLowerCase())).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_009
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_0900
     * @tc.desc   Test endsWith with trim
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World   ";
      expect(str.endsWith("World")).assertFalse();
      expect(str.trim().endsWith("World")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_010
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_1000
     * @tc.desc   Test endsWith with trimEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World   ";
      expect(str.endsWith("   ")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_011
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_1100
     * @tc.desc   Test endsWith with repeat
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "ab".repeat(3);
      expect(str.endsWith("ab")).assertTrue();
      expect(str.endsWith("b")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_012
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_1200
     * @tc.desc   Test endsWith with padEnd
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello";
      let padded: string = str.padEnd(10, "!");
      expect(padded.endsWith("!!!!!")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_013
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_1300
     * @tc.desc   Test endsWith with replace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello World";
      let replaced: string = str.replace("World", "Universe");
      expect(replaced.endsWith("Universe")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_014
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_1400
     * @tc.desc   Test endsWith with split
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "path/to/file.txt";
      let parts: string[] = str.split("/");
      expect(str.endsWith(parts[parts.length - 1])).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_MethodInteraction_015
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_INTERACTION_1500
     * @tc.desc   Test endsWith chained with trim and toLowerCase
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_MethodInteraction_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "  Hello World  ";
      expect(str.trim().toLowerCase().endsWith("world")).assertTrue();
    });


    /**
     * @tc.name   StringEndsWith_SpecialChars_001
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_0100
     * @tc.desc   Test endsWith with trailing space
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello ";
      expect(str.endsWith(" ")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_002
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_0200
     * @tc.desc   Test endsWith with trailing space and characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello ";
      expect(str.endsWith("lo ")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_003
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_0300
     * @tc.desc   Test endsWith with trailing tab
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\t";
      expect(str.endsWith("\t")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_004
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_0400
     * @tc.desc   Test endsWith with trailing newline
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\n";
      expect(str.endsWith("\n")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_005
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_0500
     * @tc.desc   Test endsWith with trailing carriage return
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\r";
      expect(str.endsWith("\r")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_006
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_0600
     * @tc.desc   Test endsWith with multiple whitespace characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello \t\n";
      expect(str.endsWith("\t\n")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_007
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_0700
     * @tc.desc   Test endsWith with all trailing whitespace
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello \t\n";
      expect(str.endsWith(" \t\n")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_008
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_0800
     * @tc.desc   Test endsWith with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "你好世界";
      expect(str.endsWith("世界")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_009
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_0900
     * @tc.desc   Test endsWith with single Chinese character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "你好世界";
      expect(str.endsWith("界")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_010
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_1000
     * @tc.desc   Test endsWith with Japanese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "こんにちは";
      expect(str.endsWith("は")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_011
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_1100
     * @tc.desc   Test endsWith with Emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello 🌍";
      expect(str.endsWith("🌍")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_012
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_1200
     * @tc.desc   Test endsWith with Unicode copyright symbol
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\u00A9";
      expect(str.endsWith("\u00A9")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_013
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_1300
     * @tc.desc   Test endsWith with backslash
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Path\\";
      expect(str.endsWith("\\")).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_014
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_1400
     * @tc.desc   Test endsWith with quotes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = 'He said "Hi"';
      expect(str.endsWith('"Hi"')).assertTrue();
    });

    /**
     * @tc.name   StringEndsWith_SpecialChars_015
     * @tc.number SUB_BUILTINS_STRING_ENDSWITH_SPECIAL_1500
     * @tc.desc   Test endsWith with zero-width space
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringEndsWith_SpecialChars_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let str: string = "Hello\u200B";
      expect(str.endsWith("\u200B")).assertTrue();
    });
  });
}
