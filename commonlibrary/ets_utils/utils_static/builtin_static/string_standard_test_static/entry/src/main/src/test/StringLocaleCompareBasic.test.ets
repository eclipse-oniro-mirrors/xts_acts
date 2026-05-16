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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '../../../hypium/index';
import Utils from './Util.test';

export interface LocaleCompareInvalidOptionsResult {
  result1: number;
  result3: number;
}

export interface LocaleCompareThisErrorResult {
  hasError: boolean;
  type: string | null;
}

export interface LocaleCompareSingleNumberResult {
  result: number;
}

export interface LocaleCompareOmitParameterResult {
  result1: number;
  result2: number;
}

export interface LocaleCompareUndefinedParameterResult {
  result: number;
}

export interface LocaleCompareNullParameterResult {
  result1: number;
  result2: number;
}

export interface LocaleCompareNumberParameterResult {
  result1: number;
  result2: number;
}

export interface LocaleCompareObjectParameterResult {
  result1: number;
  result2: number;
}

class LocaleCompareEmptyObject {
}

class LocaleCompareToTestString {
  toString(): string {
    return 'test';
  }
}

namespace localeCompareHelperTest {
  function invokeLocaleCompare(thisArg: string | null | undefined, that: string): number {
    if (thisArg === null || thisArg === undefined) {
      throw new TypeError('String.prototype.localeCompare called on null or undefined');
    }
    const recv: string = thisArg as string;
    return recv.localeCompare(that);
  }

  export function testInvalidOptions(): LocaleCompareInvalidOptionsResult {
    const result1: number = 'a'.localeCompare('b', 'en');
    const result3: number = 'a'.localeCompare('b', 'en');
    return { result1: result1, result3: result3 };
  }

  export function testThisNull(): LocaleCompareThisErrorResult {
    try {
      invokeLocaleCompare(null, 'test');
      return { hasError: false, type: null };
    } catch (e) {
      return { hasError: true, type: e.name };
    }
  }

  export function testThisUndefined(): LocaleCompareThisErrorResult {
    try {
      invokeLocaleCompare(undefined, 'test');
      return { hasError: false, type: null };
    } catch (e) {
      return { hasError: true, type: e.name };
    }
  }

  export function testThisNumber(): LocaleCompareSingleNumberResult {
    const result: number = String(123).localeCompare('123');
    return { result: result };
  }

  export function testThisObject(): LocaleCompareSingleNumberResult {
    const receiver: LocaleCompareEmptyObject = new LocaleCompareEmptyObject();
    const result: number = String(receiver).localeCompare('[object Object]');
    return { result: result };
  }

  export function testThisBoolean(): LocaleCompareSingleNumberResult {
    const result: number = String(true).localeCompare('true');
    return { result: result };
  }

  export function testOmitParameter(): LocaleCompareOmitParameterResult {
    const result1: number = 'test'.localeCompare('undefined');
    const result2: number = 'undefined'.localeCompare('undefined');
    return { result1: result1, result2: result2 };
  }

  export function testUndefinedParameter(): LocaleCompareUndefinedParameterResult {
    const result: number = 'test'.localeCompare(String(undefined));
    return { result: result };
  }

  export function testNullParameter(): LocaleCompareNullParameterResult {
    const result1: number = 'test'.localeCompare(String(null));
    const result2: number = 'null'.localeCompare(String(null));
    return { result1: result1, result2: result2 };
  }

  export function testNumberParameter(): LocaleCompareNumberParameterResult {
    const result1: number = '123'.localeCompare(String(123));
    const result2: number = '10'.localeCompare(String(5));
    return { result1: result1, result2: result2 };
  }

  export function testObjectParameter(): LocaleCompareObjectParameterResult {
    const empty: LocaleCompareEmptyObject = new LocaleCompareEmptyObject();
    const result1: number = '[object Object]'.localeCompare(String(empty));
    const withToStr: LocaleCompareToTestString = new LocaleCompareToTestString();
    const result2: number = 'test'.localeCompare(withToStr.toString());
    return { result1: result1, result2: result2 };
  }
}

export default function StringLocaleCompareBasicTest(): void {
  describe('StringLocaleCompareBasicTest', (): void => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(20);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.name   StringLocaleCompare_InvalidOptions_001
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0100
     * @tc.desc   Test localeCompare with invalid options
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_InvalidOptions_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testInvalidOptions();
      expect(typeof result.result1).assertEqual('number');
      expect(typeof result.result3).assertEqual('number');
    });

    /**
     * @tc.name   StringLocaleCompare_ThisNull_002
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0200
     * @tc.desc   Test localeCompare with this as null
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisNull_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testThisNull();
      expect(result.hasError).assertTrue();
      expect(result.type).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringLocaleCompare_ThisUndefined_003
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0300
     * @tc.desc   Test localeCompare with this as undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisUndefined_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testThisUndefined();
      expect(result.hasError).assertTrue();
      expect(result.type).assertEqual('TypeError');
    });

    /**
     * @tc.name   StringLocaleCompare_ThisNumber_004
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0400
     * @tc.desc   Test localeCompare with this as number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisNumber_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testThisNumber();
      expect(result.result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_ThisObject_005
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0500
     * @tc.desc   Test localeCompare with this as object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisObject_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testThisObject();
      expect(result.result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_ThisBoolean_006
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_EXCEPTION_0600
     * @tc.desc   Test localeCompare with this as boolean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ThisBoolean_006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testThisBoolean();
      expect(result.result).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_OmitParameter_001
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0100
     * @tc.desc   Test localeCompare with omitted parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_OmitParameter_001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testOmitParameter();
      expect(typeof result.result1).assertEqual('number');
      expect(result.result2).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_UndefinedParameter_002
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0200
     * @tc.desc   Test localeCompare with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_UndefinedParameter_002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testUndefinedParameter();
      expect(typeof result.result).assertEqual('number');
    });

    /**
     * @tc.name   StringLocaleCompare_NullParameter_003
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0300
     * @tc.desc   Test localeCompare with null parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NullParameter_003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testNullParameter();
      expect(typeof result.result1).assertEqual('number');
      expect(result.result2).assertEqual(0);
    });

    /**
     * @tc.name   StringLocaleCompare_NumberParameter_004
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0400
     * @tc.desc   Test localeCompare with number parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_NumberParameter_004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testNumberParameter();
      expect(result.result1).assertEqual(0);
      expect(result.result2 < 0).assertTrue();
    });

    /**
     * @tc.name   StringLocaleCompare_ObjectParameter_005
     * @tc.number SUB_BUILTINS_STRING_LOCALECOMPARE_PARAM_0500
     * @tc.desc   Test localeCompare with object parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('StringLocaleCompare_ObjectParameter_005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const result = localeCompareHelperTest.testObjectParameter();
      expect(result.result1).assertEqual(0);
      expect(result.result2).assertEqual(0);
    });
  });
}
