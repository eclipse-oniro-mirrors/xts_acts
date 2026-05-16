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
  testIsWellFormedEmptyString,
  testIsWellFormedPureASCII,
  testIsWellFormedUnicode,
  testIsWellFormedEmoji,
  testIsWellFormedCompleteSurrogatePairs
} from './string_isWellFormed_basic';

import {
  testIsWellFormedUserInputValidation,
  testIsWellFormedTextSanitization,
  testIsWellFormedFilenameValidation,
  testIsWellFormedDatabaseStorage,
  testIsWellFormedLogging,
  testIsWellFormedMultilingual,
  testIsWellFormedRegexPatternValidation,
  testIsWellFormedCSVData,
  testIsWellFormedHTMLValidation,
  testIsWellFormedConfigValidation,
} from './string_isWellFormed_application';

import {
  testIsWellFormedLongWellFormedString,
  testIsWellFormedLongStringWithLoneSurrogate,
  testIsWellFormedSingleASCII,
  testIsWellFormedSingleUnicode,
  testIsWellFormedSingleSurrogate,
  testIsWellFormedControlCharacters,
  testIsWellFormedEscapeCharacters,
  testIsWellFormedPrivateUseArea,
  testIsWellFormedSpecialPurposeArea,
  testIsWellFormedBOMAndSpecialMarks
} from './string_isWellFormed_boundary';

import {
  testIsWellFormedMethodExists,
  testIsWellFormedMixedCharacters,
  testIsWellFormedEmptyStringOperations,
  testIsWellFormedLoneSurrogateOperations,
  testIsWellFormedComplexScenario
} from './string_isWellFormed_compatibility';

import {
  testIsWellFormedWithToWellFormed,
  testIsWellFormedWithEncodeURISafety,
  testIsWellFormedAfterNormalize,
  testIsWellFormedAfterSlice,
  testIsWellFormedAfterSubstring,
  testIsWellFormedAfterConcat,
  testIsWellFormedAfterTrim,
  testIsWellFormedAfterPadStart,
  testIsWellFormedAfterPadEnd
} from './string_isWellFormed_interaction';

import {
  testIsWellFormedLargeString10KB,
  testIsWellFormedLargeString100KB,
  testIsWellFormedLargeStringWithSurrogate,
  testIsWellFormedRepeatedCalls100,
  testIsWellFormedRepeatedCalls1000,
  testIsWellFormedLargeUnicodeString,
  testIsWellFormedLargeEmojiString,
  testIsWellFormedConcurrentSameString
} from './string_isWellFormed_performance';

import {
  testIsWellFormedLoneHighSurrogate,
  testIsWellFormedHighSurrogateAtStart,
  testIsWellFormedHighSurrogateInMiddle,
  testIsWellFormedHighSurrogateAtEnd,
  testIsWellFormedMultipleHighSurrogates,
  testIsWellFormedHighSurrogateBoundaries,
  testIsWellFormedLoneLowSurrogate,
  testIsWellFormedLowSurrogateAtStart,
  testIsWellFormedLowSurrogateInMiddle,
  testIsWellFormedLowSurrogateAtEnd,
  testIsWellFormedMultipleLowSurrogates,
  testIsWellFormedLowSurrogateBoundaries,
  testIsWellFormedWrongSurrogateOrder,
  testIsWellFormedMixedSurrogates,
  testIsWellFormedConsecutiveHighSurrogates,
  testIsWellFormedConsecutiveLowSurrogates,
  testIsWellFormedInterleavedSurrogates
} from './string_isWellFormed_surrogate';

import {
  testIsWellFormedOnNumber,
  testIsWellFormedOnBoolean,
  testIsWellFormedOnObject,
  testIsWellFormedOnArray,
  testIsWellFormedCustomObjectToString,
  testIsWellFormedCustomObjectToStringAndValueOf,
  testIsWellFormedDirectCall,
  testIsWellFormedWithCallApply,
  testIsWellFormedWithBind
} from './string_isWellFormed_typeConversion';

function sleep(time: number): Promise<void> {
  return new Promise((re) => {
    setTimeout(() => {
      re();
    }, time);
  });
}

