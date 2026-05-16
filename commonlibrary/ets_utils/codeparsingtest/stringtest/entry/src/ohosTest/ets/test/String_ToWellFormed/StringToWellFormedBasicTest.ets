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
import * as testUtils from './StringToWellFormedTest';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringToWellFormedBasicTest() {
  describe('StringToWellFormedBasicTest', () => {
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
     * @tc.name   StringToWellFormed_EmptyString_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0100
     * @tc.desc   Test toWellFormed with empty string returns empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_EmptyString_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test001();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringToWellFormed_ASCII_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0200
     * @tc.desc   Test toWellFormed with ASCII characters returns same string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ASCII_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test002();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_BMP_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0300
     * @tc.desc   Test toWellFormed with BMP characters returns same string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_BMP_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test003();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_SurrogatePairs_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0400
     * @tc.desc   Test toWellFormed with valid surrogate pairs returns same string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SurrogatePairs_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test004();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_MixedTypes_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0500
     * @tc.desc   Test toWellFormed with mixed character types
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MixedTypes_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test005();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_ReturnType_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0600
     * @tc.desc   Test toWellFormed returns correct result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ReturnType_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test006();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_NotModifyOriginal_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0700
     * @tc.desc   Test toWellFormed does not modify original string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_NotModifyOriginal_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test007();
      expect(result.originalEqualsStr).assertEqual(true);
      expect(result.strEqualsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ReturnStringType_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_BASIC_0800
     * @tc.desc   Test toWellFormed returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ReturnStringType_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test008();
      expect(result.type).assertEqual("string");
    });


    /**
     * @tc.name   StringToWellFormed_URLParams_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0100
     * @tc.desc   Test toWellFormed with URL parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_URLParams_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test061();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_URLPath_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0200
     * @tc.desc   Test toWellFormed with URL path
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_URLPath_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test062();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_JSONStringify_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0300
     * @tc.desc   Test toWellFormed with JSON stringify
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_JSONStringify_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test063();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_JSONParse_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0400
     * @tc.desc   Test toWellFormed with JSON parse
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_JSONParse_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test064();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Storage_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0500
     * @tc.desc   Test toWellFormed with storage operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Storage_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test065();
      expect(result.result).assertEqual(result.expected);
      expect(result.isWellFormed).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Filename_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0600
     * @tc.desc   Test toWellFormed with filename processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Filename_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test066();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_FileContent_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0700
     * @tc.desc   Test toWellFormed with file content processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_FileContent_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test067();
      expect(result.line1).assertEqual("Line 2\uFFFD");
    });

    /**
     * @tc.name   StringToWellFormed_APIResponse_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_APPLICATION_0800
     * @tc.desc   Test toWellFormed with API response processing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_APIResponse_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test068();
      expect(result.result).assertEqual(result.expected);
    });


    /**
     * @tc.name   StringToWellFormed_SingleChar_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0100
     * @tc.desc   Test toWellFormed with single character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SingleChar_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test025();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringToWellFormed_SingleLoneSurrogate_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0200
     * @tc.desc   Test toWellFormed with single lone surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SingleLoneSurrogate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test026();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.name   StringToWellFormed_SingleSurrogatePair_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0300
     * @tc.desc   Test toWellFormed with single surrogate pair
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SingleSurrogatePair_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test027();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.name   StringToWellFormed_SurrogateStart_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0400
     * @tc.desc   Test toWellFormed with surrogate at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SurrogateStart_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test028();
      expect(result.result).assertEqual(result.expected);
      expect(result.indexOfFFFD).assertEqual(0);
    });

    /**
     * @tc.name   StringToWellFormed_SurrogateEnd_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0500
     * @tc.desc   Test toWellFormed with surrogate at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SurrogateEnd_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test029();
      expect(result.result).assertEqual(result.expected);
      expect(result.lastIndexOfFFFD).assertEqual(3);
    });

    /**
     * @tc.name   StringToWellFormed_SurrogateMiddle_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0600
     * @tc.desc   Test toWellFormed with surrogate in middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SurrogateMiddle_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test030();
      expect(result.result).assertEqual(result.expected);
      expect(result.indexOfFFFD).assertEqual(2);
    });

    /**
     * @tc.name   StringToWellFormed_ReplacementChar_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0700
     * @tc.desc   Test toWellFormed with replacement character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ReplacementChar_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test031();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ZeroWidthChars_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0800
     * @tc.desc   Test toWellFormed with zero width characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ZeroWidthChars_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test032();
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_BOM_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_0900
     * @tc.desc   Test toWellFormed with BOM character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_BOM_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test033();
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ControlChars_010
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1000
     * @tc.desc   Test toWellFormed with control characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ControlChars_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test034();
      expect(result.length).assertEqual(8);
      expect(result.includesFFFD).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_NewlineTab_011
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1100
     * @tc.desc   Test toWellFormed with newline and tab characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_NewlineTab_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test035();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_PrivateUseArea_012
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1200
     * @tc.desc   Test toWellFormed with private use area characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_PrivateUseArea_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test036();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_SpecialPlane_013
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1300
     * @tc.desc   Test toWellFormed with special plane characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_SpecialPlane_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test037();
      expect(result.equalsOriginal).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_TemplateString_014
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1400
     * @tc.desc   Test toWellFormed with template string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_TemplateString_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test038();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_NestedTemplate_015
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_CHARACTER_1500
     * @tc.desc   Test toWellFormed with nested template string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_NestedTemplate_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test039();
      expect(result.result).assertEqual(result.expected);
    });


    /**
     * @tc.name   StringToWellFormed_Object_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0100
     * @tc.desc   Test toWellFormed with object type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Object_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test052();
      expect(result.threwError).assertEqual(false);
    });

    /**
     * @tc.name   StringToWellFormed_Null_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0200
     * @tc.desc   Test toWellFormed with null throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Null_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test053();
      expect(result.threwError).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Undefined_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0300
     * @tc.desc   Test toWellFormed with undefined throws TypeError
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Undefined_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test054();
      expect(result.threwError).assertEqual(true);
      expect(result.isTypeError).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Number_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0400
     * @tc.desc   Test toWellFormed with number type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Number_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test055();
      expect(result.threwError).assertEqual(false);
    });

    /**
     * @tc.name   StringToWellFormed_Boolean_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0500
     * @tc.desc   Test toWellFormed with boolean type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Boolean_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test056();
      expect(result.threwError).assertEqual(false);
    });

    /**
     * @tc.name   StringToWellFormed_StringObject_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0600
     * @tc.desc   Test toWellFormed with String object returns string type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_StringObject_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test057();
      expect(result.result).assertEqual(result.expected);
      expect(result.type).assertEqual("string");
    });

    /**
     * @tc.name   StringToWellFormed_PrimitiveVsObject_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0700
     * @tc.desc   Test toWellFormed primitive vs object comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_PrimitiveVsObject_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test058();
      expect(result.equals).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ToString_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0800
     * @tc.desc   Test toWellFormed with toString conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ToString_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test059();
      expect(result.equals).assertEqual(false);
      expect(result.stringifiedEqualsStr).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ValueOf_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_TYPECONVERSION_0900
     * @tc.desc   Test toWellFormed with valueOf conversion
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ValueOf_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test060();
      expect(result.equals).assertEqual(false);
      expect(result.valueEqualsStr).assertEqual(true);
    });


    /**
     * @tc.name   StringToWellFormed_Chinese_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0100
     * @tc.desc   Test toWellFormed with Chinese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Chinese_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test074();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Japanese_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0200
     * @tc.desc   Test toWellFormed with Japanese characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Japanese_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test075();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Korean_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0300
     * @tc.desc   Test toWellFormed with Korean characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Korean_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test076();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Arabic_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0400
     * @tc.desc   Test toWellFormed with Arabic characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Arabic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test077();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Hebrew_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0500
     * @tc.desc   Test toWellFormed with Hebrew characters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Hebrew_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test078();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_EmojiSequence_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0600
     * @tc.desc   Test toWellFormed with emoji sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_EmojiSequence_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test079();
      expect(result.length).assertLarger(1);
      expect(result.includesFFFD).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_FlagEmoji_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0700
     * @tc.desc   Test toWellFormed with flag emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_FlagEmoji_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test080();
      expect(result.includesFFFD).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ComplexEmoji_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0800
     * @tc.desc   Test toWellFormed with complex emoji
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ComplexEmoji_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test081();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_CharAt_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_0900
     * @tc.desc   Test toWellFormed with charAt method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_CharAt_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test082();
      expect(result.originalCharAt2).assertEqual("\uD800");
      expect(result.wellFormedCharAt2).assertEqual("\uFFFD");
    });

    /**
     * @tc.name   StringToWellFormed_CodePointAt_010
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_MULTILANGUAGE_1000
     * @tc.desc   Test toWellFormed with codePointAt method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_CodePointAt_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test083();
      expect(result.originalCodePointAt2).assertEqual(0xD800);
      expect(result.wellFormedCodePointAt2).assertEqual(0xFFFD);
    });


    /**
     * @tc.name   StringToWellFormed_EncodeURI_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0100
     * @tc.desc   Test toWellFormed with encodeURI
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_EncodeURI_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test040();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_EncodeURIComponent_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0200
     * @tc.desc   Test toWellFormed with encodeURIComponent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_EncodeURIComponent_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test041();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_Concat_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0300
     * @tc.desc   Test toWellFormed with concat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Concat_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test042();
      expect(result.result).assertEqual(result.expected);
      expect(result.isWellFormed).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Split_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0400
     * @tc.desc   Test toWellFormed with split method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Split_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test043();
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringToWellFormed_Slice_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0500
     * @tc.desc   Test toWellFormed with slice method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Slice_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test044();
      expect(result.slice1).assertEqual(result.expected1);
      expect(result.slice2).assertEqual(result.expected2);
    });

    /**
     * @tc.name   StringToWellFormed_Substring_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0600
     * @tc.desc   Test toWellFormed with substring method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Substring_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test045();
      expect(result.sub1).assertEqual(result.expected1);
      expect(result.sub2).assertEqual(result.expected2);
    });

    /**
     * @tc.name   StringToWellFormed_Replace_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0700
     * @tc.desc   Test toWellFormed with replace method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Replace_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test046();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_IndexOf_008
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0800
     * @tc.desc   Test toWellFormed with indexOf method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_IndexOf_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test047();
      expect(result.indexOf1).assertEqual(4);
      expect(result.indexOf2).assertEqual(10);
    });

    /**
     * @tc.name   StringToWellFormed_Includes_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_0900
     * @tc.desc   Test toWellFormed with includes method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Includes_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test048();
      expect(result.includesFFFD).assertEqual(true);
      expect(result.includesValue).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Repeat_010
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_1000
     * @tc.desc   Test toWellFormed with repeat method
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Repeat_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test049();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_ToLowerCaseTrim_011
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_1100
     * @tc.desc   Test toWellFormed with toLowerCase and trim methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ToLowerCaseTrim_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test050();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_ComplexChain_012
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_STRINGMETHODS_1200
     * @tc.desc   Test toWellFormed with complex method chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ComplexChain_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test051();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_LoneTrailEnd_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0100
     * @tc.desc   Test toWellFormed with lone trail surrogate at end
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LoneTrailEnd_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test009();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(3);
      expect(result.charCodeAt2).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_LoneTrailMiddle_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0200
     * @tc.desc   Test toWellFormed with lone trail surrogate in middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LoneTrailMiddle_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test010();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.name   StringToWellFormed_MultipleLoneTrail_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0300
     * @tc.desc   Test toWellFormed with multiple lone trail surrogates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleLoneTrail_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test011();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_ConsecutiveLoneTrail_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0400
     * @tc.desc   Test toWellFormed with consecutive lone trail surrogates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ConsecutiveLoneTrail_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test012();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringToWellFormed_LoneLeadStart_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0500
     * @tc.desc   Test toWellFormed with lone lead surrogate at start
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LoneLeadStart_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test013();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name   StringToWellFormed_LoneLeadMiddle_006
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0600
     * @tc.desc   Test toWellFormed with lone lead surrogate in middle
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LoneLeadMiddle_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test014();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_MultipleLoneLead_007
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0700
     * @tc.desc   Test toWellFormed with multiple lone lead surrogates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleLoneLead_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test015();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_TrailMin_009
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0800
     * @tc.desc   Test toWellFormed with trail surrogate minimum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_TrailMin_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test017();
      expect(result.result).assertEqual(result.expected);
      expect(result.charCodeAt4).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_TrailMax_010
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_0900
     * @tc.desc   Test toWellFormed with trail surrogate maximum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_TrailMax_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test018();
      expect(result.result).assertEqual(result.expected);
      expect(result.charCodeAt4).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_LeadMin_011
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1000
     * @tc.desc   Test toWellFormed with lead surrogate minimum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LeadMin_011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test019();
      expect(result.result).assertEqual(result.expected);
      expect(result.charCodeAt4).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_LeadMax_012
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1100
     * @tc.desc   Test toWellFormed with lead surrogate maximum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_LeadMax_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test020();
      expect(result.result).assertEqual(result.expected);
      expect(result.charCodeAt4).assertEqual(0xFFFD);
    });

    /**
     * @tc.name   StringToWellFormed_ReversedOrder_014
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1200
     * @tc.desc   Test toWellFormed with reversed surrogate order
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ReversedOrder_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test022();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_TrailWithChar_015
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1300
     * @tc.desc   Test toWellFormed with trail surrogate followed by character
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_TrailWithChar_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test023();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringToWellFormed_PairThenLone_016
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_SURROGATE_1400
     * @tc.desc   Test toWellFormed with pair followed by lone surrogate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_PairThenLone_016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test024();
      expect(result.result).assertEqual(result.expected);
      expect(result.length).assertEqual(3);
    });


    /**
     * @tc.name   StringToWellFormed_MultipleLone_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0100
     * @tc.desc   Test toWellFormed with multiple lone surrogates in long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleLone_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test069();
      expect(result.length).assertEqual(10000);
      expect(result.equals).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_MixedLongString_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0200
     * @tc.desc   Test toWellFormed with mixed long string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MixedLongString_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test070();
      expect(result.isWellFormed).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_MultipleCalls_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0300
     * @tc.desc   Test toWellFormed with multiple calls returns same result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleCalls_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test071();
      expect(result.r1EqualsR2).assertEqual(true);
      expect(result.r2EqualsR3).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_ChainedCalls_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0400
     * @tc.desc   Test toWellFormed with chained calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_ChainedCalls_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test072();
      expect(result.result).assertEqual(result.expected);
      expect(result.equalsSingle).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_MultipleSameResult_005
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PERFORMANCE_0500
     * @tc.desc   Test toWellFormed multiple calls return same result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_MultipleSameResult_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test073();
      expect(result.equals).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_Exists_001
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PROPERTY_0100
     * @tc.desc   Test toWellFormed method exists on String prototype
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Exists_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test084();
      expect(result.exists).assertEqual(true);
    });

    /**
     * @tc.name   StringToWellFormed_FunctionType_002
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PROPERTY_0200
     * @tc.desc   Test toWellFormed is function type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_FunctionType_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test085();
      expect(result.type).assertEqual("function");
    });

    /**
     * @tc.name   StringToWellFormed_Length_003
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PROPERTY_0300
     * @tc.desc   Test toWellFormed method length is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Length_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test086();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name   StringToWellFormed_Name_004
     * @tc.number SUB_BUILTINS_STRING_TOWELLFORMED_PROPERTY_0400
     * @tc.desc   Test toWellFormed method name is "toWellFormed"
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringToWellFormed_Name_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = testUtils.test087();
      expect(result.name).assertEqual("toWellFormed");
    });
  });
}