export default function StringIsWellFormedBasicTest() {
  describe('StringIsWellFormedBasicTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringIsWellFormed_Basic_001
     * @tc.number SUB_BUILTINS_STRING_ISWELLFORMED_BASIC_0100
     * @tc.desc   Test isWellFormed with empty string
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIsWellFormed_Basic_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedEmptyString();
      expect(result.result).assertEqual(result.expected);
    });

    /**
     * @tc.name   StringIsWellFormed_Basic_002
     * @tc.number SUB_BUILTINS_STRING_ISWELLFORMED_BASIC_0200
     * @tc.desc   Test isWellFormed with pure ASCII strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIsWellFormed_Basic_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedPureASCII();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    /**
     * @tc.name   StringIsWellFormed_Basic_003
     * @tc.number SUB_BUILTINS_STRING_ISWELLFORMED_BASIC_0300
     * @tc.desc   Test isWellFormed with Unicode strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIsWellFormed_Basic_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedUnicode();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    /**
     * @tc.name   StringIsWellFormed_Basic_004
     * @tc.number SUB_BUILTINS_STRING_ISWELLFORMED_BASIC_0400
     * @tc.desc   Test isWellFormed with Emoji strings
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIsWellFormed_Basic_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedEmoji();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    /**
     * @tc.name   StringIsWellFormed_Basic_005
     * @tc.number SUB_BUILTINS_STRING_ISWELLFORMED_BASIC_0500
     * @tc.desc   Test isWellFormed with complete surrogate pairs
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringIsWellFormed_Basic_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedCompleteSurrogatePairs();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Application_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedUserInputValidation();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Application_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedTextSanitization();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Application_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedFilenameValidation();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Application_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedDatabaseStorage();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Application_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLogging();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Application_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedMultilingual();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Application_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedRegexPatternValidation();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Application_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedCSVData();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Application_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedHTMLValidation();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Application_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedConfigValidation();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Boundary_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLongWellFormedString();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Boundary_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLongStringWithLoneSurrogate();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Boundary_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedSingleASCII();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Boundary_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedSingleUnicode();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Boundary_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedSingleSurrogate();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Boundary_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedControlCharacters();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Boundary_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedEscapeCharacters();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Boundary_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedPrivateUseArea();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Boundary_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedSpecialPurposeArea();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Boundary_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedBOMAndSpecialMarks();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });


    it('StringIsWellFormed_Compatibility_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedMethodExists();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Compatibility_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedMixedCharacters();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Compatibility_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedEmptyStringOperations();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Compatibility_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedComplexScenario();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });


    it('StringIsWellFormed_Interaction_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedWithToWellFormed();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Interaction_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedWithEncodeURISafety();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Interaction_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedAfterNormalize();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Interaction_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedAfterSlice();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Interaction_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedAfterSubstring();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Interaction_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedAfterConcat();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Interaction_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedAfterTrim();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Interaction_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedAfterPadStart();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Interaction_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedAfterPadEnd();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });


    it('StringIsWellFormed_Performance_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLargeString10KB();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Performance_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLargeString100KB();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Performance_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLargeStringWithSurrogate();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Performance_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedRepeatedCalls100();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Performance_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedRepeatedCalls1000();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Performance_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLargeUnicodeString();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Performance_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLargeEmojiString();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_Performance_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedConcurrentSameString();
      expect(result.result).assertEqual(result.expected);
    });


    it('StringIsWellFormed_Surrogate_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLoneHighSurrogate();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedHighSurrogateAtStart();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedHighSurrogateInMiddle();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedHighSurrogateAtEnd();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedMultipleHighSurrogates();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedHighSurrogateBoundaries();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLoneLowSurrogate();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLowSurrogateAtStart();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLowSurrogateInMiddle();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLowSurrogateAtEnd();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedLowSurrogateBoundaries();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedWrongSurrogateOrder();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedMixedSurrogates();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedConsecutiveHighSurrogates();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_Surrogate_017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedInterleavedSurrogates();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_TypeConversion_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedOnNumber();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_TypeConversion_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedOnBoolean();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_TypeConversion_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedOnObject();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_TypeConversion_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedOnArray();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_TypeConversion_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedCustomObjectToString();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_TypeConversion_007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedCustomObjectToStringAndValueOf();
      expect(result.result).assertEqual(result.expected);
    });

    it('StringIsWellFormed_TypeConversion_008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedDirectCall();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_TypeConversion_009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedWithCallApply();
      for (let i = 0; i < result.result.length; i++) {
        expect(result.result[i]).assertEqual(result.expected[i]);
      }
    });

    it('StringIsWellFormed_TypeConversion_010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = testIsWellFormedWithBind();
      expect(result.result).assertEqual(result.expected);
    });
  });
}
